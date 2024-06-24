-- We’d like to see just the FirstName, LastName, and HireDate of all the
-- employees with the Title of Sales Representative. Write a SQL statement that returns only those employees

SELECT FirstName, LastName, HireDate
FROM northwind.employees
WHERE Title = 'Sales Representative';
