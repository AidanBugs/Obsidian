---
date: 01/27/25
tags:
  - CSDS
  - "#HW"
links: 
deadline: 2025-01-27
status: 0.9
---
# 1
> [!Question]
> Let $L_{1}$ and $L_{2}$ be two languages over $\Sigma$. Prove that if $L_{1},L_{2}$ are both Turing-decidable then $L_{1}\oplus L_{2}$ is Turing-decidable.

Assume $L_{1},L_{2}$ are Turing decidable.
$\exists M_{1},M_{2}$ that decide $L_{1},L_{2}$
Create $M_{3}$
$M_{3}$ runs on string $x$:
- Duplicate $x$ after a \#
- Run $M_{1}$ on $x$
    - If $M_{1}$ accepts:
		- Clear everything after \#
        - Duplicate $x$ after \#
        - Run $M_{2} on $x$
        - If $M_{2}$ accepts:
            - Output "No"
        - Else:
	        - Output "Yes"
	- Else:
        - Clear everything after \#
        - Duplicate $x$ after \#
	    - Run $M_{2}$ on $x$
	    - If $M_{2}$ accepts:
	        - Output "Yes"
	    - Else:
	        - Output "No"
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
    insert a \# after \#
    loop 1:
        for each 0 between the \#'s copy a character at the front of $x$ to after the 2nd \#
        Run $M_{1}$ on string after \#
        If $M_{1}$ accepts:
            Clear after the \#
            Copy all unmarked characters of $x$ (copy suffix)
            Run $M_{2}$ on string after \#
            If $M_{2}$ accepts:
                Output "yes"
            Else: 
                Continue
        Else:
            Continue
        Clear after the \#
        If number of 0's greater than length of $x$
            Output "no"
        Else:
            Add a new 0 between the \#'s
            Go back to loop 1

In general, the tape is structured as follows: $x \# \i \# $ copy, where $i$ is length of prefix

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
> If either $M_{2}$ or $M_{1}$ reject we go to the next prefix / suffix pair.
> As such, we exhaust every prefix / suffix pair.
> Therefore, if $x\in$ the concatenation of $L_{1},L_{2}$, $M_{3}$ will find the valid prefix / suffix pair through exhaustion.
>
> If $x\notin$ the concatenation of $L_{1}, L_{2}$, then $\nexists$ a prefix / suffix pair s.t. prefix $\in L_{1} \land$ suffix $\in L_{2}$
> At each iteration, test a possible suffix / prefix. $M_{1}$ will reject the prefix so we continue to the next prefix.
> If prefix $\in L_{1},M_{1}$ will accept but we know the suffix is not in $L_{2}$ so $M_{2}$ will reject
> After we have tested the entire length of the string $M_{3}$ will reject.

# 3
> [!Question]
> Let $L_{1},L_{2}$ be 2 languages over $\Sigma$. Prove that is $L_{1},L_{2}$ are both Turing recognizable then the concatenation of $L_{1},L_{2}$ is Turing recognizable.

Assume $L_{1},L_{2}$ are Turing recognizable.
$\exists M_{1},M_{2}$ that decide $L_{1},L_{2}$
Create $M_{3}$ (2 way infinite Tape)
    let $n$ = length($x$)
    insert \# after $x$ on tape
    insert \# after the \#
    insert \# before $x$ on tape
    loop 1:
        insert one $0$ to the left of the leftmost \#
        loop 2:
            for each $0$ between the \#'s to the right of $x$, copy a character at the front of $x$ after the \# to the right of $x$
            for each $0$ to the left of $x$ run a step of $M_{1}$ on the copied string
            If $M_{1}$ accepts:
                Clear after the \#
                Copy all unmarked characters of $x$ (copy suffix)
                Run $M_{2}$ on string after \# for $i$ steps
                If $M_{2}$ accepts:
                    Output "Yes"
                Else:
                    Continue
            Else:
                Continue
            Clear after \#
            If number of 0's greater than length of $x$
                Continue
            Else
                Add a new $0$ in between the \#'s to the right of $x$
                Go back to loop 2
    Go back to loop 1

In general, the tape is structured as follows: $i\# x \# \j \# $ copy, where $i$ is the number of steps and $j$ is length of prefix

> [!Proof]
> If $x\in$ the concatenation of $L_{1},L_{2}$, then $\exists$ a prefix / suffix pair s.t. prefix $\in L_{1} \land$ suffix $\in L_{2}$
> If prefix $\in L_{1}$ then $M_{1}$ will halt and accept in a finite number of steps.
> A similar assertion can be made for $M_{2}$ recognizing the suffix.
> $M_{3}$ runs $M_{1}$ on the prefix for $i$ finite steps.
> In the case $x \in$ the concatenation, then $M_{1}$ will recognize some prefix in finite number of steps.
> Simlarly, once the prefix is recognized, $M_{3}$ runs $M_{2}$ on the suffix.
> Since $L_{2}$ is Turing recognizable, $M_{2}$ will recognize the suffix in finite number of steps.
>
> If $x\notin$ the concatenation, then $\nexists$ a prefix / suffix pair s.t. prefix $\in L_{1} \land$ suffix $\in L_{2}$
> As such for any prefix, $M_{1}$ will either reject or run forever
> Similarly, $M_{2}$ will either reject or run forever
> As such, $M_{3}$ will run forever.
