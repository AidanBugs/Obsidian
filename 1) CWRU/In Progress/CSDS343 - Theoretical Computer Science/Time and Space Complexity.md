---
format: pdf
---

# Time and Space Complexity
## Time Complexity
$t_m(n)=$ the maximum number of steps the tm $M$ uses on input of size $n$ before $m$ halts. If $M$ runs forever on some input of size $n$, then $t_m(n)=\infty$.

$L\in TIME(f(m))$ There exists a tm $M$ that decides $L$ and $t_m(n)\in O(f(m))$

### EX
$L=\{a^nb^n\mid n\geq 1\}$

Consider $M$ that decides $L$. (one tape) 

On $s\in L$, $M$ finds first $a$ and then finds matching $B$.Finding a matching $b$ is $n$ steps, going back for an $a$ is also $n$ steps. Therefore $O(n^2)$.

On $s\nin L$, we still have $O(n^2)$

$t_m(n)\in O(n^2)$

Therefore $L\in TIME(n^2)$ <- complexity class

However we can find a more effecient tm s.t. $L\in TIME(n\log n)$

$M$: cross off every other $a$ and every other $b$. Check if odd # of $a$'s and $b$'s. Check if total is even (parity state going back). 

On a 2 tape, we can do it in $O(n)$ time. (add $a$ to other tape than cross off for each $b$).

### Theorem
If $T_m(n)\in O(f(n))$ where $m$ is a k-tape machine, then $T_{m_1}(n)\in O(f(n)^2)$ where $m_1$ is a 1-tape machine.

### Theorem
If $T_m(n)\in O(f(n))$ where $m$ is a non-deterministic machine, then $T_{m_1}(n)\in O(2^{f(n)})$ where $m_1$ is a deterministic machine.

### Time Constructable
$TIME(n)\leq TIME(n\log n)\leq TIME(n^2) \leq TIME(n^3)$

#### EX
$PATH=\{<G,a,b>\mid \exists \text{a path from a to b in G}\}$

$M$ mark vertex $a$, repeat until vertex $b$ is marked or there are no more vertexes to mark. For each marked vertex, mark all vertecies that are connected by an edge.

Runtime: let $n$ equal length of input. For each edge must scan the input to find and mark verticies. $O(n^2)$ but we might need to repeat $n$ times. So $PATH\in TIME(n^3)$

### P
$P=\union_{k=1}^{\infty} TIME(n^k)$

That is, $L\in P$ if there exists $k>0$ such that $L\in TIME(n^k)$ or $L$ is decided by a deterministic TM in polynomial time.

#### Theorem
If $L$ is context free, then $L\in P$

#### Proof
Assume $L$ is context free & we have the the grammer for it. Assume grammar is adjusted to have 2 types of rules: $A\rightarrow BC$, $A\rightarrow a$.

Create $M$ on input $s$. $|s|=n$

Create on tape of $M$ a $n\times n$ table with entry $T[i,j]$ all nonterminals that can generate the string $x_i,...,x_j$. $T[i,i]$ are all non terminals $A$ where $A\rightarrow x_i$ is a rule. $T[i,j]$ all nonterminals $A$ where $A\rightarrow BC$ and $B\in T[i,k]$ and $C\in T[k+1, j]$ for some $k, k=i,...,j-1$

$L\in TIME(n^3)$ because $T[i,j]$ are each $n$ runtimes (looking at previous entries). Thus any context free grammar is in $p$ because we can translate the grammar to a TM. 

## $NTIME$
$NTIME(f(m))$ set of languages which exist a nondeterministic TM $N$ with $T_n \in O(f(n))$. 

$NP=\union_{k=1}^{\infty} NTIME(n^k)$. With $L\in NP$ if there exists a NTM $N$ that decides $L$. $P\subset NP$. 

But is $NP$ a strict superset??? BIG QUESTION.

### Verifier
A verifier is a deterministic TM that takes 2 inputs, $x\in L$ iff there exists a verifier that takes $(x,w)$ as input and accepts 

$w$ is a certificate that $x\in L$.

$L\in NP$ iff there exists a verifier for $L, V\in P$

This means that $P$ means the language is easy to find an answer and $NP$ is easy to check if an answer is correct.

If $x\in L$ then $V(x,w)$ will accept, $|w|\in O(|x|^k)$ and $t_v(|x|,|w|)\in O(\max(|x|,|w|)^k)$

#### Proof
Given $x$ and a NTM $N$ that decides $L$. Let $w$ be the sequence of choices $N$ uses of each step. Since $T_N(n)=O(n^k), |w|\in O(n^k)$. We can simulate $N$ with deterministic machine that uses $w$ for each choice. 

### Reducibility
If $A\leq_pB$ and $B\in P$ then $A\in P$ (bc we can use $B$ to solve $A$). Similarly, if $A\notin P$ then $B\notin P$.

#### Example
$HAMILTONIAN CYCLE \leq_p TRAVELING SALESMAN$

Given $G$ on instance of Ham cycle problem. Create a network of cities + costs and a budget $K$. Make each vertex a city. set $K=n$ and if there is an edge between 2 verticies make the cost between them $1$ else $2$.
