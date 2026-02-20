# Unimodularity
LP vs ILP

$Q$: Under which circumstances does optimal solution take integer values?

**Def**: A $p\times q$ integer matrix $rank(A)=p$

$A$ is unimodular iff: for any basis $B$ of $A$, $det(B)=\pm 1$

**Thm** The following are equivalent:

- i. $A$ unimodular
- ii. Basic solution of $Ax=b$ ($b$ is integer) are integer
- iii. $B^{-1}$ integer $\forall$ basis $B$ of $A$

**Proof** $A$ integer matrix, $B$ submatrix of $A$ so $B$ integer

Start with  i. $\rightarrow$ ii.:

> $A$ unimodular $\rightarrow$ basic solutions 

> Solution solves $Bx=b$ given by Cramer's rule

> $x_i=\frac{det(B\text{where }i\text{th column replaced by }b)}{det(B)}$

> All components are integer with the denominator is $\pm 1$ and calculating a determinant is addition, subtraction, multiplication but no division. Thus determinant in the numerator is integer.

Now ii. $\rightarrow$ iii.:

> $e_j:j$th component, $B^{-1}e_j:j$th component of $B^{-1}$, $d_i:i$th component of $B^{-1}e_j$

$$
\alpha_i = \begin{cases}
0 & d_i\geq 0 \\
\lceil -d_i \rceil * d_i < 0
\end{cases}
$$

> Thus helps us get the following notes: $\alpha_i$ integer, $\alpha_i\geq 0$, $\alpha_i+d_i \geq 0$

> Solve: $Bx=e_j+B\alpha$, if we take inverse of $B$ of both sides (note that we are choosing $e_j+ B\alpha$ as our $b$)

> $\rightarrow x=B^{-1}e_j +\alpha$ since $x,\alpha$ are integer then $d_i$ must also be integer thus $B^{-1}$ is integer

Lastly iii. $\rightarrow$ i.

> $B^{-1}$ initeger

> Which means that $1=det(B)det(B^{-1})$ thus there are only two ways this statement holds and that is $det(B)=det(B^{-1})=\pm 1$ meaning $A$ is unimodular.

# Minimum Cost Network Flow
Given a directed graph $G=(V,E)$ where $V$ is a list of nodes and $E$ is a list of arcs

$b_i$ supply (=-demand) ($i\in V$)

$l_{ij}$ lower bound ($(i,j)\in E$)

$u_{ij}$ upperbound ($(i,j)\in E$)

and $0\leq l_{ij} \leq u_{ij} \leq +\infty$

$c_{ij}$ unit cost

find the feasible flow of minimum cost.

Suppose the following MCNF:

$1: 5, 2:-1, 3:-1, 4:-3$

$1,3: 3(0,6), 1,2: 1(0,3), 2,3: 5(1,\infty), 2,4: 3(0,\infty), 3,4: 2(0,4)$

The amount of flow must be equal to the amount exiting minus the amount entering and must be between the bounds. Note the sum of all supplies must be equal to $0$ in order to have a feasible solution (necessary but not sufficient for a feasible solution)

The cost is then sum of the flow amounts in an arc times the cost of the arc.
