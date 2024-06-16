-- UNION
-- by default UNION is DISTINCT or use UNION ALL
-- The UNION operator is used to combine the result sets of two or more SELECT statements into a single result set.
-- It removes duplicate rows by default unless UNION ALL is used instead, which retains all rows from all queries, including duplicates

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