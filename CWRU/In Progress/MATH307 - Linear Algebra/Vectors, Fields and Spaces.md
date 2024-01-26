### Vector Properties
- Vector Addition
	- Can add vectors together (duh)
	- Tip to tail yada yada
- Scalar Multiplication
	- Multiply any vector by any real number and it will scale the vector
	- Linear Combination Example
		- v1, … , vm 𝜖 Rn a1, … , am 𝜖 R    
		- a1vm, … , amvm 𝜖 Rn
	- The span of a vector is the set of all Linear Combinations of vector written:
		- <v1, … , vm> = {a1v1 + … + amvm | a1, … , am 𝜖 R}
- Type Checking! (Like CS cannot do certain operations for certain types)
	- xy -> you can not multiply two vectors together
	- x-1-> can not take the inverse of a vector
	- a + x -> can not add a real number to a vector
### Vector form of a linear system

![](https://lh7-us.googleusercontent.com/vzqI8oqh6u_W4edw_3T-CMkUZ02Vp_Wku72PufL5almLRkpEWMZFycI_TSGdCQJfeVlI1yQ042QPyEPKTcLWk0DpBVYqfOgHrkm7eBqGNAYimRUPEMtT0Yufu31sJnZoRXN1_DIcTm96eciOqiGKxQA)

- Converting from a linear System to a System of Vectors
    

### Fields
 A Field is a bunch of numbers that we can +, -, x, /, and things work basically like you would expect 
- Def. A field is a set F together with two binary operations +, x, and two distinct elements 0, 1 𝜖 F such that:
	- 1) ∀ a, b 𝜖 F, a + b = b + a - > (+ is commutative)
	- 2) ∀ a, b, c 𝜖 F, (a + b) + c = a + (b +c) - > (+ is associative)
	- 3) ∀ a 𝜖 F, a + 0 = a - > (0 is an additive identity)
	- 4) ∀ a 𝜖 F ∃ b 𝜖 F such that a + b = 0 - > (additive inverse, b = -a)
	- 5) ∀ a, b 𝜖 F, a * b = b * a - >(* is commutative)
	- 6) Multiplication is associative
	- 7) 1 is a multiplicative identity ( 1 * a = a )
	- 8) ∀ a 𝜖 F & a != 0 ∃ c 𝜖 F such that a * c = 1 - > (multiplicative inverse, c = 1/a)
	- 9) ∀ a, b, c 𝜖 F, a(b + c) = ab + ac - > (distributive law)
- Ex:
	- R - > set of all real numbers
	- Q = { rational numbers }
		- Q is a subset of R
	- C = {a + ib | a, b 𝜖 R} -> C is set of complex numbers
    		- Proved in 1.4 in textbook, Exercise 17?
	- Q(i) = {a + ib | a, b 𝜖 Q}
	- F2 = {0, 1}
		- In F2, + is xor and * is and

| + | 0 | 1 |
| ---- | ---- | ---- |
| 0 | 0 | 1 |
| 1 | 1 | 0 |

| * | 0 | 1 |
| ---- | ---- | ---- |
| 0 | 0 | 0 |
| 1 | 0 | 1 |

- Non-examples (nonex):
	- Z - > set of integers
		- Can not satisfy the 8th property because ⅛ is not an integer
	- N - > set of natural numbers
		- No negative numbers so does not satisfy 4th and 8th property
- Many other properties follow from the def.
	- Ex.
		- 0a = 0
			- Pf 0a = (0 + 0)a = 0a + 0a, therefore 0a = 0a + 0a. Subtracting 0a from both sides will result in 0 = 0a
	- Thm. The additive identity is unique.
		- Pf (proof) suppose 0 and 0’ are both additive identities. We know 0 + 0’ = 0 and 0 + 0’ = 0’. Therefore 0 = 0’
- GE (Gaussian Elimination) works just as well over any field
## Vector Spaces
### What do we do with Vectors?
Vector Addition & Multiplication
- Ex:
	- Consider solutions of the system:
		- x + y - z = 0
		- x - y - z = 0
		- x + 0y - z = 0
	- Notice if we have 2 solutions then their sum is also a solution
	- Similarly, scalar multiples of a solution is a solution
	- $$U epsilon R^3$$The set of solutions of this homogenous linear system has properties that:
		- The sum of 2 things in U is in U 
		- any scalar multiple of a thing in U is in U
### Defining Vector Spaces
A vector space over F consists of a set V with an element 0 exists in V and operations +, V x V -> V and scalar multiplication F x V -> V such that:
- + is commutative, associative, 0 is an additive identity and every v in V has an additive inverse
- For every v in V, 1v = v
- For ever a,b in F and v in V, (ab)v = a(bv)
- For every a,b in F and v in V, (a+b)v = av + bv
- For every a in F and v,u in V, a(u+v) = au + av
This proves other properties such as the following:
- 0v = 0, a0 = 0
- (-1)v = -v
	- Pf. v + (-1)v = 1v + (-1)v = (1 + (-1))v = 0v = 0.
Ex:
$$
F^n = {[x_1... x_n] | x_1...x_n :epsilon: F}
<br>
$$