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
