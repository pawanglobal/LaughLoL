-- Another (incorrect) answer to the problem above is this:
--  Select Top 3
--  ShipCountry
--  ,AverageFreight = avg(freight)
--  Where
--  OrderDate between '1/1/2015' and '12/31/2015'
--  Group By ShipCountry
--  Order By AverageFreight desc;
-- third highest freight charges. However, this is wrong - it should be
-- France.
-- What is the OrderID of the order that the (incorrect) answer above is
-- missing?

SELECT *
FROM orders;

SELECT OrderID, Freight, OrderDate
FROM Orders
WHERE OrderDate >= '1995-12-31 00:00:00' AND OrderDate < '1996-01-01 00:00:00'
ORDER BY Freight DESC
LIMIT 1;

SELECT OrderID, Freight, OrderDate, ShipCountry
FROM Orders
WHERE OrderDate BETWEEN '1995-12-31 00:00:00' AND '1995-12-31 23:59:59'
ORDER BY Freight DESC
LIMIT 1;



