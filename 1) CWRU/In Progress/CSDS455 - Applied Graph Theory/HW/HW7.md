---
format: pdf
---

# 1
We create a bipartite graph with $V_1$ of size $|m|$ and $|V_2|=|S|$. We have edge from a node $i\in V_1$ to $j\in V_2$ iff node $j \in A_i$ where $j\in S$.

Since matches are a set of vertex disjoint edges, if SDR $X$ exists then the matching would be $(i,x_i), 1\leq i \leq m$.

# 2
We construct the same bipartite graph in the middle but with the edge condition being:

> We have edge from a node $i\in V_1$ to $j\in V_2$ iff node $j \in A_i \land j\in B_i$ where $j\in S$.

Now create node $s$ which has an edge to all vertices in $V_1$ and node $t$ has an edge from all vertices in $V_2$.

Since our pathes are a set of vertex disjoint edges, if CSDR $X$ exists then the matching would be $(i,x_i), 1\leq i \leq m$ and $x_i \in A_i \land x_i \in B_i$.


# 3
For any subset $B$ of the collections $A$ of $S$ ($B\subseteq A$), the size of the subset should be less than or equal to the number of distinct elements of $S$ in the collections ($|B| \leq | \cup_i B_i |$).

# 4
Same as part 3 basically, let $I$ be a set of any indices where $i\in I, 1\leq i \leq m$, then $|I| \leq |\cup_{i\in I} (A_i \cap B_i)|$


