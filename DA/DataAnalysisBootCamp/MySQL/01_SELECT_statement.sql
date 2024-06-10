-- To see all the data
-- First way to see it

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- SELECT statement with more specifity
-- To select all the data

SELECT *
FROM parks_and_recreation.employee_demographics;

-- To select one column

SELECT first_name
FROM parks_and_recreation.employee_demographics;

SELECT last_name
FROM employee_demographics;

-- To select Multiple columns

SELECT first_name,
age,
gender
FROM parks_and_recreation.employee_demographics;

-- Playing with the data of colums with SELECT statement

SELECT first_name,
age,
age + 10,
gender
FROM parks_and_recreation.employee_demographics;

-- PEMDAS
-- How mathematical operations work in SQL

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

-- Analyze this query
-- Age is not getting affected by gneder

SELECT DISTINCT gender, age
FROM parks_and_recreation.employee_demographics;
