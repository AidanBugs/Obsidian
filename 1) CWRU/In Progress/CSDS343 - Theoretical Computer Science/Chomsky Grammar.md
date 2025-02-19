---
format: pdf
---

# Chomsky Grammars
There are 2 kinds of symbols, Terminal symbols and Nonterminal symbols.

Terminal symbols, $a\in \Sigma$

Nonterminal symbols, $n\notin \Sigma$

Production / grammar rules

- $<n>\rightarrow ab<n_2>$
- $<A>\rightarrow a<A>b$
- $<A>\rightarrow <B>$

## Chomsky Heirarchy
### Level 3: Regular grammars $\iff$ Regular languages (FSA)
$<A>\rightarrow a$
$<A>\rightarrow a<B>$

### Level 2: Context Free grammars
$<A>\rightarrow $ strings of terminal or nonterminal symbols

Non deterministic push down automata

See example below

### Level 1: Context Sensitive grammars
Review

These are languages that are recognized by linear bounded automata (TM where tape size = Input Size)

### Level 0: Free grammars $\iff$ Recognizable Languages (TM)
Complicated rules,


## EX
$L=a^nb^mc^{n-m}d^{m-n}$

$L$ cannot be recognized by FSA so it is not a regular language (exercise: prove this by pumping lemma)

$L$ is a context free grammar

// S is start
$S\rightarrow A$
$S\rightarrow B$

// A represents matching a's to c's
$A\rightarrow aAc$
$A\rightarrow C$

// C represents matching a's to b's
$C\rightarrow aCb$
$C\rightarrow \epsilon$

// B represents splitting the string into sections
$B\rightarrow ED$

// E represents matching b's to a's
$E\rightarrow aEb$
$E\rightarrow \epsilon$

// D represents matching b's to d's
$D\rightarrow bDd$
$D\rightarrow \epsilon$

## EX
