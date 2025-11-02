---
format: pdf
---


# 4.14
$E(X)=1000=\frac1\lambda\rightarrow \lambda=0.001$

$X\sim Exp(0.001)$

## a
$P(X>2000)=\int_{2000}^\infty 0.001 e^{-0.001x} dx$

$= e^{-0.001*2000}-0=e^{-2}$

## b
$P(X>2000|X>500)= \frac{P(X>2000\cap X>500)}{P(X>500)}=\frac{P(X>2000)}{P(X>500)}$

$P(X>500)=\int_{500}^\infty 0.001 e^{-0.001x} dx$

$= e^{-0.001*500}-0=e^{-1/2}$

$P(X>2000|X>500)= \frac{e^{-2}}{e^{-1/2}}=e^{-3/2}$

# 4.49
Let $X$ denote how long a unit lasts (in years). We know that $X\sim Exp(\frac1{10})$.

Our goal is to find $(C,r)$ s.t. $0=(C+200)\times P(X>r)+ (C-600)\times P(X<r)$

$\rightarrow (C+200) \int_r^\infty \frac{1}{10}e^{-\frac x{10}} dx + (C-600) \int_0^r \frac{1}{10}e^{-\frac x{10}} dx$

$\rightarrow (C+200) (e^{-\frac r{10}}) + (C-600)(1-e^{-\frac r{10}})$

$\rightarrow C-600 + 800e^{-\frac r{10}} = 0$

$C$ as a function of $r$: $C= 600- 800e^{-\frac r{10}}$

Thus, pairs $(C=600-800e^{-\frac r{10}}, r=r)$ result in a profit of $0$. 

For $r=2$, to result in $0$ profit then $C=-54.98$ (I give the warranty holder ~$50). Since I am expecting a profit of 200 dollars from people who do not buy the warranty I would price the warranty at a similar profit threshhold and say the price for the full covered warranty is $C=150$. 

# 5.4
## a
$M_X(t)=e^{6t^2}$ when $|t|<2

$X\sim N(0, 12)$ and bound by $|t|<2$

## b
$M_Y(t)=\frac{2}{2-t}$ for $t<0.5$

$Y\sim Exp(2)$ and $t<0.5$

## c
$M_Z(t) = \infty$ for $t\geq 5$

$Z$ could follow an exponential distribution with $\lambda\leq5$

Thus we can determine $Z$ as an exponential distribution but we cannot determine $\lambda$

## d
$M_W(2) =2$ 

$W\sim Exp(4)$ because for exponential distribution with $\lambda=4$, $M(2)=\frac{4}{4-2}=2$

Alternatively $W$ could follow $P(W=0)=1/2$ and $P(W=\frac{\ln{3}}2)=1/2$

Thus $M_W(2) = \sum_i e^{2i} P(W=i)\rightarrow 1/2 e^{2*0}+ 1/2 e^{2/2 \ln3} = 1/2 + 3/2 = 2$

Therefore not sufficient information to determine the distribution of $W$.

# 5.8
$f_x = \frac1 {b-a}$ if $x\in[a,b]$ and $0$ else

$f_x = \frac1 {3}$ if $x\in[-1,2]$ and $0$ else

$f_y(y) = \frac{f_x(g^{-1}(y))}{g'(g^{-1}(y))}$

$g(x) = x^2$

$g^{-1}(y)=\sqrt{y}$

$g'(x)=2x$

$f_y(y) = \frac{1/3}{2\sqrt y}=\frac{1}{6\sqrt y}$ 

Now the bounds of $Y$ are not simply $-1^2,2^2$ because this results in $[1,4]$ which does not include values of $x\in(-1,1)$. We can think about it as $x\in[-1,1]$ maps to values of $y\in[0,1]$, meaning this section is mapped twice and thus follows $\frac{1}{3\sqrt y}$

$$f_y(y) = \begin{cases} \frac{1}{3\sqrt y} & \text{if } x\in[0,1) \\ \frac{1}{6\sqrt y} & \text{if } x\in[1,4] \\ 0 & \text{else}\end{cases}$$

# 5.11

# MORE CHECK CANVAS FOR UPDATES
