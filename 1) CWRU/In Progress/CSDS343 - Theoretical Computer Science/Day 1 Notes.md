---
date: 01/13/25
tags:
  - CSDS
links:
  - "[[Proofs]]"
deadline: 
status:
---
# What is a problem
A <u>language</u> is a set of strings.
A <u>string</u> is a finite sequence of symbols of an <u>alphabet</u>.
An <u>alphabet</u> is a finite set.

A problem is a language. Computation will be to determine if a string is in a language.
## Ex: Addition
Language $L$
$L=\{<a,b,c>| c=a+b\}$
- $<5,10,15>\in L$
- $<7, 10,11>\notin L$
Alphabet $\Sigma$
$\Sigma = \{0,1,2,...,9,'-',','\}$
- $L'=\{<a'+'b'='c>|a+b=c\}$
## Ex: Shortest Path in Graph (from a to b)
# Types of Language
## Decidable
There exists an algorithm that takes a string $x$ as input and halts with either $x\in L$ or $x\notin L$
## Recognizable
There exists an algorithm $A$ such that if $x\in L, A$ halts with "yes". If $x\notin L,A$ halts with "no" or runs forever.

## Problem:
If $L_{1},L_{2}$ are both decidable languages, is $L_{1}\cap L_{2}$  is decidable?
### Proof
Assume $p:L_{1}$ decidable $\land L_{2}$ decidable.
$\exists A_1$ that decides $L_1$
$\exists A_{2}$ that decides $L_2$
Create $A_3$ 
$A_3$ runs on $x$:
- Run $A_1$ on $x$
- halt accept
	- Run $A_2$ on $x$
		- halt accept
			- :) 
		- rejects
			- :(
- rejects
	- :(

Show $A_3$ decides $L_{1}\cap L_2$ 
If $x\in L_{1}\cap L_{2} , x\in L_{1}\land x\in L_{2}$ 
	Since $x\in L_{1}, A_1$ will halt and accept
	Since $x\in L_{2}, A_{2}$ will halt and accept
	So $A_3$ will accept
If $x\notin L_{1}\cap L_{2}, x\notin L_{1}\lor x\notin L_{2}$
	If $x\notin L_{1}, A_{1}$ will reject
		so $A_{3}$ will reject
	 If $x\notin L_{2}, A_2$ will reject
		 so $A_{3}$ will reject

Therefore $A_3$ decides $L_{1}\cap L_2$

Similar proof for if $L_{1},L_{2}$ are recognizable languages. 