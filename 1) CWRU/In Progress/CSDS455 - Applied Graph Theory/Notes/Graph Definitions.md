# Graphs
- Vertex or nodes are points

- Edge is the connector between two nodes

- Directed edges point from one node to another

## Simple Graphs
A graph is simple iff:

- Undirected edges
- No duplicate edges
- No loops (no edge (a,a))

## Isomorphic Graphs
Two graphs $G_1, G_2$ are isomorphic iff $\exists$ a 1-1 onto function $f: V(G_1) \rightarrow V(G_2)$ s.t. $a,b\in E(G_1) \leftrightarrow f(a), f(b)\in E(G_2)$

## Simple graphs
$C_k$ cicle of $k$ vertices and $k$ edges that form a simple loop

$P_k$ path of $k$ vertices of $k-1$ edges that form a simple sequential paths

## Example Problem:
Prove that if $G \cong H$ then $\bar G \cong \bar H$

Proof by contradiction

Idea is that if we suppose $G$ and $H$ are isomorphic but their compliments arent, then there does not exist a function that has a one to one between the edges of $\bar G$ to $\bar H$. The lack of said function means that for some edge $(a,b)$ in $\bar G$ $f(a),f(b)$ is not in $\bar H$  
