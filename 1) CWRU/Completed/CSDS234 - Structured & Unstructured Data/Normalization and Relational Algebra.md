---
format: pdf
---
# Normalization
## Functional Dependencies
A functional dependency is a rule that states that the value of one attribute can be determined by the value of another attribute. For example, an employee ID would determine an employee's name, salary, department, etc.

## Normal Forms
### 1NF
A 1NF is a data set where each attribute is a single value. For example, location in longitude and latitude is not 1NF. Instead if there was a longitude column and a latitude column, then each row would have 2 values and could be 1NF. Each key will determine a unique set of values for each attribute.

### 2NF
Same rules as 1NF but also there are no partial dependencies. That is, no attribute is dependent on a portion of the primary key. For example, given a relation of projects and their employees, the primary key could be project id and employee id. However this is not 2NF because employee name is dependent on employee id and is not dependent on project id.

### 3NF
Same rules as 2NF but also there are no transitive dependencies. That is, no attribute is dependent on a portion of another attribute. For example, a relation of R{employee id, employee name, employee job, salary}, this is not 3NF because salary is a transitive dependency of employee job. We can convert this into 3NF by decomposing it into 2 relations: R{employee id, employee name, employee job} and R{employee job, salary}.

# Relational Algebra
## Relational Algebra Expressions
Relational algebra consist of operations (that are closed!) that return sets (subsets) of attributes (relations).

### Basic Operations

- Select ($\sigma$)
    - Selects a subset of tuples from a relation.
    - Syntax: $\sigma_{condition}(relation)$
- Project ($\pi$)
    - Keeps specified attributes from a relation.
    - Syntax: $\pi_{attributes}(relation)$
- Cross Product ($\times$)
    - Returns the Cartesian product of two relations.
    - Syntax: $relation_1 \times relation_2$
- Set Difference ($-$)
    - Returns the set difference of two relations.
    - Syntax: $relation_1 - relation_2$
- Union ($\cup$)
    - Returns the union of two relations.
    - Syntax: $relation_1 \cup relation_2$

### Additional Operations

- Join ($\bowtie$)
    - Joins two relations based on a common attribute.
    - Syntax: $relation_1 \bowtie_{attribute} relation_2$
- Intersect ($\cap$)
    - Returns the intersection of two relations.
    - Syntax: $relation_1 \cap relation_2$

