---
date: 12/26/24
tags:
  - Philosophy
links:
  - "[[Proofs]]"
deadline: 
status:
---
# Model Theory
The idea with model theory is that we are able to represent things as a model. Models have axioms which are a set of rules the model follows, as well as elements which are things that the axioms apply to. For example, in arithmetic the natural numbers are the elements of the model and we have a bunch of different axioms such as $0+1=1$. 

To create a more general model, we use a successorship function $s$ to denote next element in sequence. Using the natural numbers as an example, $s0=1$ because the next number after $0$ is $1$. As long as there is a general consensus with labeling of elements in the system, we can use any label we want. Another example would be using the alphabet.

A complete model of arithmetic can be created with the following axioms:
1. $\forall x( \neg(0=sx))$
2. $\forall x,y((sx=sy)\rightarrow (x=y))$
3. $\forall x(x+0=x)$
4. $\forall x,y(sx+y=s(x+y))$
5. $\forall x(x*0=0)$
6. $\forall x,y(x*sy=x*y+x)$
7. $\forall x(x^0=s0)$
8. $\forall x,y(x^{sy}=x*x^y)$

We can derive more axioms from our original set of axioms. These are called derived axioms. We can derive axioms using using different [[Proofs]]. Any list of axioms is a theory. A complete theory is $\forall p((p\lor \neg p)\in \Gamma)$ where $\Gamma$ is a theory and $p$ is any logical axiom. A consistent theory is $\forall p\in\Gamma,(\neg p \notin \Gamma)$. 