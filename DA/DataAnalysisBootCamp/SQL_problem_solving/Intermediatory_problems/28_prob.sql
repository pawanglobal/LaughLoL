-- We're continuing to work on high freight charges. We now want to get
-- the three ship countries with the highest average freight charges. But
-- instead of filtering for a particular year, we want to use the last 12
-- months of order data, using as the end date the last OrderDate in Orders.

SELECT *
FROM orders;

SELECT MAX(OrderDate) AS LastOrderDate
FROM Orders;

SELECT ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate BETWEEN DATE_SUB((SELECT MAX(OrderDate) FROM Orders), INTERVAL 1 YEAR) AND (SELECT MAX(OrderDate) FROM Orders)
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3;


