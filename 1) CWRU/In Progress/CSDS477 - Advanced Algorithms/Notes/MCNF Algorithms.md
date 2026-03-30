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
