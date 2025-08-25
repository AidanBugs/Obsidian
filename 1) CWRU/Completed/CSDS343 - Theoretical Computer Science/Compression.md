# Compression
Basic exmaple is compressing a string of 21 a's to the string "21a"

Given string $x$, $d(x)$ is the description of string $x$ ideally if $|d(x)<|x|$ we can compress $x$.

In the above example the original string is about 336 bits, our new solution is ~96 bits, but if we convert everything to binary we have less bits but it is hard to tell where the numbers split. As such we have double the count, separator, a in binary.

## Kolmogorov Complexity
$d(x)=<M>w$

- $M$ is a TM and $w$ is a string and $M$ on input $w$ produces $x$

$\kappa(x)=|<M>w|$

### Uncompressable strings
That is $|x| \geq |d(x)|$

Proof: How many binary strings of length $n$? ($2^n$)

Assuming we can compress all how many binary strings with length < $n$? ($2^{n}-1\rightarrow \exists $ at least one uncompressible string)

$d(x)$ must also be hard to compress as if it isn't hard then $\exists d'(x)<d(x)$ which describes $x$.

### Theorem $\forall x, \kappa(x)\leq |x|+c$
Proof let $x$ be input to $M$ and $M$ halts on all input.

$\kappa(x)\leq |<M>x| \leq |x| +c$

### Theorem $\kappa(x^k)\leq \kappa(x)  + c$
Proof for $\kappa(x)=|<M>w|$ where $M$ on input $w$ produces $x$. Create a machine $M'$ that simulates $M$ on $w$ and duplicate the output $k$ times.

$\kappa(x^k)\leq $<M'><M>w \leq |d(x)| +c\leq \kappa(x) +c$

### Theorem $\kappa(xy)\leq 2\kappa(x)+\kappa(y)+c$
Proof: assume we have $d(x)=<M_x>w_x, d(y)=<M_y>w_y$

Create a machine $M'$ + an input that produces $xy$

$M'$ simulates $M_x$ on $w_x$ produces $x$
$M'$ simulates $M_y$ on $w_y$ produces $x$

This does not work because $M_x$ reads whole string as input so we must double the bits and add a separator.

This results in $\kappa(xy)\leq 2\kappa(x)+\kappa(y)+c$ but we can make this better by having a log counter.

$M''$ on input $b<M_x>w_x<M_y>w_y$ which reads $b$ as the the number of bits of $<M_x>w_x$ and repeats the above process of prroducing $xy$

This results in $\kappa(xy)\leq \kappa(x)+\kappa(y)+2\log_2\kappa(x) +c$

### If we can compute $\kappa(x)$ then we can prove there are no uncompressible strings
Assume $M_k$ on input $x$ computes $\kappa(x)$

Let $y$ be uncompressible. Let $L=\{y||d(y)|>|y|\}$ if $M_k$ then we can decide this language which means we can create an enumerator for this language.

We create machine $M'$ which gets an index $i$ as input and on input $i$ it produces the $i$th uncompressible string by using the enumerator. Since strings are infinite in length we know that eventually $|<M'>i|\leq y$ which creates a contradiction. 
