---
format: pdf
---

# HW6CSDS343
## 1
Prove the following language is context free $E=\{a^ib^j| i\neq j\}$

### A
Give a pushdown automaton that decides $E$

### B
Give a context free grammar for $E$

## 2
Prove the concatenation ($xy|x\in L_1 \land y\in L_2$) of two context free languages $L_1$ and $L_2$ is context free

### A
Assume you have the context free grammar for each language, give the context free grammar for the concatenation (create the CFG directly)

### B
Assume you have the pushdown automata for each language, give the pushdown automata for the concatenation (create the PDA directly)

## 3
Prove that each of the following languages are not context free

### A
$L_1 = \{w\bar w| w\in \{0,1\}\}$ where $\bar w$ is the bit compliment of $w$

> We can prove this language is not context free using proof by contradiction with the pumping lemma
>
> Suppose $L_1$ is context free, then $\exists$ a $p$ s.t. all strings $s$ in $L_1$ with $|s|>p$ can be divded into $s=uvxyz$ such that $|vxy|\leq p$ and $|vy|>0$
>
> Given the string $0^p1^2p0^p$ and that $|vxy|\leq p$, there are 5 cases of $vxy$
>
> 1. $vxy=0^*$ first set of 0's
> 2. $vxy=0^*1^*$
> 3. $vxy=1^*$
> 4. $vxy=1^*0^*$
> 5. $vxy=0^*$ second set of 0's
>
> In case 1, suppose the string $uv^0xy^0z$, then we have less $0$'s on the left side so our midpoint shifts to the right. 

### B
$L_2 = \{a^mb^nc^{m\times n}| m,n\in \mathbf {Z}_{\geq 0}\}$

> We can prove this language is not context free using proof by contradiction with the pumping lemma
>
> Suppose $L_2$ is context free, then $\exists$ a $p$ s.t. all strings $s$ in $L_2$ with $|s|>p$ can be divded into $s=uvxyz$ such that $|vxy|\leq p$ and $|vy|>0$
>
> Given the string $a^pb^pc^{p\times p}$ and that $|vxy|\leq p$, there are 5 cases of $vxy$
>
> 1. $vxy=a^*$
> 2. $vxy=a^*b^*$
> 3. $vxy=b^*$
> 4. $vxy=b^*c^*$
> 5. $vxy=c^*$
>
> In case 1 / 2 / 3, suppose the string $uv^0xy^0z$, then we have less $a$'s / $b$'s without changing the number of $c$'s, thus our new string is not in $L_2$.
>
> In case 5, suppose the string $uv^0xy^0z$, then we have less $c$'s without changing the number of $a$'s or $b$'s, thus our new string is not in $L_2$.
>
> In case 4, suppose the string $uv^0xy^0z$, then we linearly decrease the number of $b$'s and $c$'s, but is we decrease  the number of $b$'s by one then we need to decrease the number of $c$'s by $p$. However we cannot decrease $c$ by a factor of $p$ because $|vxy|<p$, thus our new string is not in $L_2$.
>
> Therefore since all of our cases reject the pumping lemma, $L_2$ is not context free