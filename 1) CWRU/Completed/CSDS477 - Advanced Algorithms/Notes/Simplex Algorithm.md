# Simplex Algorithm
Goal is to find an optimal solution starting at a basic feasible solution

**Def** Simplex Multipliers mrt $B$

> $\pi = (B^{-1})^T c_b$

**Def** Reduced Costs mrt $B$

> $c^\pi = c-A^T \pi$

Note that $c^\pi = (c_B, c_L)-(B^T,L^T)\pi$

> $\rightarrow (c_B, c_L)-(B^T,L^T)(B^{-1})^T c_B$

> $\rightarrow (c_B-B^T(B^{-1})^T c_B, c_L-L^T(B^{-1})^Tc_B)$

> $\rightarrow (0, c_L-L^T(B^{-1})^Tc_B)$ (Note that $B^T(B^{-1})^T=(B^{-1}B)^T=I$)

For finding equivalent points, $(c^\pi)^T x = c^Tx - \pi^T Ax = c^T x -\pi ^T b$ (note $\pi^T b$ is a constant)

> This is because $\min c^Tx = (c^\pi)^T x \equiv \min(c^\pi)^T x$

**Main Idea**:

> $c^\pi_j<0 \rightarrow increase x_j, update x_B$ and repeat until optimal solution (no $c^\pi_j<0$)

Additionally note that you aim to increase the $x_j$ with the largest increase to the objective (decrease in case of minimizing)

Small issue is that a change of basis doesn't necessarily change extreme points
