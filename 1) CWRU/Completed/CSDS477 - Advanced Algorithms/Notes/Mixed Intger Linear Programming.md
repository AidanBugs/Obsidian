# Mixed Integer Linear Programming
Some $x$'s are integers where some are continuous variables.

Note that $LP\in P$ but $ILP$ can be used to solve $NP-Complete$ problems so the integer constraints makes problem significantly different

# Vertex Cover as Binary ILP (Integer Linear Programming)
Given a a graph $G=(V,E)$ find $\min |V'|, V'\subset V$ where $V'$ covers all the edges.

$x_i= 1 \leftrightarrow i\in V'$ else $0$

$\min \sum x_i$

s.t. $x_i +x_j \geq 1 (\{i,j\}\in E)$

> $\forall i (i\in V) 0\leq x_1 \leq 1$

> $\forall i (i\in V) x_i$ integer
