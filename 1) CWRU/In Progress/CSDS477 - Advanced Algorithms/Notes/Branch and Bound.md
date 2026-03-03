# Branch and Bound
Algorithm for ILP (NP-Hard)

$\max 10x_1 +15x_2$

s.t. $8x_1 + 4x_2 \leq 40$

> $15x_1 + 30x_2 \leq 200$

> $x_1,x_2\in Z\geq 0$

1. Solve Linear Relaxation: Upper bound on the optimal integer solution

In this case: $x_1=2.22, x_2=5.56, obj=105.6$

2. Find lower bound: $x_1=2,x_2=5$ must be a lower bound ($obj=95$)

3. partition choosing an arbitrary "branching" variable then create range $x_2\leq 5, x_2\geq 5$

4. Have same  ILP but add the branching constraint and solve the resulting relaxations for both branches

5. Choose a node (book suggests choosing better objective vale node) and continue with branching on a different variable

6. Continue until nodes become integers and until all nodes are lower than the lowerbound, highest found integer solution (lower nodes always have lower objective)


theres a bunch of hueristics with choosing which variable to bound and which node to branch
