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


--RIGHT Join
-- Get all customers along with their orders including those orders without without customer
Select 
	c.id,
	c.first_name,
	order_id,
	sales
FROM orders
RIGHT JOIN  customers AS C
ON c.id = orders.customer_id;

--Full Join
--Get all customers and all order even if there's no match
Select 
	c.id,
	c.first_name,
	order_id,
	sales
FROM customers AS C 
FULL JOIN orders
ON c.id = orders.customer_id ;
