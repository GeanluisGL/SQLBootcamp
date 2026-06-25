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
