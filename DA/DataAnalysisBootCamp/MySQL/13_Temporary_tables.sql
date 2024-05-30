-- Temporary Tables
-- CREATE TABLE is permanent table

CREATE TEMPORARY TABLE temp_table
(First_name varchar(50),
Last_name varchar(50),
Faovorite_movie varchar(50));

INSERT INTO temp_table
VALUES( 'John', 'John', 'The Social Network');

SELECT *
FROM temp_table;

-- creating a TEMPORARY TABLE from an existing TABLE

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM salary_over_50k;