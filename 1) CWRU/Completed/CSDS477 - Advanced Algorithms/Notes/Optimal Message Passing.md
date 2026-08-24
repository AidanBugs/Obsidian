# Optimal Message Passing 
Given an undirected graph $G=(V,E)$

w/ $p_e\in (0,1) e\in E$

Find a spanning tree $T^*$ that $\max \Pi_{e\in T} (1-p_e)$

# Minimum Spannign Tree (MST)
Given an undirected graph $G=(V,E)$

w/ $w_e, e\in E$ 

Find a spanning tree $T'$ that $\min \sum_{e\in T}w_e$

MST can be solved using things like the Primm's algorithm

# Reduction
Attempt to reduce the optimal message passing problem to MST 

For optimization problems when trying to find a max/min, we are able to switch to a problem that looks for the min/max by changing the sign of the contents.

# Reducing Optimal Message Passing problem to MST
Given a $G$ and $p$ for Message Passing problem, we can convert to an MST by setting the weights of our graph $G'$ to $w_e=-\ln (1-p_e)$

This works because $\min_T \sum_{e\in T} w_e = \min_T - \sum_{e\in T} \ln(1-p_e) \equiv \max_T \sum_{e\in T} \ln(1-p_e)= \max_T \ln \Pi_{e\in T} (1-p_e)\equiv \max_T \Pi_{e\in T} (1-p_e)$

We can do the final equivalency because the natural log is an increasing function.

$T^*$ is opt msg passing tree iff $T$ is MST, this is a straightforward proof since our work demonstrates all equations are either equivalent or equal.
