-- We want to send all of our high-value customers a special VIP gift.
-- We're defining high-value customers as those who've made at least 1
-- order with a total value (not including the discount) equal to $10,000 or
-- more. We only want to consider orders made in the year 2016

SELECT 
    c.CustomerID, 
    c.CompanyName, 
    SUM(UnitPrice * Quantity) AS TotalPurchase, 
    YEAR(o.OrderDate) AS OrderYear
FROM 
    customers c 
LEFT JOIN 
    orders o ON c.CustomerID = o.CustomerID
LEFT JOIN 
    orderdetails od ON o.OrderID = od.OrderID
LEFT JOIN 
    products p ON od.ProductID = p.ProductID
WHERE 
    YEAR(o.OrderDate) = 1994
GROUP BY 
    c.CustomerID, c.CompanyName, YEAR(o.OrderDate)
HAVING 
    TotalPurchase >= 10000.000
ORDER BY 
    c.CompanyName;

-- ALTERNATIVE

SELECT
    Customers.CustomerID,
    Customers.CompanyName,
    Orders.OrderID,
    SUM(orderdetails.Quantity * orderdetails.UnitPrice) AS TotalOrderAmount
FROM
    Customers
JOIN
    Orders ON Orders.CustomerID = Customers.CustomerID
JOIN
    orderdetails ON Orders.OrderID = orderdetails.OrderID
WHERE
    Orders.OrderDate >= '1994-01-01' AND Orders.OrderDate < '1995-01-01'
GROUP BY
    Customers.CustomerID,
    Customers.CompanyName,
    Orders.OrderID
ORDER BY
    TotalOrderAmount DESC;