---
date: 01/17/25
tags:
  - CSDS
links:
  - "[[Turing Machines]]"
deadline: 
status:
---
# Finite State Automata
Finite State Automata: TM without a tape

A deterministic finite state automate DFSA is $(\Sigma , Q, \delta , F)$
$\delta : Q\times\Sigma\rightarrow Q$
$F\subset Q$ are the accept states

The DFSA accepts if when it finishes reading the input, it is an accepting is state. Otherwise reject.
## Ex
$L=$ binary numbers that are divisible by $8$, noo leading zeros
$\Sigma = \{0,1\}$

q0: If 0, go to q1, else q3
q1: If end accept, otherwise go q2 (reject)
q2: Stay q2, if end reject
q3: Make sure ends with 3 0's on q6 to accept basically

## Compliments
If $L$ can be decided by DFSA $A$ then $\bar L$ can be decided by a DFSA $\bar A$.

$\bar A$ has same $\Sigma , \delta , Q$ as $A$. But $F_{\bar A}=Q-F_{A}$

In other words, if we end on any state that would accept on $A$, we reject, otherwise accept.

## Union
The union of 2 decidable by DFSA languages is also decidable by DFSA.
Let $L_{1}$ be decimal numbers divisble by 3
Let $L_{2}$ be decimal number with even number of 0's 
Let $L_{3}=L_{1}\cup L_{2}$

$L_3$ states are $Q_{3}=Q_{1}\times Q_{2}$. That is the cross product of the states.

## Regular languages
A language $L$ is regular if it can be decided by a DFSA

### Theorem
Regular langauges are closed under compliment, union, conccatenation, "star" operations

### Proof later

# Regular Expressions
- $\phi$ is a regular expression
- $a, a\in\Sigma$ is a regular expression
- $x\cup y$ where $x+y$ are regular expression
- $x \times y$ where x, y are regular expressions (concatenation)
- $x*$ (star operator is repeat 0 or more times) also reg ex

## Ex:
A reg ex for binary numbers devisable by by 8 (no leading 0's)
$R=0+1(0+1)*000$
## Theorem
A language is regular iff it can be described by a regular expression

## Proof
Later :)

# Non Deterministic Finite State Automata
NFSA is $(\Sigma, Q,\delta, F)$
$\delta : Q\times\Sigma\rightarrow P(Q)$

If there is a choice that will lead to the machine accepting the input the NFSA will make that choice otherwise it chooses at random.
## Ex
Divisible by 8 binary

