-- GROUP BY 
-- AGGREGATED FUNCTIONS AVG, MAX, MIN, COUNT

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT salary, occupation, MAX(salary)
FROM employee_salary
GROUP BY salary, occupation;

-- ORDER BY

SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;
