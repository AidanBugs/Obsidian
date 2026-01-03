---
format: pdf
---

# 3.2 
## a
$p(k) = ck$ 

We know that a probability mass function is the probability that $X=k$ and that the $\sum_{k=1}^6 p(k) = 1$

Using this:

> $\sum_{k=1}^6 p(k) = 1$
>
> $\sum_{k=1}^6 ck = 1$
>
> $\rightarrow c + 2c + 3c + 4c + 5c + 6c = 1$
>
> $\rightarrow 21c = 1$
>
> $c = \frac1{21}$

## b

$O = X\in \{1,3,5\}$

$P(O) = p(1) + p(3) + p(5)$

$P(O) = \frac{1}{21} + \frac{3}{21} + \frac{5}{21}$

$P(O) = \frac{9}{21}= \frac37$

# 3.3 
## a
$\int_{-\infty}^{\infty} f(x) dx= \int_{-\infty}^{0} f(x) dx + \int_{0}^{\infty} f(x) dx$

$\rightarrow 0 + \int_{0}^{\infty} 3e^{-3x}dx$

$\rightarrow -e^{-3(\infty)} - (-e^{-3(0)})$

$\rightarrow 0 + e^{0})$

$\rightarrow 1$

Therefore this is a valid probability density function because $\int f(x) dx=1$

## b
$P(-1<X<1) = \int_{-1}^{1} f(x) dx= \int_{-1}^{0} f(x) dx + \int_{0}^{1} f(x) dx$

$\rightarrow 0 + \int_{0}^{1} 3e^{-3x}dx$

$\rightarrow -e^{-3(1)} - (-e^{-3(0)})$

$\rightarrow -e^{-3} + e^{0})$

$\rightarrow P(-1<X<1) =1-e^{-3} = 0.95021$


## c
$P(X<5) = \int_{-\infty}^{5} f(x) dx= \int_{-\infty}^{0} f(x) dx + \int_{0}^{5} f(x) dx$

$\rightarrow 0 + \int_{0}^{5} 3e^{-3x}dx$

$\rightarrow -e^{-3(5)} - (-e^{-3(0)})$

$\rightarrow -e^{-15} + e^{0})$

$\rightarrow P(X<5) =1-e^{-15} = 0.999999694$

## d
$P(2<X<4 | X<5) = \frac{P(2<X<4 \cap X<5)}{P(X<5)}$

> $P(2<X<4 \cap X<5) = P(2<X<4)$

$P(2<X<4 | X<5) = \frac{P(2<X<4)}{P(X<5)}$

> $P(2<X<4) = \int_{2}^{4} f(x) dx$
> 
> $\rightarrow \int_{2}^{4} 3e^{-3x}dx$
> 
> $\rightarrow -e^{-3(4)} - (-e^{-3(2)})$
> 
> $\rightarrow -e^{-12} + e^{-6})$
> 
> $\rightarrow P(2<X<4) =e^{-6} - e^{-12} = 0.0024726$
> 
> Take $P(X<5)$ from part c

$P(2<X<4 | X<5) = \frac{e^{-6} - e^{-12}}{1-e^{-5}}$

$P(2<X<4 | X<5) = \frac{0.0024726}{0.999999694}$

$P(2<X<4 | X<5) = 0.0024893812$

# 3.7 
## a
$[\sqrt 2, \sqrt 3]$

## b
$P(X=1.6)=0$ because $\lim_{a\rightarrow 0} F(1.6) - F(1.6-a) = 0$ 

## c
$P(1<X<\frac32) = F(\frac 32) - F(1) = \frac32 ^2 -2 - 0 = \frac14$

## d
$$ f(x) = \begin{cases}  0 & \text{if } x < \sqrt 2\\ 2x & \text{if } \sqrt 2 \leq x < \sqrt 3 \\0 & \text{if } \sqrt 3 \leq x \end{cases}$$

# 3.9 
## a
$\mu = \int_{-\infty}^{\infty} xf(x)dx = \int_{-\infty}^{0} xf(x)dx + \int_{0}^{\infty} xf(x)dx$

$\rightarrow 0+ \int_{0}^{\infty} 3xe^{-3x}dx$

$\rightarrow -\frac{(3(\infty)+1)e^{-3(\infty)}}{3} - (-\frac{(3(0)+1)e^0}{3})$

$\rightarrow 0  +\frac{(1)*1}{3}$

$\mu = \frac13$

# 3.25(b)
$h(x)$ is a pdf if $\int_{-b}^b h(x)dx = 1$

$\int_{-b}^b \cos(x) dx = \sin(b) - \sin(-b) = 1$

$\sin(\frac\pi 6) = \frac 12, \sin(-\frac\pi 6) = \frac12$

$\sin(\frac{5\pi} 6) = \frac 12, \sin(-\frac{5\pi} 6) = \frac12$

$\therefore \forall n \in \mathbf Z (b = \frac\pi 6 + 2\pi n) \lor (b = \frac{5\pi}6 + 2\pi n)$

# 3.32
## a
$P(X>10)= \int_{10}^\infty f_X(x)dx)$

$\int_{10}^\infty \frac12 x^{-\frac32} dx)$

$- (\infty)^{-\frac 12} - (-(10)^{-\frac 12})$

$0 + \frac{1}{\sqrt{10}}$

$\rightarrow P(X>10) = \frac{1}{\sqrt{10}}$

## b
$F_X(b) = P(X < b) = 1-P(X>b)$

$\rightarrow 1 - \int_{b}^\infty f_X(X)dx$

$\rightarrow 1 - (- (\infty)^{-\frac 12} - (-(b)^{-\frac 12}))$

$\rightarrow 1 - (0 + \frac{1}{\sqrt b})$

$\rightarrow 1 - \frac{1}{\sqrt b}$

$$F_X(x) = \begin{cases}  1-\frac{1}{\sqrt x} & \text{if } 1< x < \infty\\ 0 & \text{otherwise}\end{cases}$$

## c
$E[X] = \int_{-\infty}^\infty xf(x) dx$

$= 0 + \int_1^\infty \frac 12 x^{-\frac 12}dx$

$= \lim_{b\rightarrow \infty} \int_1^b\frac 12 x^{-\frac 12}dx$

$=\lim_{b\rightarrow \infty} \sqrt b - \sqrt 1$

$=\infty$

$\therefore E[X]=\infty$
