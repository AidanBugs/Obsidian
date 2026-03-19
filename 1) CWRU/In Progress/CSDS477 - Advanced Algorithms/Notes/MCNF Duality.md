# Duality of MCNF

$\min \sum c_{ij} x_{ij}$

s.t. $\sum x_{ij} - \sum x_{ji} = b_i, (i\in V)$ 

> $x_{ij} \leq u_{ij}, ((i,j)\in U)$

> $x_{ij}\geq 0, ((i,j)\in E)$

>>>> Note $U=\{(i,j)\in E: u_{ij}< \infty\}$

Let $\pi_i$ denote the node potentials and $\alpha_{ij}$ denote the constraints for arcs with upper bounds

Higher Level Observations:

i. At least one mass balance constraint is redundant (bc $rank(N)< n$) means that at least one $\pi_i$ is redundant

> from lagrangian constraint, $\pi_i$ is the break even cost to violate a constraint.

ii. $\pi_i$ is penalty for violating $b_i$, which forces at least one $b_j$ to change as well

iii. $\alpha_{ij}$ implied by $\pi_i$

iv. complementary slackness: $x_{ij}$ times expression of $\pi_i, (\alpha_{ij})$

## Equivalent

$\min \sum c_{ij} x_{ij}$

s.t. $\sum x_{ij} - \sum x_{ji} = b_i, (i\in V)$ 

> $-x_{ij} \geq -u_{ij}, ((i,j)\in U)$

> $x_{ij}\geq 0, ((i,j)\in E)$

## Taking the dual
$\max \sum_{i\in V} b_i \pi_i - \sum_{(i,j)\in U} u_ij\alpha_{ij}$

s.t. $\pi_i -\pi_j \leq c_{ij}$   ((i,j)\notin U)$ this can be rewritten as $c_{ij}^\pi \geq 0$

> $\pi_i -\pi_j +\alpha_{ij} \leq c_{ij} ((i,j)\in U)$ this can be rewritten as $c_{ij}^\pi +\alpha_{ij}\geq 0$

> $\pi_i$ unrestricted and $\alpha_{ij}\geq 0$

**Def** $c_{ij}^\pi= c_{ij}-\pi_i +\pi_j$ is the reduced cost of the arc $ij$

> $c_{ij}^\pi = - c_{ji}^\pi$

**Claim** If $c_{ij}<0$ then the arc has an upperbound

**Lemma** If MCNF has a finite opt, then wlog $\exists$ an optimal solution $\alpha_{ij} = [-c_{ij}^\pi]^+$ 

**Proof** is intuitive because $\alpha_{ij}$ should be as small as possible bc its a negative term in the max objective function. Derivation is found by looking at the dual so $\alpha_{ij}\geq 0$ and $\alpha_{ij}\geq -c_{ij}^\pi$

**Node Potentials** Since the $\pi_i$'s never appear in isolation rather its the difference between the node potentials that matter

## Complementary Slackness
$x_{ij}c_{ij}^\pi =0, ((i,j)\notin U)$ 

$x_{ij}(c_{ij}+\alpha_{ij})^\pi =0, ((i,j)\in U)$ 

$\alpha_{ij}(u_{ij}-x_{ij})=0, ((i,j)\in U)$ 

Note the $\pi_i$ dont have a complementary slackness because they are multiplied by something that is known to be $0$ in feasible solutions

# Resuidual Network
Suppose two nodes $i,j$ with cost $c_{ij}$ and a cost $u_{ij}$ traversed with a flow $x_{ij}$

$G(V,E) + x \rightarrow G(X)=(V,E(x))$ which is basically updated version of edges given that flow exists already in the graph, IE the residual flows that can still be sent through the arcs. In this example our arc $i,j$ has now an upper bound $u_{ij}-x_{ij}$. We also add an arc from $j$ to $i$ to essentially send back flow $x_{ij}$ so this arc has an upperbound of $x_{ij}$ with a cost of $-c_{ij}$. Note we do need to omit any arcs with upperbounds of $0$

**Thm** Let $x$ be a finite feasible flow $\pi$ be feasible node potentials, $x(\pi)$ are opt for MCNF (its dual) iff 

> $\forall (i,j)\in E(x), c_{ij}^\pi \geq 0$ note that $E(X)$ are arcs in the residual networks

**Pf** $\rightarrow$ Assume $x,\pi$ are optimal iff comp slack

> For every $(i,j)\in E$, cases:

- $x_{ij}=0\rightarrow (j,i)\notin E(x)$

> By contradiction $c^\pi_{ij}<0$ Then $(i,j)\in U$ (lemma) $\rightarrow \alpha_{ij}=-c_{ij}^\pi > 0 \rightarrow x_{ij}=u_{ij}$ contradiction. 

- $x_{ij}>0$

> i. $c_{ij}^\pi = 0 =-c_{ji}^\pi$ (satisfies all arcs in $G(X)$)
>
> ii. $c_{ij}^\pi <0\rightarrow (i,j)\in U \rightarrow$ wlog
>
>> $\alpha_{ij}=-c_{ij}^\pi\rightarrow x_{ij}=u_{ij}$ so $(i,j)\notin E(x)$ thus $c_{ji}^\pi>0$ 

- $c_{ij}^\pi > 0\rightarrow (i,j)\in U$ 

> $\alpha_{ij}=0$ bc max of $-c_{ij}^\pi$ and $0$

> So $c_{ij}^\pi + \alpha_{ij}>0$ sp $x_{ij=0}$ and follows first case / violates comp slack 2

**Pf** $\leftarrow$ Assume $c_{ij}^\pi>0\rightarrow$ comp slack

1. $x_{ij}=0$, so no back arrow between $i,j$

> $U=\{(i,j)\in E: u_{ij}<\infty}$

> $\alpha_{ij}(u_{ij}- x_{ij})=0, ((i,j)\in U)$ (1)

> $(c^\pi_{ij} + \alpha_{ij})x_ij=0, ((i,j)\in U)$ (2)

> $x_{ij}c^\pi_{ij}\geq 0, ((i,j)\notin U)$ (3)

> So if $(i,j)\in U$ then:

>> 1 is true bc $\alpha_{ij}=0$ and 2,3 are true bc $x_{ij}=0$

2. $0<x_{ij}< u_{ij}$

> $0\leq c_{ij}^\pi = -c_{ji}^\pi \leq 0$ so both of them are $0$

>> so 1 comp slack is true because $\alpha_{ij}$ is then $0$, so similarly 2 and 3 are true.

3. $x_ij=u_ij$

>> 1 holds

> $x_{ij}$ is finite then $(i,j)\in U$

> So because we start with $c_{ji}^\pi \geq 0$ then $c_{ij}^\pi \leq 0$ so $\alpha_{ij}=-c_{ij}^\pi$ so 2 holds

# Shortest Paths
Find shortest paths from $s$ to $i \in V$, $G(V,E)$ and $l_{ij}, (i,j)\in E$ as the lengths between each node 

# Shortest Paths reduced to MCNF
Costs are the lengths, supplies for $s$ is $n-1$ and the supplies for other verticies are $-1$

Thus:

$b_s=n-1, b_i=-1, (i\in V-\{s\})$

$c_{ij}=l_{ij}, u_{ij}=\infty$

# Dual of shortest paths
$\max (n-1)\pi_{s} - \sum_{i\in V-\{s\}} \pi_i$

s.t. $l_{ij} -\pi_i + \pi_j \geq 0, ((i,j)\in E)$

Suppose we create $d_i=\pi_s-\pi_i\rightarrow\pi_i=\pi_s -d_i$

$\max \sum_{i\in V-\{s\}} d_i$

s.t. $dj\leq d_i + l_{ij}, ((i,j)\in E)$

higher level, we are creating these $d_j$ such that for each edge, the length plus the $d_i$ of the incoming node must be greater than $d_j$. In other words, these $d_j$ are the distances of $j$ from the source vertex.
