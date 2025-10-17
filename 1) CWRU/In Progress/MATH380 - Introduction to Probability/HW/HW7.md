---
format: pdf
---


# 4.2
We approximate this binomial distribution ($X\sim Bin(n=1000,p=0.42)$) because $np(1-p)>10$.

$E(X)=np=420$

$Var(x)=np(1-p)=159.6$

$X\sim N(420,159.6)$

$\sigma = \sqrt {159.6}= 12.633$

$450 = 420 + 12.633 z\rightarrow 30 = 12.633 z \rightarrow z= 2.37$

$P(X>450) = 1 - P(X<450) = 1-\Phi(2.37) = 1-0.9972 = 0.0028$


# 4.6
$2\Phi(2\epsilon \sqrt n) \geq 0.95\rightarrow \Phi(2\epsilon\sqrt n) \geq 0.975$

$\rightarrow 2\epsilon\sqrt n \geq 1.96 \rightarrow n = \frac{1.96}{2\epsilon}^2$

$\epsilon = 0.02$ from the problem

$n = \frac{1.96}{0.04}^2=2401$

# 4.10
$1-P(X=0)=0.5\rightarrow P(X=0) =0.5$

$P(X=0)=e^{-\lambda} * 1 =0.5\rightarrow \lambda = -\ln(0.5)=0.693147$ 

Scoring exactly 3 goals (hat trick) is then $P(X=3)=0.5\frac{3^{-\ln(0.5)}}{3!}=0.178457$

If you define hat trick as 3 or more goals then its $1-P(X=0)-P(X=1)-P(X=2)$ but since the majority accepted definition is exactly 3 goals I will leave my answer as $P(HAT TRICK)= P(X=3)=0.178457$

# 4.16
## a
$P(Start1)= \frac{1.99999999-1.5}{4.8-1.5}\approx \frac{0.5}{3.3} = \frac{5}{33}$

$X\sim Bin(500,\frac5{33})$

$X\sim N(\frac{2500}{33}, \frac{70000}{1089})$

## b
$P(Start3)= \frac{3.99999999-3}{4.8-1.5}\approx \frac{1}{3.3} = \frac{10}{33}$

$X\sim Bin(500,\frac{10}{33})$

$X\sim N(\frac{5000}{33}, \frac{115000}{1089})$

# 4.24

# 4.26

# 4.35
