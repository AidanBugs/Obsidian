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

$\frac{2500}{33}+\sqrt{\frac{70000}{1089}}z = 65$

$z=\frac{-355}{\sqrt{70000}}=-1.34$

$P(X<65) = \Phi(z) = 0.09012$

## b
$P(Start3)= \frac{3.99999999-3}{4.8-1.5}\approx \frac{1}{3.3} = \frac{10}{33}$

$X\sim Bin(500,\frac{10}{33})$

$X\sim N(\frac{5000}{33}, \frac{115000}{1089})$

$\frac{5000}{33}+\sqrt{\frac{115000}{1089}} z = 160$

$z=\frac{280}{\sqrt{115000}} = 0.826$

$P(X>160) = 1-\Phi(z) = -0.20327$

# 4.24
## a
Let $\#4_n$ denote the number of 4's in $n$ rolls.

$P(\frac{\#4_n}{n}\geq 0.17)= P(\frac{\#4_n}{n} - \frac 16 \geq 0.17-\frac 16$

$\leq P(|\frac{\#4_n}{n} -\frac 16 |\geq 0.17-\frac 16)$

$=1-P(|\frac{\#4_n}{n} - \frac 16| < 0.17-\frac16) = 0$ as $n\rightarrow\infty$ 

## b
Let $\#S_n$ denote the set $[\#1_n,\#2_n,\#3_n,\#4_n,\#5_n,\#6_n]$

$P(A_n) = \forall S_n \in \#S_n$ where $P(0.16 < \frac{S_n}n < 0.17)$

Due to normal approximation: $P(0.16 < \frac{S_n}n < 0.17)= \Phi((0.17 - \frac{S_n}n)(\frac{\sqrt n}{\sqrt{\frac16 \frac56}})) - \Phi((0.16-\frac{S_n}n )(\frac{\sqrt n}{\sqrt{\frac16 \frac56}}))\approx\Phi((0.17 - \frac16)(\frac{\sqrt n}{\sqrt{\frac16 \frac56}})) - \Phi((0.16-\frac16 )(\frac{\sqrt n}{\sqrt{\frac16 \frac56}}))$

$= \Phi(0.008894427 \sqrt n) - \Phi(-0.01788854 \sqrt n)$

We want $\Phi(0.008894427 \sqrt n) - \Phi(-0.01788854 \sqrt n)> 0.999$ so pick a large $n=160000$ and solve we get $\Phi(3.578) - \Phi(-7.155) \approx 1$ which is greater than $0.999$.


# 4.26
$P(|\hat p - p | < 0.1) \geq 2\Phi(2(0.1)\sqrt n) - 1 = 2\Phi(2) - 1 = 2(0.97725) - 1 = 0.9545$

With confidence of $0.9545$

# 4.35
## a
Since $X\sim Bin(365, \frac1{2^{9}})$ (note its $2^9$ because the first flip can be either heads or tails but all subsequent flips must be same as first flip).

$P(X>1) = 1-P(X=1) - P(X=0)$

$P(X=0) = (1-\frac1{2^9})^{365}$

$P(X=1) = 365(1-\frac1{2^9})^364 \frac1{2^9}$

$P(X>1) = 1-365(1-\frac1{2^9})^364 \frac1{2^9} -(1-\frac1{2^9})^{365}$

## b
Since $X\sim Bin(365, \frac1{2^{9}})$ (note its $2^9$ because the first flip can be either heads or tails but all subsequent flips must be same as first flip).

This would not be a good fit for a normal approximation because $p$ is close to $0$ and $np(1-p)\approx 0.711 < 10$.

Thus $\lambda = \frac{365}{2^{9}}=0.71289$

$P(X>1) = 1-P(X=1) - P(X=0)$

$P(X=0) \approx e^{-0.71289}$

$P(X=1) \approx e^{-0.71289}\frac{0.71289}{1}$

$P(X>1) 1- 1.71289e^{-0.71289} = 1-0.8397=0.1603$
