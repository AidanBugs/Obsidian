---
date: 01/16/25
tags:
  - "#Math"
  - HW
links: 
deadline: 2025-01-28
status: 0
---
# 2-14
An order for an automobile can specify transmission (auto/standard), no air / air conditioning, and color (red/blue/black/white). Draw a tree diagram to represent the possible orders for this experiment:

``` mermaid
graph LR;
	A[Order]-->B[Auto];
    A[Order]-->C[Standard];
    B[Auto]-->D[AC];
    B[Auto]-->E[No AC];
    D--> F[Red];
    D-->G[Blue];
    D-->H[Black];
    D-->I[White];
    E-->J[Red];
    E-->K[Blue];
    E-->L[Black];
    E-->M[White];
    C-->N[AC];
    C-->O[No AC];
    N-->P[Red];
    N-->Q[Blue];
    N-->R[Black];
    N-->S[White];
    O-->T[Red];
    O-->U[Blue];
    O-->V[Black];
    O-->W[White];

```
> [!Ans] From the tree diagram the cardinality of $S$ is $16$.
# 2-36
Given 3 machine tools, 4 polishing tools, 3 painting tools, how many different routings are there (consisting of machining, then polishing, then painting).
> [!ans] There are $3*4*3=36$ different routings.
>
# 2-42
12 different locations can accommodate chips, if there are 5 chips on the board, how many layouts possible?
> [!Ans] There are $C^{12}_{5}=\frac{12!}{7!5!}=\frac{12*11*10*9*8}{5*4*3*2}=12*11*2*3=792$ layouts.
>

# 2-48
Plastic parts produced by an injection-molding operation are checked for conformance to specifications. Each tool contains 12 cavities in which parts are produced, and these parts fall into a conveyor when the press opens. An inspector chooses 3 parts from among the 12 at random. Two cavities are affected by a temperature malfunction that results in parts that do not conform to specifications. Assume order is not important.
## a
How many samples contain exactly one non conforming part?
> [!Ans] $2*C^{10}_{2}=2*10*9=180$ samples contain exactly one non conforming part.

## b
How many samples contain at least one non conforming part?
> [!Ans] $180+10=190$ samples contain at least one non conforming part.

# 2-50
## a) $A\cap B$
> [!Ans] $44+12=56$
## b) $A'$
> [!Ans] $56+36=92$
## c) $A\cup B$
> [!Ans] $12+40+44+16+56=168$
## d) $A\cup B'$
> [!Ans] $12+40+44+16+36=148$
## e) $A'\cap B'$
> [!Ans] $36$
