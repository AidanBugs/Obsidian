# 1 - Basketball Teams
There are $n$ teams ranked from $\{1,2...,n\}$ . 
Since there are $m$ games that means there are $m$ directed edges.
Since teams are able to dominate each other we should use Strongly Connected Components.
The highest rank in that component is the value of that component.
Apply DFS from any given component and save the highest value reached. That value is the domination factor for all teams in a component.
## Pseudo Code

## Proof

## Runtime
SCC is runtime of $O(n(n+m))$, DFS is worst case $O(n+m)$ (assuming each node is its own SCC). So total runtime is $O(n(n+m))$
# 2 - Proofs
## a

## b

# 3 - Wrestler Rivalries
Apply BFS, if node has already been visited, check if the depth is of different parity. If they are same parity return false. Otherwise assign baby faces to odd parity nodes and heels to even nodes and return these assignments.
## Proof

# 4 - Course Evaluation
![[Pasted image 20241204145959.png]]