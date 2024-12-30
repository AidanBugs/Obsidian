---
date: 12/26/24
tags:
  - CSDS
  - CSDS/Algo
links: 
deadline: 
status:
---
# Selection Sort
Finds the smallest element moves to the front, then 2nd smallest, then 3rd smallest .... Each finding smallest is $O(n)$ and you need to do this $n$ times so runtime is $O(n^2)$.
# Merge Sort
Split the array into a bunch of pairs, merge the pairs together into sorted pairs. Then merge the sorted pairs with adjacent sorted pairs. Merge those groups together etc. Since each group is sorted, to find the next element when merging is the smaller of the last elements. Each merge is linear time, but there are $\log n$ merges, so runtime is $O(n\log n)$.
# Quick Sort
Select an element to "pivot" the array. Go through the array and order it such that everything to the left of the pivot element is less than the pivot element and everything on the other side is greater than the pivot. This is called partitioning. Repeat this partitioning process on these 2 sections of the array. Runtime best case is roughly even splits after each partition, meaning partitioning $\log n$ times, which is runtime of $O(n\log n)$. However worst case is picking bad pivot elements (ie the largest element) which results in a runtime of $O(n^2)$ (partitioning $n$ times).
# Bucket Sort
This sort is often seen as unreasonable because of the space complexity. Essentially create an array that is the size of the largest element in the array minus the smallest element in the array. Then iterate through the original array and the insert each element into our new array at the index (element + smallest element). Then iterate through our new array (which is sorted  with a lot of null entries / 0) and put everything into our original array. This is all linear time but the space complexity is very inefficient. 