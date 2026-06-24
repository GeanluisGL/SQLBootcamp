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

--INTERSECT
/**FIND the employees who are also customers at the same time**/
SELECT 
E.FirstName,
E.LastName
FROM sales.Employees as E
INTERSECT
SELECT 
c.FirstName,
c.LastName
FROM sales.Customers as c


-- Orders data are stored in separate tables (Ordes and OrdersArchive).
-- Combine all orders data into one report without duplicate

Select 
	'Orders' As SourceTable
      ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
union
Select
	'Orders Archive' As SourceTable
	  ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
Order by OrderID
