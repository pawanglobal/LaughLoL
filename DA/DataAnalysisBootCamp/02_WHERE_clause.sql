-- WHERE CLAUSE

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'Tom';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age > 40 ;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age != 40 ;

-- AND and OR Logical operaors
-- IS NOT
-- We can make complex queries with these operators

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age > 40 and first_name = 'April' ;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male';

-- Like statement
-- % and __ = "This is like value" : operators

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name Like 'A%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name Like 'A____';