# Simple Linear Regression (SLR)
This is a regression concerned with the linear relationship between 2 variables (x and y). Before applying a SLR be sure to look at the scatterplot between the variables and determine if the SLR is the best approach.

## Scatterplots!
Look for:
- Trends or Structures that emerge
- Variation
- Read the axis and determine if the relationship holds outside the range?
- Which is the X and which is the Y matters!

## Interpretting SLR Parameters
SLR has 2 parameters $\Beta_1, \Beta_0$. 

$\Beta_1$ is the slope of the line, referring to how much $y$ increases for one unit increase of $x$.

$\Beta_0$ is the y-intercept, when $x=0$ what is $y$? (Note sometimes $\Beta_0$ has no meaning under certain types of datasets)


## Estimate an SLR using Method of Least Squares
$Q= \sum_{i=1}^n (y_i-\Beta_0-\Beta_1 x_i)^2$ is the sum of squares of residuals (errors of predicted vs actual). 

Take the derivatives of $Q$ with respect to $\Beta_1$ and $\Beta_2$:

> $\frac{dQ}{d\Beta_0}=-2\sum_{i=1}^n(y_i-\Beta_0-\Beta_1 x_i)=0$
>
> $\frac{dQ}{d\Beta_1}=-2\sum_{i=1}^n x_i(y_i-\Beta_0-\Beta_1 x_i)= 0$

Solving for $\hat\Beta_0$ using the $\frac{dQ}{d\Beta_0}:

> $\hat\Beta_0 = \bar y - \hat\Beta_1 \bar x$

Plug this into $\frac{dQ}{d\Beta_1}$ and solve for $\hat\Beta_1$:

> $\sum_{i=1}^n x_i(y_i-\bar y + \hat \Beta_1 \bar x - \hat \Beta_1 x_i) \rightarrow \hat \Beta_1 = \frac{\sum_{i=1}^n (x_i - \bar x)(y_i - \bar y)}{\sum_{i=1}^n (x_i - \bar x)^2}$
