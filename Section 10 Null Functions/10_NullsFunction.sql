Use SalesDB
Go

--FIND THE AVERAGE SCORES OF THE CUSTOMERS
--Coalesce is used for replacing null's values in a column or a row - IN this case is for INT
SELECT
sCORE,
AVG(COALESCE(SCORE, 0)) OVER () AS 'SCORE AVERAGE'
FROM Sales.Customers

-- IN this case is for a String Value.
	Select 
	Lastname,
	Coalesce(Lastname, 'Unknown') as 'Lastname'
	FROM Sales.Customers


-- USE CASE FOR MATHEMATICAL OPERATOIN
-- Display the full name of customers by merging their first and last names
-- And add 10 bonus points to each customer's score

SELECT
CustomerID,
FirstName,
LastName,
Score,
FirstName + ' ' + Coalesce(Lastname, ' ') AS 'Fullname', 
(Coalesce(score, 0)) + 10 AS '+ 10 POINTS'
FROM Sales.Customers


-- USE CASE Sorting Data
--SORT the customers from lowest to highest scores with nulls appearing last
SELECT
CustomerID,
score,
Case When Score Is null Then 1 else 0 End as 'Flag'
FROM SALES.Customers
ORDER BY Case When Score Is null Then 1 else 0 End 



--Null If
-- Find the sales prices for each order by dividing the sales by the quantity
Select
OrderId,
Sales,
Quantity,
Sales / Nullif(Quantity ,0) 
from  Sales.Orders

--IS NULL & IS NOT NULL
--Identify the customers who have no scores

SELECT
*
FROM Sales.Customers
WHERE SCORE IS NULL

--Identify the customers who only have scores

SELECT
*
FROM Sales.Customers
WHERE SCORE IS NOT NULL

--List all details for customers who have not placed any order

SELECT 
C.*,
O.CustomerID
FROM SALES.Customers AS C
LEFT   JOIN SALES.Orders AS O
ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL

SELECT
*
FROM SALES.Orders


