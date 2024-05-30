-- Triggers and Events
-- Trigger: when someone will update data in salary, it will
-- automatically update in dempgraphics

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$ -- IT WILL HELP US WITH MULTIPLE QUERIES
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary -- read about BEFORE
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'John', 'John', 'Executive', 60000, NULL);

-- EVENTS
-- An EVENT happen when a TRIGGER takes place
-- EVENT takes place when it is schduled

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retireee
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
	WHERE age > 60;
END $$
DELIMITER :

SHOW VARIABLES LIKE 'event%';
