# QUBO
$\min x^T Q x$ s.t. $x\in \{0,1\}^p$

Given the Example in [Binary LP.md]:

> $\min x_1^2 + x_2 ^2 + 5x_1x_2$ s.t. $x_1,x_2\in \{0,1\}$

> $\equiv x_1 + x_2 + 5x_1x_2$ s.t. $x_1,x_2\in \{0,1\}$

QUBO is a special case of linear programming because we can represent the multiplication by other variables.

> Note that Quantum Computers are REALLY good at solving these QUBO problems.

# Lagrangian Relaxtion in QUBO
$L(\lambda) = \min c^T x - \lambda(f^T x -g)$

| Boolean Condition | Linear Constraint | Quadratic Constraints |
| -------- | -------- | -------- |
| $x\lor y$ | $x+y\geq 1$ | $1-x-y+xy=0$ |
| $x\lor y \lor z$ | $x+y+z\geq 1$ | $1-x-y-z+xy+xz+yz-xyz=0$ |
| $x\rightarrow y$ | $x\leq y$ | $x-xy=0$ |
| $\lnot (x\land y)$ | $x+y \leq 1$ | $xy=0$ |
| $x\land y$ | $x+y = 2$ |  $1-xy=0$ |
| $x\oplus y$ | $x+y = 1$ | $(1-x-y)^2=$ |

$\min x^T Q x$ s.t. $x\in \{0,1\}^q$

$=q_{11}x1^2 + q_{12}x_1x_2+q_{21}x_1x_2+...$

$=q_{11}x1 + q_{12}x_1x_2+q_{21}x_1x_2+...$

# Vertex Cover
$\min \sum_{i\in V} x_i$

s.t. $x_i+x_j\geq 1, (\{i,j\}\in E)$ -> this constraint is a problem so apply lagrangian Relaxtion

> $x_i\in\{0,1\}, (i\in V)$

Lagrangian Relaxtion

$\min \sum x_i + \lambda\sum_{i,j\in E}(1-x_i-x_j+x_ix_j)$

$=\sum_{i\in V} x_i(1-\lambda deg(i)) + \lambda \sum_{i,j\in E} x_ix_j$
