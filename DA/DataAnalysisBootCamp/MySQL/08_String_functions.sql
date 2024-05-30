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
