---
format: pdf
---

$D= \sum_{i=1}^N \sum_{k=1}^k r_{ik} ||x^{(i)}-u_k||^2$

$\rightarrow \frac{\delta D}{\delta u_k} = \sum_{i=1}^N r_{ik}\frac{\delta}{\delta u_k} ||x^{(i)} - u_k||^2$

> $||x-u||^2 = x^Tx - 2x^T u + u^T u$


> $\frac{\delta}{\delta u}||x-u||^2 = - 2x + 2u$

> $\rightarrow - 2(x -u)$


$\rightarrow \frac{\delta D}{\delta u_k} = \sum_{i=1}^N -2r_{ik}(x^{(i)} - u_k)$

$\rightarrow \frac{\delta D}{\delta u_k} = -2\sum_{i=1}^N r_{ik}(x^{(i)} - u_k)$
