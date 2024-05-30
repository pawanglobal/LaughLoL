-- Stored Procedures

SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary;
CALL large_salaries()

-- DELIMITER for multiple PROCEDURE

DELIMITER $$
CREATE PROCEDURE large_salaries_2()
BEGIN
	SELECT *
	FROM employee_salary
    WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;

-- Give us two tables, because two queries

CALL large_salaries_2();

-- Parameters use

DELIMITER $$
CREATE PROCEDURE large_salaries_3(roti INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = roti;
END $$
DELIMITER ;

CALL large_salaries_3(1)
