---
format: pdf
---

# Pushdown Automata
A machine where the memory is a stack of infinite capacity.

On each step the machine reads on input (or not) reads top of the stack and pops / pushes or keeps stack.

PDA =$(Q,\Sigma,\Gamma,\delta)$
$\delta : Q\times\{\Sigma\cup\{\epsilon\}\}\times \{\Gamma\cup\{\epsilon\}\}\rightarrow P(Q\times\{\Gamma\cup\{\epsilon\}\})$

Watch class video on 02/24 for an example of a drawn out PDA (I am too lazy to draw it :sob:)

## Pumping Lemma for context free languages
Think of giant tree, some states must repeat so we are left with the following pumping lemma:

If $L$ is context free, $\exists p$ such that for all $s\in L, |s|>p$,

- $s=uvxyz$
- $|vxy|\leq p$
- $|vy|>0

$uv^kxy^kz\in L\forall k=0,1,2..$

### EX

$L=\{a^nb^nc^n|n\geq 0\}$

Prove $L$ is not context free

Assume $L$ is context free, thus there exists a $p$ such that for all $s,|s|>p:s=uvxyz$ 

Let $s=a^pb^pc^p$

Since $|vxy|\leq p$, there are 5 cases.

$vy=a^*,vy=a^*b^*,vy=b^*,vy=b^*c^*,vy=c^*$
