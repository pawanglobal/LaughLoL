-- JOINS
-- INNER JOIN
-- The INNER JOIN keyword selects records that have matching values in both tables

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
-- Only JOIN works as INNER JOIN

SELECT *
FROM employee_demographics dem 
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOINS
--  There are three types of OUTER JOINs: LEFT OUTER JOIN (or simply LEFT JOIN), 
-- RIGHT OUTER JOIN (or simply RIGHT JOIN), 
-- and FULL OUTER JOIN


-- LEFT JOIN
-- Return all rows from the left table and the matched rows from the right table

SELECT dem.employee_id, age, occupation
FROM employee_demographics dem 
LEFT JOIN employee_salary sal # or we can use LEFT OUTER JOIN
	ON dem.employee_id = sal.employee_id
;

-- RIGHT JOIN
-- Return all rows from the right table and the matched rows from the left table

SELECT *
FROM employee_demographics dem 
RIGHT JOIN employee_salary sal # or we can use RIGHT OUTER JOIN
	ON dem.employee_id = sal.employee_id
;

-- FULL OUTER JOIN
-- It returns all records from both tables, filling in NULL where there is no match


-- SELF JOIN
-- A SELF JOIN is a join where a table is joined with itself. 
-- This can be useful when you need to compare rows within the same table.
-- Or when the table has a hierarchical structure, such as an organizational chart where employees report to other employees.

SELECT emp1.employee_id AS emp_santa, emp1.occupation, emp1.salary,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_id,
emp2.first_name AS first_name_empl,
emp2.last_name AS last_name_empl
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


-- More Practice

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

SELECT 
    emp1.employee_id AS emp_santa,
    emp1.occupation,
    emp1.salary,
    emp1.first_name AS first_name_santa,
    emp1.last_name AS last_name_santa,
    emp2.employee_id AS emp_id,
    emp2.first_name AS first_name_empl,
    emp2.last_name AS last_name_empl
FROM 
    employee_salary emp1
JOIN 
    employee_salary emp2 ON emp1.employee_id = emp2.employee_id + 1;