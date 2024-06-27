-- In the OrderDetails table, we have the fields UnitPrice and Quantity.
-- Create a new field, TotalPrice, that multiplies these two together. We’ll
-- ignore the Discount field for now.
-- In addition, show the OrderID, ProductID, UnitPrice, and Quantity.
-- Order by OrderID and ProductID.

SELECT OrderID, ProductID, UnitPrice, Quantity,
Round(UnitPrice*Quantity, 2) AS TotalPrice
FROM northwind.`order details`