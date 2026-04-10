# Penny Game
Choose a head or tails and cover it up. Other player has to guess and correctly to win.

**Def** A game in strategic form:

> $S^1,..., S^n$ finite set where $S^i$ is the strategy of the $i$th player

> There is a function $H:S^1\times ...\times S^n \rightarrow R^n$

>> Payoff function which takes as input the strategy profile (tuple of strategies choosen by the players)

> Objective of each player is to maximize this payoff

## Strategic Form of Penny Game
$n=2$

Let $S^1$ be prof strategys and $S^1=\{H,T\}$

Let $S^2$ be student strategys and $S^2=\{H,T\}$

| $S^1 / S^2$ | Head | Tail |
| ---- | --- | --- |
| Head | $(-1 / +1)$ | $(+1 / -1)$ |
| Tail | $(+1 / -1)$ | $(-1 / +1)$ |

**Def** A game in extensive form

> $T$ tree, edges are labeled "action labels"

> Internal verticies are partitioned into $n$ sets and the $i$th set are the decision nodes of the $i$th player

>> Note that a player can play twice if their action moves towards another node in their set

> Payoff function $H:$leaves$\rightarrow R^n$

Ex tic tac toe

Where the graph is constructed as the edges represent the turns each player could take, and the levels represent whose turn it is. Keeping track of overlal board state and which moves are and aren't possible. Go until a leaf of the tree (which means game over) with a corresponding payoffs for the two players.

## Extensive vs Strategic Form
Extensive form may seem like an extention of the strategic form game but actually this isn't the case because in the case of extensive form games players know the previous players choices. In actuality, any game in extensive form can be a game in strategic form due to the "hidden" nature of strategic form

## Conversion of Extensive Form to Strategic Form
The big difference is that the strategies are revealed at the same time in Strategic. We can model this as a series of conditionals essentially. Essentially each player's node sets are indexed and each player's strategy is a long tuple of what they would play at each of these nodes. Note that most of these actions would NOT be played but its what WOULD be played IF the game progresses to that node.

**Def** 2 Person Zero Sum Games
Games in strategic form where $n=2$ and "zero sum" is because $H(s_1,s_2)=R^2=(h_1,h_2)\rightarrow h_1=-h_2$ 

Note that player $1$ is trying to maxmize $h_1$ and minimize $h_2$ thus we are saying the player $1$ is the maximizing player and player $2$ is the minimizing player


**Def** A mixed strategy for player $i$ is a probability distribution over $S^i$ 

If all players are performing a mixed strategy then we are able to find the expected value of $H$ $E(H)$

let $x(y)$ be a mxed strategies for maximizing (minimizing) player

> $h(x,y)= E_{x,y}(h(i,j))=\sum_{i\in S1} \sum_{j\in S2} x(i)y(i) h(i,j)$

Suppose w rewrite the penny game payoff function to be of this format (assuming $1$ is the maximizing player):

| $S^1 / S^2$ | Head | Tail |
| ---- | --- | --- |
| Head | $-1$ | $+1$ |
| Tail | $+1$ | $-1$ |

**Def** A pure strategy for player $i$ is they will always do strategy $s \in S^i$

> Note that this can be represented as a mix strategy with strategy $s$ having a probability of $1$ with all others as $0$


**Def** Game Value = $h(i,j)$ if both players play optimally (or $h(x,y)$)

Suppose the following game:

| $S^1 / S^2$ | a | b | c |
| ---- | --- | --- | --- |
| a | 3 | 1 | 2 |
| b | 1 | 0 | 1 |

Regardless of $S^2$, player $1$ should play a because its always higher than playing b. 

For player $2$, they should always play b because Regardless of $S^1$ it results in a $h$ that is less than or equal to any of the other outcomes.

**How does prior information affect the game?**

How game value affected if max/min player has to reveal ahead of time his pure/mixed strategy?

### Revealing Pure Strategy

If max player plays $i\in S^+$ then game value $\min_{j\in S^-} h(i,j)$

$\rightarrow$ best choice for max player if they have to give their strategy is:

> $\max_{i\in S^+}\min_{j\in S^-} h(i,j)$

And this is symmetrical for the min player:

> $\min_{j\in S^-}\max_{i\in S^+} h(i,j)$

### Revealing Mixed Strategy
If mmax player plays according to mixed strategy $x$

> Game value = $\min_{j\in S^-} h(x,j)$

> $\rightarrow$ best choice for max player is $\max_x \min_{j\in S^-} h(x,j)$

And this is symmetrical for the min player:

> $\min_y \max_{i\in S^+} h(i,y)$

To find an optimal mixed strategy we need an algorithm that takes in $h$ and outputs $x$ (or $y$)

## Algorithm for finding optimal mixed strategy
Suppose we are finding mixed strategy $x$ for max player

Decision vas: $x(i), i\in S^+$

$max min_{j\in S^-} \sum_{i\in S^+} x(i) h(i,j)$

s.t. $\sum_{i\in S^+} x(i)=1$

> $x(i)\geq 0$

Which is equivalent to:

$\max \gamma$

s.t. $\sum_{i \in S^+} h(i,j) x(i) \geq \gamma, (j\in S^-)$

> $\sum_{i\in S^+} x(i)=1$

> $x(i)\geq 0$

## Finding dual of this

$\max \gamma$

s.t. $\gamma - \sum_{i \in S^+} h(i,j) x(i) \leq 0, (j\in S^-)$

> $\sum_{i\in S^+} x(i)=1$

> $x(i)\geq 0$

suppose the first consraint can be labelled as $y(j)$ and the second as $\beta$

$\min \beta$

s.t. $-\sum_{j\in S^-}h(i,j)y(j) + \beta \geq 0, (i\in S^+)$

> $\sum_{j\in S^-}y(j)=1$

> $y(j)\geq 0$

This is the algorithm for the minimizing player

Thus, in the case of revealing mixed strategies, the max player revealing their mixed strategy is the same as the min player revealing their mixed strategy.

This is the von Neuman theorem

**Corollary** (Yao's principlle)

> $\max_x \min_{j\in S^-} h(x,j)=\min_y \max_{i\in S^+} h(i,y)$

Thus by weak duality:

> $\max_x \min_{j\in S^-} h(x,j)\leq \forall y, \max_{i\in S^+} h(i,y)$
