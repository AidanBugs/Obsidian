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

# Oracele Machines
Typical model of an Oracle Machine is a 2 Tape machine where tape 2 is the oracle tape. TM can write strings to the oracle tap,e enter state $q_{oracle}$ and the string is replaced with $Y/N$ in one step.

$NP=\exists x \phi (x) | \phi(x)\in P$

$CONP=\forall x \lnot \phi(x)\rightarrow \forall x \phi(x)$

$NP^{NP}=NP^{\exists x \phi(x)}=NP^{\forall x \phi(x)}=\exists y \forall x \phi(x,y)$ which is another $NP$ problem. 

## Oracle Notation Stuff:
$\Sigma_1^P=NP, \Sigma_2^P=NP^{NP}...$

$\Delta_1^P=P^{NP}, \Delta_2^P=NP^{NP^{NP}}...$

$\Pi_1^P=NP, \Pi_2^P=CONP^{NP}...$

$\Sigma_0^P=\Pi_0^P=\Delta_0^P=P$

We can create a nest of these notations and we call this the Polynomial Heirarchy $PH$ and $PH\subset PSPACE$

# Untrustworthy Oracle
Verifier $V:\Sigma ^* \times \Sigma^* \times \Sigma^* \rightarrow \Sigma^*\cup \{accept, reject\}$ and $V$ is deterministic and polynomial time. First $\Sigma^*$ is the problem description, then history of queries to prover oracle, then a string of random bits, then a new query.

Prover: $\Sigma^*\time \Sigma^*\rightarrow\Sigma ^*$, current query, history of queries, answer

Zero knowledge proofs: if $x\in L$ we want verifier to accept with probability $>\frac{2}{3}$ without giving any information that lets verifier solve problem directly.

Interactive proof: Class IP, $L\in IP$ if $\exists V$ such that:

1. If $w\in L\rightarrow \exists P$ such that $V$ querying $P$ will accept with prob $>2/3$
2. If $w\notin L\rightarrow \forall P, V$ will accept after querying $P$ with prob $<1/3$ 

## EX Zero Knowledge Proofs
Zero knowledge proof of $HAM-CYC$, I am the prover & I have a graph is a $HC$ on the graph. How do I convince a verifier that $G$ has a HC without revealing anything about the cycle. 

Prover does the follwing on each query of $V$ (Assuming graph isomorphism $\notin P$)

> Create $G'$ which is a permutation of $G$
>
> Send $G'$ to the verifier.

Verifier flips a coin (uses the random bits) and asks one of 2 questions: 

1. Give me the HC of $G'$
2. Give me the witness that $G$ is isomorphic to $G'$

## EX Interactive Proofs
Graph non-isomorphism $<G_1,G_2>|$ such that $G_1$ is not isomorphic to $G_2$

I want the verifier to decide this language. 

Verifier creates $G_1',G_1''$ and $G_2',G_2''$. 

1. Ask $G_1'',G_1'$
2. Ask $G_2'',G_2'$
3. Ask $G_1'',G_2'$
4. Ask $G_2'',G_1'$

Each time verifier asks Q1 or Q2 it increases probability in correct answer to whether $G_1,G_2$ are isomorphic or not.

## More IP Examples
$IP = PSPACE$

$#SAT=\{<w,k>| w\text{is a SAT formula (CNF) and has exactly } k \text{ satisfying assignments}\}$

Alternatively, given a $SAT$ formula, how many different assignments satisfy it?

$V$ Given $w$ a $3-SAT$ formula 

1. Ask $P$ how many different satisfying assignments and $P$ will return with a number $k$
2. $V$ sets first variable to $T$ and adjust formulas and asks $P$ how many satisfying assignments to new formula. Then $V$ sets 1st variable to false and asks $V$ how many satisfying assignments. If these numbers don't add up to $k$ then reject. 
3. Repeat step 2 for reach variable.

We can't do step 3 for both assignments otherwise we will have a non polynomial number of queries. We can get around this by turning $SAT$ into a polynomial.

- $\alpha\land \beta\rightarrow\alpha\beta$, where $\alpha,\beta$ are clauses
- $\lnot \alpha\rightarrow (1-\alpha)$
- $\alpha\lor\beta \rightarrow 1-(1-\alpha)(1-\beta)$

For example:

- $x\lor y\lor z\rightarrow 1-(1-x)(1-y)(1-z)$ we can expand this into a polynomial.

Let $n$ be the final degree of the polynomial and $m$ be the # of variables. $n\leq m$

We can ask what the polynomial's value is at arbitrary points. 

So $V$ turns forumla into polynomial $f$ and ask $P$ how many assignments of variables make $f\neq 0$ (=$k$). 

Let $f_1(0)$ = polynomial first var set to $0$ and $f_1(1)$ = polynomial first var set to $1$

Ask $P$ how many assignments $f_1(1)\neq 0$ and $f_1(0)\neq 0$ and must $=k$. 

$V$ chooses a randomm $r_1\in Z_q, q\text{ is a prime}>2^n$ 

$V$ asks $P$ for the coeffecients of the polynomial $f_1(r_1)$ and $V$ verifies the coeffecients are for a degree $n$ polynomial

Repeat the process to create $f_2(0)\land f_2(1)$ and sum must be equal to $k=P(f_1(r_1))$ and pick new random number and verify the polynomial.

Once there are no more variables to assign $r_1,...,r_m$ then we can confirm that the answer is consistent.

## MTIP
$MIP=V$ can query $2$ or more provers & te provers cant communicate with eachother. $MIP=EXPTIME$

$2020: MIP^*=$ 2 or more provers and the provers share quantumly entangled bits (shareable random bits) and $MIP^*=$ recognizable languages.



