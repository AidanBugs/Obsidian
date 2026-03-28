# Max Flow
Have network flow from $s,t$ and trying to maximize the flow from $s$ to $t$. Where the arcs have upper bounds.

# Max Flow reduces to MCNF
All supplies are $0$ at all nodes. Copy the arcs over with the same upper bounds and costs are $0$. Then add a new arc from $t$ to $s$ with an infinite upper bound and a cost of $-1$

Note that this creates a cycle which makes this an equivalent circulation problem.

# Dual of Max Flow
$v^* = \max \sum_{i\in V} b_i \pi_i - \sum_{(i,j)\in U} u_{ij}[-c_{ij}^\pi]^+$

s.t. $c_{ij}^\pi \geq 0, \quad ((i,j)\notin U)$

> $c_{ij}=0, \quad (i,j)\in E$

> $c_{ts}=-1$

note since max flow is all supplies are $0$ the first term in the objective function is $0$

Equivalently:

$f^*= \min \sum_{(i,j)\in U} u_{ij}[y_i-y_j]^+$

s.t. $y_j\geq y_i, ((i,j)\notin U)$

> $y_t=0$

> $y_s\geq 1$

**Lemma** $f^* \leq c(S,V-S) \quad \forall (S,V-S) stcut$ 

Note these are "cuts" $S$ which is a subset of the nodes $V$

**Lemma** Dual of max flow, if $\exists$ finite opt then wlog $\exists$ integer opt

**Proof Sketch**: Matrix of constraints is transpose of node arc incidence matrix + constraints for upperbounds

> Since this is totally unimodular then there exists integer optimal

**Lemma** $f^* \geq c(S,V-S) \quad \existsl (S,V-S)$ 

**Proof** If flow is infinite then obvious. If $f^*$ is finite, then $y^*$ (opt sol of dual) and wlog $y^*$ is integer.  

> $S=\{i \in V: y^*_i \geq 1 \}$

> In general $y^*\in S, y^*\geq 1\ land y^*\in (V-S), y^* \leq 0$

> $f^* = \sum_{(i,j)\in U} u_{ij}[y_i^* - y_j^*]^+ \geq \sum_{(i,j)\in U\cap \times (S,V-S)} u_{ij}[y_i^* - y_j^*]^+\geq \sum_{(i,j)\in \times (S,V-S)} u_{ij} = c(S,V-S)$

In other words we only look at the arcs that cross the cut and have an upper bound.

We know that all arcs that cross the cut must have an upperbound because if they did not then the cut would be invalid? (need to check textbook)

**Thm** Max Flow Min Cut theorem

 Value of max $s-t$ flow = min capacity of $s-t$ cut.

# Vertex Cover Reminder
$V' \subset V: V'\cap e \neq \phi \forall e$

In other words every edge has at least one vertex in $V'$

Matching set $M\subset E$ s.t.

> $e,f \in M \quad e\intersect f= \phi$ which means that a subset of edges where they have no vertices in common

Note that the smallest matching is just an empty set. More meaningfully however is to find $\max |M|$

**Def Bipartite Graph** $G=(V_1\cup V_2, E) \land (V_1\cap V_2 =\phi) \land \forall e (e\cap V_1, e\cap V_2 \noteq \phi)$ 
**Proof** in bipartite graphs, $\min |V'|=\max |M|$ 

**Pf** 
Convert the bipartite graph into a directed graph with the same edges from $V_1$ to $V_2$. Add a target node $S$ to $V_1$ with upperbounds of $1$ and similarly from $V_2$ to $t$ with upper bounds of $1$. All original edges have infinite bounds. 

1. $f^*= \max |M|$

> i. $f^*\leq |M^*|$

>> $f^*$ is finite (see cut $(\{s\}, V-\{s\})$ has finite capacity)

>> flow of paths (from $s$ to $t$) + cycles ($\phi$ because directed acyclic graph). Any path must pass through the original arcs and these selected arcs are a matching (otherwise upperbound constraints will be violated). Thus given $f^*$ gives a matching so $f^*\leq |M^*|$

2. $c^*(S,V-S)= \min |V'|$
