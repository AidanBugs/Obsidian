---
date: 12/26/24
tags:
  - CSDS
links:
  - "[[Logic Gates]]"
deadline: 
status:
---
# Proof by Contradiction
Given a statement we are trying to prove $P$, if we can prove that $\neg P\rightarrow C$ where $C$ is a contradiction, then we have proven $P$. This is because $(\neg P\rightarrow C)\rightarrow P$ is a Tautology. 

To prove this, we can use the following truth table:

| $P$ | $C$ | $\neg P$ | $\neg P \rightarrow C$ | $(\neg P\rightarrow C)\rightarrow P$ |
| --- | --- | -------- | ---------------------- | ------------------------------------ |
| T   | F   | F        | T                      | T                                    |
| F   | F   | T        | F                      | T                                    |

Thus, proof by contradiction is proving that the negation of a statement $P$ creates a contradiction, then we have proven that $\neg P$ is false, thus $P$ is true.
# Proof by Induction & Strong Induction
Proof by induction is proving for some statement $P(x), \forall n\geq n_0,P(n)$ is true, where $n, n_0$ are an integer inputs to the statement $P$.

We do this by proving $P(n_0)$ is true, then assume $P(k)$ is true and prove the  $P(k+1)$ is also true. Proving $P(n_0)$ is known as the base case and assuming $P(k)$ and proving $P(k+1)$ is the inductive step.

Similarly there is **Strong Induction** which has the same base case as Induction, but instead its inductive step is assuming $P(x)$ is true for $n_{0}\leq x \leq k$ then proving $P(k+1)$.