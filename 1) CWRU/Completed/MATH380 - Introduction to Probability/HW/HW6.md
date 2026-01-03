---
format: pdf
---
# 3.9 
## b 
$f(x) = 3e^{-3x}, x>0$

$E(e^{2X}) = \int_{-\infty}^\infty e^{2x} (f(x))dx$

$E(e^{2X}) = \int_{0}^\infty e^{2x} (3e^{-3x})dx$

$E(e^{2X}) = 3 \int_{0}^\infty e^{2x} (e^{-3x}) dx$

$E(e^{2X}) = 3 \int_{0}^\infty e^{-x} dx$

$E(e^{2X}) = 3 (-e^{-x}|_{0}^{\infty})$

$E(e^{2X}) = 3 (0 - (-1))$

$E(e^{2X}) = 3$

# 3.14 
# $Var(X_{3.1})$
$Var(X_{3.1}) = E(X^2) - E(X)^2$

> $E(X^2) = \sum_{i=1}^5 x_i^2 P(x=i)$

> $E(X^2) = 1(1/7) + 4(1/14) + 9(3/14) + 16(2/7) + 25(2/7)$

> $E(X^2) = \frac{197}{14}$

$Var(X_{3.1}) = \frac{197}{14} - E(X)^2$

> $E(X)^2 = (\sum_{i=1}^5 x_i P(x=i))^2$

> $E(X)^2 = (1(1/7) + 2(1/14) + 3(3/14) + 4(2/7) + 5(2/7))^2$

> $E(X)^2 = (\frac72)^2$

> $E(X)^2 = \frac{49}{2}$

$Var(X_{3.1}) = \frac{197}{14} - \frac{49}2$

$Var(X_{3.1}) = \frac{51}{28}$

# $Var(X_{3.3})$
$Var(X_{3.3}) = E(X^2) - E(X)^2$

> $E(X^2) = \int_{0}^{\infty} 3x^2 e^{-3x} dx$

> $E(X^2) = -x^2e^{-3x}|_0^\infty + \int_{0}^{\infty} 2x e^{-3x} dx$

> $E(X^2) = -x^2e^{-3x} - \frac{2xe^{-3x}}{3}|_0^\infty + \int_{0}^{\infty}  \frac{2e^{-3x}}{3} dx$

> $E(X^2) = -x^2e^{-3x} - \frac{2xe^{-3x}}{3} - \frac{2e^{-3x}}{9}|_0^\infty$

> $E(X^2) = -\frac{(9x^2 + 6x + 2)e^{-3x}}9 |_0^\infty$

> $E(X^2) = \frac29$

$Var(X_{3.3}) = \frac29 - E(X)^2$

> $E(X)^2 = (\int_{0}^\infty 3xe^{-3x} dx )^2$

> $E(X)^2 = (-(xe^{-3x}+\frac{e^{-3x}}{3})|_0^\infty)^2$

> $E(X)^2 = (\frac 13)^2$

> $E(X)^2 = \frac19$


$Var(X_{3.3}) = \frac29 - \frac19 = \frac 19$

# 3.15
## (a) 
$E(3X+2) = 11$

## (b) 
$E(X^2) = E(X)^2 + Var(X) = 7$

# 3.18 
## a
$P(2<X<6) = -\Phi(-0.5) + \Phi(1.5)$ 

$P(2<X<6) = -0.3085 + 0.9332$

$P(2<X<6) = 0.6247$

## b
$1-\Phi(z) = 0.33$

$\Phi(z) = 0.66$

$z = 0.42$

$c = 3 + 2z$

$c = 3 + 0.84$

$c = 3.84$


## c

$E(X^2) = E(X)^2 - Var(X) = 9 - 4 = 5$

# 3.32
## (d) 
$E(X^\frac14) = \frac12 \int_1^\infty x^\frac14 x^{-\frac32} dx$

$E(X^\frac14) = \frac 12 \int_1^\infty x^{-\frac54} dx$

$E(X^\frac14) = \frac 12 \frac{-4}{x^\frac14}|_1^\infty$

$E(X^\frac14) = 2$


# 3.68 
## a
$E(Z^4) = \frac{1}{\sqrt{2\pi}} \int x^4 e^{-\frac{x^2}2}dx$

$E(Z^4) = \frac{1}{\sqrt{2\pi}} \int x^3 (x e^{-\frac{x^2}2})dx$

$E(Z^4) = \frac{1}{\sqrt{2\pi}} (-x^3e^{-x^2/2}|_{-\infty}^\infty - \int -3x^2 e^{-\frac{x^2}2})dx)$

> Due to the odd function rule the first half of the integral goes to 0. 

$E(Z^4) = \frac{1}{\sqrt{2\pi}} (0 - \int -3x^2 e^{-\frac{x^2}2})dx)$

$E(Z^4) = 3  (\int \frac{1}{\sqrt{2\pi}} x^2 e^{-\frac{x^2}2})dx)$

$E(Z^4) = 3 E(Z^2) = 3(1) = 3$

## b
$Z= \frac{X-\mu}{\sigma}\rightarrow \sigma Z + \mu = X$ 

$E(X^4) = E((\sigma Z + \mu)^4)$

$E(X^4) = E((\sigma Z)^4 + 4\mu (\sigma Z)^3 + 6\mu^2 (\sigma Z)^2 + 4\mu^3 \sigma Z + \mu^4)$

$E(X^4) = \sigma^4(E(Z^4)) + 4\mu \sigma ^3(E(Z^3)) + 6\mu^2 \sigma^2 (E(Z^2)) + 4\mu^3 \sigma E(Z) + \mu^4$

$E(X^4) = \sigma^4(3) + 4\mu \sigma ^3(0) + 6\mu^2 \sigma^2 (1) + 4\mu^3 \sigma (0) + \mu^4$

$E(X^4) = 3\sigma^4 + 6\mu^2 \sigma^2  + \mu^4$

# 3.71 
$\sqrt 6 z = 5$

$z = \frac5 {\sqrt 6}$

$\Phi(\frac{5}{\sqrt 6}) = \Phi(2.04)= 0.9793$

$P(X>12:05) = 1- \Phi(2.04) = 0.0207$

# 4.20

$H~Bin(10000,0.5)$

$H~N(E(H), Var(H))$

$E(H) = 10000 * 0.5 = 5000$

$Var(H) = 10000 *0.5 *0.5 = 2500$

$H~N(5000, 2500)$

$\sigma = 500$

$100 = 500 z \rightarrow z = 0.2$

$P(4900<H<5100) = \Phi(0.2) - \Phi(-0.2)$

$P(4900<H<5100) = 0.5793 - 0.4207= 0.1586$

Alternatively, $P(4900<H<5100) = 2\Phi(0.2) - 1 = 0.1586$


