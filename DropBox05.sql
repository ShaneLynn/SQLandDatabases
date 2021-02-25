-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox05
-- 02/10/2021

-- Exercise 5.4 Display the total value for product ID 7 in the deliveries table.  Note that Product ID 7 was delivered twice.
-- The first one is on Oct. 11, 2016 -- 12 units of $79.99 per unit.  The second one is on Oct. 12, 2016 -- 18 units of $69.99
-- per unit.  The displayed total value for product ID 7 should be 12X79.99 + 18X69.99 = $2219.70


SELECT  SUM(Quantity*Price) AS "Total value of Product ID 7 delivered"
FROM Purchasing.Deliveries
WHERE ProductID = 7;

 
-- Exercise 5.7 Display one of the highest priced items in the deliveries table.  Show the product ID and the price.


SELECT TOP 1 ProductId, MAX(Price) AS "Highest priced item"
FROM Purchasing.Deliveries
GROUP BY ProductId
ORDER BY "Highest priced item" DESC;

 
-- Exercise 5.13 Display orders that contain 3 or more units of product ID 1 or 3.  Show order ID, total quantity 
-- of product, and average price (not weighted average price) of each order.  Sort by quantity from high to low.


SELECT OrderId, SUM(Quantity) as "Total Units", AVG(Price) AS "Average Price"
FROM Sales.OrderDetails
WHERE ProductId IN ('1','3')
GROUP BY OrderId
HAVING SUM(Quantity) >= 3
ORDER BY SUM(Quantity) DESC;


 
-- Exercise 5.16 Display suppliers whose products are delivered between Oct. 5, 2016 and Oct. 10, 2016.  Show supplier ID.


SELECT DISTINCT supplierid
FROM Purchasing.Products
WHERE ProductId IN (SELECT ProductId
					FROM Purchasing.Deliveries
					WHERE DeliveryDate BETWEEN '20161005' AND '20161011')
ORDER BY supplierid;
