# Taking Dual Shortcut
| Primal (Max) | Dual (min) |
| ----- | ----- |
| $i$th con $\leq$ | $i$th var $\geq$ |
| $i$th con $\geq$ | $i$th var $\leq$ |
| $i$th con $=$ | $i$th var unrestricted |
| $j$th var $\geq$ | $j$th con $\geq$ |
| $j$th var $\leq$ | $j$th con $\leq$ |
| $j$th var unrestricted | $j$th con $=$ | 

Note that the costs of the primal are now the $b$ of the dual and that the $b$ of the primal are now the costs of the dual.

When trying to figure out how taking the dual of parametric LP's think about when a variable appears in more than one constraint, in which case those constraints are all important for that variable in the dual. If a variable $x$ appears in constraints $a_1,...,a_l$ then those constraint variables $a_1,...,a_l$ appear in the dual in the constraint corresponding to the variable $x$. Addtionally, these constraint variables appear in this specific constraint with the same scalar multiple in which $x$ appeared in the individual constraints.

# Lagrangian Relaxtion in QUBO
$L(\lambda) = \min c^T x - \lambda(f^T x -g)$

| Boolean Condition | Linear Constraint | Quadratic Constraints |
| ----- | ----- | -------- |
| $x\lor y$ | $x+y\geq 1$ | $1-x-y+xy=0$ |
| $x\rightarrow y$ | $x\leq y$ | $x-xy=0$ |
| $\lnot (x\land y)$ | $x+y \leq 1$ | $xy=0$ |
| $x\land y$ | $x+y = 2$ |  $1-xy=0$ |
| $x\oplus y$ | $x+y = 1$ | $(1-x-y)^2=1-x-y+2xy$ |
| $\oplus (x)$ | $\sum x = 1$ | $(1-\sum x)^2\equiv 1- \sum_i x_i + 2\sum_{0\leq i < j \leq n} x_ix_j$ |

# Finding Basic Feasible Solutions
A bfs $\bar x$ is found by finding a basis $B$ of $A$ and inverting $B$ then multiplying by $b$ to get the vector $x$ where any variables not in the basis $b$ are simply set to $0$.

# $\pi$ & $c^\pi$
For a basis $B$ of $A$:

>$\pi = (B^{-1})^T C_B$
>
>$C^\pi = C- A^T \pi$

# Proving Optimality
Either show that $c^\pi\geq 0$ or that complementary slackness is $0$ ie $y(Ax-b)=x(A^T y -c) = 0$. Note complementary slackness only applies to non equality constraints as the complementary slackness would be $0$ for any feasible solution.

# Taking the Dual of HW 2 Q5
$\min \sum y_h$

s.t. $x_{Ih} \leq y_h, (I\in A, h=1,..,n)$ 

> $x_{Ih} + x_{Jh} \leq 1, ((I,J)\in c(A), h=1,...,n)$

> $\sum_{h} x_{Ih} = 1, (I\in A)$

> $x_{Ih}, y_{h} \leq 1, (I\in A, h=1,...,n)$ 

so

$\min \sum y_h$

s.t. $x_{Ih} - y_h \leq 0, (I\in A, h=1,..,n)$ 

> $x_{Ih} + x_{Jh} \leq 1, ((I,J)\in c(A), h=1,...,n)$

> $\sum_{h} x_{Ih} = 1, (I\in A)$

> $x_{Ih}, y_{h} \leq 1, (I\in A, h=1,...,n)$ 

> $x_{Ih}, y_{h} \geq 0, (I\in A, h=1,...,n)$ 

## Dual
Lets denote the first constraints as our districts $d_{ij}, i\in A, j\in n$ and the next set as conflicts $\beta_{ikj}, (i,k)\in c(A), k\in n)$, the next as appearances $\alpha_i, i\in A$ and lastly upper bounds as $ux_{Ih}, I\in A, h\in n$ and $uy_h, h\in n$ 

Thus our dual is:

$\max \sum \beta + \sum \alpha + \sum ux_{Ih} + \sum uy_{h}$

s.t. $d_{Ih}+\sum_{(I,J)\in c(A)} \beta_{IJh} + \alpha_I + ux_{Ih} \leq 0, (I\in A, h=1,...,n)$

> $-\sum_{i\in A} d_{ij} + uy_j \leq 1, (j=1,...,n)$

> $d \leq 0, \beta \leq 0, u\leq 0$

# MST as ILP
Given an undirected graph $G(V,E)$ with edge weights $w$ we can create an LP as follows where $m=|E|, n=|V|$:

$\min \sum_{(i,j)\in E} w_{ij} x_{ij}$

s.t. $\sum_{j:(i,j)\in E} x_{ij}\geq 1, (i= 1,..., n)$

> $\sum_{(i,j)\in E} x_{ij} = n-1$

> $x_{ij}\in \{0,1\}, ((i,j)\in E)$

# Vertex Cover as ILP
Given an undirected graph $G(V,E)$ with edge weights $w$ we can create an LP as follows where $m=|E|, n=|V|$:

$\min \sum_{i\in V} x_{i}$

s.t. $x_i + x_j\geq 1, ((i,j)\in E)$

> $x_i\in \{0,1\}, \forall i\in V$


# SDP LP formulation
Suppose we have original LP as:
$\min c x$

s.t. $\bar A x = b_m$

> $x\geq 0$

with $|x| =n$

So the SDP is

$$
b=\begin{pmatrix}
b_m \\
b_z
\end{pmatrix}
, X=xI , C=cI, A=\{rI\}\cup \{Z\}
$$

And $b_z=n^2-n$ list of $0$'s and $Z$ is a list of $n^2-n$ matricies with a unique location of a nonzero entry and the diagonal is always $0$. These added constraints ensure that the solution of $X$ in our SDP remains a diagonal solution

> Note that $r$ refers to columns of $A^T$, which are rows of $A$

