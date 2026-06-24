USE SalesDB
Go

/**Combine the data from employees and customers**/

SELECT 
E.FirstName,
E.LastName
FROM sales.Employees as E
UNION
SELECT 
c.FirstName,
c.LastName
FROM sales.Customers as c

--UNION ALL
/**Combine the data from employees and customers, INCLUDING DUPLICATES**/
SELECT 
E.FirstName,
E.LastName
FROM sales.Employees as E
UNION ALL
SELECT 
c.FirstName,
c.LastName
FROM sales.Customers as c

--EXCEPT
/**FIND the employees who are not customers at the same time**/
SELECT 
E.FirstName,
E.LastName
FROM sales.Employees as E
EXCEPT
SELECT 
c.FirstName,
c.LastName
FROM sales.Customers as c
