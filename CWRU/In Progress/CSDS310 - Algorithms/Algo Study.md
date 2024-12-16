# Master Method
$T(n)=aT(\frac nb)+\Theta(f(x))$
We define $g(x)=n^{\log_ba}$
Depending on case we can determine $T(n)$
## Case 1
Subproblems > Individual Problem
$g(x)>f(x)$
$\therefore T(n)=g(x)$
## Case 2
Subproblems = Individual Problem
$g(x)=f(x)$
$\therefore T(n)= \log (n) g(x)$
## Case 3
Subproblems < Individual Problem
$g(x)<f(x)$
$\therefore T(n)=f(x)$
Regularity Condition: $af(\frac nb)\leq kf(n), k<1$
# Asymptotic Notation
$A=\{\omega, \Omega, \Theta , O, o\}$
$f(x)=a(g(x)), a\in A$
## $\omega (g(x))$
$\lim_{n\rightarrow \infty} \frac{f(n)}{g(n)}=\infty$
## $\Omega (g(x))$
$\exists c, 0<c, 0\leq cg(n)\leq f(n)$
## $\Theta(g(x))$
$\exists c_1,c_2 0<c_1<c_2, 0\leq c_1g(n)\leq f(n)\leq c_2g(n)$
## $O (g(x))$
$\exists c, 0<c, 0\leq f(n)\leq cg(n)$
## $o (g(x))$
$\lim_{n\rightarrow \infty} \frac{f(n)}{g(n)}=0$
# Prove / Disprove Graph Statements
## Cross Edge
Connects Nodes without ancestry relationship
## Back Edges
Connects Node to a distant ancestor
## Forward Edge
Connects Node to a distant child
# Prove / Disprove Greedy Choices
Use Proof by contradiction
# Prove / Disprove Optimal Substructure
Use Proof by Contradiction
Recurrence Relations
# Prove Divide and Conquer
Use Proof by Induction