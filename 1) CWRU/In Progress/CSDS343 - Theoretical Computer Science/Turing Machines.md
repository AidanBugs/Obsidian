---
date: 01/17/25
tags:
  - CSDS
links: 
deadline: 
status:
---
# Turing Machines
- A one-way infinite tape divided into cells
- Each cell can store a symbol or be blank
- There is a read/write head on the tape
- The machine has a state
- At each step the machine:
    1. Reads the symbol in the cell the head is scanning
    2. Writes a new cymbol to that cell
    3. Moves the head one cell elft or right
    4. Changes state

    Reapeat until the machine enters an accept/reject state when it halts. 

    At start the is only thing on tape, left most edge, jead os pm first cell.
# Mathematical Turing Machine
Mathematically a turing maachine is a tuple $(\Sigma,\Gamma,Q,\Delta)$
- $\Sigma$: the alphabet of the language
- $\Gamma$: symbols that can be written to the tape
    - $\Sigma\subset\Gamma$ because $\_\in \Gamma,\_\notin\Sigma$
- $Q$: Set of states TM can be in
    - $q_0$ initial state
    - $q_{accept}$ 
    - $q_{reject}$
- $\Delta$: Transition Function
    - $\Delta :\Gamma\times Q\rightarrow\Gamma\times Q\times \{L,R\}$
    - Read $\times$ state $\rightarrow$ write $\times$ new state $\times$ move L/R
# Create a TN ti decide the Language
$L=\{a^xb^yc^{\max\{x,y\}}\}$
EX: $aaabccc\in L$
$\Sigma=\{a,b,c\}$
$\Gamma=\{a,b,c,\_,a',b',a'',b''$
$Q=\{q_0,q_{accept},q_{reject},$

1. Figure if more a's then b's
2. If more a's see if same number of c's
3. If more b's see if same number of c's
## States
### $q_0$
$\Delta: Q\times\Gamma\rightarrow Q\times\Gamma\times\{L,R\}$
$\Delta (q_0, a)=(q_1,a'',R)$
$\Delta (q_0, b)=$ more b's than a's
$\Delta (q_0, c)=(q_{reject},\_,R$
$\Delta (q_0, \_)=(q_{accept},\_,R$
### $q_1$
$\Delta (q_1, a)=(q_1,a,R)$
$\Delta (q_1, b)=(q_2,b',L)$
$\Delta (q_1, c)=(q_4,c,L)$ more a's than b's
$\Delta (q_1, \_)= (q_{reject}, \_, R)$
$\Delta (q_1, a')= (q_{reject}, \_, R)$ \* this should not happen
$\Delta (q_1, b')= (q_1, b', R)$
### $q_2$
$\Delta (q_2, a)=(q_2,a,L)$
$\Delta (q_2, b)=(q_{reject},\_,L)$ \* this should not happen
$\Delta (q_2, c)=(q_{reject},\_,L)$ \* this should not happen
$\Delta (q_2, \_)=(q_{reject},\_,L)$ \* this should not happen
$\Delta (q_2, a')= (q_3, a', R)$ \* this should not happen
$\Delta (q_2 b')= (q_2, b', L)$
### $q_3$
$\Delta (q_0, a)=(q_1,a',R)$
$\Delta (q_0, b)=$ more b's than a'
$\Delta (q_0, c)=(q_{reject},\_,R$
$\Delta (q_0, \_)=(q_{reject},\_,R$
### $q_4$ -- More a's than b's, clear marked a's
$\Delta (q_4, a)=(q_4,a,L)$
$\Delta (q_4, b)=(q_{reject},\_,L)$ \* this should not happen
$\Delta (q_4, c)=(q_{reject},\_,L)$ \* this should not happen
$\Delta (q_4, \_)=(q_{reject},\_,L)$ \* this should not happen
$\Delta (q_4, a')= (q_4, a, L)$ 
$\Delta (q_4, b')= (q_4, b', L)$




