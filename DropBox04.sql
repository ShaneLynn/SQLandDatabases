-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox04
-- 02/03/2021

-- Exercise 4.4 Same as Exercise 4.3, but this time use a more meaningful column head called "Supplier (Country)".
--- Exercise 4.3 Display all suppliers with the supplier name followed by the country in parentheses, such as Pine Apple (USA).

SELECT  SupplierName + ' (' + Country + ')' AS "Supplier (Country)"
FROM Purchasing.Suppliers;

 
-- Exercise 4.6 The LifeSytle manager decides to give customers who bought three or more units of the same product in the same
-- order a 20 percent discount.  Show Order ID, product ID, price, quantity, and discounted price for those discounted in the orderdetails.

SELECT OrderId, ProductId, Price, Quantity, (Price - (Price * .20)) AS "Discounted Price"
FROM Sales.OrderDetails
WHERE Quantity >= 3 
ORDER BY OrderId;

 
-- Exercise 4.11 Display the first word after the street number in a supplier's street address.  For example, for the supplier 
-- "1 Pine Apple St", the first word after the street number is "Pine".  Show the supplier's street and address and the first 
-- word after the street number

SELECT StreetAddress, SUBSTRING(StreetAddress, CHARINDEX(' ', StreetAddress)+1, CHARINDEX(' ', StreetAddress, CHARINDEX(' ', StreetAddress)+1) - CHARINDEX(' ', StreetAddress) -1) AS "First word after street number"
FROM Purchasing.Suppliers;


 
-- Exercise 4.12 Display today's date and the number of days that have passed since the order date.  
-- Show order ID, customer ID, employee ID, order date, today's date, and the order's age in days.


SELECT OrderId, CustomerId, EmployeeId, OrderDate, GETDATE() AS "Today's Date", DATEDIFF(day, OrderDate, GETDATE()) AS "Order's Age"
FROM Sales.Orders
ORDER BY OrderId;
--To get the order's age calculations as indicated by the book example, replace GETDATE() with '2017-06-11' in the DATEDIFF function.
