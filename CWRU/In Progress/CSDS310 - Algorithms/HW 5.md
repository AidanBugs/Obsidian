#CSDS310
# 1 - Basketball Teams
>There are $n$ teams ranked from $\{1,2...,n\}$ . 
>Since there are $m$ games that means there are $m$ directed edges.
>Since teams are able to dominate each other we should use Strongly Connected Components.
>The highest rank in that component is the value of that component.
>Apply DFS to determine highest factor of each component.
>This algorithm checks for the highest ranked team domination factor (so 1 is highest ranked)
## Pseudo Code
``` python
def DominationFactor(Teams, Games):
	n = len(Teams)
	m = len(Games)
	groups = SCC(Teams, Games)
	g = len(groups)
	groupings = [None] * g
	maxs = [None] * g
	# Find max node in a group
	for group in groups do
		mins = group[0].val
		for node in group do
			groupings[node] = group
			if mins > node.val then mins = node.val
		maxs[group] = max
	scc_edges = [None] * g
	# Find edges for SCC
	for edge in Games do
		g1 = groupings[edge[0]]
		g2 = groupings[edge[1]]
		if g1 != g2 then
			if scc_edges[g1] is None then
				scc_edges[g1] = [g2]
			else if g2 not in scc_edges[g1] then
				scc_edges[g1].append(g2)
	# Find Domination Factor of a group
	bests = [None] * g
	for group in groups do
		if group is None then
			modifiedDFS(scc_edges, group, bests, maxs)
	# Find Domination Factor of nodes
	z = [None] * Teams
	for team in Teams do
		z[team] = maxs[groupings[team]]
	return z

def modifiedDFS(edges, start, bests, max_group):
	if bests[start] is None then bests[start] = max_group(start)
	for v in edges[start] do
		if bests[v] is None then
			modifiedDFS(edges, v, bests, max_group)
		bests[start] = min(bests[start], bests[v])
```
## Proof

## Runtime
> SCC is runtime of $O(n+m)$, finding max of groups is $O(n)$, finding the edges of SCC's is $O(m)$, DFS is worst case $O(n+m)$ (assuming each node is its own SCC). So total runtime is $O(n+m)$
# 2 - Proofs
## a
>True, there are 3 possible cases for a DFS search with $uv\in E$ and directed graph $G$.
>
>Case 1, the DFS reaches $u$ before $v$. When the DFS reaches $u$ it then searches through its neighbours and finishes $u$'s neighbours first. Since $v$ is a neighbour of $u$, it will finish before $u$ is finished. Therefore $u.f>v.f$.
>
>Case 2, is DFS reaches $v$ before $u$, and $v$ is an ancestor of $u$. Since DFS finishes children before ancestors, $u$ will finish before $v$. Therefore $v.f>u.f$.
>
>Case 3, is DFS reaches $v$ before $u$ and $v$ is not an ancestor of $u$. This means that $u$ will not be traversed in this DFS so $v$ will finish before $u$. Therefore $u.f>v.f$.
>
>Therefore the only way for $v.f>u.f$ is if $v$ is an ancestor of $u$ and $v$ is discovered before $u$.
>
>Since $v$ is an ancestor of $u$ then $\exists$ a path $p$ from $v$ to $u$. Since we have an edge $uv$ which connects $u$ to $v$, then we have a cycle with edge $uv$. 
>
>$\therefore$ If $v.f>u.f$, then $uv$ must be on a cycle.
## b
>True, proof by contradiction.
>
>Assume $uv$ is a cross edge and there is a path from $v$ to $u$.
>
>If there is a path from $v$ to $u$ then $v$ is an ancestor of $u$. If $v$ is an ancestor of $u$ then $v$ cannot be finished until $u$ has finished.
>
>However if $uv$ is a cross edge then $v$ must have discovered and finished before $u$ was discovered. 
>
>This is creates a contradiction. Therefore if there is a path from $v$ to $u$ in $G$, then $uv$ is not a cross edge.
# 3 - Wrestler Rivalries
>Apply BFS, if node has already been visited, check if the depth is of different parity. If they are same parity return false. Otherwise assign baby faces to odd parity nodes and heels to even nodes and return these assignments.
## Pseudo Code
``` python
def WrestlerRivalries(W, R):
	n = len(W)
	Queue = new Queue
	Queue.insert((W[0],0))
	Assignments = [None] * n
	while Queue is not empty do
		node, parity = Queue.pop()
		for v in R[node] do
			if Assignments[v] is None then
				Queue.insert((v, (parity+1)%2))
			else if Assignments[v] != (parity+1)%2 then
				return False
		Assignments[node] = parity
	return Assignments
```
## Proof

## Runtime
> BFS is runtime $O(n+r)$. All other parts of the code are constant time. So total runtime is $O(n+r)$
# 4 - Course Evaluation
> ![[Pasted image 20241204145959.png]]