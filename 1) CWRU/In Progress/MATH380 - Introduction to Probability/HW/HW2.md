---
format: pdf
---

# 1.14
$P(AB)$ is the probability of the interesection of the event sets $A$ and $B$. 

Thus the intersection of the two sets is at most the size of the smaller set. Thus $P(AB)$ is at most $P(A)$

To find the minimum probability, its trying to minimize the intersection of sets $A$ and $B$. In otherwords, maximumizing the intersection of $A$ and $B^c$. $P(A)=0.4$ and $P(B^c)=1-P(B)=1-0.7=0.3$ The maximum of this intersection is $0.3$ because $P(B^c)$ is the smaller one, thus the remaining $0.1$ probability must be in the intersection of $A$ and $(B^{c})^{c}=B$. Thus the minimum of $P(AB)$ is $0.1$

Therefore $0.1 \leq P(AB) \leq 0.4$

# 1.18 
$\Omega = \{3,4,5\}$

| $k$ |\| | $3$ | $4$ | $5$ |
| :-: |-| :---: | :----: |:---: |
| $p_X(k) = P(X == k)$| \| | $\frac3{16}$ | $\frac12$ | $\frac{5}{16}$ |

# 1.26 
$|\Omega | = \binom{15}{4}  =1365$

$|\text{2 men 2 women}| = \binom{10}{2} * \binom{5}{2}= 45*10=450$

$P(\text{2 men 2 women}) = \frac{|\text{2m2w}|}{|\Omega|} =\frac{450}{1365}=\frac{30}{91}$ 

# 1.28 
## a
$A$ is w/o replacement

$P(A)= \frac{n^2-n + m^2-m}{(n+m)(n+m-1)}$

## b
$B$ is w/ replacement

$P(B)=\frac{n^2 + m^2}{(n+m)^2}$

## c
Intuitively, when you do not replace the ball, the probability you get the same color again is lower because there is less of the same color now. Therefore $P(A)$ is smaller than $P(B)$.

# 1.33 
$|\Omega| = 6^5$

$|FH| = 6*5\binom 53=300$

$P(FH) = \frac{300}{6^5}=\frac{25}{648}$

# 1.41 
$A_i=\{\text{player } i \text{ wins no games}\}$

$P(A_i) = \frac23 ^4= \frac{16}{81}$

$A_i \cap A_j=\{\text{players }i,j \text{ win no games}\}$

$P(A_i\cap A_j) =\frac{1}{3^4}= \frac{1}{81}$ 

$A_1 \cap A_2 \cap A_3=\{\text{no one wins any games}\}$

$P(A_1\cap A_2 \cap A_3) = 0$ because at least one person must win each round.

$P(A_1 \cup A_2 \cup A_3) = \sum_{k=1}^3(-1)^{k+1} \sum_{1\leq i_1 < ... < i_k \leq n} P(A_{i1}\cap ... \cap A_{ik}) = 3P(A_i) + 3P(A_i\cap A_j) + P(A_1\cap A_2 \cap A_3)=\frac{16}{27} + \frac{1}{27} + 0= \frac{17}{27}$

# 1.44 (tentative)
## a
$X,Y\in \{1,2,3,4,5,6\}$

## b and c

| $k$ | \| | $1$ | $2$ | $3$ | $4$ | $5$ | $6$ |
| :--: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| $P(X=k)$ | \| | $\frac{1}{36}$| $\frac{1}{12}$| $\frac{5}{36}$| $\frac{7}{36}$| $\frac{9}{36}$| $\frac{11}{36}$|
| $P(X\leq k)$ | \| | $\frac{1}{36}$| $\frac{1}{9}$| $\frac{1}{4}$| $\frac{4}{9}$| $\frac{25}{36}$| $1$|
| $P(Y =  k)$ | \| | $\frac{11}{36}$| $\frac{9}{36}$| $\frac{7}{36}$| $\frac{5}{36}$| $\frac{3}{36}$| $\frac{1}{36}$|
| $P(Y\leq k)$ | \| | $\frac{11}{36}$| $\frac{5}{9}$| $\frac{3}{4}$| $\frac{8}{9}$| $\frac{35}{36}$| $1$|


