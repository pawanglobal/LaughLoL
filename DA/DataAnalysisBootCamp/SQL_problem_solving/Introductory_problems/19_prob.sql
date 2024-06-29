-- We’d like to show a list of the Orders that were made, including the
-- Shipper that was used. Show the OrderID, OrderDate (date only), and
-- CompanyName of the Shipper, and sort by OrderID.
-- In order to not show all the orders (there’s more than 800), show only
-- those rows with an OrderID of less than 10300

SELECT OrderID, CONVERT(OrderDate, DATE), CompanyName
FROM orders o
JOIN shippers s 
  ON o.ShipVia = s.ShipperID
WHERE OrderID < 10300
ORDER BY OrderID;