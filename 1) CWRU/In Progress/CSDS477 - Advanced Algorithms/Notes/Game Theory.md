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

> $h(x,y)= \sum_{i\in S1} \sum_{j\in S2} x(i)y(i) h(i,j)$
