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
$\Omega = \{1,2,3,4,...,40\}^5$ using the cartesian power

$\forall \omega \in \Omega \> P(\{\omega\}) = 1/40^5$

## b 
Let $3E=$ {3 of 5 numbers are even (1-40)}

Let $E={2,4,6,...,40}$

Let $O={1,3,5,...,39}$

Since $|E|=|O|$ and $E^c = O$ then $P(E) = P(O) = 1/2$

This means we can then translate a set of 5 numbers to ${E,O}^5$ resulting in $2^5=32$ different $E,O$ sets. 

Therefore there are $\binom 53$ combinations of 3 even numbers. $\binom 53 = \frac{5!}{3!(5-3)!}=\frac{5*4}{2}=10$

Thus $P(3E)=10/32= 5/16$

# 1.7 
## a
$P(GYG) = \frac{3}{7}\frac{4}{6}\frac{2}{5}=\frac{4}{35}$

## b
$3P(GYG)=12/35$ this is because the probability of any order of 2 green and one yellow is the same.

# 1.10
## a
$\Omega = \{\infty, 1,2,3,...\}$

$P(\omega) = (\frac{5}{6})^{\omega-1}*\frac16$

## b
$P(\omega=\infty)=\lim_{\omega\rightarrow \infty} (\frac{5}{6})^{\omega-1}*\frac16 = 0$


# 1.12 
## a

$P(\omega <= 3) = P(1) + P(2) + P(3) = \frac{1}{6} + \frac{5}{36} + \frac{25}{216} = \frac{91}{216}$

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

$B= $ {No 5's} $\cup$ {Only 1 5}

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
Suppose $\exists A $ s.t. $P(A) = \frac{1}{5}$

By fact 1.8, then $P(A)= \frac{|A|}{|\Omega|} = \frac15$

Plugging in our known values: $\frac{|A|}{52} = \frac15$

When solving for $|A|$: $|A|=\frac{52}{5}=10.4$

This is not possible because the size of a set cannot be a non whole number. Therefore $\nexists A$ s.t. $P(A)=\frac15


# 1.34





