# Orcale TM
A TM that has access to an oracle for a particular language. The TM can query the oracle with any string $w$ and the oracle responds Y/N on whether the string is in the oracle language.

## EX
Hamiltonian Cycle and Unique Hamiltonian Cycle

Show if we have Hamiltonian Cycle as oracle, then $UNIQUE HC \in P^{HC}$

Algorithm:

For each edge $e\in G$ ask oracle ($HC$) if $G-e$ has a Hamiltonian Cycle.

Ask if $G$ has a Hamiltonian Cycle and reject if not

If the oracle answers no exactly $n$ (num of verticies), then accept, otherwise accept. 

### Proof
If $G$ has exactly one HC then cycle has $n$ edges in it and $HC$ will reject $n$ times and $UHC$ will accept.

If $G$ has more than one HC then at least one edge can't be in both cycles so oracle will reject on less than $n$ edges so $UHC$ will reject.

# Diagonalization
Oracles are basically diagonalization proofs. 

Theorem: There exists language $A$ such that $P^A=NP^A$

There exists a language $B$ such that $P^B\neqNP^B$

## EX $P^A=NP^A$
$NP^{TQBF}$ = nondeterministically guess polynomiallly many quantified frmula to query the oracle.

We know that $TQBF\in NPSPACE$ so a TM using $SPACE(n^k)$ can solve a polyomial number of $TQBF$.

This meanns $NP^{TQBF}\subset NPSPACE=PSPACE$

$PSPACE\subset P^{TQBF}$ in polynomial time construct the $TQBF$ solved by the $PSPACE$ machine and ask oracle to solve it.

## EX $P^B \neq NP^B$
$L^*=\{w|\exists x\in B \land |w|=|x|\}$ essentially $L^*$ is strings where there is a string of equal length in $B$

Let $M^*$ be a NTM that decides $L^*$ and $M^*$ uses polynomial time and has an orcale for $B$. $L(M^*)\in NP^B$ show $L^*=L(M^*)$.

Guess string $x$ with size $|x|=|w|$ and reject or accept if oracle accepts or rejects. 

Let $M_1, M_2,...$ be all deterministic polynomial oracle TM's. Order TMs so $M_1$ runs in time $\leq n^i$. Choose a number $K_i$ so that $K_i\leq K_{i-1}$ and $2^{K_i}> n^i$.

Define language $B$: consider $L(M_i^B)$, which runs in time $n^i$ and does $n^i$ queries of $B$. So $M_i$ on input $w$ will make some query $y$ of $B$. If $|y|<K_i$ then orracle for $B$ it will give same answer as previous. If $|y|\geq K_i$ oracle answers no so $y\notin B$
