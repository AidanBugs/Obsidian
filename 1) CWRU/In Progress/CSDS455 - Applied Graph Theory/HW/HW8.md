---
format: pdf
---

# 1
Euler's formula: $v-e+f=2$ where $v$ is number of vertices, $e$ is number of edges and $f$ is the number of faces (regions bound by edges including the infinite one outside the graph) for finite connected planar graphs.

>> Definition from the planar graph wikipedia

Base case: $1$ vertex so $0$ edges and $1$ face so $1-0+1=2$ so true!

Inductive step on $v=k$ vertices.

> Suppose $k-e+f=2$. Changing the number of vertices to $k+1$ we know that we must add a new edge because the planar graph must be connected. We know that this does not change the number of faces because this would imply that we are either removing an edge to decrease faces (which is not true because we are adding a vertex) or somehow creating a new face, implying that our edge closes with another edge. For the latter, since we are only adding one edge it implies that either the edge or the vertex intercepts with an existing edge/vertex which creates a contradiction in the planar graph definition. Therefore $v-e+f=2$ still holds when adding a vertex because we also must add an edge that does not affect the number of faces. 

Inductive step on $e=m$ vertices

> Suppose $v-m+f=2$. If adding our new edge creates a new vertex we are done because of the previous section. Thus this section can focus on the case that this new edge is between two existing vertices (cant be 2 new vertices because then our graph is not connected). This new edge must add one and only one new face. If it adds more than one face then that edge actually intersects with another edge meaning it is no longer a planar graph so contradiction.

> However suppose we are able to add an edge that does not add a new face. This means our new edge has the same face on both "sides" of the edge (imagine a vertical edge, the left and right side of the edge need to be the same face). Thus if we look at this like an edge cut for our new edge, we should be able to create an edge cut with no other edges in it besides our new edge (otherwise it isn't the same face on both sides of the edge). This means that in removing our new edge we would have two disjoint components that are no longer connected to eachother, which creates a contradiction because our graph should have been connected before.

> Thus when adding an edge to a planar graph it must add at least one face (otherwise the original graph was not a planar graph) and if it adds more than one face then the resulting graph is not a planar graph. Therefore if adding an edge to a planar graph results in another planar graph then Euler's formular holds because we only add one more face.

# 2
First, since all vertices are at least degree 6, and an edge is between two nodes then we know that the number of edges is at least three times the amount of nodes, ie $|e|\geq 3 |v|$.

We also know that each edge in a planar graph is part of two faces, and each face has at least 3 edges so $2 |e| \geq 3 |f|\rightarrow |f| \leq \frac23 |e|$. If we plug this into Euler's formula from problem 1, $v-e+f=2\rightarrow 2-v+e = f \leq \frac23 e$

> $\frac13 e +2 \leq v$ which creates a contradiction because before we said $\frac 13 e \geq |v|$

# 3
Proof by induction like problem 1. Base case of 1 vertex has 0 edges and one face, so does $G^*$ so a spanning tree is trivial since only one vertex

Suppose $G$ and $G^*$ hold the spanning tree property described in the problem, now prove $G+e$ and $(G+e)^*$ have that same property. Break into three cases for the new edge $e$:

1. $e$ has one new vertex
2. $e$ has 2 new vertices
3. $e$ uses 2 existing vertices

For $1$ we know then that $e$ is in the spanning tree of $G+e$ because $e$ is the only edge to reach the new vertex. We also know from $1$ that adding this new edge does not effect the number of faces so $(G+e)^*$ has no new vertices. Since we use $e$ in the spanning tree of $G$, $e$ also does not affect the dual of the remaining edges so $(G+e)^*$ actually has the same spanning tree as $G^*$

$2$ is trivial because this actual is a violation because then our 2 new vertices are not connected which is against the problem being a connected planar graph

$3$ is similar to $1$ but this time $G$ stays the same and $G^*$ changes. From problem 1, we know that this new edge adds a new face and is not part of our spanning tree since we do not add any new edges. Thus this edge would be in the dual of $G+e$. Suppose that our new edge split a face $f_0$, then from our inductive step we know that the remaining dual of $G-T$ is a spanning tree and thus either the vertex corresponding to $f_0$ is a leaf or a non leaf node. 

> For the leaf node case, suppose $f_0$ was split into $i,j$ when adding $e$. Then since we already had a tree, we know that our dual would connect to either $i$ or $j$ and the dual of the edge $e$ connects $i$ and $j$ thus completing the tree (also notice that we only add one vertex and one edge so $|E|=|V|-1$ holds)

> For the non leaf node case, some vertices would connect to $i$, some to $j$ and then the dual of our new edge would connect $i$ and $j$ still. Suppose this somehow created a cycle then this would imply that there existed a cycle that loops back to $f_0$ in our original dual tree creating a contradiction

Therefore we proved that if there is a set of edges in $G$ that are a spanning tree of $G$ then the dual of the remaining edges create a tree in $G^*$

For the other direction, since $(G^*)^*=G$ we apply the above direction to prove that if the dual of the remaining edges in $G$ from a tree in $G^*$ then there is a set of edges in $G$ that form a tree. 

# 4
Just a mental reminder for self, $2$-connected means that the graph has a vertex connectivity of at least $2$ and subsequently an edge connectivity of at least $2$

Proof by contradiction, suppose $G$ is two connected and $G^*$ is not $2$-connected. This means that there exists a vertex in $G^*$ whose removal will disconnect $G^*$. Thus, $G^*$ must take the shape of some planar subgraphs $A,B$ connected by some node $v$ such that the removal of $v$ disconnects $A$ and $B$. Since $(G^*)^*=G$, lets look at the faces then of our $G^*$. $A$ could have some faces inside of it but must be connected to the big infinite face we can call $f_0$, same thing with $B$. Thus when we take the dual of $G^*$ to get $G$, then we would have a single node corresponding to $f_0$ which connects $A$ and $B$. Thus means removing the vertex corresponding to $f_0$ in $(G^*)^*=G$ we would disconnect the graph which creates a contradiction because we said $G$ was $2$ connected. Just to be a little more thorough, we know that removing this $f_0$ vertex does disconnect $G$ because if it did not then it would imply some face in $A$ shares a border/edge with some face in $B$ meaning that there would be $2$ vertices that connect $A$ and $B$ in $G^*$ which goes against our previous assumption that $v$ disconnects $A$ and $B$

Therefore if $G$ is 2 connected then $G^*$ must also be 2 connected.
