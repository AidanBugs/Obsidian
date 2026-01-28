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

