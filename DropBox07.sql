-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox07
-- 02/22/2021

-- Exercise 7.2 LifeStyle LLC has another new customer.  But, this time you only know the new customer's name.  
-- Write an SQL statement to add the customer to the database.  The new customer's data is shown below

INSERT INTO Sales.Customers(CustomerName) VALUES('Magic E');

 	--Including this statement to verify the table updates for one click run.
SELECT *
FROM Sales.Customers;

-- Exercise 7.3 LifeStyle LLC gains two more customers.  Write an SQL statement to add both customers to the database.  The new customer data is shown below:

INSERT INTO Sales.Customers(CustomerName, Contact) VALUES('E4U', 'Tom Comell'), ('Web E', 'Daniel Head');

 	--Including this statement to verify the table updates for one click run.
SELECT *
FROM Sales.Customers;

-- Exercise 7.8 Additional entry, this is required for 7.9 to function.  
-- Write an SQL statement to add the email customers@lifestyle.com to all newly added customers (all customers you inserted in this chapter exercises).

UPDATE Sales.Customers
SET Email = 'customers@lifestyle.com'
WHERE CustomerID > 8;

	--Including this statement to verify the table updates for one click run.
SELECT *
FROM Sales.Customers;

-- Exercise 7.9 You just realized it is a mistake to assign all newly added customers an email of customers@lifestyle.com.
-- Write an SQL statement to delete the emails for those customers.

UPDATE Sales.Customers
SET Email = Null
WHERE CustomerID > 8;

	--Including this statement to verify the table updates for one click run.
SELECT *
FROM Sales.Customers;
 
-- Exercise 7.11 Write an SQL statement to delete all new customers you added in this chapter's exercises.

DELETE FROM 
Sales.Customers 
WHERE CustomerID > 8;

	--Including this statement to verify the final table updates for one click run.
SELECT *
FROM Sales.Customers;