-- JOINS
-- INNER JOIN

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOIN

SELECT *
FROM employee_demographics AS dem # we can miss AS it is default
INNER JOIN employee_salary AS sal # we can miss the INNER, because it is default
	ON dem.employee_id = sal.employee_id
;

-- if there are common columns in both tables then 
-- specify which one you want to use

SELECT *
FROM employee_demographics dem 
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOINS

-- LEFT JOIN

SELECT dem.employee_id, age, occupation
FROM employee_demographics dem 
LEFT JOIN employee_salary sal # or we can use LEFT OUTER JOIN
	ON dem.employee_id = sal.employee_id
;

-- RIGHT JOIN

SELECT *
FROM employee_demographics dem 
RIGHT JOIN employee_salary sal # or we can use RIGHT OUTER JOIN
	ON dem.employee_id = sal.employee_id
;

-- SELF JOIN

SELECT emp1.employee_id AS emp_santa, emp1.occupation, emp1.salary,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_id,
emp2.first_name AS first_name_empl,
emp2.first_name AS last_name_empl
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
-- Joining multiple tables

SELECT *
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments;

