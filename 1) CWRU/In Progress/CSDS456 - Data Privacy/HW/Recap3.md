---
format:
  pdf:
    output-file: "bugayong_aidan_module3.pdf"
---

# t-Closeness: Privacy Beyond k-Anonymity and l-Diversity
## Summary
The article introduces a new concept of $t$-closeness which is a privacy model for data publishing. First however, the article reviews key concepts of $k$-anonymity, which refers to the uniqueness of the quasi identifiers, and $l$-diversity, which refers to the uniqueness of the sensitive values within their groups. However the authors note a key flaw with $l$-diversity which is that the distribution of the sensitive attribute within subgroups. As such, they proposed the idea of $t$-closeness which is the idea that the distribution of the sensitive attributes within a subgroup is similar to the distribution in the overall table.

::: {layout-ncol="2"}
::: {}
## Strengths
- $k$-anonymity as a simple identity concealing metric
- $l$-diversity as a direct combatant to homogeniety attacks
- $t$-closeness direct adressment of the limits of $l$-diversity

:::
::: {}
## Weaknesses
- $k$-anonymity lack of protection against sensitive attributes
- $l$-diversity insufficient protection of sensitive attributes
- $t$-closeness computational complexiity 
- $t$-closeness weakens the researching utility of the data

:::
:::

## Comments On Strengths & Weaknesses
The idea of $k$-anonymity is that it ensures the identity of individuals are concealed within the data set by ensuring there is at least $k$ matching quasi identifiers for any set of quasi-identifiers in the data set. However, this is subject to homogeniety attacks as if a particular group of quasi-identifiers has a low variety of the sensitive attribute within the group. For example, even if we achieve $k$-anonymity for a electronic health record dataset, if a group only has heart related issues then an attacker could easily determine that a person in that group has a heart related issue. This gets addressed by $l$-diversity which ensures that knowledge about a person's group does not directly give away their sensitive attribute. With distinct $l$-diversity, it ensures there are at least $l$ different values for the sensitive attribute within a given group. This however is not necessarily sufficient as a single entry of a different value would achiheve $l$ diversity although it would not add much protective power. This leads to other definitions of $l$ diversity such as the entropy definition but this too has draw backs if the table overall has a skewed distribution. This leads us to the $t$-closeness definition which aims to have the distribution of values within a group match the distribution of the overall table within a threshhold $t$. This of course could be quite computationally expensive especially if there are multiple sensitive attributes each with different distributions. Additionally, this is a direct decrease of the utility of the data since a well-intentioned researcher is less able to utilize the data to draw distinctions of the sensitive attribute across different quasi-identifiers.
