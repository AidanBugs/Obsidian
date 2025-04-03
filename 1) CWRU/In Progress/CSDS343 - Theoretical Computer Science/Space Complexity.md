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

## LOGSpace
$L=$ languages for which there is deterministic TM that decide the language using $O(\log n)$ space.

$NL=$ languages for which there is nondeterministic TM that decide the language using $O(\log n)$ space.

TM Model:

- Tape 1: READ ONLY input (assume we know where start / end of input is)
- Tape 2: Read / write work tape
- Tape 3: Output tape

### EX: $<a^nb^n>$
1. Count num a's in binary on workspace
2. Count num b's in binary on workspace
3. Make sure theyre the same

### EX: Palindromes
1. Keep counter in binary, let $i=0,1,2,...,n/2$
2. On input tape copy the $i$th symbol to work tape (separate counter for counting to $i$)
3. On input tape go to the $n-i$th symbol and check if theyre the same as work tape symbol (separate counter for counting to $n-i$)
4. repeat until reject or $i$ reaches max so accept.

Total count is 2 counters, one symbol so $O(\log n)$

### EX $PATH=\{<G,a,b>|\exists PATH a\rightarrow b \in G\}$
Show $PATH\in NL$

> Start at $a$
>
> nondeterministicly guess the next node in the path (constant space)
>
> verify that te next node is adjacent to current node (constant space)
>
> maintain a counter for number of nodes and reject if counter exceeds number of nodes (log space)
>
> accept if $b$ is reached

Total space $O(\log n)$

$UNDIRECTED-PATH\in L$ proven by Omar Rengold in 2008.

### EX: $UNDIRECTED-CYCLE$
We need to "always go left", we do this by always choosing the first edge as it appears in $G$.

>For each vertex $s$ try with $s$ as starting vertex.
>
>> For each vertex $t$ adjacent to $s$ we make $t$ be 2nd vertex.
>>
>>> If traversal revists $s$ and did not use edge $t\rightarrow s$ then we have a cycle
>>>
>>> When traversal goes from $a$ to $b$ consider the order the edges appear listed in $G$ and visit the vertex whose edge from $b$ is immediately after the edge from $b$ to $a$. If $b$ to $a$ is last edge for $b$ then we take the first edge for $b$. 

Prove we eventually find a cycle because we are doing this for every edge (vertex pair).

Proof

> Suppose $G$ has a cycle but our algorithm fails to find it
>
> $s$ is start and $t$ is next vertex and there exists a cycle that can be visitied from $s\rightarrow t\rightarrow...$
>
> Let $u$ be the first vertex revisted on the traversal starting from $s\rightarrow t$
>
> We know that $u$ went to $w$, when we start the algorithm starting at $u$ to $w$ then this will detect the cycle. 

## NL-comoplete
Is $L=NL$ or is $L\subset NL$?

Find $NL$-complete languages

We need to create a log space transducer $f$ which takes input $x$ and $i$ and $f(x,i)$ will output the $i$th symbol of $f(x)$ and $f$ uses $O(\log n)$ space.

### Prove $PATH$ is $NL$-complete:

> See above for $PATH\in NL$
>
> Prove $\forall B\in NL, B\leq_{L} PATH$
>>
>> Given $M$, machine that decides $B$ and $M$ on input $w$ create a graph $G$ and identify $2$ verticies $a,b$ such that $G$ has a path $a\rightarrow b$ iff $M$ accepts $w$.
>>
>> ### Idea
>> 
>> Each vertex of $G$ is a valid configuration of $M$, each edge are the different steps $M$ could take, and we go from $a$ as the initial config and $b$ is accept state.
>>
>> A configuration needs to have state ($O(1)$), head location ($O(\log n)$), working tape ($O(\log n)$.
>>
>> $f$ if we need too produce a vertex generate all string of $O(\log n)$ (lexical graphical order) size and verify that the string is a possible configuration. If so it will be the $k$th vertex and increment $k$.
>>
>> if we need to produce an edge, generate all pairs of strings of $O(\log n)$ size. We need to verify that both are valid configurations of $M$ on $w$ and verify that the second configuration is produced by the transition function of $M$ on  the first configuration. Increment $k$
>>
>> Generate edges to $b$, for each configuration that is at accepts state then we add an edge from that configuration to $b$.
>>
>> ### Proof
>>
>> Left as exercise for the reader :+1:

### Prove $SCC$ is $NL$-complete 

Prove $SSC\in NL$ 

> For each vertex $u_i$
>
>> for each vertex $v_i$
>>
>>> nondeterministicly guess the next node in the path from $u$ to $v$ checking that each next vertex is adjacent and keeping a count and reject if count $=n$
>>>
>>> accepting if $b$ is reached
>>>
>>> Keep track of next vertex, and count $O(\log n)$

Prove $PATH\leq_L SCC$

> Map everything to $a$ and $b$ can move to anything.
>
> Proof left for reader.
