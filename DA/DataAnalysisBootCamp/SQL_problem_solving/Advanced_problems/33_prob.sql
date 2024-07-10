-- The manager has changed his mind. Instead of requiring that customers
-- have at least one individual orders totaling $10,000 or more, he wants to
-- define high-value customers as those who have orders totaling $15,000
-- or more in 2016. How would you change the answer to the problem
-- above

SELECT 
    c.CustomerID,
    c.CompanyName,
    SUM(Quantity * UnitPrice) AS TotalOrderAmount
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    orderdetails od ON o.OrderID = od.OrderID
JOIN
    products p ON od.ProductID = p.ProductID
WHERE 
    o.OrderDate >= '1994-01-01' AND o.OrderDate < '1995-01-01'
GROUP BY 
    c.CustomerID,
    c.CompanyName
HAVING 
    SUM(Quantity * UnitPrice) >= 15000
ORDER BY 
    TotalOrderAmount DESC;