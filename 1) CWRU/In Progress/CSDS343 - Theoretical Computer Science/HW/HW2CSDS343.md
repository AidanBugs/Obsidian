---
date: 01/27/25
tags:
  - CSDS
  - "#HW"
links: 
deadline: 2025-01-27
status: 0.4
---
# 1
> [!Question]
> Let $L_{1}$ and $L_{2}$ be two languages over $\Sigma$. Prove that if $L_{1},L_{2}$ are both Turing-decidable then $L_{1}\oplus L_{2}$ is Turing-decidable.

Assume $L_{1},L_{2}$ are Turing decidable.
$\exists M_{1},M_{2}$ that decide $L_{1},L_{2}$
Create $M_{3}$
$M_{3}$ runs on string $x$:
    Duplicate $x$ after a \#
	Run $M_{1}$ on $x$
	If $M_{1}$ accepts:
        Clear everything after \#
        Duplicate $x$ after \#
	    Run $M_{2} on $x$
	    If $M_{2}$ accepts:
	        Output "No"
	    Else:
	        Output "Yes"
	Else:
        Clear everything after \#
        Duplicate $x$ after \#
	    Run $M_{2}$ on $x$
	    If $M_{2}$ accepts:
	        Output "Yes"
	    Else:
	        Output "No"
> [!Proof]
> Show $M_{3}$ decides $L_{1}\oplus L_{2}$
> If $x\in (L_{1}\oplus L_{2}$ then $(x\in L_{1}\land x\notin L_{2})\lor (x\notin L_{1} \land x\in L_{2})$
> - If $x\in L_{1} \land x\notin L_{2}$                                                          - If $x\in L_{1} \land x\not in L_{2}$
> 	- $M_3$ will run $M_1$ which accepts, then it will run $M_2$ which rejects. So $M_3$ accepts. 
> - If $x\notin L_{1} \land x\in L_{2}$
> 	- $M_3$ will run $M_1$ which rejects, then it will run $M_2$ which accepts. So $M_3$ accepts.
>
> If $x\notin L$ then $(x\in L_{1}\land x\in L_{2}) \lor (x\notin L_{1}\land x\notin L_{2})$
> - If $x\in L_{1} \land x\in L_{2}$
> 	- $M_3$ will run $M_1$ which accepts, then it will run $M_2$ which accepts. So $M_3$ rejects.
> - If $x\notin L_{1} \land x\notin L_{2}$
> 	- $M_3$ will run $M_1$ which rejects, then it will run $M_2$ which rejects. So $M_3$ rejects.

# 2
> [!Question]
> Let $L_{1},L_{2}$ be 2 languages over $\Sigma$. Prove that is $L_{1},L_{2}$ are both Turing decidable then the concatenation of $L_{1},L_{2}$ is Turing decidable.

Assume $L_{1},L_{2}$ are Turing decidable.
$\exists M_{1},M_{2}$ that decide $L_{1},L_{2}$
Create $M_{3}$
$M_{3}$ runs on string $x$:
    let $n$ = length($x$)
    insert \# after $x$ on tape
    for $i=0,1,2,...,n$
        Copy first $i$ characters of $x$ and place after \#
        Run $M_{1}$ on string after \#
        If $M_{1}$ accepts:
            Clear after the \#
            Copy the last $n-i$ characters of $x$ and place after \#
            Run $M_{2}$ on string after \#
            If $M_{2}$ accepts:
                Output "yes"
            Else: 
                Continue
        Else:
            Continue
        Clear after the \#
    Output "no"
> [!Proof]        
> Show $M_{3}$ decides the concatenation of $L_{1},L_{2}$
> If $x\in$ concatenation of $L_{1},L{2}$, then $\exists i\in \mathbf Z$ where $0\leq i\leq length(x)$ such that $x_{1,i}\in L_{1} \land x_{i+1,length(x)} \in L_{2}$
>
> We know the above statement is true by the definition of the concatenation of $L_{1},L{2}$.
> Note that given a substring $x_{j,k}$ if $j > k$ the string is invalid and thus blank. Also bounds are inclusive.
>
> $M_{3}$ iterates through all possible values of $i$ ($0,1,2,...,length(x)$)
> On any iteration $x_{1,i} \notin L_{1}, M_{1}$ will reject so $M_{3}$ continues.
> If $x_{1,i}\in L_{1}$ then $M_{1}$ will accept so $M_{3}$ runs $M_{2}$ on $x_{i+1,length(x)}$.
> If $M_{2}$ accepts, $M_{3}$ accepts, otherwise $M_{3}$ continues.
>
> If $x\in$ concatenation of $L_{1},L{2}$, then $\exists i\in \mathbf Z$ where $0\leq i\leq length(x)$ such that $x_{1,i}\in L_{1} \land x_{i+1,length(x)} \in L_{2}$
> Then $M_{3}$ will find the valid $i$ such that $M_{1}$ accepts $x_{1,i}$ and $M_{2}$ accepts $x_{i+1,length(x)}$ and so $M_{3}$ will accept.
>
> If $x\notin$ the concatenation of $L_{1}, L_{2}$, then $\nexists$

# 3
> [!Question]
> Let $L_{1},L_{2}$ be 2 languages over $\Sigma$. Prove that is $L_{1},L_{2}$ are both Turing recognizable then the concatenation of $L_{1},L_{2}$ is Turing recognizable.

Assume $L_{1},L_{2}$ are Turing recognizeable.
$\exists M_{1},M_{2}$ that decide $L_{1},L_{2}$
Create $M_{3}$
    let $n$ = length($x$)
    insert \# after $x$ on tape
    for $i = 0,1,2,...$
        for $j = 0,1,2,...,n$
            Copy first $j$ characters of $x$ and place after \#
            Run $M_{1} on string after \# for $i$ steps
            If $M_{1}$ accepts:
                Clear afer the \#
                Copy the last $n-j$ characters of $x$ and place after \#
                Run $M_{2}$ on string after \# for $i$ steps
                If $M_{2}$ accepts:
                    Output "Yes"
                Else:
                    Continue
            Else:
                Continue
            Clear after \#

> [!Proof]
>



