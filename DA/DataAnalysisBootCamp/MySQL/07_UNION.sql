-- UNION
-- by default UNION IS DISTINCT
-- or use UNION ALL

SELECT first_name, last_name, 'Old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'Old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'highly paid employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;