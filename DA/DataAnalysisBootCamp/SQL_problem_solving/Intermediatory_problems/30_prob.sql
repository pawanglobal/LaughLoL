-- There are some customers who have never actually placed an order.
-- Show these customers

SELECT c.CustomerID, o.CustomerID
FROM customers c
LEFT JOIN orders o 
  ON c.CustomerID = o.CustomerID
  WHERE o.CustomerID IS NULL;