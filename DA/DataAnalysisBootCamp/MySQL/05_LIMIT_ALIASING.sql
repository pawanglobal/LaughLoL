-- LIMIT & ALIASING

-- LIMIT
-- The LIMIT clause in SQL is used to specify the maximum number of rows that the result set should return

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3, 1;

-- ALIASING

SELECT gender, AVG(age) as Avg_age
FROM employee_demographics
GROUP BY gender
HAVING Avg_age > 40;


-- More practice

SELECT dept_id, AVG(salary) as Avg_salary
FROM employee_salary
GROUP BY dept_id
ORDER BY dept_id
LIMIT 3, 1;

-- This query skips the first 5 rows and then returns the next 10 rows from the result set.

SELECT salary, AVG(salary) OVER () as Avg_salary
FROM employee_salary
LIMIT 10 OFFSET 5;