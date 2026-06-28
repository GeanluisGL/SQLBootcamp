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
  
-- DATEPART
Select
OrderId,
CreationTime,
DATEPART (YEAR, Creationtime) as 'Year',
DATEPART (MM, Creationtime)as 'Month',
DATEPART (DAY, Creationtime) as 'Day'
FROM Sales.Orders

-- DATEPART
Select
OrderId,
CreationTime,
DATEPART (QUARTER, Creationtime) as 'Quarter',
DATEPART (WEEK, Creationtime) as 'Week',
DATEPART (WEEKDAY, Creationtime) as 'Weekday'
FROM Sales.Orders

wOO
