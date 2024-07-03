-- In the Customers table, show the total number of customers per Country
-- and City.

SELECT 
    Country,
    City,
    COUNT(*) AS TotalCustomers
FROM 
    Customers
GROUP BY 
    Country, 
    City
ORDER BY
   TotalCustomers DESC;
