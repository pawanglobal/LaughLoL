-- Now we’d like to see the same columns as in 03_prob.sql, but only for those
-- employees that both have the title of Sales Representative, and also are in the United States

SELECT *, FirstName, LastName, HireDate
FROM northwind.employees
WHERE Title = 'Sales Representative' AND Country = 'USA';