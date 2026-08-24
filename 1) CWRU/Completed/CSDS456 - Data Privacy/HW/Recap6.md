---
format:
  pdf:
    output-file: "bugayong_aidan_module6.pdf"
---

# Private Information Retrieval
## Summary
This paper first defines the problem of obscuring information retrieval from a set of data bases of size $k$. They assume that these $k$ owners all have identical databases of size $n$ and that the user is attempting to find data $x$ from the data base without letting the data base owners figure out what their query is. They do this through suggesting two main approaches: Linear Summation Scheme and Polynomial Interpolation Scheme.

::: {layout-ncol="2"}
::: {}
## Strengths
- Formal Definitions, Theorems, and Corollaries for the two suggested Schemes. Demonstrating the power of the schemes as well as the communication improvements.
- Proposed a $k=2$ solution that is still somewhat private.

:::
::: {}
## Weaknesses
- While less communication overhead, this requires a lot of redudancy in data storage.

:::
:::

## Comments On Strengths & Weaknesses
The main weakness with these schemes is that it requires a large quantity of data in identical forms through a variety of different providers. Thus, in the case of the user storing their own information, updating this information across a variety of presumably cloud owners would take a long time. On the other hand, if this is some form of public datasets, then the user would need to access the same data through a variety of different servers that are all hopefully up to date with the same information. Of course the authors mention the naive approach of having a single data base and simply downloading the entire database each time to obscure the query but this in practice (as mentioned) is not very feasible. To combat this main weakness of multiple redudancies, the authors propose a scheme for the Linear Summation on which $k=2$. Suppose the user is trying to find data $x_i$ which is stored in the databasese at index $i$. The user queries a subset $S$ to database $1$ and queries $S^1=S\oplus i$ then is able to find $x_i$ because $x_{S}\oplus x_{S\oplus i}=x_i$. While this solution maintains privacy, it is not much better than the naive download all approach since $S$ is formed by selecting each index with a probability of $1/2$, thus resulting in a total size of the messages sent to the user being $\approx n$ although the communication overhead is still roughly halved. Thus using this they are able to propose the multi-database Linear Summation scheme which creates $d$ pairs of subqueries $S^0=S, S^1$ where $d=\log_2 k$ and $d=\log_l n$. These subsets this time are subsets of $l$ and can send these pairs of subqueries across to the different databases and perform the xor operation to find $x_i$ like before. This results in a significantly lower communication overhead of $O((dk+2^d-k)n^{1/d})$. The next scheme described was the Polynomial Interpolation scheme which in short (since I'm running out of space) is the user creates a bunch of subqueries sending one to each data base and can now perform polynomial interpolation to determine what polynomial fits the returned queries. Similar to the Linear Summation scheme, the authors created a variety of Corollaries and Theorems to prove the power of this scheme and found that the overhead is $O(n^{1/k})$ where $k$ is the number of databases.
