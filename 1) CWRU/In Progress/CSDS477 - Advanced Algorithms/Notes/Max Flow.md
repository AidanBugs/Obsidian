# Max Flow
Have network flow from $s,t$ and trying to maximize the flow from $s$ to $t$. Where the arcs have upper bounds.

# Max Flow reduces to MCNF
All supplies are $0$ at all nodes. Copy the arcs over with the same upper bounds and costs are $0$. Then add a new arc from $t$ to $s$ with an infinite upper bound and a cost of $-1$

Note that this creates a cycle which makes this an equivalent circulation problem.

# Dual of Max Flow
$v^* = \max \sum_{i\in V} b_i \pi_i - \sum_{(i,j)\in U} u_{ij}[-c_{ij}^\pi]^+$

s.t. $c_{ij}^\pi \geq 0, \quad ((i,j)\notin U)$

> $c_{ij}=0, \quad (i,j)\in E$

> $c_{ts}=-1$

note since max flow is all supplies are $0$ the first term in the objective function is $0$

