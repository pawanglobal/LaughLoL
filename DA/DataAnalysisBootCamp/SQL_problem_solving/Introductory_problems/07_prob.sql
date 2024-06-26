-- In the products table, we’d like to see the ProductID and ProductName
-- for those products where the ProductName includes the string “queso”

SELECT ProductID, ProductName
FROM northwind.products
WHERE ProductName LIKE "%queso%";