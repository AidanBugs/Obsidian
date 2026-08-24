# Definition
Very similar to the basic perceptron except the learning algorithm is different.

Perceptron learning is a function of $\sigma$ or $\hat y$ (ie after the threshold function) whereas adaline is learned from the activation function (in the case of adaline $y=x$) before the threshold function. More specifically learned from some form of loss function and perform the best attempt to minimize the loss.

# Gradient Descent
Calculate the loss, find the slope at those inputs for the loss. Move in the direction to minimize the loss (calculus).

Typically use MSE $L(w,b) = \frac 1n \sum(y-\sigma'(z))^2$ with the derivative solutions being:

$\frac{dL}{dw_i} = \frac2n \sum(y_j-\sigma'(z_j)) x^j_i$

> Note that $x^j_i$ is the $j$th value of the $i$th $x$

And for the $b$: 

$\frac{dL}{db} = \frac2n \sum(y_j-\sigma'(z_j))$
