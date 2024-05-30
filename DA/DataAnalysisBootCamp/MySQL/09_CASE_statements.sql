-- CASE statements

SELECT first_name, 
last_name, 
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age > 50 THEN 'On Death Bed'
END age_bracket
FROM employee_demographics;

-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus
SELECT first_name, 
last_name, 
salary,
dept_id,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
    
END new_slary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END bonus
FROM employee_salary;