# Max Flow
Have network flow from $s,t$ and trying to maximize the flow from $s$ to $t$. Where the arcs have upper bounds.

# Max Flow reduces to MCNF
All supplies are $0$ at all nodes. Copy the arcs over with the same upper bounds and costs are $0$. Then add a new arc from $t$ to $s$ with an infinite upper bound and a cost of $-1$

Note that this creates a cycle which makes this an equivalent circulation problem.

# Scheduling on Unifrom Parallel Machines
given $n$ jobs each:

> $p_i$: processing time

> $r_i$: release time

> $d_i$: deadline ($d_i-r_i \geq p_i$)

Schedule on parrallel machines $M$ with pre-emption (pausing and switching between machines) but jobs only can be  processed on one machine at a time and each machine can only work on one job.
