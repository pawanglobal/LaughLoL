SELECT  FirstName, LastName, Title, BirthDate
FROM employees
ORDER BY BirthDate;

-- In the output of the query above, showing the Employees in order of
-- BirthDate, we see the time of the BirthDate field, which we don’t want.
-- Show only the date portion of the BirthDate field

SELECT FirstName, LastName, Title, BirthDate, DATE(birthdate) AS birthdate
FROM northwind.employees;


-- MySQL doesn't support convert function
-- Select
-- FirstName
-- ,LastName
-- ,Title
-- ,DateOnlyBirthDate = convert(date, BirthDate)
-- From Employees
-- Order By Birthdate;