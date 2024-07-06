-- One employee (Margaret Peacock, EmployeeID 4) has placed the most
-- orders. However, there are some customers who've never placed an order
-- with her. Show only those customers who have never placed an order
-- with her

SELECT c.CustomerID, c.CompanyName
FROM customers c
LEFT JOIN orders o ON c.CustomerID = o.CustomerID AND o.EmployeeID = 4
WHERE o.OrderID IS NULL;
