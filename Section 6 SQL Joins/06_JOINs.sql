Use MyDatabase
Go

/** ============================================== **/
/**SQL Joins **/
/** ============================================== **/

-- No Join
-- RETRIVE ALL DATA FROM CUSDTOMERS AND ORDERS IN TWO DIFFERENT RESULTS

Select * FROM customers;
Select * FROM orders;


--Inner Join
--Get all customers along with their orders, but only for customer who have placed an order

Select 
	id,
	first_name,
	order_id,
	sales
FROM customers
INNER JOIN orders
on customers.id = orders.customer_id

/**The column could be repited and the Database could confuse with who is he calling to,
so this could be solve with the property [Table_name].[column_Name] (and the column name could be abbreviate by using the "AS")**/

Select 
	c.id,
	c.first_name,
	order_id,
	sales
FROM customers as c
INNER JOIN orders
on c.id = orders.customer_id


--LEFT Join
-- Get all customers along with their orders including those without orders
	
Select 
c.id,
	c.first_name,
	order_id,
	sales
FROM customers AS C
LEFT JOIN orders
ON c.id = orders.customer_id;
