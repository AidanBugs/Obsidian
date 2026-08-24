# Lagrangian Relaxation
General idea is given a LP:

$\min c^T x$

s.t. $Ax \leq b$

> $fx \leq d$

> $x\geq 0$

We can relax a constraint by removing it from the constraints but adding to the cost:

$\min c^T x + \lambda (fx-d)$

s.t. $Ax \leq b$

> $x\geq 0$

Note that $\lambda$ references the variable in the dual $y_i$.
