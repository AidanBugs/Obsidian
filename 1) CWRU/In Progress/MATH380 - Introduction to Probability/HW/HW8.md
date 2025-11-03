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
## a
$M_X(t) = \int_0^\infty e^{tx}xe^{-x}dx =\int_0^\infty xe^{x(t-1)}dx$

Integration by parts:

$\frac{xe^{x(t-1)}}{t-1}|_0^\infty - \int_0^\infty \frac{e^{x(t-1)}}{t-1}dx$

For $t<1$ the first term goes to $0$ so

$\rightarrow 0 - \frac{e^{x(t-1)}}{(t-1)^2} |_0^\infty$

$\rightarrow 0 + \frac{e^{0}}{(t-1)^2} \rightarrow \frac{1}{(t-1)^2}$

$M_X(t) = \frac{1}{(t-1)^2}, t<1$

## b

$E(X^n)= M_X^n(0)\rightarrow\frac{d}{dt}^n(\frac{1}{(t-1)^2})$ then plug in $0$ for $t$

$\rightarrow \frac{d}{dt}^n (t-1)^{-2}$

For $n=1\rightarrow \frac{-2}{(t-1)^{-3}}$, $t=0\rightarrow 2$

For $n=2\rightarrow \frac{6}{(t-1)^{-4}}$, $t=0\rightarrow 6$

For $n=3\rightarrow \frac{-24}{(t-1)^{-5}}$, $t=0\rightarrow 24$

$E(X^n)= (n+1)!$

# 5.18
## a
$M_X(t)=E(e^{tX})=\Sigma_{k=0}^\infty e^{tk} p(1-p)^{k-1}$

$\rightarrow \frac{p}{1-p} \Sigma_{k=0}^\infty e^{tk} (1-p)^k$

$\rightarrow \frac{p}{1-p} \Sigma_{k=0}^\infty (e^t (1-p))^k$

To prevent the sum from diverging, $|e^t(1-p)|<1\rightarrow t<-\ln(1-p)$

$\rightarrow \frac{p}{1-p} \frac{e^t(1-p)}{1-e^t(1-p)}$

$\rightarrow M_X(t)=\frac{pe^t}{1-e^t(1-p)},t<-\ln(1-p)$

## b
$E(X)=M_X'(0)$

$\rightarrow p(\frac{(1-e^t(1-p))e^t-e^t(0-e^t(1-p))}{(1-e^t(1-p))^2})$

$\rightarrow p(\frac{(1-(1-p))-(-(1-p))}{(1-(1-p))^2})$

$\rightarrow p(\frac{1}{p^2})$

$\rightarrow \frac{1}{p}$

$Var(X)= E(X^2)-E(X)^2\rightarrow M_X''(0)-M_X'(0)^2$

$M''_X(0)=\frac{d}{dt}M'_X(t)$

$\rightarrow \frac{d}{dt} p(\frac{(1-e^t(1-p))e^t-e^t(0-e^t(1-p))}{(1-e^t(1-p))^2})$

$\rightarrow \frac{d}{dt} p(\frac{(1-e^t+pe^t))e^t-e^t(-e^t+pe^t))}{(1-e^t+pe^t)^2})$

$\rightarrow \frac{d}{dt} p(\frac{e^t}{(1-e^t+pe^t)^2})$

$\rightarrow p\frac{(1-e^t(1-p))^2e^t-(e^t(2(1-e^t(1-p))(-e^t(1-p))))}{(1-e^t(1-p))^4}$

$\rightarrow p\frac{(1-(1-p))^2-(2(1-(1-p))(-(1-p)))}{p^4}$

$\rightarrow \frac{(p^2)-(2p)(-1+p)}{p^3}$

$\rightarrow \frac{(p)-(-2+2p)}{p^2}$

$\rightarrow \frac{2-p}{p^2}$

$Var(X) = \frac{2-p}{p^2} - \frac1p^2 = \frac{1-p}{p^2}$


# 5.35
CDF of $Exp(\lambda)\rightarrow F(x)= 1-e^{-\lambda x}, x\geq 0$

$f_{\lfloor X \rfloor}(x)=F(x+1)-F(x), x\in \mathbb N$

This represents the probability that a number lies in the range $[x,x+1)$ which is how the ceiling function works.

We can do a sanity check to see that our function works as a pmf.

$\sum_{k=0}^\infty f_{\lfloor X \rfloor}$

$\sum_{k=0}^\infty F(k+1)-F(k)$

$-F(0)+F(1)-F(1)+F(2)-F(2)+F(3)-...+F(\infty)$

$F(\infty)-F(0)$

$1-e^{-\infty}-(1-e^0)=1$


# 6.3
## a
$(W,Y,Pu)\sim Mult(10,3,0.5,0.4,0.1)$

$P(W=5,Y=4,Pu=1)=\binom{10}{5,4,1}0.5^50.4^40.1$

$P(W=5,Y=4,Pu=1)=\frac{10!}{5!4!1!}0.5^50.4^40.1$

$P(W=5,Y=4,Pu=1)=(2*3*4*7*6)*0.5^50.4^40.1$

$P(W=5,Y=4,Pu=1)=0.08064$


## b
$P(W=9)=P(W=9,Y=1,Pu=0)+P(W=9,Y=0,Pu=1)$

$P(W=9)=4*0.5^9+0.5^9=5*0.5^9=\frac5{512}$
