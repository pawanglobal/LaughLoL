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

-- More practice

SELECT * 
FROM parks_and_recreation.employee_salary;

-- Select column with the SELECT statement before using GROUP BY

SELECT dept_id, AVG(salary), COUNT(salary)
FROM parks_and_recreation.employee_salary
GROUP BY dept_id;

-- ORDER BY
SELECT *
FROM parks_and_recreation.parks_departments
WHERE (department_id) % 2 = 0 
ORDER BY department_id DESC;

