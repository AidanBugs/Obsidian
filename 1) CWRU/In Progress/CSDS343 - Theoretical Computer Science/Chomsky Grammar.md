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

### Level 1: Context Sensitive grammars
Review

These are languages that are recognized by linear bounded automata (TM where tape size = Input Size)

### Level 0: Free grammars $\iff$ Recognizable Languages (TM)
Complicated rules,
