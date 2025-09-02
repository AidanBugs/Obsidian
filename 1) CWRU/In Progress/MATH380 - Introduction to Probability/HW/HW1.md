---
format: pdf
---
# 1.1
$(i,j) \in\Omega$, where $i,j \in \{1,2,3,4,5,6\}$.

Let $A=\{\text{Second Roll is Higher than the first}\}$ 

| First Roll | P(A) |
| --- | --- |
| 1 | 5/6 |
| 2 | 4/6 |
| 3 | 3/6 |
| 4 | 2/6 |
| 5 | 1/6 |
| 6 | 0/6 |

Thus $|A| = 5 + 4 + 3 + 2 + 1 = 15$ 

$|\Omega|=6*6=36$

$P(A)=\frac{|A|}{|\Omega|}=\frac{15}{36}=\frac{5}{12}$

# 1.5 
## a 
$\Omega = (a_1,a_2,a_3,a_4,a_5) | (a_1,a_2,a_3,a_4,a_5 \in \{1,2,3,4,...,40\})\land \forall i,j (i\neq j \rightarrow a_i\neq a_j)$ 

$|\Omega| = _{40}P_5 = \frac{40!}{35!}$

$\forall \omega \in \Omega \> P(\{\omega\}) = 35!/40!=\frac{1}{40*39*38*37*36}=\frac{1}{78960960}$

## b 
We can think of this problem as choosing 3 numbers from the set of the even numbers 1-40 and then choosing 2 numbers from the set of odd numbers 1-40.

This results in the combinations of lottery numbers being $\frac{20!}{17!3!}\frac{20!}{18!2!}$

If we want to find the permutations of these then we multiply by $5!$ so this results in $\frac{5!20!20!}{3!2!17!18!}=25992000$ different permutations of lottery numbers with exactly 3 evens.

Thus to find the probability we divide by $|\Omega$ which results in $P(3E)=\frac{5!20!20!35!}{3!2!17!18!40!}=\frac{25992000}{78960960}=0.3291753292$

# 1.7 
## a
$P(GYG) = \frac{3}{7}\frac{4}{6}\frac{2}{5}=\frac{4}{35}$

## b
$3P(GYG)=12/35$ this is because the probability of any order of 2 green and one yellow is the same.

# 1.10
## a
$\Omega = \{\infty, 1,2,3,...\}$

$\forall \omega \in \Omega \>P(\omega) = (\frac{5}{6})^{\omega-1}*\frac16$

## b
$P(\omega=\infty)=\lim_{\omega\rightarrow \infty} (\frac{5}{6})^{\omega-1}*\frac16 = 0$

$P(\{\infty\})=0$


# 1.12 
## a

$P(\omega \leq 3) = P(1) + P(2) + P(3) = \frac{1}{6} + \frac{5}{36} + \frac{25}{216} = \frac{91}{216}$

It is also important to note that P(1), P(2), P(3) are disjoint

## b

$P(E\omega) = 5/36 + 125/(216*6) + ...$

Using geometric series sum: $P = \frac{5/36}{1-(5/6)^2}=\frac{5}{11}$

# 1.20
## a
$\Omega = \{1,2,3,4,5,6\}^4$

$\forall \omega \in \Omega \> P(\{\omega\})=\frac{1}{|\Omega|}=\frac{1}{6^4}$

## b
$|\Omega|=6^4$

$B=$ {No 5's} $\cup$ {Only 1 5}

|{No 5's}| = $5^4$

|{Only 1 5}| = $4*5^3$ (because the 5 can be in 4 different positions and other numbers are 5 options {non 5})

$|B| = 5^4 + 4*5^3$

$P(B) = \frac{5^4 + 4*5^3}{6^4}= \frac{1125}{6^4}$

-----

$A=$ {Only 5's} $\cup$ {One non 5} $\cup$ {2 5's}

|{Only 5's}| = 1

|{Only one non 5}| $= 4* 5= 20$ (non 5 can be in 4 different places with 5 different values)

For the set of 2 5's, there are 6 different orientations of the numbers where $x,y\in \{1,2,3,4,6\}$

xy55
x5y5
x55y
5xy5
5x5y
55xy

Thus |{2 5's}| = $6*5^2= 150$

Therefore $P(A)=\frac{150+20+1}{6^4}=\frac{171}{6^4}$

## c

$A\cup B = \Omega$

$P(A) + P(B) = 1$ 

$\rightarrow\frac{171}{6^4} + \frac{1125}{6^4}=1$

$\rightarrow\frac{1296}{6^4}=1$

$\rightarrow\frac{1296}{1296}=1$

So the answer to part b holds true

# 1.22 
## a
$\Omega = (i,j) | i\in\{\text{hearts,clubs,spades,diamonds}\}, j\in\{2,3,4,5,6,7,8,9,10,J,Q,K,A\}$

$\forall \omega \in \Omega \> P(\omega) = \frac{1}{|\Omega|}=\frac{1}{4*13}=\frac{1}{52}$

## b
What is the probability of picking an Ace from the deck that is not the Ace of Spades?

## c
Suppose $\exists A$ s.t. $P(A) = \frac{1}{5}$

By fact 1.8, then $P(A)= \frac{|A|}{|\Omega|} = \frac15$

Plugging in our known values: $\frac{|A|}{52} = \frac15$

When solving for $|A|$: $|A|=\frac{52}{5}=10.4$

This is not possible because the size of a set cannot be a non whole number. Therefore $\nexists A$ s.t. $P(A)=\frac15$


# 1.34
$\Omega = (i,j) \forall i,j (0\leq i\leq 1, 0\leq j \leq 1)$

Circle lies within the square iff $(\frac 13 < i < \frac 23) \land (\frac 13 < j < \frac 23)$

The range $(\frac 13,\frac 23)$ is one third the size of the possible range. Thus the probability the $i$ is within the range is $\frac 13$ and same for $j$.

Since we apply this range to both $i$ and $j$ the resulting probability is $\frac13\times\frac13=\frac19$

