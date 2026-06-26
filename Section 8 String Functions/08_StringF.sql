--SECTION 8: STRING FUNCTIONS

use SalesDB
Go

--Concatenate 
--Concatenate first name and country into one column

Select
FirstName, 
Country,
CONCAT(FirstName, ' ', Country ) As 'Name & Country'
FROM Sales.Customers 

--Upper and Lower
--Convert the first name to uppercase
 Select
FirstName, 
Country,
CONCAT(FirstName, ' ', Country ) As 'Name & Country',
Upper(Firstname) as 'Upper_Case',
lower(Firstname) as 'Lower_Case'
FROM Sales.Customers 

--Trim
--Find customersd whose first name contains leading or trailing spaces
 Select
FirstName,
Len(FirstName) as Len_Name,
Country
FROM Sales.Customers 
--Where FirstName != Trim(FirstName)
