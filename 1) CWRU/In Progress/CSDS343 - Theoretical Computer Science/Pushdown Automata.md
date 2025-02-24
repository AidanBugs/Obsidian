---
format: pdf
---

# Pushdown Automata
A machine where the memory is a stack of infinite capacity.

On each step the machine reads on input (or not) reads top of the stack and pops / pushes or keeps stack.

PDA =$(Q,\Sigma,\Gamma,\delta)$
$\delta : Q\times\{\Sigma\cup\{\epsilon\}\}\times \{\Gamma\cup\{\epsilon\}\}\rightarrow P(Q\times\{\Gamma\cup\{\epsilon\}\})$

Watch class video on 02/24 for an example of a drawn out PDA (I am too lazy to draw it :sob:)