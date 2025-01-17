---
date: 01/17/25
tags:
  - CSDS
  - HW
links: 
deadline: 2025-01-22
status: 1
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
> ## Create a TM for $L$
> $L=\{a^nb^mc^{\max\{n-m,0\}}d^{\max\{m-n,0\}}\}$
> $\Sigma=\{a,b,c,d\}$
> $\Gamma=\{a,b,c,d,\_,a'',b'',a',b',c',d'\}$
> $Q=\{q_{0},q_{reject},q_{accept},q_{1},q_{2},q_{3},q_{4},q_{5},q_{6},q_{7},q_{8},q_{9},q_{a},q_{b},q_{d}\}$
> 
> ### $q_{0}$ -- Start
> $\delta (q_{0}, a)= (q_{1}, a'', R)$
> $\delta (q_{0}, b)= (q_{7}, b'', R)$ -- more b's than a's 
> $\delta (q_{0}, c)= (q_{reject}, \_, R)$
> $\delta (q_{0}, d)= (q_{reject}, \_, R)$
> $\delta (q_{0}, \_)= (q_{accept}, \_, R)$
> $\delta (q_{0}, a'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{0}, b'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{0}, a')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{0}, b')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{0}, c')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{0}, d')= (q_{reject}, \_, R)$ \* This should not happen
> ### $q_{1}$ -- Match b's (a vs b) (R)
> $\delta (q_{1}, a)= (q_{1}, a, R)$ 
> $\delta (q_{1}, b)= (q_{2}, b', R)$
> $\delta (q_{1}, c)= (q_{4}, c', L)$ -- More a's than b's
> $\delta (q_{1}, d)= (q_{reject}, \_, R)$
> $\delta (q_{1}, \_)= (q_{reject}, \_, R)$
> $\delta (q_{1}, a'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{1}, b'')= (q_{reject}, \_, R)$ \* Thiis should not happen
> $\delta (q_{1}, a')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{1}, b')= (q_{1}, b', R)$
> $\delta (q_{1}, c')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{1}, d')= (q_{reject}, \_, R)$ \* This should not happen
> ### $q_{2}$ -- Count a's (a vs b) (L)
> $\delta (q_{2}, a)= (q_{2}, a, L)$ 
> $\delta (q_{2}, b)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{2}, c)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{2}, d)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{2}, \_)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{2}, a'')= (q_{3}, a'', R)$
> $\delta (q_{2}, b'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{2}, a')= (q_{3}, a', R)$
> $\delta (q_{2}, b')= (q_{2}, b', L)$
> $\delta (q_{2}, c')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{2}, d')= (q_{reject}, \_, R)$ \* This should not happen  
> ### $q_{3}$ -- Strike through a (a vs b) (R)
> $\delta (q_{3}, a)= (q_{1}, a', R)$ 
> $\delta (q_{3}, b)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, c)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, d)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, \_)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, a'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, b'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, a')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, b')= (q_{8},b,R)$ -- More b's than a's
> $\delta (q_{3}, c')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{3}, d')= (q_{reject}, \_, R)$ \* This should not happen 
> ### $q_{4}$ -- Match a's (a vs c) (L)
> $\delta (q_{4}, a)= (q_{4}, a, L)$ 
> $\delta (q_{4}, b)= (q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{4}, c)= (q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{4}, d)= (q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{4}, \_)= (q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{4}, a'')= (q_{6}, a'', R)$ 
> $\delta (q_{4}, b'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{4}, a')= (q_{6}, a', R)$
> $\delta (q_{4}, b')= (q_{4}, a, L)$
> $\delta (q_{4}, c')= (q_{4}, a, L)$
> $\delta (q_{4}, d')= (q_{reject}, \_, R)$ \* This should not happen  
> ### $q_{5}$ -- Count c's (a vs c) (R)
> $\delta (q_{5}, a)=(q_{5}, a, R)$ 
> $\delta (q_{5}, b)=(q_{reject}, \_, R)$
> $\delta (q_{5}, c)= (q_{4}, c',L)$
> $\delta (q_{5}, d)=(q_{reject}, \_, R)$
> $\delta (q_{5}, \_)=(q_{a},\_,L)$ -- Check no more a's then c's
> $\delta (q_{5}, a'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{5}, b'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{5}, a')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{5}, b')=(q_{5},b',R)$
> $\delta (q_{5}, c')=(q_{5},c',R)$
> $\delta (q_{5}, d')=(q_{reject}, \_, R)$ \* This should not happen   
> ### $q_{6}$ -- Strike through a (a vs c) (R)
> $\delta (q_{6}, a)= (q_{5}, a', R)$
> $\delta (q_{6}, b)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, c)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, d)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, \_)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, a'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, b'')= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, a')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{6}, b')=(q_{reject}, \_, R)$ -- More c's than a's
> $\delta (q_{6}, c')=(q_{reject}, \_, R)$ -- More c's than a's
> $\delta (q_{6}, d')= (q_{reject}, \_, R)$ \* This should not happen  
> ### $q_{7}$ -- Match b's (b vs d) (L)
> $\delta (q_{7}, a)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{7}, b)=(q_{7},b,L)$
> $\delta (q_{7}, c)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{7}, d)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{7}, \_)=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{7}, a'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{7}, b'')=(q_{9},a'',R)$ udahkjiaugfiakhdgvadhk ******
> $\delta (q_{7}, a')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{7}, b')=(q_{9},a'',R)$
> $\delta (q_{7}, c')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{7}, d')=(q_{7},d',L)$
> ### $q_{8}$ -- Count d's (b vs d) (R)
> $\delta (q_{8}, a)= (q_{reject},\_,R)$ 
> $\delta (q_{8}, b)=(q_{8},b,R)$
> $\delta (q_{8}, c)= (q_{reject},\_,R)$ 
> $\delta (q_{8}, d)= (q_{7},d',L)$
> $\delta (q_{8}, \_)=(q_{b},\_,L)$ -- Check no more b's than c's
> $\delta (q_{8}, a'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{8}, b'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{8}, a')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{8}, b')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{8}, c')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{8}, d')=(q_{8},d',R)$
> ### $q_{9}$ -- Strike through b (b vs d) (R)
> $\delta (q_{9}, a)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{9}, b)=(q_{8},b',R)$
> $\delta (q_{9}, c)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{9}, d)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{9}, \_)=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{9}, a'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{9}, b'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{9}, a')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{9}, b')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{9}, c')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{9}, d')=(q_{reject}, \_, R)$ -- More d's than b's
> ### $q_{d}$ -- Strike through d (b vs d) (R) \* Edge case for no a's
> $\delta (q_{d}, a)=(q_{reject},\_,R)$ 
> $\delta (q_{d}, b)=(q_{d},b,R)$
> $\delta (q_{d}, c)=(q_{reject},\_,R)$ 
> $\delta (q_{d}, d)=(q_{8},d',R)$  
> $\delta (q_{d}, \_)=(q_{reject},\_,R)$
> $\delta (q_{d}, a'')=(q_{reject},\_,R)$ \* This should not happen
> $\delta (q_{d}, b'')=(q_{reject},\_,R)$ \* This should not happen
> $\delta (q_{d}, a')=(q_{reject},\_,R)$ \* This should not happen
> $\delta (q_{d}, b')=(q_{reject},\_,R)$ \* This should not happen
> $\delta (q_{d}, c')=(q_{reject},\_,R)$ \* This should not happen
> $\delta (q_{d}, d')= (q_{reject},\_,R)$ \* This should not happen  
> ### $q_{a}$ -- Search no a's (a vs c) (L)
> $\delta (q_{a}, a)= (q_{reject},\_,R)$ -- More a's than c's
> $\delta (q_{a}, b)=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{a}, c)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{a}, d)= (q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{a}, \_)=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{a}, a'')=(q_{accept},\_,R)$   
> $\delta (q_{a}, b'')=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{a}, a')= (q_{a},a',L)$
> $\delta (q_{a}, b')=(q_{a},b',L)$
> $\delta (q_{a}, c')=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{a}, d')=  (q_{reject}, \_, R)$ \* This should not happen 
> ### $q_{b}$ -- Search no b's (b vs d) (L)
> $\delta (q_{b}, a)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{b}, b)= (q_{reject},\_,R)$ -- More b's than d's
> $\delta (q_{b}, c)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{b}, d)=(q_{reject}, \_, R)$ \* This should not happen 
> $\delta (q_{b}, \_)=(q_{reject}, \_, R)$ \* This should not happen
> $\delta (q_{b}, a'')=(q_{accept},\_,R)$ 
> $\delta (q_{b}, b'')=(q_{accept},\_,R)$ 
> $\delta (q_{b}, a')=(q_{b},a',L)$
> $\delta (q_{b}, b')=(q_{b},b',L)$
> $\delta (q_{b}, c')=(q_{reject},\_,R)$
> $\delta (q_{b}, d')= (q_{b},d',L)$  

