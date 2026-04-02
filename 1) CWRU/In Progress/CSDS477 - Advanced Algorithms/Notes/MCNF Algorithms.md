# MCNF Algorithms
## Assumptions
1. Integrality (supplies and demands are integer) thus by unimodularity $\exists$ optimal integer solution
2. $l_{ij}$, no parallel arcs, no symmetric arcs, 
3. $\exists$ feasible solution
4. $\forall (i,j)\in E, c_{ij}\geq 0$ (restrictive for negative costs and infinite upperbound)
5. $\forall i,j \in V, \exists$ path $i\rightarrow j$ of $\infty$ capacity

> $i,j$ both point to an exchange vertex $X$ which points back to $i$ and $j$ (through a temp vertex to prevent symmetric arcs) all with infinite capacity. Suppose all arcs have a cost of $BC+1$ see below 

**Question** Max cost of a MCNF? $\exists$ feasible solution

- wlog no cycles bc they just increase the cost
- wlog integer solution

For paths, there must be paths from all source nodes to all sink nodes. Thus we can write $B=\sum_{i:b_i>0} b_i$ and $C=\sum_{(i,j)\in E} c_{ij}$ so cost of MCNF $\leq BC$ as an extreme worst case scenario.

## Primal Dual Method
Idea is find $x,\pi$ and slowly reduce the infeasibility region (start with a not necessarily feasible solution in primal and iterate progressively)

Assumptions from above

Invariant:

- $\pi$ feasible for dual
- $x$ solution for primal
- $x,\pi$ complementary slackness

At every iteration, reduce $x$ infeasibility

**Def** A pseudo-flow $x$ satisfies capcity constraints ($x_{ij}\leq u_{ij}$) but not necessarily mass-balance constraints.

$e_i = b_i - \sum_{j:(i,j)\in E} x_{ij} + \sum_{i:(i,j)\in E} x_{ij}$

excess at $i\in V$. Note it is feasible if $e_i=0$ for all $i$

> Thus we start our algorithm with a feasible flow of $x^0=0$ so $\pi^0=0$ because $G(x^0)=G(x)$ is valid for $c^{\pi0}_{ij}\geq 0$ where $G(x^0)$ is the residual network flow for our flows $x^0$.

>> Recall that $c^\pi_{ij}=c_{ij}-\pi_i+\pi_j$

**Lemma** For $\pi^i\rightarrow \pi^{i+1}$

Let $x$ be a pseudoflow, $\pi$ feasible node potentials, $s\in V$, $c^\pi_{ij}\geq 0, \forall (i,j)\in E(x)$

> $d_i=$ length of shortest path from $s$ to $i$ in $G(x)$ w/ length $c_{ij}^\pi$

Then, $\pi'=\pi-d, c_{ij}^{\pi'}\geq 0, \forall (i,j) \in E(x)$ and actually $c_{ij}^{\pi'}$ is exactly $0$ along shortest paths

> In other words, we use the shortest paths algorithms and $x^i,\pi^i$ to find $\pi^{i+1}$

**Proof** Bellmin Ford $d_j\leq d_i + c_{ij}^\pi, (j\in V, (i,j)\in E(X))$

> $c_{ij}^{\pi'}=c_{ij}-\pi'_i+\pi'_j= c_{ij}-\pi_i+\d_i+\pi_j-d_j=c_{ij}^\pi+d_i-d_j$

> By the Bellmin ford conditions: $c_{ij}^\pi+d_i-d_j\geq c_{ij}^\pi-c_{ij}^\pi=0$

> The Bellmin Ford inequality is $0$ along shortest paths, thus $c_{ij}^{\pi'}=0$ along shortest paths

**Lemma** For $x^i\rightarrow x^{i+1}$

Let $x$ be a pseudoflow, $\pi$ feasible node potentials, $s\in V$, $c^\pi_{ij}\geq 0, \forall (i,j)\in E(x)$

> $x'= x+$flow $s\rightarrow i$ along the shortest path $s\rightarrow i$ 

> From the previous lemma, $c_{ij}^\pi=0$ along the shortest paths from $s\rightarrow i$ in the residual network

> $c_{ij}^\pi\geq 0, \forall (i,j)\in E(x')$

In other words we reduce the excess $e$ for $s$ and $i$ at each iteration.

**Proof**
We have an original $G(x)$ and we create a $G(x')$ with the only changes along the shortest path from $s$ to $i$.

Since we are only increasing flow along this path, the entire rest of the residual network stays the same. Along the path however, we could add new arcs in reverse and potential remove forward arcs (if we reach capacity).

Since $c_{ij}^\pi = -c_{ji}^\pi$ the reversed arcs are still $0$ and we know the forward reduced costs stay the same since we haven't changed the $\pi$'s.
