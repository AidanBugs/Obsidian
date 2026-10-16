// common.cuh — shared helpers for part1_matmul.cu and part2_coalescing.cu
#pragma once
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>
#include <random>
#include <algorithm>
#include <cuda_runtime.h>
#include <cuda_fp16.h>

#define CUDA_CHECK(call)                                                        \
    do {                                                                        \
        cudaError_t e_ = (call);                                                \
        if (e_ != cudaSuccess) {                                                \
            fprintf(stderr, "CUDA error '%s' at %s:%d\n",                       \
                    cudaGetErrorString(e_), __FILE__, __LINE__);                \
            exit(1);                                                            \
        }                                                                       \
    } while (0)

// Experiment grid (reduced from the handout: p in {8,16,32}, N <= 1024)
static const int N_VALUES[] = {64, 128, 512, 1024};
static const int P_VALUES[] = {8, 16, 32};
static const int NUM_N = sizeof(N_VALUES) / sizeof(int);
static const int NUM_P = sizeof(P_VALUES) / sizeof(int);

// ---------------------------------------------------------------------------
// Host helpers
// ---------------------------------------------------------------------------

// Random half matrix in [-1, 1]. `f` keeps the exact float value of each half
// so the CPU reference sees the same inputs the GPU does.
inline void init_matrix(std::vector<__half>& h, std::vector<float>& f, int n, unsigned seed) {
    std::mt19937 rng(seed);
    std::uniform_real_distribution<float> dist(-1.f, 1.f);
    h.resize((size_t)n * n);
    f.resize((size_t)n * n);
    for (size_t i = 0; i < h.size(); ++i) {
        __half v = __float2half(dist(rng));
        h[i] = v;
        f[i] = __half2float(v);
    }
}

// Row-major C = A * B on the CPU in float (i-k-j order for cache friendliness).
inline void cpu_matmul(const std::vector<float>& A, const std::vector<float>& B,
                       std::vector<float>& C, int n) {
    C.assign((size_t)n * n, 0.f);
    for (int i = 0; i < n; ++i)
        for (int k = 0; k < n; ++k) {
            float a = A[(size_t)i * n + k];
            const float* b = &B[(size_t)k * n];
            float* c = &C[(size_t)i * n];
            for (int j = 0; j < n; ++j) c[j] += a * b[j];
        }
}

// Max of |got - ref| / (1 + |ref|). Returns +inf if any value is NaN/inf.
inline double max_err(const float* got, const std::vector<float>& ref) {
    double m = 0.0;
    for (size_t i = 0; i < ref.size(); ++i) {
        if (!std::isfinite(got[i])) return INFINITY;
        double d = std::fabs((double)got[i] - ref[i]) / (1.0 + std::fabs(ref[i]));
        m = std::max(m, d);
    }
    return m;
}

// Time a launch with CUDA events: one warm-up, then the mean of `maxReps` runs
// (a single timed run if the kernel takes longer than 200 ms).
template <typename F>
float time_kernel(F launch, int maxReps = 5) {
    cudaEvent_t s, e;
    CUDA_CHECK(cudaEventCreate(&s));
    CUDA_CHECK(cudaEventCreate(&e));

    launch();  // warm-up
    CUDA_CHECK(cudaGetLastError());
    CUDA_CHECK(cudaDeviceSynchronize());

    float ms = 0.f;
    CUDA_CHECK(cudaEventRecord(s));
    launch();
    CUDA_CHECK(cudaEventRecord(e));
    CUDA_CHECK(cudaEventSynchronize(e));
    CUDA_CHECK(cudaEventElapsedTime(&ms, s, e));

    if (ms < 200.f && maxReps > 1) {
        CUDA_CHECK(cudaEventRecord(s));
        for (int r = 0; r < maxReps; ++r) launch();
        CUDA_CHECK(cudaEventRecord(e));
        CUDA_CHECK(cudaEventSynchronize(e));
        CUDA_CHECK(cudaEventElapsedTime(&ms, s, e));
        ms /= maxReps;
    }
    CUDA_CHECK(cudaGetLastError());
    CUDA_CHECK(cudaEventDestroy(s));
    CUDA_CHECK(cudaEventDestroy(e));
    return ms;
}

inline double gflops(int N, float ms) { return 2.0 * N * N * (double)N / (ms * 1e6); }

// ---------------------------------------------------------------------------
// Naive-1 (shared by Part 1 and Part 2 as the baseline)
//
// p*p threads in total, launched as blockNum x threadNum (blockNum*threadNum == p*p).
// Global thread g -> (tx, ty) = (g % p, g / p). Thread owns the T x T output tile
// with T = N/p starting at row ty*T, col tx*T. Global memory only.
// ---------------------------------------------------------------------------
// __launch_bounds__(1024): tells the compiler this kernel may run with 1024
// threads per block, so it keeps register use low enough for that to launch.
__global__ void __launch_bounds__(1024) naive1_kernel(const __half* __restrict__ A, const __half* __restrict__ B,
                              float* __restrict__ C, int N, int p) {
    int g = blockIdx.x * blockDim.x + threadIdx.x;
    if (g >= p * p) return;
    int tx = g % p, ty = g / p, T = N / p;
    int r0 = ty * T, c0 = tx * T;

    for (int i = 0; i < T; ++i) {
        const __half* a = A + (size_t)(r0 + i) * N;
        for (int j = 0; j < T; ++j) {
            int col = c0 + j;
            float sum = 0.f;
            for (int k = 0; k < N; ++k)
                sum += __half2float(a[k]) * __half2float(B[(size_t)k * N + col]);
            C[(size_t)(r0 + i) * N + col] = sum;
        }
    }
}
