-- How many customers do we have in the Customers table? Show one
-- value only, and don’t rely on getting the recordcount at the end of a
-- resultset

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- This query will return a single row with a single column named TotalCustomers that contains the total 
-- number of customers in the Customers table. This approach ensures you get the count directly in the 
-- result set, not as a separate message or record count after the query execution.