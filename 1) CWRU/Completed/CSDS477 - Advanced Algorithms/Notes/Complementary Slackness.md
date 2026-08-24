# Complemntary Slackness

Opt Condition for LP

$\min c^T x$

s.t. $Ax \geq b$

> $x\geq 0$

Then dual is:

$\max b^T y$

s.t. $A^T y \leq c$

> $y\geq 0$

Corallary weak duality is that if $c^Tx=b^Ty$ then they are optimal

**Thm** If primal(dual) has finite optimal $x^*(y^*)$ then so does the dual (primal) $y^*(x^*)$

$A: p\times q$ where $p$ \# constrains but $A^T:q\times p$ for dual and $p$ is the \# variables

$y_i$ is the dual variable which corresponds to the $i$th constraint in the primal

Slack in primal (excess): $e=Ax-b\geq 0$ if $x$ is feasible ($e$ has $p$ variables)

Slack in dual: $s= c-A^Ty\geq 0$ if $y$ is feasible ($s$ has $q$ variables)

**Thm** Let $\bar x (\bar y)$ be a feasible solution of the primal (dual) then $\bar x, \bar y$ optimal iff:

$\forall i\in \{1,...,p\}: e_i \bar y_i = 0 ,\forall j\in \{1,...,q\}: s_j \bar x_j = 0$

## EX
$\min x_1 + 2x_2$

$3x_1 +4x_2 \geq 5$

and dual is

$\max 5y$

$3y \leq 1$

$4y \leq 2$

So the equalities are

$(3x_1 + 4x_2 -5)y=0$

$(1-3y)x_1=0$

$(2-4y)x_2=0$

## Proof
$e^T \bar y = \sum_i e_i\bar y_i, s^T \bar x\sum_j s_j \bar x_j$

$\rightarrow$ If $\bar x, \bar y$ optimal then by strong duality, $c^T \bar x - (\bar y)^T A \bar x = 0$

$= (c^T - (\bar y)^T A) \bar x$

$= s^T x =0$ since all variables are positive then the individual sum of $s_j\bar x_j$ are all $0$

Similarly: $\bar y ^T A \bar x- b^T \bar y = 0$

$= e^T \bar y =0$ since all variables are positive then the individual sum of $s_j\bar x_j$ are all $0$

Now $\leftarrow$ $e_i \bar y_i = 0 \forall i, s_j \bar x_j =0 \forall j$

It is the eact same idea.... start with weak duality and show that they are equal by substituting in our slack definition so now by the corallary it is optimal

This means $e_i>0\rightarrow \bar y_i =0$ similarly $s_j > 0\rightarrow \bar x_i=0$

## EX
$\min 3x_1 + 4x_2$ 

$5x_1 + 6x_2 =7$

in sym form:

$\min 3x_1 + 4x_2$

$5x_1 +6x_2 \geq 7$

$-5x_1 -6x_2 \geq -7$

in dual

$\max 7y_1 - 7y_2$

$5y_1 -5y_2 \leq 3$

$6y_1 -6y_2 \leq 4$

Suppose $z=y_1-y_2$, then:

$\max 7z$

$5z \leq 3$

$6z \leq 4$

With $z\lesseqgtr 0$

In other words we can take the dual of a standard form by just unrestricting the $z$
