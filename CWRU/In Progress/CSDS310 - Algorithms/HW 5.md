# 1 - Basketball Teams
>There are $n$ teams ranked from $\{1,2...,n\}$ . 
>Since there are $m$ games that means there are $m$ directed edges.
>Since teams are able to dominate each other we should use Strongly Connected Components.
>The highest rank in that component is the value of that component.
>Apply topological sort to determine highest factor of each component.
## Pseudo Code
``` python
def DominationFactor(Teams, Games):
	n = len(Teams)
	m = len(Games)
	groups = SCC(Teams, Games)
	g = len(groups)
	max_of_groups = [None] * g
	for group in groups do
		max = group[0].val
		for node in group do
			if max < node.val then max = node.val
		max_of_groups[group] = max
```
## Proof

## Runtime
> SCC is runtime of $O(n+m)$, DFS is worst case $O(n+m)$ (assuming each node is its own SCC). So total runtime is $O(n+m)$
# 2 - Proofs
## a
>False
## b
>True 
# 3 - Wrestler Rivalries
>Apply BFS, if node has already been visited, check if the depth is of different parity. If they are same parity return false. Otherwise assign baby faces to odd parity nodes and heels to even nodes and return these assignments.
## Pseudo Code
``` python
proc WrestlerRivalries(W, R):
	n=len(W)
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
end proc
```
## Proof

## Runtime
> BFS is runtime $O(n+r)$. All other parts of the code are constant time. So total runtime is $O(n+r)$
# 4 - Course Evaluation
> ![[Pasted image 20241204145959.png]]