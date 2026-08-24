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

# As a Linear Program
$\min \sum_{{i,j}\in E} c_{ij}x_{ij}$

s.t. $\sum_{j:(i,j)\in E} x_{ij} - \sum_{j:(j,i)\in E} x_ji = b_i, (i\in V)$ (mass balance)

> $0 \leq l_{ij}\leq x_{ij} \leq u_{ij}, ((i,j)\in E)$ (capacity) 

Thus, each row/constraint corresponds to a node and each column/variable represents and arc/edge. If we create our matrix $N$, we notice that each column has a single $1$ and a single $-1$, corresponding to the node-arc incidence matrix. Note the $rank(N)$ is not $4$ because the sum of the supply from nodes must be $0$ thus at least one node's supply is implied from previous constraints. In other words the columns of $N$ are not linear separable. Thus, $rank(N)< |V|$

# Assumptions
1. No parallel arcs (beneficial if the arcs have different costs with different upperbounds)

> This can be solved by putting a fake node with a supply of $0$ and one side having same costs

2. No symmetric arcs

> Similarly solved by adding a fake node again with a supply of $0$ and one side having same costs

3. No lower bounds $(l_{ij}=0)$

> We can add a middle node with a supply of $-l_{ij}$, the left arc would be the same (costs and upperbound) and so is the left node, the right node now has a supply of $b_j-l_{ij}$

> Alternatively, without creating a new node we can decrease the supply of the left node by $l_{ij}$ and increase the supply of the right node by $l_{ij}$ and decreasing the upperbound of the arc by $l_{ij}$ (we can ignore the cost of sending $l_{ij}$ because it is constant) (note this problem is equivalent but does not preserve the objective function of the original)

4. Cost reversal

> For any negative cost we can reverse the arc direction, take the negative of the cost and preserve the upperbound of the arc. The original left node's supply is subtracted by the upperbound and the right node's supply adds the upperbound. Essentially this is saying were assuming the maximum flow in the original direction and adding back the flow as needed

5. Removing Upper Bounds ($u_{ij}=\infty$)

> $x_{ij}\leq u_{ij} \rightarrow x_{ij} + s_{ij} = u_{ij}$, suppose we have an arc $i,j$ with upperbound $u_{ij}$. We can create a dummy node in between nodes $i,j$ with a supply of $u_{ij}$, subtract that supply from $b_{i}$, and the cost of going from node $ij$ to $j$ is $c_{ij}$

# Path and Cycle Flow
We can follow any arbitrary path until it stops to determine how much flow is sent along a single path

Path+Cycle Flows -> $x_{ij}$ Arc Flows

> Look at every arc and determine how many path is in an individual arc and add that to our flow for that arc.

**Thm** An arc flow can be represented w/ at most flows on $n+m$ paths and cycles. Note that $|V|=n,|E|=m$.

- Path connects a supply ($b_i>0$) vertex to demand vertex ($b_i<0$)

- At most $m$ cycle flows

**Proof** Sketch an Algorithm arc flows -> path/cycles

0. $e_i\leftarrow b_i$ (excess at $i$) and $r_{ij}\leftarrow x_{ij}$ (residual flow)

1. Attempt to find the path flows $P$

> Start at $e_i>0$, follows arcs w/ $r_{ij}>0$ until either:

>> a. Find $e_j <0$, flow =$\min \{e_i, -e_j, r_{ij}\in P\}$

>> b. Repeated Vertex, means there is a cycle $C$, so flow $=\min\{r_{ij}\in C\}$

> Update $e_i,e_j, r_{ij}\in P$, repeat until $\forall i, e_i=0$

>> Note: $\exists$ outgoing arc w. $r_{ij}>0$ by feasibility of arc flow, $n$ finite -> if no $e_i<0$ find repeated node)

2. Find cycle flows $C$:

> Start from arc and follow $r_{ij}>0$ until find repeated vertex

> Thus we have a cycle flow and assign flow =$\min\{r_{ij}\in C\}$

Our path/cycle assigning formula ensure at least one of $e_i,r_{ij}\rightarrow 0$. Thus each path/cycle assigns one of these quantities to $0$. Thus there is at most $n+m$ paths/cycles because each path/cycle is associated with an arc/node supply going to $0$.

# Unimodular MCNF
$A$ integer and $p\times q$, $rank(A)=p$

**THM** $A$ is unimodular ($\forall B, det(B)=\pm 1$) iff $\forall$ integer $b$, bfs $Ax=b$ are integer

MCNF

$\min c^T x$

s.t. $Nx=b$ and $x\geq 0$

wlog no lower and upper bounds (demonstrated in last lecture)

> Note that $c$ is arc cost, $x$ flows, $N$ node-arc incidence matrix, $b$ is the supply.

This runs in to an immediate issue that $rank(N)<n$

We can make a matrix $N'$ as the maximal set of linearly independent rows of $N$ and rewrite the problem as follows:

> $\min c^T x$
>
> s.t. $Nx=b$ and $x\geq 0$

**Def** $A$ is totally unimodular iff $\forall$ square submatrix $F$ of $A$, $det(F)\in \{\pm 1,0\}$

**Claim** If $A$ is totally unimodular then $A$ is unimodular 

**Proof** $B$ is square submatrix of $A$ and $det(B)\in\{\pm 1\}$ and cannot be $0$ because its a basis

$N$ is totally unimodular $\rightarrow N'$ is totally unimodular

$\rightarrow N'$ is unimodular so there is an integer optimum

**Thm** $N$ is totally unimodular

**Pf** By induction on size $F$

**Base Case** $F$ is a $1\times 1$ matrix (trivial since all entries are $\in\{0,\pm1\}$)

**Induction** Suppose $\forall F_k$ $k\times k$, $det(F_k)=\{0,\pm 1\}$

$F_{k+1} (k+1)\times(k+1)$

Cases:

1. $F_{k+1}$ ends up with a column of all $0$ so $det(F_{k+1})=0$
2. $F_{k+1}$ all columns have 2 non zero entries, means all columns add to $0$ (by definition of $N$) so $det(F_{k+1})=0$
3. $\exists$ column of $F_{k+1}$ w/ single nonzero entry ($\pm 1$). 

> $det(F_{k+1})= (\pm 1)\cdot (\pm 1) detF$. In a way, we could rewrite our constraints and variables to have the remaining matrix $F$ to be a continuous $k\times k$ matrix which we already know the determinant to be $=\{0,\pm 1\}$

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
