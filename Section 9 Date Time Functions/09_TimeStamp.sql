--Section 9 Date Time Functions

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

-- DATETRUNC
Select
OrderId,
CreationTime,
DATETRUNC (SECOND, Creationtime) as 'SECOND',
DATETRUNC (MINUTE, Creationtime) as 'MINUTE',
DATETRUNC (HOUR, Creationtime) as 'HOUR',
DATETRUNC (DAY, Creationtime) as 'DAY',
DATETRUNC (MONTH, Creationtime) as 'MONTH',
DATETRUNC (YEAR, Creationtime) as 'YEAR'
FROM Sales.Orders

 -- IN THE DATA SCIENCE IS USED FOR GROUPING THE DATA IN MANY WAYS
 SELECT
 DATETRUNC (MONTH, CreationTime) AS 'CREATION',
 COUNT(*) AS TOTAL
 FROM SALES.Orders
 GROUP BY  DATETRUNC (MONTH, CreationTime) 

 -- EOMONTH
Select
OrderId,
CreationTime,
EOMONTH (Creationtime) as 'EOMONTH FUNCTION', -- GIVE THE LAST DAY OF THE MONTH IN THE SELECTED DATE
CAST(DATETRUNC(MONTH, CREATIONTIME) AS dATE) AS 'FIRST DAY'
FROM Sales.Orders

--HOW MANY ORDERS WHERE PLACED EAHC YEAR
SELECT
Year(Orderdate) as 'Year',
Count (*) As 'Count'
FROM Sales.Orders
group by Year(Orderdate)


--HOW MANY ORDERS WHERE PLACED EAHC YEAR
SELECT
DateName(MONTH, OrderDate) as 'Month',
Count (*) As 'Count'
FROM Sales.Orders
group by DateName(MONTH, OrderDate)

-- SHOW ALL ORDERS THAT WERE PLACED DURING THE MONTH OF FEBRUARY
SELECT 
*
FROM SALES.Orders
WHERE MONTH(OrderDate) = 2

-- All possible parts can be used in DATEPART SQL Function
SELECT 
    'Year' AS DatePart, 
    DATEPART(year, GETDATE()) AS DatePart_Output,
    DATENAME(year, GETDATE()) AS DateName_Output,
    DATETRUNC(year, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'YY', 
    DATEPART(yy, GETDATE()) AS DatePart_Output,
    DATENAME(yy, GETDATE()) AS DateName_Output, 
    DATETRUNC(yy, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'YYYY', 
    DATEPART(yyyy, GETDATE()) AS DatePart_Output,
    DATENAME(yyyy, GETDATE()) AS DateName_Output, 
    DATETRUNC(yyyy, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Quarter', 
    DATEPART(quarter, GETDATE()) AS DatePart_Output,
    DATENAME(quarter, GETDATE()) AS DateName_Output, 
    DATETRUNC(quarter, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'QQ', 
    DATEPART(qq, GETDATE()) AS DatePart_Output,
    DATENAME(qq, GETDATE()) AS DateName_Output, 
    DATETRUNC(qq, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Q', 
    DATEPART(q, GETDATE()) AS DatePart_Output,
    DATENAME(q, GETDATE()) AS DateName_Output, 
    DATETRUNC(q, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Month', 
    DATEPART(month, GETDATE()) AS DatePart_Output,
    DATENAME(month, GETDATE()) AS DateName_Output, 
    DATETRUNC(month, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'MM', 
    DATEPART(mm, GETDATE()) AS DatePart_Output,
    DATENAME(mm, GETDATE()) AS DateName_Output, 
    DATETRUNC(mm, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'M', 
    DATEPART(m, GETDATE()) AS DatePart_Output,
    DATENAME(m, GETDATE()) AS DateName_Output, 
    DATETRUNC(m, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'DayOfYear', 
    DATEPART(dayofyear, GETDATE()) AS DatePart_Output,
    DATENAME(dayofyear, GETDATE()) AS DateName_Output, 
    DATETRUNC(dayofyear, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'DY', 
    DATEPART(dy, GETDATE()) AS DatePart_Output,
    DATENAME(dy, GETDATE()) AS DateName_Output, 
    DATETRUNC(dy, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Y', 
    DATEPART(y, GETDATE()) AS DatePart_Output,
    DATENAME(y, GETDATE()) AS DateName_Output, 
    DATETRUNC(y, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Day', 
    DATEPART(day, GETDATE()) AS DatePart_Output,
    DATENAME(day, GETDATE()) AS DateName_Output, 
    DATETRUNC(day, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'DD', 
    DATEPART(dd, GETDATE()) AS DatePart_Output,
    DATENAME(dd, GETDATE()) AS DateName_Output, 
    DATETRUNC(dd, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'D', 
    DATEPART(d, GETDATE()) AS DatePart_Output,
    DATENAME(d, GETDATE()) AS DateName_Output, 
    DATETRUNC(d, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Week', 
    DATEPART(week, GETDATE()) AS DatePart_Output,
    DATENAME(week, GETDATE()) AS DateName_Output, 
    DATETRUNC(week, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'WK', 
    DATEPART(wk, GETDATE()) AS DatePart_Output,
    DATENAME(wk, GETDATE()) AS DateName_Output, 
    DATETRUNC(wk, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'WW', 
    DATEPART(ww, GETDATE()) AS DatePart_Output,
    DATENAME(ww, GETDATE()) AS DateName_Output, 
    DATETRUNC(ww, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Weekday', 
    DATEPART(weekday, GETDATE()) AS DatePart_Output,
    DATENAME(weekday, GETDATE()) AS DateName_Output, 
    NULL AS DateTrunc_Output
UNION ALL
SELECT 
    'DW', 
    DATEPART(dw, GETDATE()) AS DatePart_Output,
    DATENAME(dw, GETDATE()) AS DateName_Output, 
    NULL AS DateTrunc_Output
UNION ALL
SELECT 
    'Hour', 
    DATEPART(hour, GETDATE()) AS DatePart_Output,
    DATENAME(hour, GETDATE()) AS DateName_Output, 
    DATETRUNC(hour, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'HH', 
    DATEPART(hh, GETDATE()) AS DatePart_Output,
    DATENAME(hh, GETDATE()) AS DateName_Output, 
    DATETRUNC(hh, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Minute', 
    DATEPART(minute, GETDATE()) AS DatePart_Output,
    DATENAME(minute, GETDATE()) AS DateName_Output, 
    DATETRUNC(minute, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'MI', 
    DATEPART(mi, GETDATE()) AS DatePart_Output,
    DATENAME(mi, GETDATE()) AS DateName_Output, 
    DATETRUNC(mi, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'N', 
    DATEPART(n, GETDATE()) AS DatePart_Output,
    DATENAME(n, GETDATE()) AS DateName_Output, 
    DATETRUNC(n, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Second', 
    DATEPART(second, GETDATE()) AS DatePart_Output,
    DATENAME(second, GETDATE()) AS DateName_Output, 
    DATETRUNC(second, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'SS', 
    DATEPART(ss, GETDATE()) AS DatePart_Output,
    DATENAME(ss, GETDATE()) AS DateName_Output, 
    DATETRUNC(ss, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'S', 
    DATEPART(s, GETDATE()) AS DatePart_Output,
    DATENAME(s, GETDATE()) AS DateName_Output, 
    DATETRUNC(s, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Millisecond', 
    DATEPART(millisecond, GETDATE()) AS DatePart_Output,
    DATENAME(millisecond, GETDATE()) AS DateName_Output, 
    DATETRUNC(millisecond, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'MS', 
    DATEPART(ms, GETDATE()) AS DatePart_Output,
    DATENAME(ms, GETDATE()) AS DateName_Output, 
    DATETRUNC(ms, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'Microsecond', 
    DATEPART(microsecond, GETDATE()) AS DatePart_Output,
    DATENAME(microsecond, GETDATE()) AS DateName_Output, 
    NULL AS DateTrunc_Output
UNION ALL
SELECT 
    'MCS', 
    DATEPART(mcs, GETDATE()) AS DatePart_Output,
    DATENAME(mcs, GETDATE()) AS DateName_Output, 
    NULL AS DateTrunc_Output
UNION ALL
SELECT 
    'Nanosecond', 
    DATEPART(nanosecond, GETDATE()) AS DatePart_Output,
    DATENAME(nanosecond, GETDATE()) AS DateName_Output, 
    NULL AS DateTrunc_Output
UNION ALL
SELECT 
    'NS', 
    DATEPART(ns, GETDATE()) AS DatePart_Output,
    DATENAME(ns, GETDATE()) AS DateName_Output, 
    NULL AS DateTrunc_Output
UNION ALL
SELECT 
    'ISOWeek', 
    DATEPART(iso_week, GETDATE()) AS DatePart_Output,
    DATENAME(iso_week, GETDATE()) AS DateName_Output, 
    DATETRUNC(iso_week, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'ISOWK', 
    DATEPART(isowk, GETDATE()) AS DatePart_Output,
    DATENAME(isowk, GETDATE()) AS DateName_Output, 
    DATETRUNC(isowk, GETDATE()) AS DateTrunc_Output
UNION ALL
SELECT 
    'ISOWW', 
    DATEPART(isoww, GETDATE()) AS DatePart_Output,
    DATENAME(isoww, GETDATE()) AS DateName_Output, 
    DATETRUNC(isoww, GETDATE()) AS DateTrunc_Output;

-- DATE FORMATTING
SELECT
ORDERID,
CREATIONTIME,
FORMAT (CreationTime, 'd') as 'd',
FORMAT (CreationTime, 'dd') as 'd',
FORMAT (CreationTime, 'MM') as 'MM',
FORMAT (CreationTime, 'MMM') as 'MMM',
FORMAT (CreationTime, 'yy') as 'YY',
FORMAT (CreationTime, 'yyyy') as 'YYYY',
FORMAT (CreationTime, 'dd-yyyy-MM') as 'Tate formatting'
From Sales.Orders

--Show CreatrionTime using the following format: Day Wend Jan Q1 2025 12:34:56 PM
SELECT
ORDERID,
CREATIONTIME,
'Day ' + FORMAT (CreationTime, 'ddd-MMM') + ' Q' + Datename(QUARTER, CreationTime) + ' ' + Format(CreationTime, 'yyyy hh:mm:ss tt')AS 'Custome Format'
From Sales.Orders

--Aggregation
SELECT
Format (OrderDate, 'MMM,yyyy') Date,
Count (*) as 'Count'
FROM  SALES.Orders
Group by Format (OrderDate, 'MMM,yyyy')


--Convert
SELECT
Convert(varchar, 123) AS 'INT TO String',
Convert(INT, '506') AS 'String to INT',
Convert(varchar, 123) AS 'INT TO String',
Convert(Date, CreationTime) as 'Datetime to date'
From Sales.Orders

--Cast
SELECT
CAST ('123' AS INT) AS 'STRING TO INT',
CAST (123 AS VARCHAR) AS 'INT TO STRING',
CAST ('2025-08-20' AS DATE) AS 'STRING TO DATE',
CAST ('2025-08-20' AS DATETIME2) AS 'STRING TO DATETIME',
CREATIONTIME,
CAST(CREATIONTIME AS DATE) AS 'DATETIME TO DATE'
FROM SALES.Orders

Select
O.OrderID,
O.OrderDate,
O.CreationTime,
Dateadd( year, 2, OrderDate),
Dateadd( month, -4, orderdate),
Dateadd( DAY, -4, orderdate)
From Sales.Orders as O
inner Join Sales.Customers as S
on o.CustomerID = s.CustomerID


-- Calculate the employees age
Select
EmployeeId
Birthdate,
Datediff (year, birthdate, Getdate()) as age
from sales.employees


-- Find the average shipping duration in days for each month
Select
Month(OrderDate),
Avg (Datediff (day, OrderDate, ShipDate)) as 'Shipping duration'
from sales.Orders
Group by month(OrderDate)

-- Find the noumber of days between each order and previous order
SELECT 
OrderID,
OrderDate,
LAG(OrderDate) OVER (ORDER BY ORDERDATE) AS 'Previous Date',
DATEDIFF(DAY, (LAG(OrderDate) OVER (ORDER BY ORDERDATE)), ORDERDATE) AS 'DIFERENCIA ENTRE FECHAS'
FROM SALES.Orders


--Isdate
SELECT
ISDATE('123'),
ISDATE('2025-08-20'),
ISDATE('20-08-2025')

