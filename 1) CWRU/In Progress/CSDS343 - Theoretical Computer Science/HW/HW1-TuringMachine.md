## Create a TM for $L$
$L=\{a^nb^mc^{\max\{n-m,0\}}d^{\max\{m-n,0\}}\}$
$\Sigma=\{a,b,c,d\}$
$\Gamma=\{a,b,c,d,\_,a',b',c',d'\}$
$Q=\{q_{0},q_{reject},q_{accept},q_{1},q_{2},q_{3},q_{4},q_{5},q_{6},q_{7},q_{8},q_{9},q_{b},q_{c}\}$
$\delta: Q\times\Gamma\rightarrow Q\times\Gamma\times\{L,R\}$
### $q_{0}$ -- init
$\delta (q_{0},a)=(q_{1},a',R)$
$\delta (q_{0},b)=(q_{7},b',R)$ -- More b's than a's
$\delta (q_{0},c)=(q_{reject}, \_, R)$
$\delta (q_{0},d)=(q_{reject}, \_, R)$
$\delta (q_{0},\_)=(q_{accept}, \_, R)$
$\delta (q_{0},a')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{0},b')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{0},c')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{0},d')=(q_{reject}, \_, R)$ \* This should not happen
### $q_{1}$ -- Match b's to a's (R)
$\delta (q_{1}, a)= (q_{1}, a, R)$ 
$\delta (q_{1}, b)= (q_{2}, b', R)$
$\delta (q_{1}, c)= (q_{4}, c', L)$ -- More a's than b's
$\delta (q_{1}, d)= (q_{reject}, \_, R)$
$\delta (q_{1}, \_)= (q_{reject}, \_, R)$
$\delta (q_{1}, a')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{1}, b')= (q_{1}, b', R)$
$\delta (q_{1}, c')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{1}, d')= (q_{reject}, \_, R)$ \* This should not happen
### $q_{2}$ -- Find next a (a vs b) (L)
$\delta (q_{2}, a)= (q_{2}, a, L)$ 
$\delta (q_{2}, b)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{2}, c)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{2}, d)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{2}, \_)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{2}, a')= (q_{3}, a', R)$
$\delta (q_{2}, b')= (q_{2}, b', L)$
$\delta (q_{2}, c')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{2}, d')= (q_{reject}, \_, R)$ \* This should not happen  
### $q_{3}$ -- Mark the found a (a vs b) (R)
$\delta (q_{3}, a)= (q_{1}, a', R)$ 
$\delta (q_{3}, b)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{3}, c)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{3}, d)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{3}, \_)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{3}, a')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{3}, b')= (q_{b}, b',R)$ -- No more a's, check if b's are greater or equal
$\delta (q_{3}, c')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{3}, d')= (q_{reject}, \_, R)$ \* This should not happen 
###  $q_{4}$ -- Find next a (a vs c) (L)
$\delta (q_{4}, a)= (q_{4}, a, L)$ 
$\delta (q_{4}, b)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{4}, c)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{4}, d)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{4}, \_)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{4}, a')= (q_{5}, a', R)$
$\delta (q_{4}, b')= (q_{4}, b', L)$
$\delta (q_{4}, c')= (q_{4}, c', L)$
$\delta (q_{4}, d')= (q_{reject}, \_, R)$ \* This should not happen  
### $q_{5}$ -- Mark the found a (a vs c) (R)
$\delta (q_{5}, a)= (q_{6}, a', R)$ 
$\delta (q_{5}, b)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{5}, c)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{5}, d)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{5}, \_)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{5}, a')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{5}, b')=(q_{c},b',R)$ -- No more a's, check no more c's
$\delta (q_{5}, c')=(q_{c},c',R)$ -- No more a's, check no more c's
$\delta (q_{5}, d')= (q_{reject}, \_, R)$ \* This should not happen 
### $q_{6}$ -- Match c's to a's (R)
$\delta (q_{6}, a)= (q_{6}, a, R)$ 
$\delta (q_{6}, b)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{6}, c)= (q_{4}, c', L)$ 
$\delta (q_{6}, d)= (q_{reject}, \_, R)$ 
$\delta (q_{6}, \_)= (q_{reject}, \_, R)$ -- More a's than c's 
$\delta (q_{6}, a')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{6}, b')= (q_{6}, b', R)$
$\delta (q_{6}, c')= (q_{6}, c', R)$
$\delta (q_{6}, d')= (q_{reject}, \_, R)$ \* This should not happen  
### $q_{7}$ -- Match d's to b's (b vs d) (R)
$\delta (q_{7}, a)= (q_{reject}, \_, R)$
$\delta (q_{7}, b)= (q_{7}, b', R)$
$\delta (q_{7}, c)= (q_{reject}, \_, R)$
$\delta (q_{7}, d)= (q_{8}, d', L)$
$\delta (q_{7}, \_)=(q_{reject}, \_, R)$ -- More b's than d's
$\delta (q_{7}, a')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{7}, b')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{7}, c')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{7}, d')= (q_{7}, d', R)$
### $q_{8}$ -- Find next b (b vs d) (L)
$\delta (q_{8}, a)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{8}, b)=(q_{8},b,L)$ 
$\delta (q_{8}, c)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{8}, d)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{8}, \_)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{8}, a')=(q_{reject}, \_, R)$ \* This should not happen 
$\delta (q_{8}, b')=(q_{9}, b', R)$
$\delta (q_{8}, c')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{8}, d')= (q_{8}, d', L)$
### $q_{9}$ -- Mark the found b (b vs d) (R)
$\delta (q_{9}, a)= (q_{reject}, \_, R)$ \* This should not happen 
$\delta (q_{9}, b)= (q_{7},b',R)$
$\delta (q_{9}, c)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{9}, d)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{9}, \_)= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{9}, a')= (q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{9}, b')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{9}, c')=(q_{reject}, \_, R)$ \* This should not happen
$\delta (q_{9}, d')=(q_{c},d',R)$ -- No more b's, check no more d's
### $q_{b}$ -- More b's than a's, find next b (OR A==B so check no c's or d's)
$\delta (q_{b}, a)= (q_{reject}, \_, R)$
$\delta (q_{b}, b)=(q_{7},b'R)$
$\delta (q_{b}, c)= (q_{reject}, \_, R)$
$\delta (q_{b}, d)= (q_{reject}, \_, R)$
$\delta (q_{b}, \_)=(q_{accept}, \_, R)$
$\delta (q_{b}, a')=(q_{reject}, \_, R)$\* This should not happen
$\delta (q_{b}, b')= (q_{b},b',R)$
$\delta (q_{b}, c')=(q_{reject}, \_, R)$\* This should not happen
$\delta (q_{b}, d')=(q_{reject}, \_, R)$\* This should not happen
### $q_{c}$ -- Check if we have went through the whole string (R)
$\delta (q_{c}, a)= (q_{reject}, \_, R)$
$\delta (q_{c}, b)= (q_{reject}, \_, R)$
$\delta (q_{c}, c)= (q_{reject}, \_, R)$ 
$\delta (q_{c}, d)= (q_{reject}, \_, R)$ 
$\delta (q_{c}, \_)=(q_{accept}, \_, R)$
$\delta (q_{c}, a')=(q_{c}, a', R)$
$\delta (q_{c}, b')=(q_{c}, b', R)$
$\delta (q_{c}, c')=(q_{c}, c', R)$
$\delta (q_{c}, d')=(q_{c}, d', R)$
