-- Show a list of countries where the Northwind company has customers

SELECT Country
FROM northwind.customers
GROUP BY Country;

-- Another way

SELECT DISTINCT country
FROM customers;