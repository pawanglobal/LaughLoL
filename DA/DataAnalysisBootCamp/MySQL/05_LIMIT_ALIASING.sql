-- LIMIT & ALIASING

-- LIMIT

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3, 1;

-- ALIASING

SELECT gender, AVG(age) as Avg_age
FROM employee_demographics
GROUP BY gender
HAVING Avg_age > 40;
