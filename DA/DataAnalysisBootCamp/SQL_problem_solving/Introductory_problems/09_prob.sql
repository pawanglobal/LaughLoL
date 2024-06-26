-- Now, instead of just wanting to return all the orders from France of
-- Belgium, we want to show all the orders from any Latin American
-- country. But we don’t have a list of Latin American countries in a table
-- in the Northwind database. So, we’re going to just use this list of Latin
-- American countries that happen to be in the Orders table:
-- Brazil
-- Mexico
-- Argentina
-- Venezuela
-- It doesn’t make sense to use multiple Or statements anymore, it would
-- get too convoluted. Use the In statement

SELECT OrderID, CustomerID, ShipCountry
FROM northwind.orders
WHERE ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');