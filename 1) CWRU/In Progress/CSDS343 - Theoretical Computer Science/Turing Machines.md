---
date: 01/17/25
tags:
  - CSDS
links:
  - "[[Proofs]]"
deadline: 
status:
---
# Turing Machines
- A one-way infinite tape divided into cells
- Each cell can store a symbol or be blank
- There is a read/write head on the tape
- The machine has a state
- At each step the machine:
    1. Reads the symbol in the cell the head is scanning
    2. Writes a new cymbol to that cell
    3. Moves the head one cell elft or right
    4. Changes state

    Reapeat until the machine enters an accept/reject state when it halts. 

    At start the is only thing on tape, left most edge, jead os pm first cell.
# Mathematical Turing Machine
Mathematically a turing maachine is a tuple $(\Sigma,\Gamma,Q,\delta)$
- $\Sigma$: the alphabet of the language
- $\Gamma$: symbols that can be written to the tape
    - $\Sigma\subset\Gamma$ because $\_\in \Gamma,\_\notin\Sigma$
- $Q$: Set of states TM can be in
    - $q_0$ initial state
    - $q_{accept}$ 
    - $q_{reject}$
- $\delta$: Transition Function
    - $\delta :\Gamma\times Q\rightarrow\Gamma\times Q\times \{L,R\}$
    - Read $\times$ state $\rightarrow$ write $\times$ new state $\times$ move L/R
## Create a TM to decide the Language
$L=\{a^xb^yc^{\max\{x,y\}}\}$
EX: $aaabccc\in L$
$\Sigma=\{a,b,c\}$
$\Gamma=\{a,b,c,\_,a',b',a'',b''$
$Q=\{q_0,q_{accept},q_{reject},$

1. Figure if more a's then b's
2. If more a's see if same number of c's
3. If more b's see if same number of c's
### States
#### $q_0$ -- Start
$\delta: Q\times\Gamma\rightarrow Q\times\Gamma\times\{L,R\}$
$\delta (q_0, a)=(q_1,a'',R)$
$\delta (q_0, b)=$ more b's than a's
$\delta (q_0, c)=(q_{reject},\_,R$
$\delta (q_0, \_)=(q_{accept},\_,R$
#### $q_1$ -- Count a's vs b's
$\delta (q_1, a)=(q_1,a,R)$
$\delta (q_1, b)=(q_2,b',L)$
$\delta (q_1, c)=(q_4,c,L)$ more a's than b's
$\delta (q_1, \_)= (q_{reject}, \_, R)$
$\delta (q_1, a')= (q_{reject}, \_, R)$ \* this should not happen
$\delta (q_1, b')= (q_1, b', R)$
#### $q_2$ -- Count b's vs a's
$\delta (q_2, a)=(q_2,a,L)$
$\delta (q_2, b)=(q_{reject},\_,L)$ \* this should not happen
$\delta (q_2, c)=(q_{reject},\_,L)$ \* this should not happen
$\delta (q_2, \_)=(q_{reject},\_,L)$ \* this should not happen
$\delta (q_2, a')= (q_3, a', R)$ \* this should not happen
$\delta (q_2, b')= (q_2, b', L)$
#### $q_3$ -- 
$\delta (q_3, a)=(q_1,a',R)$
$\delta (q_3, b)=$ more b's than a'
$\delta (q_3, c)=(q_{reject},\_,R$
$\delta (q_3, \_)=(q_{reject},\_,R$
#### $q_4$ -- More a's than b's, clear marked a's
$\delta (q_4, a)=(q_4,a,L)$
$\delta (q_4, b)=(q_{reject},\_,L)$ \* this should not happen
$\delta (q_4, c)=(q_{reject},\_,L)$ \* this should not happen
$\delta (q_4, \_)=(q_{reject},\_,L)$ \* this should not happen
$\delta (q_4, a')= (q_4, a, L)$ 
$\delta (q_4, b')= (q_4, b', L)$
$\delta (q_4, a'')= 
#### $q_5$ -- count a's vs c's
....
# 2-way infinite Tape TM
Instead of a tape with a definite start, everything left of "$0$" is blank and infinitely long.
## Theorem
If $L$ can be decided on a TM with a 2-way infinite tape, then there exists a 'normal' TM that can decide $L$.
## Proof of equivalency to TM
Given $L$ and $M_{1}$ with 2-way infinite tape, $L=L(M_{1})$. Create $M_{0}$, a normal TM with $L=L(M_{0})$. Show that we can simulate each step of $M_{1}$ with a step or steps of $M_{0}$ and $M_{0}$ accepts iff $M_{1}$ accepts.

The general idea is shift everything in the input such that every even cell is to the right of "$0$" on our 2 way tape, and every odd is left of "$0$" on our 2 way tape.

Alternatively, fold the 2 way tape in half, and now it is infinite only in one direction. We can use the same functions but now we have a top vs bottom state. Each symbol is now a tuple of the top symbol and the bottom symbol. 
# K-tape TM
Instead of a single tape, we have k-tapes, each with their own head.
## Proof
Same theorem / need to prove as 2 way tape.

The general idea is to have each "tape" seperated by "#". We have separate signs to indicate start / end of our tape. Each section of our tape will have a "\*" to indicate the head of that section. Store everything in different states to determine the exact "state" of our tape heads. If there is ever a need to use a blank in the k-tape system, we add a new blank space to all of the ections in our single tape. Alternatively, copy tape to the right and add spaaces. 
## Formal definition
K-tapeTM $(\Sigma , \Gamma , Q, \delta)$
$\delta: Q\times \Gamma ^{k} \rightarrow Q\times \Gamma ^{k} \times \{L,R,S\} ^{k}$

Runtime is as follows $t_{m_{1}}(x)=O(t_{m_{k}}^2)$

This runtime is because for each run in $t_{m_{k}}$ we need to scan the whole tape, the maximum length of the tape is the number of steps of $t_{m_{k}}$ (each step we move to the right).
# A non-deterministic TM
$N=(\Sigma , \Gamma , Q , \delta )$
$\delta : Q\times \Gamma \rightarrow P(Q\times\Gamma\times\{ L,R \} )$
Essentially, each step the TM is given a set of choices of what to do.

If any choice leads to accept it will make that choice. (If multiple do it will choose one that works arbitrarily)

If no choice leads to accept it chooses arbitrarily.
## Theorem
If a non-deterministic TM $N$ decides the language $L$ then there exists a normal TM that decides $L$
## Proof
3-tape machine

Tape 1: input $x$
Tape 2: simulate $N$
Tape 3: list all choices we will make. Suppose of most $r$ choices at any step.

Place in tape 3, 1,2,3,...,r

M: write next sequence of numbers to tape 3 (initially 1)

Copy input to tape 2

Simulate N on type 2. At each step, we consult tape 3 to see which choice to make.

# Church-Turing Thesis
Any language that is decidable is also turing decidable on a reasonable model of computation

$L=\{<m>|m$ is a turing machine $\}$

$<m>$ is the representation of object $m$ using alphabet $\Sigma_{1}$

$m=(\Sigma ,\Gamma , Q, \delta )$

Each $\Sigma ,\Gamma , Q, \delta $ can be writteen on paper -> so can be written on a tape

We need every $Q\times \Gamma$ pair to be a possible input on $\delta$

Create $M_{L}$ to decide $L$

- $M_{L}$ scans tape to verify $\Sigma ,\Gamma , Q, \delta$ exists
- $\Sigma \subset \Gamma$ and if is defined on every $(q,x)$ pair $q\in Q, x\in \Gamma$. And each pair only appears once on left side

$L$ is decidable!
# Alternate Turing Machine $A_{TM}$
$A_{TM}=\{<M,w>|M$ is a TM that accepts $w$ if $w$ is input to $M\}$

Theorem: $A_{TM}$ is Turing-recognizable

Proof:
Create a "Universal Tturing Machine" $U$

$U$ takes as input the description of a TM $M$ and a string $w$ and it runs $M$ on $w$

$U$ will have 3 tapes
Tape 1: $<M,w>$
Tape 2: Simulate $M$ on $w$ (Basically this is $M$'s tape
Tape 3: Store the current state of $M$ (or scratch work)

$U$ on input $x$
1. Verify $x$ is of form $<M,w>$ with $M$ a valid TM description & $w$ a string of $M$'s $\Sigma$
2. Copies $w$ to tape 2 + place tape 2 head on left
3. Write $q_{0}$ to tape 3

At each step, $U$ looks at state on tape 3 + symbol head on tape 2. Searches $\delta$ on tape 1 to find the correct transition step.

Once found, write the new state to tape 3 and change the symbol and move head for tape 2 accordingly.

If tape 3 ever goes to $q_{accept}$ then $U$ accepts. 
If tape 3 goes to $q_{reject}$ then $U$ rejects.
Otherwise $U$ runs forever.

Therefore $U$ will recognize $<M,w>$

Theorem: $A_{TM}$ is not decidable

Proof:
Proof by contradiction. Assume $A_{TM}$ is decidable. Then $\exists M_{A_{TM}}$ that decides $A_{TM}$

Create a TM $D$

$D$ on input $x$ will either accept / reject.
Within $D$ we place $M_{A_{TM}}$
We $D$ runs $M_{A_{TM}}$ on $<x,x>$ and reverse output

What does $D$ do when $x=D$?
- Runs $M_{A_{TM}}$ on $<D,D>$
- If $M_{A_{TM}}$ accepts $<D,D>$ then $D$ is supposed to accept itself
    - However if $M_{A_{TM}}$ accepts then $D$ rejects
    - This creates a contradiction bc $D$ cannot both accept and reject itself
- Same logic as above if $M_{A_{TM}}$ rejects $<D,D>$

Therefore $M_{A_{TM}}$ cannot exist by contradiction and $A_{TM}$ is not decidable.

## Other things with $A_{TM}$
Since $A_{TM}$ is recognizable (not decidable), $A'_{TM}$ is not decidable or recognizable.

We can also use $M_{A_{TM}}$ as an impossible TM so we can make different $M_{A_{TM}}$'s with different submachines and if those machines prove $M_{A_{TM}}$ exists then those submachines cannot exist.
