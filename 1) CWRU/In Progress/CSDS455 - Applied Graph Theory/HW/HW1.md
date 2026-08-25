---
format: pdf
---


# 1
Prove the following assertions are equivalent. Ironically if we make a cycle of each assertion then we know that the assertions are equivalent.

i. $T$ is a tree (connected graph with no cycle)

ii. Any two verticies of $T$ are linked by a unique path in $T$

iii. $T$ is connected but $T-e$ is disconnected for any edge $e\in T$

iv. $T$ does not contain a cycle but $T+xy$ contains a cycle for any two non adjacent vertices $x,y$ of $T$

## i -> ii
If $T$ is a connected graph with no cycles, suppose $i$ implies $\neg ii$. This means that there would exist two different paths from $s$ to $t$. Since the graph is undirected we can take one path from $s$ to $t$ and the other path from $t$ to $s$ which creates a cycle and a contradiction.

Thus $i$ implies $ii$

## ii -> iii
If any two verticies of $T$ are linked by one unique path, then the removal of any edge $(x,y)$ must affect the path from $x$ to $y$ meaning that there is no longer a feasible path from $x$ to $y$. This means the graph must be disconnected if any arbitrary edge being removed, proving that if $ii$ then $iii$

## iii -> iv
We can do this proof by first showing that $iii$ and $ii$ are equivalent. Briefly, $iii$ implies that removal of any edge now creates a disjoint graph. This means that the vertices in one part of the graph no longer have a path to the other part. This applies that the edge $e$ that was removed was part of every path from some vertex $a$ in part 1 to vertex $b$ in part 2. Since $iii$ applies to all edges, then each edge must be part of all paths from any two vertices in the separate parts. This means that since every edge is present in all paths between any two vertices of the different parts of the disconnected graph, it implies a unique path between every vertex.

Now that we showed $iii->ii$ we can show that $iii->ii->iv$. Since we know that the graph is connected (from $iii$), then for any given vertex pair there exists a uniquue path between the two vertices (from $ii$). To show $iv$ is emergent from $ii$, suppose we add the new edge $xy$. We know that we created a cycle because we already have an existing unique path from $y$ to $x$, thus this creates a cycle.

Therefore $iii->ii->iv$


## iv -> i
In the definition of $iv$ we are given that $T$ does not contain a cycle so we are almost at $i$ already but we must prove that $T$ is connected.

If $T$ is not connected for some vertex $y$ that is disconnected, then we know that $T$ cannot be disconnected because if there exists a vertex $y$ that is not connected to the other nodes then adding the edge $x,y$ would not create a cycle.

Thus the graph $T$ from $iv$ results in the statement $i$ being true.



Therefore we showed that all the statements are equivalent because $i->ii->iii->ii->iv->i$ 

# 2
Proof by induction: 

Base case is $|T|=1$ so $\delta(G)\geq 0$ trivially true because we remove all nodes in $G$ except for $1$ showing that $T\subseteq G$

Assume works for $|T_k|=k$ show works for $|T_{k+1}|= k+1$

> Since we know that $T_k\subseteq G_k$ then $\exists f$ that removes edges and vertices of $G_k$ such that $f(G_k) \cong T_k$

> We know that $T_{k+1}$ only adds edges to our new node $u$ compared to $T_k$ because $T_k$ is any tree of size $k$, thus the only relevant new edges are ones that connect to our new node $u$. Since we are given that $\delta(G_{k+1}) \geq k$ we know that the minimum number of edges a node in $G_{k+1}$ can has increased by $1$. Thus we know that if we apply the exact same transformations $f$ used to make $G_k\cong T_k$, then we would end up with at least one extra edge at every node. The key property about this extra edge is that it also points to a node not used in $f$ because $G_k$ has a minimum vertex degree of $k-1$ so the smallest $|G_k|$ can be is $k$, thus by increasing the minimum degree by $1$ we increase the minimum size of $|G_{k+1}|$ to be $k$. 

> Thus from our extra edges, we can remove the edge if in the isomorphic transition from $f(G_k)$ to $T_k$ there is no edge from the new node $u$ to an existing node in $T_k$. Therefore by utilizing the existing $f$ and the existing isomorphic transition to show that $T \subseteq G$ we are able to prove the inductive step.

Therefore if $T$ is a tree and $G$ is a graph with $\delta (G) \geq |T|-1$ then $T\subseteq G$

# 3
We can start off by looking at the nuumber of edges being $\binom n 2 = \frac{n(n-1)}{2}$ (from monday's class). In order for there to exist a self complimentary graph then we know that the number of edges must be even. This means that $\frac{n(n-1)}{2}%2 == 0$ so:

> $\rightarrow $n(n-1)%4==0$ meaning that either $n$ is divisible by $4$ or $n-1$ is divisible by $4$

>> The latter statement resutls in $n%4==1$

This means that we end up with the exact statement from the problem where $n%4$ is either $0$ or $1$.

> Note that this does NOT mean that all graphs where $n%4$ is $0$ or $1$ are self complimentary but this is a basic qualification based on the number of edges.

# 4
Proof by contradiction, suppose $P$ and $Q$ are two disjoint longest paths in $G$ of length $k$. If $P$ and $Q$ are disjoint and are both the longest paths, then they are of length at most $\frac n 2$ (for the case where the paths are longer than $\frac n 2$ trivial since there doesn't exist two distinct subsets of $V$ that are of size greater than $\frac n 2$). 

We are given that $G$ is connected which means for any given pair of vertices there must exist a path between them. Suppose path $P$ starts at $p_0$ and ends at $p_k$ and $Q$ starts at $q_0$ and ends at $q_k$. We are able to create paths between $(p_0,q_0), (p_0,q_k)$ and we can show that one of these paths must be longer than $P$ or $Q$.

Obviously there cannot be a path from $p_0$ to $q_0$ or $q_k$ that does not use vertices in $P$ or $Q$ because otherwise we would have a trivially larger path. Instead our new paths $S_1, S_2$ must use a subset of $P +$ a subset of $Q$. We can label the path that connects $P$ and $Q$ the path between $p_i$ to $q_j$. Thus $S_1$ must be at least of length $i+j+1$ and $S_2$ must be at least of length $i+k-j+1$ with the $+1$ coming from the path between $p_i$ to $q_j$. Here we can see that for any values of $i,j$ (note they are bounded from $0$ to $k$) we end up with either $S_1$ or $S_2$ having a length greater than $k$. This creates a contradiction because we assumed $P$ and $Q$ were the longest paths.

Therefore $P$ and $Q$ cannot be disjoint proof by contradiction.


