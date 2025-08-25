---
date: 01/14/25
tags:
  - "#Math"
links:
  - "[[Set Theory]]"
deadline: 2025-01-14
status:
format: pdf
---
# Branches of Statistics
## Descriptive Statistics
Summarize present data. Example is making comparisons of which product is better.

## Inferential Statistics
Drawing conclusions from data that isn't there. Example is predictive data.

# Sample Space
Sample space refers to the set of all possible outcomes. For example $S=\{H,T\}$ refers to the sample space of the possible outcomes of a single coin flip (heads or tails).

See [[Set Theory]] for different ways to manipulate subspaces of sample spaces.

The sample space is typically denoted as $S$.

# Probability
Probability refers to the study of randomness and uncertainty.

## Probability of an Event
$$P(A)=\frac{|A|}{|S|}$$

## Multiplication Rule
$$P(x\land y)=P(x)\times P(y)$$

## Permutation
Def: arrangement of n distinct objects

Ex:
- Given 8 distinct letters, how many different orders can you arrange them? $8!$
- Given 8 distinct letters, how many different orders can you arrange 3 of them? $\frac{8!}{(8-3)!}$
$$P^{n}_r=\frac{n!}{(n-r)!}$$

## Combination
Def: a subset of S

Ex:
- Given 8 distinct letters, how many sets of 8 can you make? $1$
- Given 8 distinct letters, how many combinations of 8 can you make? $\frac{8!}{5!3!}$
$$C^{n}_{r}=\frac{n!}{(n-r)!r!}$$

## Complement Rule
Def: finding the probability of an event using the probability of its compliment

$$P(A)=P(S)-P(A')$$
