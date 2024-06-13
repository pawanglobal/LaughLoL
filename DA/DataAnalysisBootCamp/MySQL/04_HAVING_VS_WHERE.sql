-- HAVING VS WHERE
-- WHERE we use before grouping
-- HAVING after grouping on aggregated functions

SELECT *
FROM employee_demographics;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
Having AVG(salary) > 50000;

-- More Practice
SELECT dept_id, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY dept_id
HAVING AVG(salary) BETWEEN 25000 AND 60000;

SELECT *
FROM parks_and_recreation.employee_salary;


-- The HAVING clause should come after the GROUP BY clause but before the ORDER BY clause.

SELECT dept_id, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_salary
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING AVG(salary) > 20000
ORDER BY avg_salary DESC;


