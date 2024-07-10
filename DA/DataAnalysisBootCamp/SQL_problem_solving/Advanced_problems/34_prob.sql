-- Change the above query to use the discount when calculating high-value
-- customers. Order by the total amount which includes the discount

SELECT
    Customers.CustomerID,
    Customers.CompanyName,
    SUM(`Order Details`.Quantity * `Order Details`.UnitPrice) AS TotalsWithoutDiscount,
    SUM(`Order Details`.Quantity * `Order Details`.UnitPrice * (1 - `Order Details`.Discount)) AS TotalsWithDiscount
FROM
    Customers
    JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    JOIN `Order Details` ON Orders.OrderID = `Order Details`.OrderID
WHERE
    Orders.OrderDate >= '2016-01-01'
    AND Orders.OrderDate < '2017-01-01'
GROUP BY
    Customers.CustomerID,
    Customers.CompanyName
HAVING
    SUM(`Order Details`.Quantity * `Order details`.UnitPrice * (1 - `Order Details`.Discount)) > 10000
ORDER BY
    TotalsWithDiscount DESC;
