-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox2
-- 01/19/2021

-- Exercise 2.5 Display all IDs of employees who have ever made a sale.

SELECT DISTINCT employeeID

FROM Sales.Orders;

 
-- Exercise 2.7 Display all orders sorted by order date, from the most recent to the earliest.

SELECT *
FROM Sales.Orders
ORDER BY OrderDate DESC;

 
-- Exercise 2.9 Display the three most recent deliveries with the product ID and quantity.

SELECT TOP 3 ProductId, Quantity
FROM Purchasing.Deliveries
ORDER BY DeliveryDate DESC;

 
-- Exercise 2.10 Display all customers’ names and contacts.
-- Sort by the customer name. In the case where two or more customers have the same name, sort by contact.

SELECT CustomerName, Contact
FROM Sales.Customers
ORDER BY CustomerName, Contact;