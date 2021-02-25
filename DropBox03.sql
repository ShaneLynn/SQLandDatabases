-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox03
-- 01/26/2021

-- Exercise 3.3 Display all UK customers.  Show customer name and email.  Sort customer name in alphabetic order.

SELECT DISTINCT CustomerName, Email
FROM Sales.Customers
WHERE Country = 'UK'
ORDER BY CustomerName;

 
-- Exercise 3.4 Display all products delivered in the first 9 days of October, 2016.  Show product ID, quantity, and date.

SELECT ProductID, Quantity, DeliveryDate
FROM Purchasing.Deliveries
WHERE DeliveryDate BETWEEN '2016-10-01' AND '2016-10-10'
ORDER BY DeliveryDate;

 
-- Exercise 3.6 Display all employees who do not provide a phone number.  Show the employee's first name and last name.

SELECT FirstName, LastName
FROM HR.Employees
WHERE Phone IS NULL;

 
-- Exercise 3.10 Display all products that are delivered more than 5 units at a time and the supplier price
-- is either under $100.00 or over $1000.  Show the product ID, supplier price, and delivery date.

SELECT ProductId, Price, DeliveryDate
FROM Purchasing.Deliveries
WHERE Quantity > 5 AND (Price < 100.00 OR Price > 1000.00);
