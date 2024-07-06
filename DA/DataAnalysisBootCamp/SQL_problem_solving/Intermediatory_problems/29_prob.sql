-- We're doing inventory, and need to show information like the below, for
-- all orders. Sort by OrderID and Product ID.

-- EmployeeID LastName OrderID ProductName Quantity
-- The columns we need to show

SELECT e.EmployeeID, e.LastName, o.OrderID, p.ProductName, od.Quantity
FROM employees e
LEFT JOIN orders o
  ON e.EmployeeID = o.EmployeeID
LEFT JOIN orderdetails od
  ON o.OrderID = od.OrderID
LEFT JOIN products p 
  ON od.ProductID = p.ProductID
ORDER BY o.OrderID, p.ProductID;


-- Alternative

SELECT e.EmployeeID, e.LastName, o.OrderID, p.ProductName, od.Quantity
FROM employees e
LEFT JOIN orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN orderdetails od ON o.OrderID = od.OrderID
LEFT JOIN products p ON od.ProductID = p.ProductID

UNION

SELECT e.EmployeeID, e.LastName, o.OrderID, p.ProductName, od.Quantity
FROM orders o
RIGHT JOIN employees e ON e.EmployeeID = o.EmployeeID
RIGHT JOIN orderdetails od ON o.OrderID = od.OrderID
RIGHT JOIN products p ON od.ProductID = p.ProductID

ORDER BY OrderID, ProductName;

-- Alternative

SELECT COALESCE(e.EmployeeID, o.EmployeeID) AS EmployeeID, 
       e.LastName, 
       COALESCE(o.OrderID, 0) AS OrderID, 
       p.ProductName, 
       COALESCE(od.Quantity, 0) AS Quantity,
       COALESCE(od.ProductID, 0) AS ProductID
FROM employees e
LEFT JOIN orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN orderdetails od ON o.OrderID = od.OrderID
LEFT JOIN products p ON od.ProductID = p.ProductID

UNION

SELECT COALESCE(e.EmployeeID, o.EmployeeID) AS EmployeeID, 
       e.LastName, 
       COALESCE(o.OrderID, 0) AS OrderID, 
       p.ProductName, 
       COALESCE(od.Quantity, 0) AS Quantity,
       COALESCE(od.ProductID, 0) AS ProductID
FROM orders o
RIGHT JOIN employees e ON e.EmployeeID = o.EmployeeID
RIGHT JOIN orderdetails od ON o.OrderID = od.OrderID
RIGHT JOIN products p ON od.ProductID = p.ProductID

ORDER BY OrderID, ProductID;




-- Tables we need -> employees.EmployeeID, employees.LastName, products.ProductName, products.Quantity, orders.OrderID
-- Let's do inner join to show these columns