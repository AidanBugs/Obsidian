# LP Duality
LP in symmetric form

$\min c^T x$

s.t. $Ax \geq b$

> $x\geq 0$

Standard to symmetric form:

> $2x_1 + 3x_2 = 4$

> Becomes

> $2x_1 + 3x_2 \geq 4$

> $-2x_1 - 3x_2 \geq -4$

**Def** Dual form of a symmetric LP (the original is the primal) is as follows:

$\max b^T y$

s.t. $A^T y \leq c$

> $y\geq 0$

## EX
$\min x_1+2x_2$

s.t. $3x_1 + 4x_2 \geq 5$

> $x_1,x_2\geq 0$

As the primal, now the dual is:

$\max 5y$

s.t. $3y \leq 1$

> $4y \leq 2$

> $y\geq 0$

Each variable in dual corresponds to a constraint in primal

## Dual of Dual is primal

**Thm** Dual of dual is primal

**Proof** 
$\max b^T y \rightarrow \min -b^T y$

s.t. $A^T y \leq c \rightarrow$ s.t. $-A^T y\geq -c$

> $y\geq 0$

Now to convert the symmetric dual to dual

$\max -c^T x\rightarrow \min c^T x$

s.t. $-Ax\leq -b \rightarrow$ s.t. $Ax\geq b$

$x\geq 0$

## Weal Duality

**Thm** Weak Duality

Let $\bar x(\bar y)$ be a feasible solution of primal (dual). Then, $b^T\bar y\ leq \bar y^T A\bar x \leq c^T \bar x$

**Proof**

$b\leq A \bar x$ and $\bar y ^T A=(A^T\bar y)^T \leq c^T$ sub in as needed

This theorem tells us that the feasible region of the primal is always greater than the feasible region for the dual. In other words the costs of the dual is less than or equal to the cost of the primal. These two sets intersect at at most one point because of the $\leq$ constraint.

**Corallary**

1. If $\bar x(\bar y)$ feasible solution to primal(dual), ten $c^T \bar x (b^T \bar y)$ are upper(lower) bounds to the optimal objective value of dual(primal).
2. Iff the primal(dual) is unbounded meaning achieve minus infinity (positive infinity) then the dual (primal) is infeasible.
3. If $\bar x(\bar y)$ are feasible solution for primal (dual) and $c^T \bar x = b^T \bar y$ then $\bar x,\bar y$ are optimal

## Strong Duality
**Thm** Strong Duality

If the primal (dual) has a finite (objective function has a finite value) optimal solution $x^*(y^*)$, so does the dual (primal) and $c^T x^*=(y^*)^T Ax^* = b^T y^*$

**Proof** Optimality Condition

Suppose $\bar x$ is an optimal solution then it is also a bfs then this is an extreme point that corresponds to a basis $B\rightarrow \pi=(B^{-1})^T c_B\rightarrow c^\pi = c-A^T\pi$

$\bar x opt \leftrightarrow c^\pi \geq 0$

$x^*$ opt for 

$\min c^T x$

s.t. $Ax \geq b$

> $x\geq 0$

Convert to standard form:

$\min c^T x$

s.t. $Ax-Is\geq b$

> $x,s\geq 0$

Now we have $\tilde x = (x,s), \tilde c = (c,0), \tilde A = (A, -I), \tilde b = b$

Thus $0\leq c^\pi = \tilde c - \tilde A^T \pi = (c,0)- (A^T, -I)\pi = (c-A^T \pi, \pi)$

This means that $c-A^T\pi \geq 0\rightarrow c\geq A^T\pi$

and $\pi \geq 0$

This is the same form as the dual!! So $\pi$ is a feasible solution of the dual!!

In canonical form, 

$\min (c^\pi_L)^T x_L (+\pi^Tb)\rightarrow \pi^T b$ at Optimality where the dual's objective valus is $b^T \pi$

## Duality Shortcuts
Originally: standard form -> symmetric form -> dual -> simplify (see complemnetary slackness)

We can actually just use standard form -> substitution by taking the dual with a variable $z$ which is unrestricted 

In short follow this table:

| Primal | Dual |
| ----- | ----- |
| $i$th con $\leq$ | $i$th var $\geq$ |
| $i$th con $\geq$ | $i$th var $\leq$ |
| $i$th con $=$ | $i$th var unrestricted |
| $j$th var $\geq$ | $j$th con $\leq$ |
| $j$th var $\leq$ | $j$th con $\geq$ |
| $j$th var unrestricted | $j$th con $=$ | 

## Lagrangian Relaxation
$\min c^T x$

s.t. $Ax=b$

> $f^T x=g$

> $x\geq 0$

With a dual of

$\max b^T z + gy$

s.t. $A^T z + fy \leq c$

With complemnetary slackness of

$x_j(c_j - \sum_{i=1}^p a_{ij}z_j - f_jy) =0, (j=1,2,...,q$

1. What is the meaning of the dual variables?
2. How constraining a given costraint is? Can a constraint be removed without changing the optimum?

> Tight vs Not Tight constraints

We introduce a penalty term such that we remove the $f^Tx=g$ constraint and add to the cost function such that:

$\min c^T x - \lambda (f^T x -g)$ where $\lambda$ is the Lagrangian multiplier

Dual of this one is

$\max b^T z$

s.t. $A^T z \leq c-\lambda f$

we can rewrite as $(c-\lambda f)^T x (+\lambda g)$

**Claim** $L(\lambda)\leq c^*$

**Proof** Feasible regioon of $L(\lambda) \supseteq$ original feasible region (trivial)

Our goal is to find a $\lambda^*$ such that $L(\lambda^*)=c^*$

When we compare the two duals we find that the value of lambda that makes this true is any below the optimal $y^*$. $y^*$ is the break even point

1. $z^*$ feasible for dual of $L(y^*)$

If we relax a constraint and set $\lambda$ to $y^*$ then we can find the optimal solution without changing the optimal
