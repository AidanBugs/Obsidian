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
