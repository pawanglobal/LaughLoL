-- Show all the orders placed by a specific employee. The EmployeeID for
-- this Employee (Steven Buchanan) is 5

SELECT OrderID, OrderDate
FROM northwind.orders
WHERE EmployeeID = 5;

-- SELECT *
-- FROM northwind.employees emp
--   INNER JOIN northwind.orders ord
--   ON emp.EmployeeID = ord.EmployeeID
--   WHERE emp.EmployeeID = 5;