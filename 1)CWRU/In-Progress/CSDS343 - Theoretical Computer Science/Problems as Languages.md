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
A <u>problem</u> is a language.
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
## Problem 1:
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
- Since $x\in L_{1}, A_1$ will halt and accept
- Since $x\in L_{2}, A_{2}$ will halt and accept
- So $A_3$ will accept
If $x\notin L_{1}\cap L_{2}, x\notin L_{1}\lor x\notin L_{2}$
- If $x\notin L_{1}, A_{1}$ will reject
	- so $A_{3}$ will reject
- If $x\notin L_{2}, A_2$ will reject
	- so $A_{3}$ will reject

Therefore $A_3$ decides $L_{1}\cap L_2$

Similar proof for if $L_{1},L_{2}$ are recognizable languages. 
## Problem 2:
If $L_{1}, L_{2}$ are decidable languages then $L_{1}\cup L_{2}$ is decidable.
### Proof
Assume: $p:L_{1},L_{2}$ are decidable.
$\therefore \exists A_{1}, A_{2}$ that decide $L_{1}, L_{2}$
Create $A_{3}$
$A_{3}:$ on input $x$
	Run $x$ on $A_1$
	If $A_{1}$ accepts: output "yes"
	If $A_{1}$ rejects:
		Run $x$ on $A_{2}$
		If $A_{2}$ accepts: output "yes"
		If $A_{2}$ rejects: output "no"

Show $A_{3}$ decides $L_{1}\cup L_{2}$
If $x\in L_{1}\cup L_{2}$ then $x\in L_{1}\lor x\in L_{2}$
	If $x\in L_{1}$ then $A_{1}$ will accept so $A_{3}$ accepts
	If $x\notin L_{1},x\in L_{2}$ then
		$A_{1}$ will reject, $A_{3}$ runs $A_{2}$ which accepts so $A_{3}$ will accept
If $x\notin L_{1}\cup L_{2}$ then $x\notin L_{1}\land x\notin L_{2}$
	So $A_{1}$ will reject so $A_{3}$ will run $A_{2}$ which rejects so $A_{3}$ will reject.
## Problem 3:
If $L_{1}, L_{2}$ are recognizable languages then $L_{1}\cup L_{2}$ is recognizable.
### Proof
Assume $L_{1},L_{2}$ are recognizable.
$\exists A_{1}, A_{2}$ that recognize $L_{1},L_{2}$
$A_{3}$ on input $x$:
	For $i$ = 0,1,2 ....
		Run $x$ on $A_1$ for $i$ steps
		If $A_1$ accepts: return "yes"
		Else
			Run $x$ on $A_2$ for $i$ steps
			If $A_{1}$ accepts: return "yes"

Show $A_{3}$ recognizes $L_{1}\cup L_{2}$
If $x\in L_{1}\cup L_{2}$ then $x\in L_{1}\lor x\in L_{2}$
	If $x\in L_{1}$ then $\exists a \in \mathbf Z$ which $A_{1}$ will accept $x$ after $a$ steps.
	If $x\in L_{2}$ then $\exists b \in \mathbf Z$ which $A_{2}$ will accept $x$ after $a$ steps.
	Therefore $A_{3}$ will accept after $a\lor b$ steps. 
If $x\notin L_{1}\cup L_{2}$ then $x\notin L_{1}\land x\notin L_{2}$
	Since $x\notin L_{1}$ then $A_{1}$ will either reject or run forever
	Since $x\notin L_{2}$ then $A_{2}$ will either reject or run forever
	Therefore $A_{3}$ will run forever.
## Existence of Undecidable Languages
### Proof (by contradiction)
Assume all languages are decidable.
All algorithms are describable by a finite string, we can represent each algorithm as an integer.

| Algorithm\Input | 0   | 1   | 2   | ... |
| --------------- | --- | --- | --- | --- |
| 0               | Y   | Y   | Y   |     |
| 1               | N   | N   | N   |     |
| 2               | N   | Y   | N   |     |
| ...             |     |     |     |     |

If every language is decidable, then one of the these rows must be the algorithm for those languages.

Let there be a language $L'=\{x|A_{x}(x)$ rejects$\}$. If all languages are decidable, then $L'$ is decidable and $\exists A'$ that decides $L'$. Then there is some row $y$ that corresponds to $A'$. $L(A)=$ language $A$ decides
$L(A_{y})=L(A')$

But $A'$ does the opposite of $A_{y}$ on input $y$. Therefore $L(A')\neq L(A_{y})$, which is a contradiction. 