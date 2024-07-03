-- For this problem, we’d like to see the total number of products in each
-- category. Sort the results by the total number of products, in descending order

SELECT c.CategoryName,
COUNT(ProductID) AS TotalProducts
FROM categories c
JOIN products p 
  ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalProducts DESC ;


-- Alternative

SELECT
    Categories.CategoryName,
    COUNT(*) AS TotalProducts
FROM
    Products
JOIN
    Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY
    Categories.CategoryName
ORDER BY
    TotalProducts DESC;