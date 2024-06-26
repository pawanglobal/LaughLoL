-- For all the employees in the Employees table, show the FirstName,
-- LastName, Title, and BirthDate. Order the results by BirthDate, so we
-- have the oldest employees first

SELECT  FirstName, LastName, Title, BirthDate
FROM employees
ORDER BY BirthDate;
