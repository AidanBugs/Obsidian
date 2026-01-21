# Data Models
Collection of describing:

- Data Relationships
- Data Semantics
- Data Constraints

Attributes (Columns)

Tuples / Entries / Entity (Rows)

Relation (Table/Matrix)

# Schema
$R(A_1,A_2,...,A_n)$

> $R$ is the name of the relation
>
> $A_i$ is the name of the $i$th attribute

The schema refers to the format/outline of the table

# Domain
Set of all possible values of an attribute

> EX: USA Pone Numbers is limited to only 10 Digit Numbers that are valid in the US. Note that not all 10 Digit numbers are valid so they are not in the set.

Sometimes the domain of an attribute most follow a specific format

> EX: US Phone Numberes could be "(ddd)-ddd-dddd", Dates could be "dd/mm/yyyy" or "yyyy-mm-dd" or "mm/dd/yy" etc

# Tuple
Formatted $t=<v_1,v_2,...,v_n>$ 

> $v_i$ must be a valid value in the domain of attribute $A_i$

# State (Relation State)
$r(R) = {t_1,t_2,...,t_m}$

> $t_i$ is the $i$th tuple in the relation
>
> Note that $r(R) \subset dom(A_1)\times dom(A_2)\times ....\times dom(A_n)$

Note this is a populatede table (a table with valid data entries)

# Component Values
$t[A_i,A_j]$ gives the corresponding values for that tuple.

# Constraints
## Domain Constraints
Every value in a tuple must be within the domain of the corresponding attribute

## Key Constraints
This means the primary key must be valid for new data entries and that new data entries do not have the same values for the primary key attributes as another data entry

### Superkey (SK)
$\forall i,j \in m (i\neq j \rightarrow t_i[SK]\neq t_j[SK])$

> Essentially the values of a superkey uniquely reference a single tuple within $r(R)$

Note that $SK$ is a set of attributes in $R$

### Key (or minimal key)
This is a superkey were the removal of any attribute of the key makes the attribute set no longer a super key

Note that the primary key refers to the desegnated key of the database schema (typically denoted by attributes being underlined)

## Entity Integrity
The primary key attributes cannot be null in any tuple of $r(R)$

$\forall i\in |r(R)| (t_i[PK]\neq [null]\times |PK|)$

## Referential Integrity

