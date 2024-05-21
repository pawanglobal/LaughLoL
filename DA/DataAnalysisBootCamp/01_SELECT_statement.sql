SELECT *
FROM employee_demographics;

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
age,
gender
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
age,
age + 10,
gender
FROM parks_and_recreation.employee_demographics;

#PEMDAS

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;