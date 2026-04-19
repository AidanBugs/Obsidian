# Approximation algorithms
Optimization problem $\mathcal J$

Instance $I\in \mathcal J\rightarrow c^*(I):$ optimal cost

$A:$ algorithm for $\mathcal J\rightarrow c_A(I):$ cost of solution returned by $A$ on $I$ 

Finding the optimal in an algorithm can be difficult or impossible, EX

- Vertex cover, $2$-appx algorithm $c_{vcapx}(I)\leq 2 c^*(I)$
- Partial information, like Skirental with $D$ unknown, $2$-appx algorithm $c_{A}(I)\leq 2 c^*(I)$

Apx ratio is $sup_{I\in \mathcal J}\frac{c_A(I)}{c^*(I)}$

## Hitting Set
Given $T_1,T_2,...,T_p \subset S$

> $c: S\rightarrow R^+$

Find $H\subset S$ that 

> $\min \sum_{e\in H} c_e$

> s.t. $H\cap T_j\neq \phi, j=1,...,p$

$\alpha = \max | T_j |$


Hitting Set is a generalization of Vertex Cover. Each edge is $T$ set so we are finding $H\subset S$ that way $\exists h\in H, \forall T: h\in T$. Each vertex however has a cost of $1$ because Hitting Set is a weighted generalization of Vertex Cover.

### Hitting Set as ILP
$\min \sum_{e\in S} c_e x_e$

s.t. $\sum_{e\in T_j} x_e \geq 1, (j=1,...,p)$

$x_e\in \{0,1}$ and $1$ iff $e\in H$

### Linear Relaxation
$\min \sum_{e\in S} c_e x_e$

s.t. $\sum_{e\in T_j} x_e \geq 1, (j=1,...,p)$

> $0 \leq x_e \leq 1$

Note that the $x_e\leq 1$ constraint is redundant because there is no optimal solution where $x_e>1$ because the max an $x$ is needed is $1$ and all costs are positive so having a cost greater than $1$ is useless.

### Primal Dual Algorithm Idea
Primal $x^{(0)}$ (not necessarily feasible) and $y^{(0)}$ as a solution in dual that is feasible (note these are linked by comp slack)

We iterate forward to create $x^{(1)}, y^{(1)}$ where $x$ is not necessarily feasible but we are going to reduce the infeasibility region from $x^{(0)}$ to $x&{(1)}$


### Dual of Lin Relax
$y_p$ for each $T_p$

So dual is

$\max \sum_{j=1}^p y_j$

s.t. $\sum_{j: e\in Tj} y_j \leq c_{e}, (\forall e \in S)$

> $y_j \geq 0$
Continue until $x^*$ and $y^*$ are both feasible and satisfy comp slack.

Thus optimal $c^*: \sum_{j=1}^p y_j \leq c^* \leq \sum_{e\in S} c_e x_e$

### Comp Slack
$x_e s_e=0, (e\in S)$

> $s_e= c_e-\sum_{j:e\in T_j} y_j\geq 0$

>> $\geq 0$ for feasible $y$

$y_j (\sum_{e\in T_j} x_e -1)=0, (j=1,...,p)$

This is good but we also need to try and get an optimal integrality idea. For Successive Shortest Paths, we had integrality bc MCNF is unimodular so optimal solution is integer.

### Primal Dual Algorithm for Hitting Set
We relax the comp slack constraint of 

$y_j (\sum_{e\in T_j} x_e -1)=0, (j=1,...,p)$

Each iteration we slowly introduce these set constraints.

Thus:

```
H = \phi
y_j = 0

while \exists j: T_j \cap H = \phi:
    increase y_j until v s.t. \exists e s_e =0
    H.append(e)
return H

```

Invariants

1. $s_e \geq 0$
2. $y_j \geq 0$

True initially, (straight forward)

At each iteration we are increasing $y_j$ to an $se\geq 0$

$\rightarrow y_j$ never deacreases so $\rightarrow y_j\geq 0$

$\rightarrow s_e$ does not go below $0$ because we no longer use that vertex 

**Thm** HSPD Is $\alpha$-apx algorithm for HS

**Corollary** HSPD is $2$-apx for VC

Proof Cost of returned $H$:

$c(H)=\sum_{e\in H} c_e=\sum_{e\in H} \sum_{j:e\in T_j} y_j = \sum_{j=1}^p |H\cap T_j| y_j \leq \alpha \sum_{j=1}^p y_j\leq \alpha c^*$

> $s_e=0$ when $e$ added to $H$ and never change any of those sets again because they are satisfied ($y_j, j: e\in T_j$) (think comp slack)

> The last is given from that the optimal solution is always $c^* \geq \max \sum y_j$


## A dif thing idk he didnt name it
$\max \Pi_{i=1}^n (1-x_i)$

s.t. $\sum_{i=1}^n x_i \geq \beta$

> $0\leq x_i \leq 1$

Where $\beta$ is a parameter where $0\leq \beta \leq 1$

Claim WLOG opt $x_i^*\leq \beta$ otherwise we can set a single $x_i$ to $\beta$ which results in a objective of $1-\beta$. Since we are assuming that $\exists x_i^*\in x^*, x_i^*> \beta$ then the objective would be smaller than this.

**Thm** $x_i^* = \frac{\beta}{n}$ as optimal solution

Proof by induction: $n=1$ trivial

inductive step:

$\max (1- x_n) \Pi_{i=1}^{n-1} (1-x_i)$

s.t. $x_n + \sum_{i=1}^{n-1}x_i\geq \beta$

If we assume $\bar x_n$ is fixed then:

$\max \Pi_{i=1}^{n-1} (1-x_i)$

s.t. $\sum_{i=1}^{n-1}x_i\geq \beta-\bar x_n$

This is easy to solve because this is the same as our $n-1$ induction so optimal is:

$x_i^* = \frac{\beta - \bar x_n}{n-1}$ so the optimal value is $(1-\frac{\beta - \bar x_n}{n-1})^{n-1}$

We can take the derative of this with respect to $\bar x_n$ to determine the maximum of this function is. We find that the optimal $\bar x_n = \frac{\beta}{n}$, this makes the $x_i^* = \frac{\beta - \beta/n}{n-1}=\frac{\beta}{n}$

Thus the final cost is $c^* = (1- \frac \beta 1)^n \leq e^{-\beta}$ which is equality as $n$ approaches $\infty$ due to this being the definition of $e$

## Algorithm HSRnd1
$\min \sum_{e\in S} c_e x_e$

s.t. $\sum_{e\in T_j} x_e \geq 1, (j=1,...,p)$

> $0 \leq x_e \leq 1$

```
for each e in S do:
    H = H \cup {e} w/ prob x_e^*

```

$E(c(H)) = \sum_{e\in S} c_e Pr[e\in H]= \sum_{e\in S} c_e x_e^* \leq c^*$ better than optimal but may not give a cover
