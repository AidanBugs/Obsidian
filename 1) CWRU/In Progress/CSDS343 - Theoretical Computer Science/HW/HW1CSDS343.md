---
date: 01/17/25
tags:
  - CSDS
  - HW
links: 
deadline: 2025-01-22
status:
---
# 1
Let $L_1$ and $L_2$ be decidable languages over the same alphabet $\Sigma$. Consider language $L=L_{1}\oplus L_{2}$ Prove that $L$ is decidable.
> [!Ans]
> Assume $L_{1},L_2$ are decidable languages
> $\exists A_1$ that decides $L_1$
> $\exists A_2$ that decides $L_2$
> Create $A_3$
> $A_3$ runs on $x$:
> - Run $A_1$ on $x$
> - If $A_1$ accepts:
>   - Run $A_2$ on $x$
>   - If $A_2$ accepts:
>       - Output "no"
>   - Else:
>       - Output "yes"
> - Else:
>   - Run $A_2$ on $x$
>   - If $A_2$ accepts:
>       - Output "yes:
>   - Else:
>       - Output "no"
>    
>> [!Proof]
>> Show $A_3$ decides $L$
>> $L=L_{1}\oplus L_2$
>> If $x\in L$ then $(x\in L_{1}\land x\notin L_{2}) \lor (x\notin L_{1}\land x\in L_{2})$
>> - If $x\in L_{1} \land x\notin L_{2}$
>> 	- $A_3$ will run $A_1$ which accepts, then it will run $A_2$ which rejects. So $A_3$ accepts.
>> - If $x\notin L_{1} \land x\in L_{2}$
>> 	- $A_3$ will run $A_1$ which rejects, then it will run $A_2$ which accepts. So $A_3$ accepts.
>>
>> If $x\notin L$ then $(x\in L_{1}\land x\in L_{2}) \lor (x\notin L_{1}\land x\notin L_{2})$
>> - If $x\in L_{1} \land x\in L_{2}$
>> 	- $A_3$ will run $A_1$ which accepts, then it will run $A_2$ which accepts. So $A_3$ rejects.
>> - If $x\notin L_{1} \land x\notin L_{2}$
>> 	- $A_3$ will run $A_1$ which rejects, then it will run $A_2$ which rejects. So $A_3$ rejects.
# 2
Let $L$ be a language over alphabet $\Sigma$. Prove that if both $L$ and $\bar L$ (the complement of $L$) are recognizable, then $L$ is decidable.
> [!Ans]
> Assume $L_1,L_2$ are recognizable languages
> $\exists A_1$ that recognizes $L_1$
> $\exists A_2$ that recognizes $L_2$
> Create $A_3$
> $A_3$ runs on $x$:
> - For $i=0,1,2,...$:
>   - Run $A_1$ on $x$
>   - If $A_1$ accepts:
>       - Ouput "yes"
>   - Else:
>       - Run $A_2$ on $x$
>       - If $A_2$ accepts:
>           - Ouput "no"
>
>> [!Proof]
>> Show $A_3$ decides $L$
>> If $x\in L$ then $A_3$ runs $A_1$ which accepts in a finite number of steps. So $A_3$ will output "yes" in a finite number of steps.
>> If $x\notin L$ then $x\in \bar L$ so $A_3$ runs $A_2$ which accepts in a finite number of steps. So $A_3$ will output "no" in a finite number of steps.

# 3
Let $L$ be the set of all strings over the alphabet $\Sigma =\{a,b,c,d\}$ defined as $L=\{a^{n}b^{m}c^{\max \{n-m,0\}}d^{\max \{m-n,0\}}\}$ for $n,m$ non-negative integers. For example, $aaabbc$ and $aabbbd$ are both strings of the language. (This is basically doing the subtraction $n-m$). Write a Turing machine that will accept all strings that are in $L$ and reject all other strings. Explicitly give your machine's alphabet, set of states, and transition function.
> [!Ans]

