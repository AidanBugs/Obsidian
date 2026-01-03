# Ridge Regression
Assumes $X$ is standardized and $Y$ is centered such that $\beta_0=\bar y$

Adds a penalty $\lambda$ the penalizes the model if the coefficients $\beta$ get too large. This creates a biased estimator of $\beta$ but has a lower variance than OLS.

$RSS(\lambda)= (Y-X\beta)^T(Y-X\beta) + \lambda \sum \beta^2$

$\hat\beta_R = (X^T X + \lambda I)^{-1}X^T Y$

Effective model degress of freedom $df(\lambda)=tr(H(\lambda))$

Effective residual degrees of freedom $n-df(\lambda)$

# Principal Component Analysis
Essentially tries to find the vectors that create the most orthonormal basis vectors for the data. PCA focuses on explaining the most amount of variance with the fewest variables

If all vars have 0 covariance then the principal components arr the original vars.

Assumes Linearity, continuous, not robust against outliers

PC reduction may not necessarily maintain the relationship between Y and PC's so be catious.

# Variable Selection Criteria
$R_a^2$

AIC = n(\ln(SSE/n))+2(p+1)

BIC = n(\ln(SSE/n))+\ln(n)(p+1)

AIC and BIC smaller is better

## Selection methods
- Backward Elim: start with full model and reduce predictors until only one significant one remains 
- Forward Selection: start with null model and add predictors until additional variables do not contribute significantly
- Stepwise Selection: add and remove predictors at different steps
- All subsets: self explanatory
- Penalized Regression: Use shrinkage and selection penalties (Lasso, Scad, MCP) to select the most important variables

### Stepwise Selection
Drawbacks such as overfitting and multicolinearity

Basically start at full model then remove the least sig predictor. Then at each subsequent step, either remove predictor with least sig or add the predictor which adds the most sig

# Lasso Regression
Similar to ridge regression except on $l_1$ norm instead of $l_2$ norm

no penalty on intercept

$RSS(\lambda)= (Y-X\beta)^T(Y-X\beta) + \lambda \sum |\beta|$

Effective model degrees of freedom is the number of non zero regression parameters

# Lasso vs Ridge
Fewer contributing predictors use Lasso

Most predictorsr are contributing use Ridge

Similar:

- Need to select $\lambda$
- may yield smaller SSE and predictions 
- Sampling distribution is unknown

Different:

- Lasso can set parameters to exactly $0$
- Lasso performs variable selection
