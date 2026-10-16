// part2_coalescing.cu — Part 2: memory-request counting + coalesced Naive-1
//
// Build:  nvcc -O3 -std=c++17 -arch=sm_80 -o part2 part2_coalescing.cu
// Run:    ./part2              (request counts + timing)
//         ./part2 --counts     (request counts only, skips the GPU timing)
//
// (1) Request counting, for every warp instruction of Naive-1, Naive-2 and
//     Block MM (same thread mappings as part1_matmul.cu), two ways:
//       * class equation (L10 slides), the DEFAULT: requests = ceil(R / 32),
//         R = range of data elements fetched across the warp, first to last
//         inclusive -> load_requests / store_requests columns
//       * hardware model, for comparison: number of distinct 32-byte segments
//         touched -> *_seg columns
//     Written to results_part2_requests.csv. Only global memory is counted.
//
// (2) Coalesced Naive-1. In Naive-1, neighbouring threads (consecutive tx)
//     read B[k][tx*T + j], which are T halves apart, and threads with
//     different ty read A rows T*N halves apart -> one request per thread
//     (group). We change the DATA LAYOUT (not the work assignment):
//         Bp[(k*T + j)*p + tx] = B[k*N + tx*T + j]
//         Ap[(i*N + k)*p + ty] = A[(ty*T + i)*N + k]
//     so for a fixed (i, j, k) consecutive tx / ty touch consecutive halves.
//     The relayout is a one-off kernel, timed separately.

#include "common.cuh"
#include <string>

// ---------------------------------------------------------------------------
// Layout transforms + coalesced kernel
// ---------------------------------------------------------------------------
__global__ void permute_A(const __half* __restrict__ A, __half* __restrict__ Ap, int N, int p) {
    size_t idx = (size_t)blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= (size_t)N * N) return;
    int T = N / p;
    int row = idx / N, k = idx % N;
    int ty = row / T, i = row % T;
    Ap[((size_t)i * N + k) * p + ty] = A[idx];
}

__global__ void permute_B(const __half* __restrict__ B, __half* __restrict__ Bp, int N, int p) {
    size_t idx = (size_t)blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= (size_t)N * N) return;
    int T = N / p;
    int k = idx / N, col = idx % N;
    int tx = col / T, j = col % T;
    Bp[((size_t)k * T + j) * p + tx] = B[idx];
}

// Same ownership as naive1_kernel (thread (tx,ty) -> T x T tile), new layouts.
__global__ void __launch_bounds__(1024) naive1_coalesced_kernel(const __half* __restrict__ Ap, const __half* __restrict__ Bp,
                                        float* __restrict__ C, int N, int p) {
    int g = blockIdx.x * blockDim.x + threadIdx.x;
    if (g >= p * p) return;
    int tx = g % p, ty = g / p, T = N / p;

    for (int i = 0; i < T; ++i) {
        const __half* a = Ap + (size_t)i * N * p + ty;     // a[k*p]
        for (int j = 0; j < T; ++j) {
            const __half* b = Bp + (size_t)j * p + tx;     // b[k*T*p] = b[k*N]
            float sum = 0.f;
            for (int k = 0; k < N; ++k)
                sum += __half2float(a[(size_t)k * p]) * __half2float(b[(size_t)k * N]);
            C[(size_t)(ty * T + i) * N + tx * T + j] = sum;
        }
    }
}

// ---------------------------------------------------------------------------
// Request counting (host only)
//
// Every warp-level global access is counted two ways:
//   seg   : distinct 32-byte segments touched by the warp's addresses
//           (what the hardware actually fetches)
//   slide : the class equation (L10 slides 36-39):  ceil(R / 32), where R is the
//           range of data elements fetched across all threads in the warp,
//           first to last element inclusive.
// ---------------------------------------------------------------------------
struct Req {
    long long seg = 0, slide = 0;
    Req& operator+=(const Req& o) { seg += o.seg; slide += o.slide; return *this; }
    Req operator*(long long k) const { Req r; r.seg = seg * k; r.slide = slide * k; return r; }
};

struct Counts {
    long long ldInstr = 0, stInstr = 0;
    Req ld, st;
};

// One warp-level access by n active lanes; byteAddr are byte addresses of
// elements of size esize bytes.
static Req requests(const long long* byteAddr, int n, int esize) {
    long long s[32];
    long long lo = byteAddr[0], hi = byteAddr[0];
    for (int i = 0; i < n; ++i) {
        s[i] = byteAddr[i] >> 5;
        lo = std::min(lo, byteAddr[i]);
        hi = std::max(hi, byteAddr[i]);
    }
    std::sort(s, s + n);
    Req r;
    r.seg = (long long)(std::unique(s, s + n) - s);
    long long range = (hi - lo) / esize + 1;   // elements, inclusive
    r.slide = (range + 31) / 32;
    return r;
}

// Warps of a 1-D launch (bn blocks x tn threads), as lists of global thread ids.
// A warp is 32 consecutive threads of one block (fewer if tn < 32).
static std::vector<std::vector<int>> warps_of(int bn, int tn) {
    std::vector<std::vector<int>> W;
    for (int b = 0; b < bn; ++b)
        for (int w0 = 0; w0 < tn; w0 += 32) {
            std::vector<int> lanes;
            for (int l = w0; l < std::min(tn, w0 + 32); ++l) lanes.push_back(b * tn + l);
            W.push_back(lanes);
        }
    return W;
}

// Sum over j in [0,T) of requests for the per-thread C tile access at row offset 0.
// (Row offsets i*N*4 bytes are multiples of 32, so every i gives the same count.)
static Req c_tile_requests(const std::vector<int>& lanes, int N, int p) {
    int T = N / p;
    long long addr[32];
    Req s;
    for (int j = 0; j < T; ++j) {
        int n = 0;
        for (int g : lanes) addr[n++] = 4LL * ((long long)(g / p) * T * N + (g % p) * T + j);
        s += requests(addr, n, 4);
    }
    return s;
}

// Naive-1 (original or coalesced layout). Per (i, j, k) every lane's address is
// shifted by the same amount, so the segment count only depends on that shift
// modulo 32 bytes (and the slide count not at all); we enumerate the index that
// changes the alignment and weight it by how often it occurs.
// (Valid because N is a multiple of 16.)
static Counts count_naive1(int N, int p, int tn, bool coalesced) {
    const int T = N / p, bn = p * p / tn;
    Counts c;
    long long addr[32];
    for (auto& lanes : warps_of(bn, tn)) {
        const int n = (int)lanes.size();
        Req s;

        // A loads
        if (!coalesced) {  // A[(ty*T+i)*N + k]: alignment depends on k mod 16
            for (int r = 0; r < 16; ++r) {
                for (int l = 0; l < n; ++l)
                    addr[l] = 2LL * ((long long)(lanes[l] / p) * T * N + r);
                s += requests(addr, n, 2);
            }
            c.ld += s * ((long long)T * T * (N / 16));
        } else {           // Ap[(i*N+k)*p + ty]: alignment depends on k
            for (int k = 0; k < N; ++k) {
                for (int l = 0; l < n; ++l) addr[l] = 2LL * ((long long)k * p + lanes[l] / p);
                s += requests(addr, n, 2);
            }
            c.ld += s * ((long long)T * T);
        }
        c.ldInstr += (long long)T * T * N;

        // B loads: alignment depends on j only
        s = Req();
        for (int j = 0; j < T; ++j) {
            for (int l = 0; l < n; ++l) {
                int tx = lanes[l] % p;
                addr[l] = coalesced ? 2LL * ((long long)j * p + tx) : 2LL * (tx * T + j);
            }
            s += requests(addr, n, 2);
        }
        c.ld += s * ((long long)T * N);
        c.ldInstr += (long long)T * T * N;

        // C stores
        c.st += c_tile_requests(lanes, N, p) * T;
        c.stInstr += (long long)T * T;
    }
    return c;
}

// One pass of a cooperative "for (idx = tid; idx < total; idx += tn)" loop:
// counts warp instructions and requests; addrOf(idx) returns a byte address.
template <typename F>
static void strided_loop(int total, int tn, int esize, F addrOf, long long& instr, Req& req) {
    long long addr[32];
    for (int base = 0; base < total; base += tn)
        for (int w0 = 0; w0 < tn; w0 += 32) {
            int n = 0;
            for (int l = w0; l < std::min(tn, w0 + 32); ++l) {
                int idx = base + l;
                if (idx >= total) break;
                addr[n++] = addrOf(idx);
            }
            if (n) { ++instr; req += requests(addr, n, esize); }
        }
}

// Naive-2 (same block rectangle + KC chunking as part1_matmul.cu)
static Counts count_naive2(int N, int p, int tn, int KC) {
    const int T = N / p, bn = p * p / tn, chunks = N / KC;
    const int BR = (tn <= p) ? 1 : tn / p, BC = (tn <= p) ? tn : p;
    const int rows = BR * T, cols = BC * T;
    Counts c;
    for (int b = 0; b < bn; ++b) {
        const int gFirst = b * tn, rowA0 = (gFirst / p) * T, colB0 = (gFirst % p) * T;
        for (int k0 = 0; k0 < N; k0 += KC) {
            strided_loop(rows * KC, tn, 2, [&](int idx) {
                return 2LL * ((long long)(rowA0 + idx / KC) * N + k0 + idx % KC);
            }, c.ldInstr, c.ld);
            strided_loop(KC * cols, tn, 2, [&](int idx) {
                return 2LL * ((long long)(k0 + idx / cols) * N + colB0 + idx % cols);
            }, c.ldInstr, c.ld);
        }
    }
    // C: written on the first chunk, read-modify-written on the others
    for (auto& lanes : warps_of(bn, tn)) {
        Req s = c_tile_requests(lanes, N, p) * T;
        c.st += s * chunks;
        c.stInstr += (long long)T * T * chunks;
        c.ld += s * (chunks - 1);
        c.ldInstr += (long long)T * T * (chunks - 1);
    }
    return c;
}

// Block MM (tile P x P, threadNum threads per block). Counts don't depend on
// blockNum: every tile is processed exactly once by some block.
static Counts count_blockmm(int N, int P, int tn) {
    const int tpd = N / P, numTiles = tpd * tpd, steps = N / P;
    Counts c;

    // A tile loads: alignment depends on k0 only (row offsets are multiples of 32 B)
    for (int s = 0; s < steps; ++s) {
        const int k0 = s * P;
        long long instr = 0;
        Req req;
        strided_loop(P * P, tn, 2, [&](int idx) {
            return 2LL * ((long long)(idx / P) * N + k0 + idx % P);
        }, instr, req);
        c.ldInstr += instr * numTiles;
        c.ld += req * numTiles;
    }
    // B tile loads: alignment depends on the tile column only
    for (int tc = 0; tc < tpd; ++tc) {
        long long instr = 0;
        Req req;
        strided_loop(P * P, tn, 2, [&](int idx) {
            return 2LL * ((long long)(idx / P) * N + tc * P + idx % P);
        }, instr, req);
        c.ldInstr += instr * tpd * steps;
        c.ld += req * ((long long)tpd * steps);
    }
    // C stores: element e = threadIdx + q*tn
    for (int tc = 0; tc < tpd; ++tc) {
        long long instr = 0;
        Req req;
        strided_loop(P * P, tn, 4, [&](int e) {
            return 4LL * ((long long)(e / P) * N + tc * P + e % P);
        }, instr, req);
        c.stInstr += instr * tpd;
        c.st += req * tpd;
    }
    return c;
}

static void write_counts(FILE* f, const char* kernel, int N, int p, int tn, int kc, const Counts& c) {
    auto per = [](long long r, long long i) { return i ? (double)r / i : 0.0; };
    // Default columns use the class equation; 32-byte-segment counts are appended as *_seg.
    fprintf(f, "%s,%d,%d,%d,%d,%lld,%lld,%.3f,%lld,%lld,%.3f,%lld,%.3f,%lld,%.3f\n",
            kernel, N, p, tn, kc,
            c.ldInstr, c.ld.slide, per(c.ld.slide, c.ldInstr),
            c.stInstr, c.st.slide, per(c.st.slide, c.stInstr),
            c.ld.seg, per(c.ld.seg, c.ldInstr),
            c.st.seg, per(c.st.seg, c.stInstr));
}

// Must match naive2_kc() in part1_matmul.cu
static int naive2_kc(int N, int p, int tn, size_t smemMax) {
    int BR = (tn <= p) ? 1 : tn / p, BC = (tn <= p) ? tn : p;
    size_t perK = (size_t)(BR + BC) * (N / p) * sizeof(__half);
    int kc = 1;
    while (kc * 2 <= N && (size_t)(kc * 2) * perK <= smemMax) kc *= 2;
    return kc;
}

static void run_counts(size_t smemMax) {
    FILE* f = fopen("results_part2_requests.csv", "w");
    fprintf(f, "kernel,N,p,threadNum,kc,load_instr,load_requests,load_req_per_instr,"
               "store_instr,store_requests,store_req_per_instr,"
               "load_requests_seg,load_req_per_instr_seg,"
               "store_requests_seg,store_req_per_instr_seg\n");
    printf("Counting requests (32-byte segments and class equation ceil(range/32))...\n");
    for (int ni = 0; ni < NUM_N; ++ni)
        for (int pi = 0; pi < NUM_P; ++pi) {
            const int N = N_VALUES[ni], p = P_VALUES[pi], threads = p * p;
            for (int tn = 1; tn <= std::min(threads, 1024); tn *= 2) {
                write_counts(f, "naive1", N, p, tn, N, count_naive1(N, p, tn, false));
                write_counts(f, "naive1_coalesced", N, p, tn, N, count_naive1(N, p, tn, true));
                int kc = naive2_kc(N, p, tn, smemMax);
                write_counts(f, "naive2", N, p, tn, kc, count_naive2(N, p, tn, kc));
                if (tn >= threads / 32) write_counts(f, "blockmm", N, p, tn, p, count_blockmm(N, p, tn));
            }
            printf("  N=%d p=%d done\n", N, p);
        }
    fclose(f);
    printf("Wrote results_part2_requests.csv\n");
}

// ---------------------------------------------------------------------------
// Timing: Naive-1 vs coalesced Naive-1
// ---------------------------------------------------------------------------
static void run_timing() {
    FILE* f = fopen("results_part2_timing.csv", "w");
    fprintf(f, "impl,N,p,blockNum,threadNum,time_ms,gflops,max_err,pass,relayout_ms\n");

    for (int ni = 0; ni < NUM_N; ++ni) {
        const int N = N_VALUES[ni];
        const size_t elems = (size_t)N * N;
        std::vector<__half> hA, hB;
        std::vector<float> fA, fB, ref, hC(elems);
        init_matrix(hA, fA, N, 1234u + N);
        init_matrix(hB, fB, N, 5678u + N);
        printf("\n=== N = %d: computing CPU reference ===\n", N);
        cpu_matmul(fA, fB, ref, N);

        __half *dA, *dB, *dAp, *dBp;
        float* dC;
        CUDA_CHECK(cudaMalloc(&dA, elems * sizeof(__half)));
        CUDA_CHECK(cudaMalloc(&dB, elems * sizeof(__half)));
        CUDA_CHECK(cudaMalloc(&dAp, elems * sizeof(__half)));
        CUDA_CHECK(cudaMalloc(&dBp, elems * sizeof(__half)));
        CUDA_CHECK(cudaMalloc(&dC, elems * sizeof(float)));
        CUDA_CHECK(cudaMemcpy(dA, hA.data(), elems * sizeof(__half), cudaMemcpyHostToDevice));
        CUDA_CHECK(cudaMemcpy(dB, hB.data(), elems * sizeof(__half), cudaMemcpyHostToDevice));

        auto check = [&] {
            CUDA_CHECK(cudaMemcpy(hC.data(), dC, elems * sizeof(float), cudaMemcpyDeviceToHost));
            return max_err(hC.data(), ref);
        };
        auto log = [&](const char* impl, int p, int bn, int tn, float ms, double err, float relayout) {
            fprintf(f, "%s,%d,%d,%d,%d,%.6f,%.3f,%.3e,%d,%.6f\n", impl, N, p, bn, tn, ms,
                    gflops(N, ms), err, err < 1e-3 ? 1 : 0, relayout);
            fflush(f);
            printf("%-17s N=%5d p=%3d blocks=%5d threads=%5d %10.4f ms  err=%.2e%s\n", impl, N, p,
                   bn, tn, ms, err, err < 1e-3 ? "" : "  <-- CHECK");
        };

        for (int pi = 0; pi < NUM_P; ++pi) {
            const int p = P_VALUES[pi], threads = p * p;
            const int permBlocks = (int)((elems + 255) / 256);
            float relayout = time_kernel([&] {
                permute_A<<<permBlocks, 256>>>(dA, dAp, N, p);
                permute_B<<<permBlocks, 256>>>(dB, dBp, N, p);
            });

            for (int tn = 1; tn <= std::min(threads, 1024); tn *= 2) {
                const int bn = threads / tn;
                CUDA_CHECK(cudaMemset(dC, 0xFF, elems * sizeof(float)));
                float ms = time_kernel([&] { naive1_kernel<<<bn, tn>>>(dA, dB, dC, N, p); });
                log("naive1", p, bn, tn, ms, check(), 0.f);

                CUDA_CHECK(cudaMemset(dC, 0xFF, elems * sizeof(float)));
                ms = time_kernel([&] { naive1_coalesced_kernel<<<bn, tn>>>(dAp, dBp, dC, N, p); });
                log("naive1_coalesced", p, bn, tn, ms, check(), relayout);
            }
        }
        CUDA_CHECK(cudaFree(dA));
        CUDA_CHECK(cudaFree(dB));
        CUDA_CHECK(cudaFree(dAp));
        CUDA_CHECK(cudaFree(dBp));
        CUDA_CHECK(cudaFree(dC));
    }
    fclose(f);
    printf("\nWrote results_part2_timing.csv\n");
}

int main(int argc, char** argv) {
    bool countsOnly = argc > 1 && std::string(argv[1]) == "--counts";

    size_t smemMax = 48 * 1024;  // Naive-2's KC depends on the GPU's shared memory
    cudaDeviceProp prop;
    if (cudaGetDeviceProperties(&prop, 0) == cudaSuccess) {
        smemMax = prop.sharedMemPerBlockOptin;
        printf("GPU: %s (sm_%d%d), max dynamic smem/block %zu KB\n", prop.name, prop.major,
               prop.minor, smemMax / 1024);
    } else {
        printf("No GPU found; using 48 KB shared memory for Naive-2 chunk sizes.\n");
        countsOnly = true;
    }

    run_counts(smemMax);
    if (!countsOnly) run_timing();
    return 0;
}
