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
