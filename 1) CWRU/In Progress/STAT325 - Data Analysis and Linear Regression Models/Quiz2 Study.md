# SLR Model Assumptions

1. Linearity
2. $\forall i \in \{1,...,n\},E(\epsilon_i)=0$
3. Independence ($Cov(\epsilon_i, \epsilon_j)\forall i,j)$
4. Constant variance: $\forall i Var(\epsilon_i) = \sigma^2 \land Cov(\epsilon_i, X_i=0)$
5. $\sigma^2> 0$ is unknown model parameter 
6. Errors are also normally distributed 

# Method of Least Squares
$Q = \sum_{i=1}^n (y_i - \beta_0 -\beta_1 x_i)^2$

Take partial derivatives with respect to the parameters and set to $0$

> $\frac{dQ}{d\Beta_0}=-2\sum_{i=1}^n(y_i-\Beta_0-\Beta_1 x_i)=0$
>
> $\frac{dQ}{d\Beta_1}=-2\sum_{i=1}^n x_i(y_i-\Beta_0-\Beta_1 x_i)= 0$

Solving for $\hat\Beta_0$ using the $\frac{dQ}{d\Beta_0}:

> $\hat\Beta_0 = \bar y - \hat\Beta_1 \bar x$

Plug this into $\frac{dQ}{d\Beta_1}$ and solve for $\hat\Beta_1$:

> $\sum_{i=1}^n x_i(y_i-\bar y + \hat \Beta_1 \bar x - \hat \Beta_1 x_i) \rightarrow \hat \Beta_1 = \frac{\sum_{i=1}^n (x_i - \bar x)(y_i - \bar y)}{\sum_{i=1}^n (x_i - \bar x)^2}$

# Sum of the absolute value of distances 
$arg \min Q(\beta_0, \beta_1) = arg \min \sum_{i=1}^n |y_i - \beta_0 -\beta_1 x_i|$

> This finds the median as opposed to mean for the response.

# Interpretting SLR Parameters
$\beta_1$ is the the change in the response mean $E(Y)$ for a unit change of $X$

> Note this is an average change!!

$\beta_1$ is the response mean when $X=0$




