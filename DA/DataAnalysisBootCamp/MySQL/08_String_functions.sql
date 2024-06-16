-- String functions

-- LENGTH

SELECT LENGTH('JASON');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

-- UPPER
-- LOWER

SELECT UPPER('PAwAN');
SELECT LOWER('HARMESH');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

-- TRIM (FOR WHITE SPACES)

SELECT TRIM('           SKY                ');
SELECT LTRIM('           SKY               '); # LEFT TRIM
SELECT RTRIM('           SKY               '); # RIGHT TRIM

-- SUBSTRING

SELECT first_name, LEFT(first_name, 2)
FROM employee_demographics;

SELECT first_name, 
RIGHT(first_name, 2),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

-- REPLACE

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

-- LOCATE

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

-- CONCAT

SELECT first_name, last_name,
CONCAT(first_name,' ', last_name) AS full_name
FROM employee_demographics;

-- More practice

SELECT *
FROM employee_salary;

-- In SQL, you cannot use an alias defined in the SELECT clause directly in the WHERE clause of the same query because the WHERE clause is evaluated 
-- before the SELECT clause. 
-- However, you can use the alias in the ORDER BY clause because the ORDER BY clause is evaluated after the SELECT clause.
-- To solve this issue, you can either:
-- Repeat the expression in the WHERE clause without using the alias.
-- Use a subquery or a Common Table Expression (CTE) to first compute the alias and then filter the results.

SELECT UPPER(first_name), LOWER(last_name),
occupation, LENGTH(occupation) AS len_occupation,
SUBSTR(first_name, 2, 3)
FROM employee_salary
WHERE LENGTH(occupation) = 14 OR LENGTH(occupation) = 12
ORDER BY len_occupation DESC;





