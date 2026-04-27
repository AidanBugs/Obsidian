# Runtime Stuff as a function of input size
Given $n$ integers in the range $[0,N-1]$

$O(n+N)$ time, \# bits to represent the input

Since input is in $[0,N-1]$, that means the input size is actually $\Theta(\log N)$ so runtime is actually $\Theta(n\log N)$

Eg $n=O(i)$ runtime is now $O(N)$and input size is $O(\log N)$

Thus if we think back to the arc conflicting set if we haave a sufficiently large $n$-arc we could significantly inflate the problem.
