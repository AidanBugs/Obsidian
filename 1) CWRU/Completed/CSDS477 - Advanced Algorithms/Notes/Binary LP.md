# Binary LP

$\min c^T x$

s.t. $Ax=b$

> $x\geq 0$

> $x\in \{0,1\}^q$

## EX Vertex Cover
...

s.t. $x_i +x_j \geq 1$

...

> $x\in \{0,1\}^q$

## Having an "And" variable

$x\land y \rightarrow z (=xy)(=x\land y)$

$x,y \geq z \geq x+y -1$

This allows for $z=1$ iff $x$ and $y$ are $1$ and $0$ otherwise. This creates the flexibility for this constraint to be true without forcing $x,y=1$

## Misc
$Q\in R^{q\times q}, x\in R^p$

$x^T Q x = \sum_i^p \sum_j^q q_{ij}x_ix_j$

> This is an arbitray homogenous quadratic form.

### EX

$Q=[(1,2), (3,4)] \rightarrow x^T Q x = x_1^2 + 2x_1 x_2 + 3x_1 x_2 + 4x_2^2$

We can assume $Q$ is symmetric because it does not change the $x^T Q x$
