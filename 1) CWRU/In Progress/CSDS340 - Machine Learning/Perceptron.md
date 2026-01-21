# Basic Perceptron
$z = w^T x + b$

$y = 1 iff z\geq 0, else 0$

# Learning Algorithm For Perceptron
```
for each epoch (until convergence):
    for each training example, x^i_j:
        hat_y = {Basic Perceptron Output}
        w_j = w_j + delta_w
        b_j = b_j + delta_b
        delta_w = eta(y-hat_y)(x^i_j)
        delta_b = eta(y-hat_y)
```

Convergence occurs when there is no updates across the weights or biases.
