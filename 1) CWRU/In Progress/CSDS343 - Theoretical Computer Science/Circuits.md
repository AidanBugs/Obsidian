# Circuts
Circuts are another model of computing.

- Circuits are considered a non-uniform model
    - Different circuit for each size input
- Turing Machines are considered a uniform model
    - Same TM for different sized inputs

A circuit is comprised of n-inputs, gates, outputs (many as needed).

**Types of Gates**

- $\land$
- $\lor$
- $\lnot$

Important to note that these circuits have no loops / cycles so instead we need a lot of layers. The no cycles allows us to determine the runtime by simply determining how many levels we have and how many processes there are. In a single processor, the runtime is how many gates there are and with infinitely many processors then it is the depth / height of the circuit.

For a large language $L$ we consider a circuit family $<c_1,c_2,...>$ where $c_k$ is the circuit for the $w\in L, |w|=k$

A circuit family is reralizable if there exists a logspace transducer that takes $1^k$ as input and outputs $<c_k>$. (We can create $c_k$ in $O(\log n)$ space)

## EX: Boolean matrix multiplication
input $2m^2$

output $m^2$

To determin the $i,j$ output:

$[a(i,1)\land b(1,j) ]\lor [a(i,2)\land b(2,j)] ....$ 

For each entry $i,j$ this takes $m\log m$ gates with a height of $O(\log m)$.

Thus on input of size $n$ gates is $O(n^{3/2}\log n)$ and height is $O(\log n)$

## Ponder
$L\in NC^i$ if we can decide $L$ with a circuit family with $O(n^k)$ gates and $O(\log^i n)$ height.

$NC = \cup_{i=1}^{\infty} NC^i \rightarrow$ If $L\in NC$ then we can parellelize the algorithm for $L$.

- $NL\in NC^2$
- $NC^1 \in L$
- Is $P\in NC$ ? (unknown) 

## Theorem
If $L\in TIME(f(n))$ then $\exists $ a circuit family of $O(f(n)^2)$ gates that decide $L$.

Suppose $L\in TIME(f(m))$, let $f(n)$ be the actual running time of a TM $M$ with $f(m)=L$

Create a circuit with $O(n)$ inpts to encode input $w$ with $1$ output (T accept, F reject).

Consider each configuration of $M$ from init until accepts. There are $f(n)$ such configurations our circuit will have $f(n)+2$ levels because the first level is $w\rightarrow q_0 w ___$ and last level is $q_{accept}___\rightarrow 1$ or $q_{reject}___ \rightarrow 0$.

Number of symbols per configuration: $|\Gamma| + |Q|\times |\Gamma|$ so we need $\log _2 (|\Gamma| + |Q|\times |\Gamma|)$ gates per symbol of config.

Essentially each level represents the current configuration.

This is why the number of gates is $O(f(n)^2)$ because there is a depth of $f(n) + 2$ with $O(f(n))$ gates at each level.

For creating the transitions between configurations:

- For all cells not adjacent to the head simply create a tautology to pass them to the next level (ie dont change the cells not by the head)
- For cells adjacent to the head we need to decide whether the head moves left or right and encode the new head location
- For head position encode the correct transformation.
