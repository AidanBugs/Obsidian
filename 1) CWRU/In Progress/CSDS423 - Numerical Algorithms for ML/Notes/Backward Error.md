Suppose $Ax=b$ with the actual value being $x_0: Ax_0=b$ but we got $x_e$

So the forward error is $||x_e-x_0||$ note that we can use any norm like euclidian distance, manhattan norm and infinity norm.

Backward error is now $||Ax_e -b||$ 

In contrast suppose we try to calculate $\sqrt 2$ with $x_e$ having 1 decimal precision

> Forward error is $||\sqrt 2 - 1.4||$

> Backward error is $||2 - 1.4^2||$

In iterative algorithms we can do $|x^t-x^{t-1}|$ as if this difference is small then maybe were getting really close to the real $x_0$

Note that backward error $=0$ iff forward error $=0$

We really mostly care about if backward error small then forward error small because we can always calculate backward error but may not always be able to calculate forward error when $x_0$ is unknown.

We can formally define backward error as:

> How much would the quanity of interest change if we plugged in $x_e$ instead of $x_0$

# new example
$ax=b$, inputs $a,b$ output $x$, $x_0 = b/a$

forward error $|x-x_0|=|x-b/a|$

backward error $|ax-b|=|a(x-x_0)|$ 

> If $|a|<<1$ ill conditioned because $a$ can make backward error $0$ regardless of forward error

> If $|a|>>1$ well conditioned because backward error small only when forward error is small

# Condition number:
$\kappa =$ forward error / backward error

Example of $f:R\rightarrow R$ find $x$ to satisfy $f(x)=0$

Forward error is $\epsilon$, backward error $|f(x+\epsilon)- f(x)|$ 

We can write $f(x+\epsilon)\approx f(x)+\epsilon f'(x)$

so $\kappa = \frac{\epsilon}{f(x)+\epsilon f'(x) - f(x)}=\frac{1}{f'(x)}$
