---
date: 01/23/25
tags:
  - CSDS
  - HW
links: 
deadline: 2025-01-30
status: 0.1
---
# 1 Data and Attributes Types
Determine the type of the following attributes of real-world objects (Nominal, Ordinal,  
Interval, Ratio). Justify your answers with brief explanations
## 1. Flavors of Coca Cola (such as Classic, Cherry, Zero...)  
> [!Ans]
> Nominal, flavors are categorical and can not be ordered
## 2. Income of computer science students in US in 2024  
> [!Ans]
 
## 3. Weights of lions in a zoo, in pounds  

## 4. Rating of a hotel in {Excellent, Above Average, Average, Below Average, Poor}  
> [!Ans]
> Ordinal, ratings of a hotel are categorical, orderable, but can not be added
## 5. Blood Type of Human  
> [!Ans]
> Nominal, blood types are categorical and can not be ordered
## 6. GINI coefficient of Asian countries  

## 7. Memory cost measured in MB of a computer program  

## 8. Processing temperatures of alloys of Aluminum in Celsius  

## 9. The probability a person wins a lottery

# 2 Data Models and Types of Data
We have seen several examples of different types of data. Based on your understanding, determine the proper types of the following dataset (structured, semi-structured, unstructured, ordered data, time-series data), for a given context of application scenario. Briefly justify your answer. A dataset can be assigned with multiple types, whenever applicable
## i. Sensor data from a weather station that records windspeed, irradiance, and temperatures

## ii. Google map data, for searching a shortest path from location A to location B

## iii. A set of Tweets discussing “” with their posted time

## iv. A fraction of genome sequences

## v. A sequence of images sampled from a movie when it is played

## vi. A list of image features defined by attributes “{image name, pixel number, topic, color-depth, height, length}”

## vii. Webpages in HTML code

## viii. Real-time Stock price feed

# 3 Relational Data and Models
Consider the following schema defined for Lake Erie Cruises. The schema keeps track of ships, cruises, ports and passengers. A cruise refers to the sailing of a ship on a specific date.

Ship(ship_number, ship_name, ship_builder, departure_date, gross_weight)
Cruise(cruise_number, start_date, end_date, director, ship_number)
Port(port_name, country, dock_number, port_manager)
Visit(cruise_number, port_name, country, arrival_date, departure_date)
Passenger(passenger_number, passenger_name, SSN, Address, Phone)
Voyage(passenger_number, cruise_number, stateroom_number, fare)

The following facts have been validated.
• Both ship number and ship name are unique in Ship relation.
• A ship goes on many cruises. A cruise is associated with a single ship.
• A port can be uniquely identified by a port name and country
• A cruise may visit multiple ports, and a port can be included as a stop by multiple cruises.
• A passenger has a unique passenger number, and a unique SSN.
• A person has a single passenger number that is used for all cruises she takes.
• A voyage indicates that a person can take many cruises. A cruise, as expected, can have multiple passengers.

## (10) Identify a primary key, and a candidate key for each relation.
> [!Ans]
> | Relation | PK                       | CK                    | 
> | -------- | ------------------------ | --------------------- |
> | Ship     |                          |                       |
> | Cruise   |                          |                       |
> | Port     |                          |                       |
> | Visit    |                          |                       |
> | Passenger|                          |                       |
> | Voyage   |                          |                       |




## (10) Identify the foreign keys of each relation, given your choice of primary keys.

## (10) Identify the foreign keys that are also a part of the primary keys of the same schema they are defined on.

## (10) Happy Hour Lines wants to track which passengers visited which ports on which ships, and on which dates. In this case, which are the relations you will need? Design a schema as necessary to store this information.

## (10) Give three examples of functional dependencies that may likely hold on the schema, and explain why you think they will hold.

# 4 Data Constraints
Given a referencing relation R1 with foreign key FK1, and a referenced relation R2 with primary key PK2 that FK1 refers to, and two states r(R1), and r(R2), describe an algorithm that checks if r(R1) and r(R2) violate the foreign key constraint. You may use pseudocode or simply describe it. It is also encouraged that you provide a time cost analysis for the algorithm you propose.

