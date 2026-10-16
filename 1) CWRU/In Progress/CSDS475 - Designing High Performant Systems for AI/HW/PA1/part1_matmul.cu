// part1_matmul.cu — Part 1: Naive-1, Naive-2, Block MM, Tensor Cores (WMMA), cuBLAS
//
// Build:  nvcc -O3 -std=c++17 -arch=sm_80 -o part1 part1_matmul.cu -lcublas
// Run:    ./part1 [results_part1.csv]
//
// A, B are N x N row-major __half; C is N x N row-major float.
// Every configuration is timed (CUDA events, kernel only, no host<->device copies)
// and checked against a CPU float reference. Results go to a CSV for plotting.

#include "common.cuh"
#include <mma.h>
#include <cublas_v2.h>

using namespace nvcuda;

#define CUBLAS_CHECK(call)                                                      \
    do {                                                                        \
        cublasStatus_t s_ = (call);                                             \
        if (s_ != CUBLAS_STATUS_SUCCESS) {                                      \
            fprintf(stderr, "cuBLAS error %d at %s:%d\n", (int)s_, __FILE__,    \
                    __LINE__);                                                  \
            exit(1);                                                            \
        }                                                                       \
    } while (0)

// ---------------------------------------------------------------------------
// Naive-2
//
// Same thread -> output-tile ownership as Naive-1 (p*p threads, T = N/p).
// The threads of one thread block form a rectangle of the p x p thread grid:
//   threadNum <= p : 1 thread-row  x threadNum thread-cols
//   threadNum >  p : threadNum/p thread-rows x p thread-cols
// (all sizes are powers of two, so one of these always holds).
// The block stages the A rows and B columns its threads need into shared
// memory and every thread computes from shared memory.
//
// The driver runs the literal handout version: KC = N, i.e. all N/p rows of A
// and N/p columns of B (full length N) are loaded before the multiplication.
// That needs (BR + BC) * (N/p) * N * 2 bytes of shared memory per block, which
// exceeds the GPU limit for most configurations at N >= 512 (e.g. 512 KB at
// N = 1024, p = 8); those configurations are skipped and listed in
// results_part1_skipped.csv. (The kernel still accepts KC < N, which stages k
// in chunks and accumulates partial sums into C.)
// ---------------------------------------------------------------------------
__host__ __device__ inline void naive2_block_shape(int p, int tn, int& BR, int& BC) {
    if (tn <= p) { BR = 1; BC = tn; }
    else         { BR = tn / p; BC = p; }
}

__global__ void __launch_bounds__(1024) naive2_kernel(const __half* __restrict__ A, const __half* __restrict__ B,
                              float* __restrict__ C, int N, int p, int KC) {
    extern __shared__ __half smem[];
    const int T = N / p, tn = blockDim.x;

    int BR, BC;
    naive2_block_shape(p, tn, BR, BC);
    const int gFirst = blockIdx.x * tn;
    const int ty0 = gFirst / p, tx0 = gFirst % p;   // top-left thread of the rectangle
    const int rows = BR * T, cols = BC * T;          // A rows / B cols this block needs
    const int rowA0 = ty0 * T, colB0 = tx0 * T;

    __half* As = smem;               // rows x KC
    __half* Bs = smem + rows * KC;   // KC x cols

    const int g = gFirst + threadIdx.x;              // blockNum*threadNum == p*p, all valid
    const int tx = g % p, ty = g / p;
    const int ly = ty - ty0, lx = tx - tx0;          // position inside the rectangle

    for (int k0 = 0; k0 < N; k0 += KC) {
        // Cooperative staging (consecutive threads -> consecutive addresses)
        for (int idx = threadIdx.x; idx < rows * KC; idx += tn) {
            int r = idx / KC, kk = idx % KC;
            As[idx] = A[(size_t)(rowA0 + r) * N + k0 + kk];
        }
        for (int idx = threadIdx.x; idx < KC * cols; idx += tn) {
            int kk = idx / cols, c = idx % cols;
            Bs[idx] = B[(size_t)(k0 + kk) * N + colB0 + c];
        }
        __syncthreads();

        for (int i = 0; i < T; ++i) {
            const __half* a = As + (ly * T + i) * KC;
            for (int j = 0; j < T; ++j) {
                const __half* b = Bs + lx * T + j;
                float s = 0.f;
                for (int kk = 0; kk < KC; ++kk)
                    s += __half2float(a[kk]) * __half2float(b[kk * cols]);
                size_t ci = (size_t)(ty * T + i) * N + tx * T + j;
                if (k0 == 0) C[ci] = s; else C[ci] += s;
            }
        }
        __syncthreads();
    }
}

size_t naive2_smem(int N, int p, int tn, int kc) {
    int BR, BC;
    naive2_block_shape(p, tn, BR, BC);
    return (size_t)(BR + BC) * (N / p) * kc * sizeof(__half);
}

// ---------------------------------------------------------------------------
// Block matrix multiplication: p*p threads in total, shared-memory staged
//
// Same thread -> output ownership as Naive-1: p*p threads in total
// (blockNum * threadNum == p*p), and thread (tx, ty) owns the T x T block of C
// starting at (ty*T, tx*T), T = N/p. The threads of one CUDA block form the same
// BR x BC rectangle of the p x p thread grid as Naive-2.
//
// What makes it block matrix multiplication (L4 slides 40-44):
//   * Each thread works through its T x T block in R x R sub-tiles (R = 4,
//     or 2 when T = 2). The R*R partial sums live in registers for the whole
//     k loop, and C is written once at the end (no read-modify-write of C).
//   * For every sub-tile, the block marches across k in chunks of BMM_KC = 32
//     (a fixed k-step was measured faster than k-steps of N/p, which are
//     tiny at small N and add many __syncthreads()).
//     For each step the threads COOPERATIVELY stage the A rows and B columns
//     that the whole block needs into shared memory (consecutive threads load
//     consecutive addresses, so the loads are coalesced), __syncthreads(),
//     then every thread does an R x R outer-product update per k from shared
//     memory only, __syncthreads(), next block along k.
//   * Reuse: a staged A element is used by BC threads x R columns and a staged
//     B element by BR threads x R rows, so global traffic per output drops
//     from 2N (Naive-1) to (BR + BC) * N / (BR * BC * R).
//   * Both shared tiles are padded by one column to reduce bank conflicts.
// ---------------------------------------------------------------------------
#define BMM_KC 32   // k-chunk width; divides every N in the sweep (N >= 64)

__host__ __device__ inline int blockmm_R(int T) { return T >= 4 ? 4 : 2; }

__host__ __device__ inline size_t blockmm_smem(int N, int p, int tn) {
    int BR, BC;
    naive2_block_shape(p, tn, BR, BC);
    const int R = blockmm_R(N / p);
    const int KC = BMM_KC;
    return ((size_t)BR * R * (KC + 1) + (size_t)KC * (BC * R + 1)) * sizeof(__half);
}

template <int R>
__global__ void __launch_bounds__(1024) blockmm_kernel(const __half* __restrict__ A,
                                                       const __half* __restrict__ B,
                                                       float* __restrict__ C, int N, int p) {
    extern __shared__ __half smem[];
    const int T = N / p, tn = blockDim.x;
    const int KC = BMM_KC;                           // k-chunk width

    int BR, BC;
    naive2_block_shape(p, tn, BR, BC);
    const int gFirst = blockIdx.x * tn;
    const int ty0 = gFirst / p, tx0 = gFirst % p;   // top-left thread of the rectangle
    const int g = gFirst + threadIdx.x;              // blockNum*threadNum == p*p, all valid
    const int ly = g / p - ty0, lx = g % p - tx0;    // position inside the rectangle

    const int rowsA = BR * R, colsB = BC * R;        // staged A rows / B columns
    const int ldA = KC + 1, ldB = colsB + 1;         // +1 column padding
    __half* As = smem;                               // rowsA x ldA
    __half* Bs = smem + rowsA * ldA;                 // KC x ldB

    const int sub = T / R;                           // sub-tiles per dimension
    for (int si = 0; si < sub; ++si) {
        for (int sj = 0; sj < sub; ++sj) {
            float acc[R][R];
#pragma unroll
            for (int i = 0; i < R; ++i)
#pragma unroll
                for (int j = 0; j < R; ++j) acc[i][j] = 0.f;

            for (int k0 = 0; k0 < N; k0 += KC) {
                // Stage A: staged row r = (thread-row r/R, sub-row r%R)
                for (int idx = threadIdx.x; idx < rowsA * KC; idx += tn) {
                    const int r = idx / KC, kk = idx % KC;
                    const int grow = (ty0 + r / R) * T + si * R + r % R;
                    As[r * ldA + kk] = A[(size_t)grow * N + k0 + kk];
                }
                // Stage B: staged column c = (thread-col c/R, sub-col c%R)
                for (int idx = threadIdx.x; idx < KC * colsB; idx += tn) {
                    const int kk = idx / colsB, c = idx % colsB;
                    const int gcol = (tx0 + c / R) * T + sj * R + c % R;
                    Bs[kk * ldB + c] = B[(size_t)(k0 + kk) * N + gcol];
                }
                __syncthreads();

                for (int kk = 0; kk < KC; ++kk) {
                    float a[R], b[R];
#pragma unroll
                    for (int i = 0; i < R; ++i) a[i] = __half2float(As[(ly * R + i) * ldA + kk]);
#pragma unroll
                    for (int j = 0; j < R; ++j) b[j] = __half2float(Bs[kk * ldB + lx * R + j]);
#pragma unroll
                    for (int i = 0; i < R; ++i)
#pragma unroll
                        for (int j = 0; j < R; ++j) acc[i][j] += a[i] * b[j];
                }
                __syncthreads();
            }

#pragma unroll
            for (int i = 0; i < R; ++i)
#pragma unroll
                for (int j = 0; j < R; ++j) {
                    const int row = (ty0 + ly) * T + si * R + i;
                    const int col = (tx0 + lx) * T + sj * R + j;
                    C[(size_t)row * N + col] = acc[i][j];
                }
        }
    }
}

static void launch_blockmm(int bn, int tn, const __half* A, const __half* B, float* C, int N, int p) {
    const size_t smem = blockmm_smem(N, p, tn);
    if (blockmm_R(N / p) == 4) blockmm_kernel<4><<<bn, tn, smem>>>(A, B, C, N, p);
    else                       blockmm_kernel<2><<<bn, tn, smem>>>(A, B, C, N, p);
}

// ---------------------------------------------------------------------------
// Tensor cores (WMMA)
//
// Each warp computes 16x16 output tiles with 16x16x16 half MMAs and a float
// accumulator; warps grid-stride over the (N/16)^2 tiles. threadNum must be a
// multiple of 32. Requires compute capability >= 7.0.
// ---------------------------------------------------------------------------
__global__ void __launch_bounds__(512) wmma_kernel(const __half* __restrict__ A, const __half* __restrict__ B,
                            float* __restrict__ C, int N) {
#if defined(__CUDA_ARCH__) && __CUDA_ARCH__ >= 700
    const int warpId = (blockIdx.x * blockDim.x + threadIdx.x) / 32;
    const int numWarps = (gridDim.x * blockDim.x) / 32;
    const int tpd = N / 16, numTiles = tpd * tpd;

    for (int t = warpId; t < numTiles; t += numWarps) {
        const int tr = t / tpd, tc = t % tpd;
        wmma::fragment<wmma::matrix_a, 16, 16, 16, __half, wmma::row_major> a;
        wmma::fragment<wmma::matrix_b, 16, 16, 16, __half, wmma::row_major> b;
        wmma::fragment<wmma::accumulator, 16, 16, 16, float> c;
        wmma::fill_fragment(c, 0.f);

        for (int k = 0; k < N; k += 16) {
            wmma::load_matrix_sync(a, A + (size_t)tr * 16 * N + k, N);
            wmma::load_matrix_sync(b, B + (size_t)k * N + tc * 16, N);
            wmma::mma_sync(c, a, b, c);
        }
        wmma::store_matrix_sync(C + (size_t)tr * 16 * N + tc * 16, c, N, wmma::mem_row_major);
    }
#endif
}

// ---------------------------------------------------------------------------
// Driver
// ---------------------------------------------------------------------------
static FILE* g_csv = nullptr;
static FILE* g_skip = nullptr;

// Record a configuration that could not run, and keep going with the sweep.
static void log_skip(const char* impl, int N, int p, int bn, int tn, size_t smemNeed,
                     size_t smemMax, const char* reason) {
    fprintf(g_skip, "%s,%d,%d,%d,%d,%zu,%zu,%s\n", impl, N, p, bn, tn, smemNeed, smemMax, reason);
    fflush(g_skip);
    printf("%-8s N=%5d p=%3d blocks=%6d threads=%5d  SKIPPED: %s (needs %zu KB shared memory, limit %zu KB)\n",
           impl, N, p, bn, tn, reason, smemNeed / 1024, smemMax / 1024);
}

// Launch once and synchronise; on a launch/runtime error, report it, clear it and
// return false so the caller can move on to the next configuration. (Launch-config
// errors such as too much shared memory are recoverable; a crash inside a kernel
// would leave the context unusable, which none of these kernels should do.)
template <typename F>
static bool try_launch(F launch, const char* impl, int N, int p, int bn, int tn, size_t smem,
                       size_t smemMax) {
    launch();
    cudaError_t e = cudaGetLastError();
    if (e == cudaSuccess) e = cudaDeviceSynchronize();
    if (e != cudaSuccess) {
        cudaGetLastError();   // clear the (non-sticky) error
        log_skip(impl, N, p, bn, tn, smem, smemMax, cudaGetErrorString(e));
        return false;
    }
    return true;
}

static void log_row(const char* impl, int N, int p, int bn, int tn, int kc, float ms, double err) {
    bool pass = err < 1e-3;
    fprintf(g_csv, "%s,%d,%d,%d,%d,%d,%.6f,%.3f,%.3e,%d\n", impl, N, p, bn, tn, kc, ms,
            gflops(N, ms), err, pass ? 1 : 0);
    fflush(g_csv);
    printf("%-8s N=%5d p=%3d blocks=%6d threads=%5d kc=%5d  %10.4f ms  %8.2f GFLOP/s  err=%.2e %s\n",
           impl, N, p, bn, tn, kc, ms, gflops(N, ms), err, pass ? "" : "  <-- CHECK");
}

int main(int argc, char** argv) {
    const char* outPath = argc > 1 ? argv[1] : "results_part1.csv";

    cudaDeviceProp prop;
    CUDA_CHECK(cudaGetDeviceProperties(&prop, 0));
    const bool hasTensorCores = prop.major >= 7;
    const size_t smemMax = prop.sharedMemPerBlockOptin;
    printf("GPU: %s (sm_%d%d), %d SMs, max dynamic smem/block %zu KB\n", prop.name, prop.major,
           prop.minor, prop.multiProcessorCount, smemMax / 1024);
    if (!hasTensorCores) printf("No tensor cores (need sm_70+): skipping WMMA.\n");

    CUDA_CHECK(cudaFuncSetAttribute(naive2_kernel, cudaFuncAttributeMaxDynamicSharedMemorySize,
                                    (int)smemMax));

    g_csv = fopen(outPath, "w");
    if (!g_csv) { perror(outPath); return 1; }
    fprintf(g_csv, "impl,N,p,blockNum,threadNum,kc,time_ms,gflops,max_err,pass\n");
    g_skip = fopen("results_part1_skipped.csv", "w");
    if (!g_skip) { perror("results_part1_skipped.csv"); return 1; }
    fprintf(g_skip, "impl,N,p,blockNum,threadNum,smem_needed_bytes,smem_limit_bytes,reason\n");

    cublasHandle_t handle;
    CUBLAS_CHECK(cublasCreate(&handle));

    for (int ni = 0; ni < NUM_N; ++ni) {
        const int N = N_VALUES[ni];
        const size_t elems = (size_t)N * N;

        std::vector<__half> hA, hB;
        std::vector<float> fA, fB, ref;
        init_matrix(hA, fA, N, 1234u + N);
        init_matrix(hB, fB, N, 5678u + N);
        printf("\n=== N = %d: computing CPU reference ===\n", N);
        cpu_matmul(fA, fB, ref, N);

        __half *dA, *dB, *dCh;
        float* dC;
        CUDA_CHECK(cudaMalloc(&dA, elems * sizeof(__half)));
        CUDA_CHECK(cudaMalloc(&dB, elems * sizeof(__half)));
        CUDA_CHECK(cudaMalloc(&dC, elems * sizeof(float)));
        CUDA_CHECK(cudaMalloc(&dCh, elems * sizeof(__half)));
        CUDA_CHECK(cudaMemcpy(dA, hA.data(), elems * sizeof(__half), cudaMemcpyHostToDevice));
        CUDA_CHECK(cudaMemcpy(dB, hB.data(), elems * sizeof(__half), cudaMemcpyHostToDevice));

        std::vector<float> hC(elems);
        // Fill C with NaNs before each config so a kernel that skips outputs fails the check
        auto clearC = [&] { CUDA_CHECK(cudaMemset(dC, 0xFF, elems * sizeof(float))); };
        auto checkC = [&] {
            CUDA_CHECK(cudaMemcpy(hC.data(), dC, elems * sizeof(float), cudaMemcpyDeviceToHost));
            return max_err(hC.data(), ref);
        };

        for (int pi = 0; pi < NUM_P; ++pi) {
            const int p = P_VALUES[pi];
            if (N % p) continue;
            const int threads = p * p;

            // Naive-1 and Naive-2: blockNum * threadNum == p*p
            for (int tn = 1; tn <= std::min(threads, 1024); tn *= 2) {
                const int bn = threads / tn;
                clearC();
                float ms = time_kernel([&] { naive1_kernel<<<bn, tn>>>(dA, dB, dC, N, p); });
                log_row("naive1", N, p, bn, tn, N, ms, checkC());
            }
            for (int tn = 1; tn <= std::min(threads, 1024); tn *= 2) {
                const int bn = threads / tn;
                // Literal Naive-2: load all N/p rows / columns (KC = N) before multiplying.
                const int kc = N;
                const size_t smem = naive2_smem(N, p, tn, kc);
                if (smem > smemMax) {
                    log_skip("naive2", N, p, bn, tn, smem, smemMax, "exceeds shared memory");
                    continue;
                }
                auto launch = [&] { naive2_kernel<<<bn, tn, smem>>>(dA, dB, dC, N, p, kc); };
                clearC();
                if (!try_launch(launch, "naive2", N, p, bn, tn, smem, smemMax)) continue;
                float ms = time_kernel(launch);
                log_row("naive2", N, p, bn, tn, kc, ms, checkC());
            }

            // Block MM: p*p threads in total, same splits as the naive kernels
            // (blockNum * threadNum == p*p), so the three are compared like for like.
            for (int tn = 1; tn <= std::min(threads, 1024); tn *= 2) {
                const int bn = threads / tn;
                clearC();
                float ms = time_kernel([&] { launch_blockmm(bn, tn, dA, dB, dC, N, p); });
                log_row("blockmm", N, p, bn, tn, BMM_KC, ms, checkC());
            }
        }

        // Tensor cores (independent of p; p logged as 0)
        if (hasTensorCores) {
            const int numTiles = (N / 16) * (N / 16);
            for (int tn = 32; tn <= 512; tn *= 2) {
                const int warpsPerBlock = tn / 32;
                const int maxBn = (numTiles + warpsPerBlock - 1) / warpsPerBlock;
                for (int bn = 1;; bn *= 2) {
                    clearC();
                    float ms = time_kernel([&] { wmma_kernel<<<bn, tn>>>(dA, dB, dC, N); });
                    log_row("wmma", N, 0, bn, tn, 16, ms, checkC());
                    if (bn >= maxBn) break;
                }
            }
        }

        // cuBLAS Hgemm. cuBLAS is column-major: a row-major X is seen as X^T.
        // Row-major C = A*B  <=>  column-major C^T = B^T * A^T, so pass B first.
        // Note: Hgemm writes C as half, so its error is larger than the float kernels'.
        {
            const __half alpha = __float2half(1.f), beta = __float2half(0.f);
            float ms = time_kernel([&] {
                CUBLAS_CHECK(cublasHgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, N, N, N, &alpha, dB, N,
                                         dA, N, &beta, dCh, N));
            });
            std::vector<__half> hCh(elems);
            CUDA_CHECK(cudaMemcpy(hCh.data(), dCh, elems * sizeof(__half), cudaMemcpyDeviceToHost));
            for (size_t i = 0; i < elems; ++i) hC[i] = __half2float(hCh[i]);
            double err = max_err(hC.data(), ref);
            fprintf(g_csv, "cublas,%d,0,0,0,0,%.6f,%.3f,%.3e,%d\n", N, ms, gflops(N, ms), err,
                    err < 2e-2 ? 1 : 0);
            printf("%-8s N=%5d  %10.4f ms  %8.2f GFLOP/s  err=%.2e (half output)\n", "cublas", N,
                   ms, gflops(N, ms), err);
        }

        CUDA_CHECK(cudaFree(dA));
        CUDA_CHECK(cudaFree(dB));
        CUDA_CHECK(cudaFree(dC));
        CUDA_CHECK(cudaFree(dCh));
    }

    CUBLAS_CHECK(cublasDestroy(handle));
    fclose(g_csv);
    fclose(g_skip);
    printf("\nWrote %s\n", outPath);
    return 0;
}
