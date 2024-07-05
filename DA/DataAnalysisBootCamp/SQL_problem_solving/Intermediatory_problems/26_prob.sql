-- We're continuing on the question above on high freight charges. Now,
-- instead of using all the orders we have, we only want to see orders from
-- the year 2015

SELECT ShipCountry, AVG(Freight) AS AverageFreight
FROM orders
WHERE OrderDate >= '2015-01-01' AND OrderDate < '2016-01-01'
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3;

