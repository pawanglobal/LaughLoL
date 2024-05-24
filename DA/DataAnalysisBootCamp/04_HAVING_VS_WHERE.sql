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