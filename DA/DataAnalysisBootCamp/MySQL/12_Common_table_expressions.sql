-- CTEs COMMON TABLE EXPRESSIONS

WITH CTE_example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)

-- same output with SUBQUERY, little messy

SELECT *
FROM CTE_example
;

SELECT AVG(avg_sal)
FROM
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) AS Subquery_example
;

-- MULTIPLE CTEs and JOINING

WITH CTE_example AS
(
SELECT employee_id, first_name, last_name, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1986-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 40000
)
SELECT *
FROM CTE_example
JOIN CTE_example2
	ON CTE_example.employee_id = CTE_example2.employee_id
;

-- Playing with ALIAS
-- See line 54

WITH CTE_example (Gender, Avg_sal, Max_sal, Min_sal, Count_sal) AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_example
;