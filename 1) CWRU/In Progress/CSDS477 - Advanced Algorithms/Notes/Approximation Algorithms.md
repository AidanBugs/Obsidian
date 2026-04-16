# Approximation algorithms
Optimization problem $\mathcal J$

Instance $I\in \mathcal J\rightarrow c^*(I):$ optimal cost

$A:$ algorithm for $\mathcal J\rightarrow c_A(I):$ cost of solution returned by $A$ on $I$ 

Finding the optimal in an algorithm can be difficult or impossible, EX

- Vertex cover, $2$-appx algorithm $c_{vcapx}(I)\leq 2 c^*(I)$
- Partial information, like Skirental with $D$ unknown, $2$-appx algorithm $c_{A}(I)\leq 2 c^*(I)$

Apx ratio is $sup_{I\in \mathcal J}\frac{c_A(I)}{c^*(I)}$

## Hilting Set
Given $T_1,T_2,...,T_p \subset S$

> $c: S\rightarrow R^+$

Find $H\subset S$ that 

> $\min \sum_{e\in H} c_e$

> s.t. $H\cap T_j\neq \phi, j=1,...,p$

$\alpha = \max | T_j |$


Hilting Set is a generalization of Vertex Cover. Each edge is $T$ set so we are finding $H\subset S$ that way $\exists h\in H, \forall T: h\in T$. Each vertex however has a cost of $1$ because Hilting Set is a weighted generalization of Vertex Cover.

### Hilting Set as ILP
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

### Primal Dual Algorithm for Hilting Set
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
