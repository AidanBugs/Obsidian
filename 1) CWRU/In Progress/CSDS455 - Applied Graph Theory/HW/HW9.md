---
format: pdf
---

# 1
We can look at these equations in terms of euler's formula for planar graphs. If we define the total charge of the graph as the sum of all charges of edges and faces, then we get that $C=\sum_i (d(v_i)-4) + \sum_i (|f_j|-4)$

> $\rightarrow C = -4v-4f + \sum_i (d(v_i)) +\sum_j (|f_j|)$

The sum of all the degrees must be equal to $2$ times the number of edges so we can plug that in

> $\rightarrow C = -4v-4f + 2e +\sum_j (|f_j|)$

The sum of the vertices over all the faces was defined as the number of vertices on the face. Since all the faces are bound by a cycle, the number of vertices per face is equivalent to the number of edges on a face. However unlike vertices which can be part of variable number of faces, edges can be part of at most $2$ faces (one for each side).

> $\rightarrow C \leq -4v-4f+2e+2e=-4v+4e-4f$

By euler's formula which is $v-e+f=2$

> $\rightarrow C \leq -4(v-e+f)=-8$

So the total charge must always be negative.

# 2
Well we can start with knowing that the lowest possible charge on a vertex is $\min_v(d(v))-4=\delta(G)-4\geq 3-4=-1$ and for vertices of degree greater than $3$ they already have a non-negative charge.

Now the charge of faces $6$ or larger, the lowest charge is then $6-4=2$. So the proof is done for graphs with $\delta(G) > 3$ because then all vertices would have a non-negative charge and the faces of size greater than $6$ also have non-negative charge.

So for $\delta(G)=3$, for the vertices of degree $3$ we can discharge $-\frac 13$ charge to the three adjacent faces. 

> Note that the problem states explicitly that these degree 3 vertices are adjacent to 3 faces. 

Thus our degree $3$ vertices are now at a $0$ charge but lets look at our faces that now have a charge $|f|-4-\frac t3$ where $t$ is the number of degree $3$ vertices

Since we only care for faces of size $6$ or larger being negative, we see what is the lowest charge we can have on one of these faces. This means making the most amount of vertices on a face be degree $3$ because that is the only way for us to lower the charge of our faces. Thus instead we get $|f|-\frac{|f|}3 -4 = \frac{2|f|}3 - 4$. Thus minimizing this the lowest we can get is a face of size $6$ which results in a charge of $0$ after our discharge rule which is non-negative. Thus all our vertices are now non-negative chargee and so are our faces of size 6 or greater. We also know the total charge is the same because we only transfered charge and didn't add or subtract charge that did not already exist in the graph

# 3
By the hint, lets assume that every vertex $v$ on face $f$ is constrained to be $d(v) + |f| >8\rightarrow d(v) + |f| \geq 9$

We start with the initial discharge rule from problem $2$ and thus already know that all vertices have a non-negative charge and all faces of sive greater than $6$ also have a non-negative charge. So lets look at all the faces smaller than size $6$. Size $5$ faces have an initial charge of $5-4=1$ so non-negative already, size $4$ faces also have an initial non-negative charge. The only face that currently has negative charge is faces of size $3$ which has a charge of $3-4=-1$ (and we cant have smaller faces because simple graphs).

From our initial assumption, we know that all vertices on these triangles are of degree of at least $6$ so their initial vertex charge would be $2$ or more. Now suppose we did a similar thing but reversed from problem $2$, each of the vertices that are on faces of size $3$ give $\frac13$ charge to the face. Thus all of the face would now be non-negative, but about the vertices. 

The vertices would then have a charge of $d(v)-4-\frac{s}{3}$ where $s$ is the number of triangle faces that is incident to the vertices. If we are looking at the lowest possible charge of a vertex now, then it would be incident to only triangle faces. The number of incident faces is at most the degree of the vertex so $\frac{2d(v)}{3}-4$. And since these vertices must be of at least degree $6$ we do the exact same thing as problem $2$ to show that these vertices must be now at least a $0$ charge or non-negative. 

Thus from problem $1$ we know that the total charge is at most $-8$ and from our discharge rule we showed that all vertices and faces have a non-negative charge which creates a contradiction.
