---
format: pdf
---

# Linear Programming (LP)
**LP \in P**

LP in standard form:
    $\min c^T x$
    s.t. $Ax=b, x\geq0$

where $X\in R^q$ decision variables

and $c\in R^q$ costs vector

and $A, p\times q$ matrix of constraints

and $b\in R^p$


$I=(X,c)$ where $X$ set of feasible solutions and $c$ is the cost function

$X=\{x\in R^q: Ax=b, x\geq 0\}$

$c:X\rightarrow R, c(x) = c^T x$

## EX
$\min x_1 + x_2$

s.t. $x_1 +2x_2 = 3$

$x_1,x_2\geq 0$

$$
x= 
\begin{pmatrix}
x_1 \\
x_2
\end{pmatrix}
$$
$$c= 
\begin{pmatrix}
1 \\
1
\end{pmatrix}
$$
$$A =
\begin{pmatrix}
1 \\
2
\end{pmatrix}
$$
$$b =
\begin{pmatrix}
3
\end{pmatrix}
$$

$x^* = (0,3/2)$ where this represents the optimal solution

without loss of generality (wlog) $rank(A) = p$ (full row rank which implies $q\geq p$) this is because if the rank is not $p$, then the last row (or few rows) are linear combinations of previous rows. This means that the last constraint (or last few constraints) are useless because it can be represented by the previous rows and no longer represents anything new. If (by error) the $b$ does not line up for the last row(s) then the constraints make the solution impossible.

> Since $rank(A)=p, \exists p$ column vectors of $A$ that are the basis of $R^P$ 

> This means that $A=(B L)$ where $B$ is the basis vectors and $L$ is leftover of $A$.

# Max instead of Min (and other non standard forms)
1. $\max = -\min$
2. $x_1 \leq 0$ because $-x_1=y_1, y_1\geq 0$
3. Suppose $x_1 \geq$ or $<0\rightarrow x_1=y_1-z_1, y_1,z_1 \geq 0$
4. $\sum_j a_{ij}x_j -s_i = b_i$ (for inequality $\sum \geq b_i$)
>> $s_i\geq 0$ is the slack variable
5. $\sum_j a_{ij}x_j +s_i = b_i$ (for inequality $\sum \leq b_i$)

## EX
$\max x_1+x_2$

s.t. $x_1+2x_2\geq 3$

> $2x_1 +3x_2 \leq 4$

> $x_1 \leq 0$

Working Transformations:

> $y_1=-x_1 \geq 0$

> $x_2=y_2-z_2 (y_2,z_2 \geq 0)$ (since $x_2$ is unbound)

> For the $\max$, $\min y_1 + z_2 -y_2$

Thus we have (rn)

$\min y_1 - y_2 + z_2$

s.t. $-y_1 + 2y_2 -z_2 -s_1 = $

> $-2y_1 + 3y_2 - 3z_2 + s_2 = 4$

> $y_1,y_2,z_2,s_1,s_2 \geq 0$

## Feb 2
$\max x_1 + x_2$

s.t. $2x_1 + 3x_2 \leq 12$

> $0\leq x_1 \leq 4$

> $0\leq x_2 \leq 3$

Plot here :)

**DEF** Let $x,y\in R^q (x\neq y)$

> Strict convex combinations of $x,y$

> $z=\lambda x + (1\lambda) y, \lambda\in (1,0)$

**THM** If $x,y\in X,$ then any strict convex combination is feasible (note this means we can get a $z$ between $x$ and $y$)

Proof: remember that $\min c^T x, $s.t.$ Ax=b, x\geq 0$

$x,y\in X\{Ax=Ay=b, x,y\geq 0, Az=A(\lambda x +(1-\lambda)y)$

> $Az= \lambda Ax + (1-\lambda)Ay$

> $Az= \lambda b + (1-\lambda) b =b$

and we know $z\geq 0$ bc its all positive components.

Thus $z$ can be added because it has no contradictions

**THM** If $x^*,y^*$ is optimal, then any strict convex combination is optimal

Proof: $x^*,y^*\in X\rightarrow z^*$ feasible

> $v^* = c^T x^* = c^T y^*$

> $c^T z^* = c^T($ im lazy proof is plug and simplify $)=v^*$

**Def** $x\in X$ is an  extreme point iff it is not strict convex combinaton of $y,z\in X$ (note $\in X$ denotes feasible and this is fancy to say $x$ is a corner because it is not between two points) 

**THM** If LP has a finite optimal solution then $\exists$ opitmal solution extreme point(s).

This means that extreme points are candidates for optimality

Suppose we have an optimal solution $x^*$, the non-zero components of $x^*$ relate to $A$ such that those components of $A$ are a set of lin indep vectors. In fact, since any extreme point can become the optimal solution from different cost functions, all edge points $\bar x$ can create a set of lin indep vectors from $A$ via the same method above. 

**THM** Let $\bar x$ be a feasible solution

$A=[a_1,a_2,...,a_q]$

Define $A_c = \{a_j: \bar x_j > 0\}$ (note this is a caligraphic $A$)

Extreme point iff $A_c$ is a set of lin indep vectors

**Proof 1** See examples

**Proof 2** See correctness of simplex algorithm (later)

Since $rank(A)=p, \exists$ Basis of $R^p$ among $a_1,...,a_q$

**Def** Basis of $A$

$\bar x$ feasible $A_c$

If $A_c$ is a basis of $A$ then $\bar x$ extreme pt (because if $A_c$ is basis then its columns are lin indep)

If $\bar x$ is extreme pt, then $A_c$ basis? No because we don't know if $A_c$ contains enough vectors to create a basis of $R^p$. However we can complete $A_c$ to be a basis $B$ of $A$

Do all basis of $A$ correspond to an extreme point? Suppose we have a basis $B$ and leftover $L$ from $A$. $x_B$ basic decision vectors and $x_L$ non-basic decision vectors.

> $Ax=b \rightarrow Bx_B + Lx_L = b$ 

> $\rightarrow x_B B^{-1}L x_L = B^{-1}b$ (we know $B^{-1}$ exists because $B$ is a basis)

> If we want an extreme point then $\bar x_B = B^{-1}b$

**Def** $A$ basic solution corresponding to a basis $B$ is $\bar x=[$B^{-1}b, 0]$

$B\rightarrow \bar x \rightarrow A_c \subset B \rightarrow A$ lin indep $\bar x$ is extreme pt

However is $\bar x$ feasible? NO bc we cannot guarentee $\bar x \geq 0$

**Def** Basic Feasible Solution (bfs) is a basic soolution and feasible so $x_B\geq 0$

We find that if our basis results in a feasible solution then $\bar x$ is an extreme point
