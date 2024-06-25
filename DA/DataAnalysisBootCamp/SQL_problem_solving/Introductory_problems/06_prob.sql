-- In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing
-- Manager

SELECT SupplierID, ContactName, ContactTitle
FROM northwind.suppliers
WHERE ContactTitle != 'Marketing Manager';