---
date: 02/03/25
tags:
  - CSDS
  - HW
links: 
deadline: 2025-02-05
status: 0.1
---
# 1 Multi-core TM
Let's try to relate out multi-core turing machine to a k-tape turing machine. Our k-tape turing maachine has a theorem which any language $L$ can be decided on a k-tape turing machine can also be decided on a normal turing machine.

Unlike the multi-core turing machine, our k-tape turing machine only processes one state at a time as opposed to one state for each head. 

# 2 Broken TM (left move will move head to start)

# 3 Prove the following language is recognizable and not decidable: $H_{TM}=\{<M,w>|M$ halts on inut $w\}$
## Recognizablity
### Theorem
$H_{TM}$ is Turing-recognizable.
### Proof:
Create a "Universal Turing Machine" $U$

If we already agree that simulating a TM is trivial, then we create $U$ which simply simulats the run of $M$ on $w$ and if $M$ accepts or rejects then $U$ accepts.

Otherwise we have the full formal proof as follows:

$U$ takes as input the description of a TM $M$ and a string $w$ and it runs $M$ on $w$.

$U$ will have 3 tapes
Tape 1: $<M,w>$
Tape 2: Simulate $M$ on $w$
Tape 3: Store current state of $M$

$U$ on input $x$
1. Verify $x$ is of the form $<M,w>$ with $M$ a valid TM description and $w$ a string of $M$'s $\Sigma$
2. Copies $w$ on tape 2, places the tape 2 head on left
3. Write $q_{0}$ to tape 3

At each step, $U$ looks at state on tape 3 + symbol head on tape 2. Searches $\delta$ on tape 1 to find the correct transition step.

Once found, write the new state to tape 3 and change the symbol at tape 2 head and move the tape 2 head according to the $\delta$

If tape 3 ever goes to $q_{accept}$ or $q_{reject}$ then $U$ accepts.
Otherwise $U$ runs forever.

Therefore $U$ will recognize $H_{TM}=\{<M,w>|M$ halts on input $w\}$.
## $H_{TM}$ is not decidable
### Theorem
$H_{TM}$ is not Turing-decidable
### Proof:
Proof by contradiction. Assume $H_{TM}$ is decidable. Then $\exists M_{H_{TM}}$ that decides $H_{TM}$

Create a TM $D$

$D$ on input $x$ will either accept or run forever.

Within $D$ we place $M_{H_{TM}}$.
$D$ has a transformer which transforms out input $x$ into the form $<x,x>$
$D$ also has a function which maps the output of $M_{H_{TM}}$ such that if $M_{H_{TM}}$ accepts then we run forever (loop back into $M_{H_{TM}}$. If $M_{H_{TM}}$ rejects then $D$ accepts.

What happens when we run $D$ on input $D$.
$D$ will convert out input into the form $<D,D>$ which we then run $M_{H_{TM}}$ on.

However we run into the following contradiction:
If $M_{H_{TM}}$ accepts $<D,D>$, then $D$ must halt (accept) on input $D$.
- However if $M_{H_{TM}}$ accepts then $D$ will run forever on input $D$, meaning that $M_{H_{TM}}$ should reject.
This creates a contradiction because $D$ cannot both accept and run forever on input $D$.

If $M_{H_{TM}}$ rejects $<D,D>$, then $D$ will run forever on input $D$.
- However if $M_{H_{TM}}$ rejects then $D$ will accept on input $D$, meaning that $M_{H_{TM}}$ should accept.
This creates a contradiction because $D$ cannot both accepts and run forever on input $D$.

Therefore $M_{H_{TM}}$ cannot exist by contradiction therefore $H_{TM}$ is not decidable. 
