---
format:
  pdf:
    output-file: "bugayong_aidan_module4.pdf"
---

# Differential Privacy: A Survey of Results
## Summary
This paper looks at Differential Privacy, what it is and how it can be achieved, then flows through a variety of different use cases and applications of differential privacy. Overall, I believe the article does a very good job of laying out mathematically formal definitions of differential privacy and its component parts as well as articulating a variety of use cases.

::: {layout-ncol="2"}
::: {}
## Strengths
- Formal definition of Differential Privacy 
- Formal definition of Sensitivity of a Query
- Lower Noise for String Queries

:::
::: {}
## Weaknesses
- Untrustworthy Curator
- Nonuniform Distribution of Risk

:::
:::

## Comments On Strengths & Weaknesses
According to the authors, their definition is around the idea that $Pr[\mathcal{K}(D_1)\in S] \leq \exp(\epsilon)Pr[\mathcal{K}(D_2)\in S]$, where $\mathcal{K}$ is a randomized function, $D_1,D_2$ are databases that differ by at most one entry, $S=Range(\mathcal{K})$ and $\epsilon$ is the $\epsilon$-differential privacy. In other words, the presence or absence of an individual row from a data base does not significantly affect queries done on the data base. The authors then defined the sensitivity of a query as $f:D\rightarrow R^k, sens(f) =\max_{D1,D2} ||f(D_1)-f(D_2)||_1$. The authors generalize stating the adding noise that follows a laplace distribution is a very strong contender for an ideal $\mathcal{K}$ as it preserves $E(f(D))$ and meets $\epsilon$-differential privacy. Of course, there are scenarios in which adding noise to the query could potentially remove all utility of the data, take for example a string output. Shifting letters around in a string will usually make the string almost entirely useless. As such, the author reference another paper which described an exponential function $e^{-\epsilon u(X,y)/2}$, where $u(X,y)$ is the assigned valuation based on $y$. In other words, there is a high chance that the function still outputs $y$ however there are select cases where there is a slight variation in $y$ and an individual's $u(X,y)$ does not strongly affect others $u(X,y)$. While all of this is nice on the surface, there is still an important part to address that being assuming a trustworthy curator who has access to the raw non-noisey data. If the curator chooses so he could sell the raw data for personal gain, or the curator could be subject to phishing attacks in which the hacker would have access to the raw data. Additionally, there is a nonuniform distribution of risk in the differential privacy model as the outliers aren't as protected by noise than points in the inner quartiles. Additionally, the removal of a given max outlier decreases the $epsilon$ value resulting in a more private dataset and a decrease in sensitivity of the dataset.
