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
