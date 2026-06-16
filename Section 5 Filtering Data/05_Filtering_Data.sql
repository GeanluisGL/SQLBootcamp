/* ============================================================================== 
   SQL Filtering Data
-------------------------------------------------------------------------------
   This document provides an overview of SQL filtering techniques using WHERE 
   and various operators for precise data retrieval.

   Table of Contents:
     1. Comparison Operators
        - =, <>, >, >=, <, <=
     2. Logical Operators
        - AND, OR, NOT
     3. Range Filtering
        - BETWEEN
     4. Set Filtering
        - IN
     5. Pattern Matching
        - LIKE
=================================================================================
*/

/* ============================================================================== 
   COMPARISON OPERATORS
=============================================================================== */

-- Retrieve all customers from Germany.
SELECT *
FROM customers
WHERE country = 'Germany'

-- Retrieve all customers who are not from Germany.
SELECT *
FROM customers
WHERE country <> 'Germany'

-- Retrieve all customers with a score greater than 500.
SELECT *
FROM customers
WHERE score > 500

-- Retrieve all customers with a score of 500 or more.
SELECT *
FROM customers
WHERE score >= 500

-- Retrieve all customers with a score less than 500.
SELECT *
FROM customers
WHERE score < 500

-- Retrieve all customers with a score of 500 or less.
SELECT *
FROM customers
WHERE score <= 500



/* ============================================================================== 
   LOGICAL OPERATORS
=============================================================================== */

/* Combining conditions using AND, OR, and NOT */

-- Retrieve all customers who are from the USA and have a score greater than 500.
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500

-- Retrieve all customers who are either from the USA OR have a score greater that 500
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500

-- Retrieve all customer with a score NOT less that 500
SELECT *
FROM customers
WHERE NOt score < 500

-- Retrieve all customer whose score falls in the range between 100 and 500
Select *
From customers
Where score between 100 and 500

Select *
From customers
Where score >= 100 and score <= 500

-- Retreive all customers from either Germany or USA.
Select * 
FROM customers
WHERE Country In ('Germany', 'USA')
