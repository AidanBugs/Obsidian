# QUBO
$\min x^T Q x$ s.t. $x\in \{0,1\}^p$

Given the Example in [Binary LP.md]:

> $\min x_1^2 + x_2 ^2 + 5x_1x_2$ s.t. $x_1,x_2\in \{0,1\}$

> $\equiv x_1 + x_2 + 5x_1x_2$ s.t. $x_1,x_2\in \{0,1\}$

QUBO is a special case of linear programming because we can represent the multiplication by other variables.

> Note that Quantum Computers are REALLY good at solving these QUBO problems.
