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

## PSPACE complete
Is $P\subset PSPACE$?

$L$ is PSPACE complete if 

A. $L\inPSPACE$
B. $\forall A\in PSPACE, A\leq_p L$
C. $\exist A$ that is PSPACE complete and $A\leq_p L$

### TQBF (Totall Quantified Boolean Formula)
$n$ variables, each quantified and a bunch of formulas on the variables.

$\exists x_0 \forall x_1 \exists x_2 \forall x_3 \exists x_4 ... \exists x_n (CNF)$

That is there exists variables that regardless of other variables (T/F) it is true.

1. Show $TQBF\in PSPACE$

> Take formula as input
>
> If quantifier is $\forall x$
>
> - Set $x=T$ on the reduced formula
> - Set $x=F$ on the reduced formula
>
> Return T if both are T.
>
> If quantifier is $\exists x$
>
> Return T if either assignment of $x$ returns T.
>
> SPACE = $n\times m$ so $O(f(m)^2)$

2. Show $\forall L\in PSPACE, L\leq_p TQBF$

> There exists a DTM $M$ that decies $L$ 
>
> Recall Cook-levin theorem that SAT is NP-complete.
>
> We create a formula using variables $c_{i,j,k}$ where it is the $i$th symbol of the $j$th configuration is symbol $k$,
>
> formula clauses:
>
> - init config is state $q_0$ and only $w$ is on the tape. 
> - each cell has exactly one symbol
> - q accept is cool
> - each config is one transition away from the last one. 
>
> Since $L\in PSPACE$, then $M$ could use $2^{d(f(m))}$ configurations. 
>
> $\phi_{c_1,c_2,t}=$ formula that is true if $M$ goes from config $c_1$ to $c_2$ in $t$ steps.
>
> $\phi_{c_1,c_2,t}=\exists m | \phi_{c_1,m,t/2}\land \phi_{m,c_2,t/2}$
>
> The above doesn't quite work because we double size of formula at each step.
>
> $\exists m \forall a \forall b[(a=c_1\land b=m)\lor(a=m\land b=c_2)\rightarrow \phi_{c_1,c_2,t/2}]$
>
> This works because we dont double the size of the formula at each step. 

## PSPACE Complete Problems
Generalized full-knowledge non-random 2-player games

Generalized Graph Game:

> Given a directed Graph
> 
>Player 1 starts and chooses a node
>
> Each player chooses an adjacent node, but if a player has no move (cannot repeat nodes) the player looses

$GG=\{<G,a>|G\text{is a graph and a is a vertex and player 1 is guarenteed to win starting at a}\}$

1. $GG\in PSPACE$

> Check each path in $G$, from a vertex in polynomial size ($n$).
>
> Only need linear space because we clear tape after each path is complete

2. $TQBF\leq_p GG$

> Given a TBQF
>
> Create a graph such that player 1 wins starting at vertex $a$ iff the TQBF is true
>
> Adjust formula so that it startes with $\exists$ and alternates $\forall,\exists$.
>
> Player 1: $\exists$, Player 2: $\forall$
>
> For each variable create: X_i--> B, X_i--> C, B-->D, C--> D, D-->X_i+1.
>
> After each variable is complete, the graph lets P2 choose a clause, and P1 can choose literal from clause. Literals are mapped to the T/F of the variable that make the literal true. 
>
> Proof left as exercise for the reader
