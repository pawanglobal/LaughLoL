-- At the end of the month, salespeople are likely to try much harder to get
-- orders, to meet their month-end quotas. Show all orders made on the last
-- day of the month. Order by EmployeeID and OrderID.

SELECT *
FROM employees;

SELECT
    o.OrderID,
    o.EmployeeID,
    o.CustomerID,
    o.OrderDate,
    e.LastName,
    e.FirstName
FROM
    Orders o
JOIN
    Employees e ON o.EmployeeID = e.EmployeeID
WHERE
    o.OrderDate = LAST_DAY(o.OrderDate)
ORDER BY
    o.EmployeeID,
    o.OrderID;
