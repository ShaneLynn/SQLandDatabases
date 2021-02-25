-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox05
-- 02/15/2021

-- Exercise 6.6 Display customers, their orders, and the most expensive unit price in the order.  
-- Show customer ID, customer name, order ID, order date, and unit price for the most expensive item in the order


SELECT  Customers.CustomerId, Customers.CustomerName, Orders.OrderId, Orders.OrderDate, MAX(OrderDetails.Price) AS "Highest Unit Price In Order" 
FROM Sales.Customers JOIN Sales.Orders
ON Customers.CustomerId = Orders.CustomerID JOIN Sales.OrderDetails
ON Orders.OrderId = OrderDetails.OrderId
Group BY Customers.CustomerId, Customers.CustomerName, Orders.OrderId, Orders.OrderDate
ORDER BY Customers.CustomerId;


 
-- Exercise 6.9 Display all customers.  if a customer has placed any orders, also display the highest unit price in any order of that customer.
-- Otherwise, display null.  We want to know each customer's highest price item ever ordered.  
-- Show customer ID, customer name, and the highest unit price in any order of that customer.


SELECT  Customers.CustomerId, Customers.CustomerName, MAX(OrderDetails.Price) AS "Highest Unit Price" 
FROM Sales.Customers LEFT JOIN Sales.Orders
ON Customers.CustomerId = Orders.CustomerID LEFT JOIN Sales.OrderDetails
ON Orders.OrderId = OrderDetails.OrderId
Group BY Customers.CustomerId, Customers.CustomerName
ORDER BY Customers.CustomerId;

 
-- Exercise 6.10 Display all employees with the same last name.  Show their full name and date of birth.


SELECT DISTINCT E1.FirstName + ' ' + E1.LastName AS "Employee Name", E1.BirthDate
FROM HR.Employees AS E1 JOIN HR.Employees AS E2
ON (E1.EmployeeId != E2.EmployeeId)
AND (E1.LastName = E2.LastName)
ORDER BY E1.BirthDate;


 
-- Exercise 6.12 Display all states the LifeStyle has a business (customer or supplier).  Show state and country.


SELECT State, Country
FROM Sales.Customers
UNION
SELECT State, Country
FROM Purchasing.Suppliers
ORDER BY Country, State;