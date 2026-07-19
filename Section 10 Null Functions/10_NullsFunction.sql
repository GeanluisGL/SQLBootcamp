yUse SalesDB
Go

--FIND THE AVERAGE SCORES OF THE CUSTOMERS
--Coalesce is used for replacing null's values in a column or a row - IN this case is for INT
SELECT
sCORE,
AVG(COALESCE(SCORE, 0)) OVER () AS 'SCORE AVERAGE'
FROM Sales.Customers;

-- IN this case is for a String Value.
	Select 
	Lastname,
	Coalesce(Lastname, 'Unknown') as 'Lastname'
	FROM Sales.Customers;


-- USE CASE FOR MATHEMATICAL OPERATOIN
-- Display the full name of customers by merging their first and last names
-- And add 10 bonus points to each customer's score

SELECT
CustomerID,
FirstName,
LastName,
FirstName + ' ' + Coalesce(Lastname, ' ') AS 'Fullname', 
Score,
(Coalesce(score, 0)) + 10 AS '+ 10 POINTS'
FROM Sales.Customers;