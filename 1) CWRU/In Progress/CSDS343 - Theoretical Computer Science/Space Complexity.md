---
format: pdf
---

# Space Complexity
$SPACE(f(m))$ is languages decided by a TM that needs $O(f(m))$ cells

$NSPACE(f(m))$ is languages decided by a NTM that needs $O(f(m))$ cells

$PSPACE=\union_{k=1}^{\infty}SPACE(n^k)$

$NPSPACE=\union_{k=1}^{\infty}NSPACE(n^k)$

$PSPACE=NPSPACE$

## Savitch's Theorem
$NSPACE(f(m))\subset SPACE(f(m)^2), f(m)\geq n$

### Proof
Let $L\in NPSPACE(f(m))$

There exists a NTM $N$ that decides $L$, let $N$ use $f(n)$ space to decide $s\mid |s|=n$

Consider an execution of $N$ (tree of choices), since we know that $N$ must halt then it cannot repeat a configuration. There are $|Q|\times f(n)\times |\Gamma |^{f(n)}$ configurations.

$|Q|\times f(n)\times |\Gamma |^{f(n)}\leq 2^{d(f(n))}$ for some constant $d$.

The path from the first configuration to the accept configuration could be as large as $c2^{d(f(n))}$. We cannot do BFS because we would have to store that many configurations (same reasono for DFS).

Instead we can use a divide and conquer approach to create a deterministic machine s.t. $SPACE(f(n)^2)$.

1. Adjust transition function of $N$ so that it deletes the contents before accepting. So accepts configuration is $q_{accept},_,_,_,...,_$ which is size $f(n)$.

$CANYIELD(c_1,c_2,t)=$ true if $N$ can go from $c_1$ to $c_2$ in $t$ or less steps.

$CANYIELD(c_0,c_{accept},2^{d(f(n))})$.

Code for $CANYIELD(c_1,c_2,t)$:

> if $t=0$ and $c_1=c_2$ return true
> 
> if $t=1$ and $\delta_n$ gies from $c_1$ to $c_2$ in one step then return true.
>
> if $t=0$ and $c_1\neq c_2$ return false
> 
> otherwise
>
> for each configuration $m$
>
>> if $CANYIELD(c_1,m,t/2)\land CANYIELD(m,c_2,t/2)$ return true
>
> return false

Call stack for $CANYIELD$:

> $CANYIELD(c_0, c_{accept}, 2^{d(f(n))})$
>
> $CANYIELD(c_0, m, 2^{d(f(n))-1})$
>
> $CANYIELD(c_0, m_2, 2^{d(f(n))-2})$
>
> ....
>
> until we get a $t$ of $1$ or $0$ then bounce back up the call stack.

This is $d(f(n))$ frames where each $CANYIELD$ uses up to $(3+d)f(n)$ space. $CANYIELD$ stores 3 configurations, each configuration uses $f(n)$ space and also needs space for the time which is $d(f(n))$.

Therefore max possible space is $d*f(n)*(3+d)*f(n)=O(f(n)^2)$ so $NPSPACE(f(n))\subset SPACE(f(n)^2)$
