# Moore's Law
The number of transistors in an integrated circuit roughly doubles every two years.

# Amdahl's Law
Formula for the upperbound of the speedup of a task as you introduce more resources to the system

# Memory Hierarchy
CPU Core and Registers

> Extremely Fast, Expensive, but very small

DRAM Chips

> Middle

SSD's

> Slow, Large, 

# Abstractions

ISA (Instruction Set Architecture): Hardware/Sofware Interface

ABI (Application Binary Interface): ISA + System Software Interface

# Performance
Learning to define performance

## Response Time
How long it takes to execute a task

## Throughput
Number of Tasks completed per Unit Time

## Knowledge Check
How does replacing the chip with a faster one affect response time & throughput?

> Both improve

How does adding more processors affect them?

> Response time stays the same but throughput increases

# Relative Performance
$Perf=\frac{1}{Exe}$

$\frac{Perf_A}{Perf_B} = \frac{Exe_B}{Exe_A} = n$

Results in computer $A$ is $n$ times faster than computer $B$

# Measuring Execution Time
Elapsed time refers to the total time to complete a task

CPU time refers to the time the CPU spends computing the tasks that does not include I/O time or other jobs' shares

# CPU Clocking
Clock period is duration of a clock cycle (1/frequency) (s)

Clock rate (frequency) is the number of cycles per second (1/period) (hz)

$CPU_{time} = Cycles\times Cycle_{time}= \frac{Cycles}{Rate}$

# Instruction Count (IC) and Cycles Per Instruction (CPI)
$Cycles = IC\times CPI$

$CPU_{time} = IC\times CPI\times Cycle_{time}= \frac{IC\times CPI}{Rate}$

## CPI Cont
$Cycles = \sum CPI_i\times IC_i$

$CPI = \frac{Cycles}{IC} = \sum (CPI\times \frac{IC_i}{IC})$ 

Here $IC_i$ refers to the number of a specific instruction ($i$) and $CPI_i$ refers to the cycles per that instruction.

# Performance Summary
| Components of Performance | Units of Measure|
| --- | --- |
| CPI Execution Time | Seconds for the Program | 
| Instruction Count | # Instructions in the Program | 
| CPI | Average number of clock cycles per instruction | 
| Clock cycle time | Seconds per Clock Cycle | 


$CPU_{time} = \frac{Instructions}{Program}\times \frac{Cycles}{Instruction} \times \frac{Seconds}{Cycles} = \frac{Seconds}{Program}$

Performance depends on:

- Algorithm: affects IC, maybe CPI
- Languaage: affects IC, CPI
- Compiler: affects IC, CPI
- Instruction Set Architecture: affects IC, CPI, T_C

# Millions of Instructions Per Second as Performance Metric
$MIPS = \frac{IC}{Exe_{time}\times 10^6}= \frac{ClockRate}{CPI\times 10^6}$

Doesn't account for differences in ISA

# Power Wall
Suppose a new CPI has 85% capacittive load of old CPI and 15% voltage and 15% frequency reduction.

$P=C\times V^2 \times F$

$\frac{P_{new}}{P_{old}}= \frac{C_{old}\times 0.85\times(V_{old}\times 0.85)^2 \times F_{old} \times 0.85}{C_{old}\ttimes V_{old}^2\times F_{old}} = 0.85^4=0.52$

We cannot reduuce the voltage further bc lowering voltage makes the transistors too leaky. 40% of power consumed by leakage. We can't remove more heat bc too expensive and complex.
