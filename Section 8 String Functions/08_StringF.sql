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

--Replace
--Remove dashes (-) from a phone number
Select
'123-456-7890' as phone,
Replace( '123-456-7890', '-', ' ') as clean_phone

--Replace file Extence from txt to CSV
SELECT
'report.txt' as 'olf file',
Replace('report.txt', 'txt', 'CVS') as 'new file'

--Left & Right
--Retrieve the first and the last two characters of each firstname
 Select
FirstName, 
Left(FirstName, 2) As '2 Left Characters',
Right(FirstName, 2) As '2 Right Characters' 
FROM Sales.Customers 
 
--Substring
--Retrieve a list of customers first names after removing the first character
Select
FirstName, 
Substring(firstname, 2, Len(FirstName)) As 'Substring'
FROM Sales.Customers 
