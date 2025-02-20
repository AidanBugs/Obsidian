---
date: 01/14/25
tags:
  - CSDS
links: 
deadline: 2025-01-14
status:
---
# Data as Objects and Attributes
A data object is one data point in a data set. An attribute is one component of a data object. For example, given a data set (group of data objects) of humans, the attributes of a data object could be eye color, hair color, height, etc. Whereas a data object would just be one human with their given attributes.
## Attributes vs. Attribute Values
An attribute could have different attribute values. Example: Height (attribute) could be measured in feet or meters (attribute values).
## Types of Attributes
### Nominal (Categorical)
Examples: eye color, zip code
Properties: Distinctness
### Ordinal (Attribute can be ordered)
Examples: Rankings, grades, height
Properties: Distinctness, Order
### Interval (Distance is meaningful)
Examples: Calendar dates
Properties: Distinctness, Order, Addition
### Ratio: Absolute Zero - (Meaningful Fraction / Ratio)
Examples: Temperature in kelvin, length, time, counts
Properties: Distinctness, Order, Addition, Multiplication
## Discrete vs Continuous Attributee
### Discrete
Finite or countably infinite set of values.
Ex: Count, zip codes
### Continuous
Uncountable infinity set of values.
Ex: Height, Weight
# The 4 V's
## Variety
Heterogeneous: structured, semi-structured, unstructured
- 9:1 ratio of unstructured data vs structured data
- collecting 95% restaurants requires at least 5000 sources
## Volume
Horrendously large
- PB $10^{15}$ B
- EB $10^{18}$ B
- ZB $10^{21}$ B
## Velocity
Dynamic, streams, growth of the web
## Veracity
Trust in it's quality.
- Real life data is typically dirty!

# Formal Definitions
We can write a schema as $R(A,B,C...)$ that is, a relation between attributes $A,B,C...$.

An instance of a schema can be written as $r(R)\subset dom(A)\times dom(B)\times dom(C)...$.

# Constraints
## Domain
Domain constraints is simply there can be no entries outside the list of possible elements.

## Keys & Superkeys
### Superkeys
A set of attributes where no 2 entries share the same value for that attribute. For example: ID.

### Keys
A minimal superkey: a key is a superkey $K$ such that removal of **ANY** attribute from $K$ results in a set of attributes that is not a superkey.

Note that key$\subset$superkey.

# Primary Keys and Foreign Keys
## Primary Keys
Primary keys are keys that determine the attributes within a given relation. Example, we could have an employee relation with a primary key of employee id.

## Foreign Keys
Foreign keys are keys that reference the primary keys of a different relation. Example, we could have a project relation which references employee ids as foreign keys.
