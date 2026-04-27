# Approximation algorithms
Optimization problem $\mathcal J$

Instance $I\in \mathcal J\rightarrow c^*(I):$ optimal cost

$A:$ algorithm for $\mathcal J\rightarrow c_A(I):$ cost of solution returned by $A$ on $I$ 

Finding the optimal in an algorithm can be difficult or impossible, EX

- Vertex cover, $2$-appx algorithm $c_{vcapx}(I)\leq 2 c^*(I)$
- Partial information, like Skirental with $D$ unknown, $2$-appx algorithm $c_{A}(I)\leq 2 c^*(I)$

Apx ratio is $sup_{I\in \mathcal J}\frac{c_A(I)}{c^*(I)}$

## Hitting Set
Given $T_1,T_2,...,T_p \subset S$

> $c: S\rightarrow R^+$

Find $H\subset S$ that 

> $\min \sum_{e\in H} c_e$

> s.t. $H\cap T_j\neq \phi, j=1,...,p$

$\alpha = \max | T_j |$


Hitting Set is a generalization of Vertex Cover. Each edge is $T$ set so we are finding $H\subset S$ that way $\exists h\in H, \forall T: h\in T$. Each vertex however has a cost of $1$ because Hitting Set is a weighted generalization of Vertex Cover.

### Hitting Set as ILP
$\min \sum_{e\in S} c_e x_e$

s.t. $\sum_{e\in T_j} x_e \geq 1, (j=1,...,p)$

$x_e\in \{0,1}$ and $1$ iff $e\in H$

### Linear Relaxation
$\min \sum_{e\in S} c_e x_e$

s.t. $\sum_{e\in T_j} x_e \geq 1, (j=1,...,p)$

> $0 \leq x_e \leq 1$

Note that the $x_e\leq 1$ constraint is redundant because there is no optimal solution where $x_e>1$ because the max an $x$ is needed is $1$ and all costs are positive so having a cost greater than $1$ is useless.

### Primal Dual Algorithm Idea
Primal $x^{(0)}$ (not necessarily feasible) and $y^{(0)}$ as a solution in dual that is feasible (note these are linked by comp slack)

We iterate forward to create $x^{(1)}, y^{(1)}$ where $x$ is not necessarily feasible but we are going to reduce the infeasibility region from $x^{(0)}$ to $x&{(1)}$


### Dual of Lin Relax
$y_p$ for each $T_p$

So dual is

$\max \sum_{j=1}^p y_j$

s.t. $\sum_{j: e\in Tj} y_j \leq c_{e}, (\forall e \in S)$

> $y_j \geq 0$

Continue until $x^*$ and $y^*$ are both feasible and satisfy comp slack.

Thus optimal $c^*: \sum_{j=1}^p y_j \leq c^* \leq \sum_{e\in S} c_e x_e$

### Comp Slack
$x_e s_e=0, (e\in S)$

> $s_e= c_e-\sum_{j:e\in T_j} y_j\geq 0$

>> $\geq 0$ for feasible $y$

$y_j (\sum_{e\in T_j} x_e -1)=0, (j=1,...,p)$

This is good but we also need to try and get an optimal integrality idea. For Successive Shortest Paths, we had integrality bc MCNF is unimodular so optimal solution is integer.

### Primal Dual Algorithm for Hitting Set
We relax the comp slack constraint of 

$y_j (\sum_{e\in T_j} x_e -1)=0, (j=1,...,p)$

Each iteration we slowly introduce these set constraints.

Thus:

```
H = \phi
y_j = 0

while \exists j: T_j \cap H = \phi:
    increase y_j until v s.t. \exists e s_e =0
    H.append(e)
return H

```

Invariants

1. $s_e \geq 0$
2. $y_j \geq 0$

True initially, (straight forward)

At each iteration we are increasing $y_j$ to an $se\geq 0$

$\rightarrow y_j$ never deacreases so $\rightarrow y_j\geq 0$

$\rightarrow s_e$ does not go below $0$ because we no longer use that vertex 

**Thm** HSPD Is $\alpha$-apx algorithm for HS

**Corollary** HSPD is $2$-apx for VC

Proof Cost of returned $H$:

$c(H)=\sum_{e\in H} c_e=\sum_{e\in H} \sum_{j:e\in T_j} y_j = \sum_{j=1}^p |H\cap T_j| y_j \leq \alpha \sum_{j=1}^p y_j\leq \alpha c^*$

> $s_e=0$ when $e$ added to $H$ and never change any of those sets again because they are satisfied ($y_j, j: e\in T_j$) (think comp slack)

> The last is given from that the optimal solution is always $c^* \geq \max \sum y_j$


## A dif thing idk he didnt name it
$\max \Pi_{i=1}^n (1-x_i)$

s.t. $\sum_{i=1}^n x_i \geq \beta$

> $0\leq x_i \leq 1$

Where $\beta$ is a parameter where $0\leq \beta \leq 1$

Claim WLOG opt $x_i^*\leq \beta$ otherwise we can set a single $x_i$ to $\beta$ which results in a objective of $1-\beta$. Since we are assuming that $\exists x_i^*\in x^*, x_i^*> \beta$ then the objective would be smaller than this.

**Thm** $x_i^* = \frac{\beta}{n}$ as optimal solution

Proof by induction: $n=1$ trivial

inductive step:

$\max (1- x_n) \Pi_{i=1}^{n-1} (1-x_i)$

s.t. $x_n + \sum_{i=1}^{n-1}x_i\geq \beta$

If we assume $\bar x_n$ is fixed then:

$\max \Pi_{i=1}^{n-1} (1-x_i)$

s.t. $\sum_{i=1}^{n-1}x_i\geq \beta-\bar x_n$

This is easy to solve because this is the same as our $n-1$ induction so optimal is:

$x_i^* = \frac{\beta - \bar x_n}{n-1}$ so the optimal value is $(1-\frac{\beta - \bar x_n}{n-1})^{n-1}$

We can take the derative of this with respect to $\bar x_n$ to determine the maximum of this function is. We find that the optimal $\bar x_n = \frac{\beta}{n}$, this makes the $x_i^* = \frac{\beta - \beta/n}{n-1}=\frac{\beta}{n}$

Thus the final cost is $c^* = (1- \frac \beta 1)^n \leq e^{-\beta}$ which is equality as $n$ approaches $\infty$ due to this being the definition of $e$

## Algorithm HSRand1
$\min \sum_{e\in S} c_e x_e$

s.t. $\sum_{e\in T_j} x_e \geq 1, (j=1,...,p)$

> $0 \leq x_e \leq 1$

```
for each e in S do:
    H = H \cup {e} w/ prob x_e^*

```

$E(c(H)) = \sum_{e\in S} c_e Pr[e\in H]= \sum_{e\in S} c_e x_e^* \leq c^*$ better than optimal but may not give a cover

Thus we find the probability that a set is not hit is:

> $Pr[e\cap H=\phi]=Pr[a\notin H]*Pr[b\notin H]= (1-x_a^*)*(1-x_b^*)=1/4$ -> vertex cover case

For number of edges not covered:

> $E[\# edges \ not \ covered]= E[\sum_{j=1}^p x_j ] \sum_{j=1}^p E[x_j] = \sum_{j=1}^p Pr[x_j\cap H=\phi]$

>> Where $x_i=1$ iff $T_i\cap H=\phi$ else $0$.

Thus in the case of $m=3$ edges we have the expected umber of edges covered as $\frac 34$

$Pr[T_j \cap H = \phi]=\Pi_{e\in T_j} Pr[e\notin H] = \Pi_{e\in T_j} (1-x_e^*) \leq 1$ from before we have a better bound as this probability being less than $\frac{1}{e}$

Thus $E[# T_j\not\ covered]= \frac{p}{e}$

## Algorithm HSRand2
```
Solve LR -> x_e^*
for h=1 to t do:
    H <- H\cup {e} w/ prob x_e^*
```

$Pr[T_j not hit] <= \frac{1}{e^t}$ 

$E[# sets not hit] <= \frac{p}{e^t}$

Thus $E[c(H)] \leq t\times c(H^*)$

# HSR vs PD
| Type | Apx Ratio | Failute |
| - | -- | -- |
| PD | $\max |T_j|$ | NA |
| HSR | $\ln p$ | $E[not hit] \leq 1$ |

# MAX SAT
Clauses are similar to SAT, conjuctive normal form, so variables joined by OR's

goal is to maximize the number of true clauses.

## 2-apx for MAX SAT
Randomly select true or false for each $x$ with probability 1/2

So probability a clause is satisfied is $1-\frac{1}{2^k}\geq \frac 12$ where $k$ is number of literals in MAX SAT

So expected # of satisfied clauses is $\geq \frac p2$

Alternatively set all to True and all to False and pick the larger of the two.

## Algorithm MAXSAT Rand
```
for each variable x do:
    set x to true w/ prob 0.5
```

If a clause $C_j$ contains $k$ literals:

> $Pr[C_j sat] = 1- \frac{1}{2^k}\geq \frac 12$

So expected number of satisfied clauses is $\fracp2\geq \frac{opt}{2}$

Thus MAXSAT Rand is a $2$-apx algorithm for MAX SAT

## Max SAT as ILP

Therea re $p$ clauses. Let set of positive literals be $C_j^+$ and negatives for a clause is $C_j^-$

$\max \sum z_j$

s.t. $\sum_{x_i\in C_j^+} x_i + \sum_{x_i\in C_j^-} (1-x_i) \geq z_j, j=1,...,p$

> $x \in \{0,1\}$

> $z \in \{0,1\}$

## MAX SAT Lin Relax
**Thm** this a $(1-\frac 1e)$-appx

$Pr[C_j !SAT]=\Pi_{i\in C_j^+} (1-y_i^*)$

> for simplicity $C_j^- =\phi$

s.t. $\sum y_i^* \geq z_j^*$

worst case:

$\leq \max \Pi (1-y_i^*) \rightarrow \leq (1-\frac{z_j^*}{k})^k$

>> note $k=$ num literals in $C_j$

$Pr[C_j SAT]\geq 1-(1-\frac{z_j^*}{k})^k\geq (1-\frac 1e)z_j^*$

$E[\# SAT C]\geq (1-\frac 1e)OPT$

NOTE DERIVATIVE OF $(1-\frac ab)^b=(1-\frac1b)^b a\geq (1-\frac 1e)a$

## MAX SAT Mix
Find assignments from MAXSAT RND, MAXSAT Lin Relax and pick the best one (satisfies most clauses)

$n_1$ expected satisfied from MAXSAT RND and $n_2$ is the other

**Thm** This is $\frac34$- Appx

So $E[MAXSAT Mix]=\max n_1, n_2\geq E[\frac{n_1+n_2}{2}]=\frac12 n_1 + \frac 12 n_2$

$C^k=\{Clauses C_j: |C_j|=k\}$

Let $\alpha_k = 1-\frac{1}{2^k}$

And $\beta_k=(1-(1-\frac 1k)^k)$

**PF**

$E[|C| SAT by MAXSATMix]=E[\max\{n_1,n_2\}]\geq E[\frac{n_1+n_2}{2}]$

> $=\frac 12 (E[n_1]+E[n_2])$

>> $E[n_1]=\sum_{k=1}^\infty\sum_{C_j\in C^k} \alpha_k$

>> $E[n_2]=\sum_{k=1}^\infty\sum_{C_j\in C^k} \beta_k z_j^*$

> $\frac 12 (E[n_1]+E[n_2])\geq \sum_{k=1}^n\sum_{C_j\sum C^k} \frac{\alpha_k+\beta_k}{2}z_j^*\geq \frac34 \sum z_j^*\geq \frac 34 OPT$

# MAX CUT
Given complete undirected graph $G=(V,E)$ and weights $w_e=w_{ij}, \forall e =(i,j)\in E$

$a_{ij}=$ distance between $i,j\in V \land i\neq j$

Find cut $(S,V-S)$ that max $c(S,V-S)=\sum_{(i,j)\in \times (S,V-S)}\alpha_{ij}$

Essentially find a set of verticies $S$ that maximizes the sum of all edges that intersect the cut line.

$\delta_e = 1$ iff $e\in \times (S,V-S)$ and $0$ otherwise.

$c(S,V-S)=\sum_{e\in E} a_e \delta_e$

## MAXCUT Rand
For each $v\in V$, add $v$ to $S$ with probability $\frac12$

Claim This algo is a $2$-apx

**Proof** $E[c(S,V-S)]=\sum_{e\in E}a_e E[\delta_e]=\frac12 \sum_{e\in E}a_e\geq \frac12 OPT$

Decision Vars:

$x_i = 1$ iff $i\in S$ and $-1$ otherwise, $(\forall i \in V)$.

$x_ix_j=1$ iff same side and $-1$ iff opposite sides

Thus $\frac{1-x_ix_j}{2}=\delta_{ij}$

Integer Quadratic program

$max c(S,V-S)=max \sum_{e\in E} \alpha_e \frac{1-x_ix_j}{2}$

s.t. $x_i\in \{-1,1\}$

Instead of our usual relaxation, we instead relax $x_i$ to a $n$d unit vector $v_i$

### Relaxtion
$\max c(S,V-S)\leq \max \sum_{e\in E}\alpha_e \frac{1-v_i^Tv_j}{2}$

s.t. $v_i \in S_n (i\in V)$

$B=$ matrix of the $v$

$X=B^TB$ is a semi definite program that we are trying to maximize.

Thus $X$ is the matrix of dot products of these vectors

Diagonal entries are $1$ because all $v$ are part of unit hypersphere

If $v_i^Tv_j=-1$ then wed want $\delta_e$ be $1$ and conversly, $v_i^Tv_j=1$ then wed want $\delta_e=0$

Now we need to generate a cut from the relaxation. So here are a few ideas (that don't really work):

1. Random Rounding
2. Vectors alr express clustering so more clustering may not be helpful
3. Project onto $x$ axis (rotations are identical so projection would mess with results)
4. Almost anything to round would work

Random hyperplane through origin and that is used for random rounding. 

$E[c(S,V-S)]=E[\sum_{e\in E}a_e \delta_e] = \sum_e a_e Pr[\delta_e=1]$

$Pr[\delta_e=1]=\frac \alpha\pi$ where $\alpha$ is the angle between the two vectors. 

> $Pr[\delta_e=1]=\frac{\arccos(v_i^v_j)}{\pi}$

$E[c(S,V-S)]=E[\sum_{e\in E}a_e \delta_e] = \sum_e a_e Pr[\delta_e=1]=\sum_e a_e \frac{\arccos(v_i^v_j)}{\pi}$

$f(z)=\frac{\arccos(z)}{\pi}\frac{z}{1-z}$

> Applying derivative to find that $\hat z = \sqrt{\frac{1-\hat z}{1+\hat z}}$

$f(z)=\frac{\arccos(z)}{\pi}\frac{z}{1-z}\rightarrow f(z)\geq f(\hat z) = 0.879$

$=\sum_e a_e \frac{\arccos(v_i^v_j)}{\pi}\geq 0.879 \sum_e a_e \frac{1-v_i^Tv_j}{2}\geq 0.879 c^*$
