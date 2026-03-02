---
format:
  pdf:
    output-file: "bugayong_aidan_module5.pdf"
---

# Locally Differentially Private Protocols for Frequency Estimation
## Summary
The paper provides an in depth overview of Local Differential Privacy (LDP) as well as defines different tools and key probabilities for what makes LDP algorithms strong. The paper defines the notion of "pure LDP" as well as elaborates on optimizations of both unary encoding and local hashing functions. The paper goes into the tradeoffs of various LDP algorithms (including existing methods like RAPPOR and basic RAPPOR) and creates actionable guidelines for which algorithms are best used for different applications or domain sizes.

::: {layout-ncol="2"}
::: {}
## Strengths
- Generazing LDP into "Pure LDP" Framework
- Good overview of existing frameworks
- Optimized Local Hashing (OLH)

:::
::: {}
## Weaknesses
- Pure LDP not applying to RAPPOR

:::
:::

## Comments On Strengths & Weaknesses
First the paper opens with a solid explanation as to how LDP extends on the DP framework in that for LDP it does not trust the data curator. The paper then gives the definition of $\epsilon$-LDP: $\forall y\in range(A): P[A(v_1)=y]\leq e^\epsilon P[A(v_2)=y]$ which is basically identical to the $\epsilon$-DP discussed in the previous modules. This simply states that a different vector $v_2$ will output the same as $v_1$ with a certain probability thus introducing noise to the system. The paper then describes basic RAPPOR and RAPPOR, where basic RAPPOR performs basic unary encoding on the data which is an issue at scale so RAPPOR uses Bloom filters which is a set of $m$ hashing functions to ensure the vector doesn't get too large. These rappor both use randomize perturbations to the encoded message to add noise to the data. This lays thhe groundwork for pure LDP which is simply $p^*,q^*$ where $p^*$ can be viewed as the probability of a data point "voting" for itself and $q^*$ is the probability of sending noise and a data point "voting" for another data point. Thus, this runs into an issue of pure LDP not applying to RAPPOR because of the hashing system having potential collisions in the hashing process. Speaking of collisions, the main issue with RAPPOR is information loss due to the collisions in the hashing. On the other hand, basic RAPPOR has a large overhead due to the large size of the input. OLH provides a framework to determine the optimal $g$ as a middle ground between the two frameworks.
