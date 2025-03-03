---
format: pdf
---

# Time and Space Complexity
## Time Complexity
$t_m(n)=$ the maximum number of steps the tm $M$ uses on input of size $n$ before $m$ halts. If $M$ runs forever on some input of size $n$, then $t_m(n)=\infty$.

$L\in TIME(f(m))$ There exists a tm $M$ that decides $L$ and $t_m(n)\in O(f(m))$

### EX
$L=\{a^nb^n\mid n\geq 1\}$

Consider $M$ that decides $L$. (one tape) 

On $s\in L$, $M$ finds first $a$ and then finds matching $B$.Finding a matching $b$ is $n$ steps, going back for an $a$ is also $n$ steps. Therefore $O(n^2)$.

On $s\nin L$, we still have $O(n^2)$

$t_m(n)\in O(n^2)$

Therefore $L\in TIME(n^2)$ <- complexity class

However we can find a more effecient tm s.t. $L\in TIME(n\log n)$

$M$: cross off every other $a$ and every other $b$. Check if odd # of $a$'s and $b$'s. Check if total is even (parity state going back). 

On a 2 tape, we can do it in $O(n)$ time. (add $a$ to other tape than cross off for each $b$).

### Theorem
If $T_m(n)\in O(f(n))$ where $m$ is a k-tape machine, then $T_{m_1}(n)\in O(f(n)^2)$ where $m_1$ is a 1-tape machine.

### Theorem
If $T_m(n)\in O(f(n))$ where $m$ is a non-deterministic machine, then $T_{m_1}(n)\in O(2^{f(n)})$ where $m_1$ is a deterministic machine.