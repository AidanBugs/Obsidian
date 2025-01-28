---
date: 01/27/25
tags:
  - CSDS
  - "#HW"
links: 
deadline: 2025-01-27
status: 0
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
        Clear after the \#
    Output "no"
        
# 3
> [!Question]
> Let $L_{1},L_{2}$ be 2 languages over $\Sigma$. Prove that is $L_{1},L_{2}$ are both Turing recognizable then the concatenation of $L_{1},L_{2}$ is Turing recognizable.

