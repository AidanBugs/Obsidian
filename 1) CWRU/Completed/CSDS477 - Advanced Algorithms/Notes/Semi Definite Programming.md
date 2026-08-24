# SDP
Note that SDP is a generalization of LP and there is a Poly time apx algorithm for SDP $(1+\epsilon)\forall \epsilon >0$ apx and the poly time is in size of input, $\ln \frac1\epsilon$

Define a matrix to be positive semidefinite: $Q\in R^{p\times p}$ is symmetric positiive (semi)definite 

iff $\forall x\in R^P - \{0\}, x^TQx \geq 0$ (semidefinite if $Q\geq 0$ and definite if $Q>0$)

Thm $Q\geq 0$ iff symetric all eigenvalues $\geq 0$

($Q> 0$ iff symmetric all eigenvalues $>0$)

Thm $Q\geq 0$ iff $\exists B: Q=B^TB$

> Proof Sketch:

>> (<=) $Q=B^TB$ then $x^TQx = x^TB^TBx=y^Ty=|y|^2\geq 0$ (note that $y=Bx$)

>> (=>) Incomplete Chobeski factorization (or smth) that in poly time give $Q\rightarrow B$

$B= [b_1,b_2,...,b_q]$

$Q=B^T B= [(b_1^T b_1, ... b_1^T b_q),(b_2^T b_1, ... b_2^T b_q), ... (b_q^T,b_1, ... b_q^T b_q)]$

Let $A,B\in R^{p\times q}$

$A\cdot B = \sum_i^p \sum_j^q a_{ij}b_{ij}$

# SDP Standard Form
$\min C\cdot X$

s.t. $A_i \cdot X= b_i (i=1,2,...,p)$

> $X\geq 0$

Note that $X\geq 0$ suggests that $\forall x x^TX\geq 0$, eigenvalues of $X$ are $\geq 0$ and $\exists B: B^TB=X$

WLOG $X$ is symmetric

When trying to find $B$: 

$$
X= \begin{pmatrix}
b_1^T b_1 & b_1^T b_2 & ... & b_1^T b_h \\
b_2^T b_1 & b_2^T b_2 & ... & b_2^T b_h \\
... & ... & ... & ... \\
b_h^T b_1 & b_h^T b_2 & ... & b_h^T b_h \\
\end{pmatrix}
$$

## EX 

$C=[(1,-2),(-2,4)]$

$A_1 = =[(4,3),(3,1)], b_1=1$

$A_2 = =[(1,5),(5,4)], b_2=2$

$X= [(x_11,x_12),(x_12, x_22)]$

Which is equivalent to:

$\min x_11 - 4x_12 + 4x_22$

s.t. $4x_11 + 6x_12 + x_22 = 1$

> $x_11 + 10x_12 + 4x_22 = 2$

If we add a new constraint:

$A_3 = [(0,1),(1,0)], b_3=0$ which now forces $x_12$ to be $0$ which now forces the SDP to become a linear program

So this $A_3$ turns the problem into a linear program because the eigenvalues are $>0$ and they are the diagonal entries

> Note to self figure out why SDP isnt by default a linear program if we dont add this $A_3$ constraint

## Feb 2
$X=[(x_11, x_12), (x_12, x_22)]$

$\rightarrow \exists b_1,b_2\in R^h: X=[(b_1^2, b_1^Tb_2), (b_1^Tb_2, b_2^2)]$

If I wish to restrict: $b_1,b_2\in S_h$ where $S_h$ is a unit hypersphere

