--Section 9 Date Time Functions

--Table where we gonna WORK
Select
ORderID,
OrderDate,
ShipDate,
CreationTime
From Sales.orders

-- Day, month, day
Select
OrderId,
CreationTime,
Year(CreationTime) as 'Year',
Month(CreationTime) as 'Month',
Day(CreationTime) as 'Day'
FROM Sales.Orders
