---
date: 12/26/24
tags:
  - CSDS
  - CSDS/Algo
links:
  - "[[Proofs]]"
deadline: 
status:
---
# Divide and Conquer
Divide and conquer is an algorithm approach which utilizes recursion to solve subproblems. Essentially, break the problem into subproblems, solve those solve problems until you reach a base case, then piece together the small problems to solve your big problem. 

An example for this is merging a list of $k$ sorted arrays into one array. An optimal solution is to merge pairs of arrays (linear time), and do this $\log k$ times. 

Proving a divide and conquer algorithm follows inductive [[Proofs]] linked above.