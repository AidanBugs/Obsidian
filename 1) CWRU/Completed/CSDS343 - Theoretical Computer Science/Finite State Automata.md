---
date: 01/17/25
tags:
  - CSDS
links:
  - "[[Turing Machines]]"
deadline: 
format: pdf
status:
---
# Deterministic Finite State Automata
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
- $\epsilon$ is a regular expression
- $a, a\in\Sigma$ is a regular expression
- $x\cup y$ where $x+y$ are regular expression
- $x \times y$ where x, y are regular expressions (concatenation)
- $x*$ (star operator is repeat 0 or more times) also reg ex

Note $\epsilon$ means move without reading the characters

## Ex:
A reg ex for binary numbers devisable by by 8 (no leading 0's)
$R=0+1(0+1)*000$
## Theorem
A language is regular iff it can be described by a regular expression

## Proof
Given a REG EX, build a FSA

- $\epsilon:\delta(q_{0},\epsilon)=$ accept
- $a:\delta(q_{0},a)=$ accept
- $x\cup y$ assume you have a machine that accepts $x$ and $y$, run in parallel and accept if one of them accepts
- $xy$ assume you have a machine that accepts $x$ and $y$, run sequentially and accept if both of them accepts
- $x*$ assume you have a machine that accepts $x$, we $\epsilon$ transition to accept or into our machine. If machine accepts we $\epsilon$ to accept. From accept we can $\epsilon$ to $q_{0}$

Given a FSA, build a REGEX

Repeateedly replace single states with "guarenteed" transitions.

Instead of using single characters for each transition we create REG EX for each transition.


# Non Deterministic Finite State Automata
NFSA is $(\Sigma, Q,\delta, F)$

$\delta : Q\times\Sigma\rightarrow P(Q)$


If there is a choice that will lead to the machine accepting the input the NFSA will make that choice otherwise it chooses at random.

## Theorem
Given a NFSA $N$ then there exists a determinstic FSA $M$ that accepts the same language

## Proof
$N=(\Sigma_{N},Q_{N},\delta_{N},F_{N})$

For $M$:

- $\Sigma_{M}=\Sigma_{N}$
- $q_{0M}=\{q_{0N}\}$
- $Q_{M}=P(Q_{N})$
- $\delta_{M}(q_{A},\sigma)=q_{B}$
  - $q_{B}=\{q_{yN}|\delta_{N}(q_{x},x)=q_{yN}\quad \text{for} \quad q_{x}\in A\}$
- $F_{M} =\{q_{A}|\exists q_{x}\in F_{N},q_{x}\in A\}$

# Regular Languages
All finite langauges are regular because we can create a FSA that has all strings hardocded in.

If $s\in L, |s|>|Q|$ then some state will be repeated.

## The Pumping Lemma
If $L$ is a regular language, then there exists a positive integer $p$ such that for all strings in $L$ with $|s|>p$ then $s$ can be divided into $s=xyz$ such that:

- $|xy|\leq p$
- $|y| >0$

Then $xy^kz\in L$ for all $k\in\mathbb{N}$

In other words, we know the string length is larger than the number of states so we have a looping state. So the prefix ($x$) + loop ($y$) must be less than or equal to number of states ($z\geq0$). Additionally the looping portion must be non empty ($y>0$).

## EX
Show $L=\{a^nb^mc^{n+m}\}$ is not regular by contradicting the pumping lemma

## Proof
Assume $L$ is regular, there exists a $p$.

Let $s=a^pbc^{p+1}=xyz$

$xy$ is all $a$'s

What is the string $xy^2z$? -> $a^{p+|y|}bc^{p+1}$ 
If $xy^2z\in L$ then $p+|y|+1=p+1\rightarrow |y|=0$ contradiction!