--- what are the regions?

Select*
FROM dbo.Region;

---What are the cities?

SELECT*
FROM dbo.Territories;

---What are the cities in the Southern region?

SELECT*
FROM dbo.Territories
WHERE RegionID = 4

---How do you run this query with the fully qualified column name?

SELECT TerritoryID, TerritoryDescription,
case RegionID
WHEN  1 THEN 'Eastern'
WHEN  2 THEN 'Western'
WHEN  3 THEN 'Northern'
WHEN  4 THEN 'Southern'
END AS RegionDescription
FROM dbo.Territories;

---How do you run this query with a table alias?

SELECT TerritoryID AS " City ID", TerritoryDescription AS "CITY NAME",
case RegionID
WHEN  1 THEN 'Eastern'
WHEN  2 THEN 'Western'
WHEN  3 THEN 'Northern'
WHEN  4 THEN 'Southern'
END AS RegionDescription
FROM dbo.Territories;

---What is the contact name, telephone number, and city for each customer?

SELECT ContactName, Phone, City
FROM dbo.Customers;

---What are the products currently out of stock?

SELECT*
FROM dbo.Products
WHERE UnitsInStock = 0;

---What are the ten products currently in stock with the least amount on hand?

SELECT Top(10)ProductName, UnitsInStock
FROM dbo.Products
WHERE UnitsInStock >0
Order by UnitsINStock;


---What are the five most expensive products in stock?

SELECT Top(5)ProductName, UnitsInStock, UnitPrice
FROM dbo.Products
WHERE UnitsInStock >0
ORDER by UnitPrice
desc;

---How many products does Northwind have? How many customers? How many suppliers?


SELECT DISTINCT Count('ProductName') AS Product
From dbo.Products
SELECT DISTINCT Count ('CustomerID') AS Customer
From dbo.Customers;
SELECT DISTINCT Count ('SupplierID') AS Supplier
FROM dbo.Suppliers












