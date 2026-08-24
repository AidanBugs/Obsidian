# Shortest Paths and DP
DP: Telescope Scheduling

```
for (i=1 to n) do:
    M[i] = max{b_i + M[p(i), M[i-1]]}
```

Note $p(i)$: index $(<i)$

Thus the network flow would simply be a linked list of $0$'s with occasional arcs from $p(i)$ to $i$ with a cost of $-b_i$

# Coin Game:

```
M[i,j]= max{min{M[i+1,j-1], M[i+2,j]}, min{M[...]}}
```
