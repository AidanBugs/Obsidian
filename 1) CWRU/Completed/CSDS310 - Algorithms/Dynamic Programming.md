---
date: 12/26/24
tags:
  - CSDS
  - CSDS/Algo
links:
  - "[[Proofs]]"
  - "[[Divide and Conquer]]"
deadline: 
status:
---
# Dynamic Programming
Dynamic programming (DP) is similar to [[Divide and Conquer]] in the sense that you break the bigger problem into subproblems then solve those, however instead of doing this recursively it is typically done bottom up, meaning start at the base case and work toward the final result. In the process of doing this, store all the answers along the way and use them to solve subsequent subproblems.

For example, making change problem. You have to make change for an amount $n$ and you have a list of coins $C$, and you need to find the minimum number of coins to make amount $n$ using the list of coins $C$. To solve this using dynamic programming, you would see how many coins it would take to make change for $1$, then for $2$ then $3$, so on until you reach $n$. Along the way, use previous solutions to find the current solution. For example, the solution for an amount $4$ is the minimum of $Ans[1]+Ans[3]$ and $Ans[2]+Ans[2]$ assuming there is not a coin of value 4.

To prove DP algorithms, we need to prove optimal substructure, meaning that optimality of subproblems carries over to the optimal final solution. To do this use proof by contradiction (see [[Proofs]]). Then to prove the algorithm utilizes optimal substructure correctly you need to do an inductive proof (see [[Proofs]]).