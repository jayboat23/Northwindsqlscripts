--- USE Northwind
---Who are our customers in North America?

SELECT CustomerID, ContactName, Country
FROM dbo.Customers
WHERE Country = 'USA' or Country = 'Mexico' or Country = 'Canada'

---What orders were placed in April, 1998?

SELECT OrderID, OrderDate
FROM dbo.Orders
 WHERE OrderDate Between '19980401' and '19980430'

 ---What sauces do we sell?

 SELECT ProductName, ProductID
 FROM dbo.Products
 WHERE ProductName LIKE '%Sauce'

 ---You sell some kind of dried fruit that I liked very much. What is its name?

 SELECT ProductName, ProductID, CategoryID
 FROM dbo.Products
 WHERE ProductName LIKE '%Dried%'
 Order by ProductName

 ---What employees ship products to Germany in December?

 SELECT ShipCountry, ShippedDate, EmployeeID
 FROM dbo.Orders
 WHERE  Month(ShippedDate) = 12
	 AND (ShipCountry) = 'Germany'
 Order by EmployeeID
  
 ---We have an issue with product 19. I need to know the total amount and the net amount of all orders for product 19 where the customer took a discount.

 SELECT ProductID, Quantity,UnitPrice as net,(UnitPrice*Quantity) as TotalPrice
 From dbo.[Order Details]
 Where (ProductID = 19
 and Discount <=.01);

 ---I need a list of employees by title, first name, and last name, with the employee’s position under their names, and a line separating each employee.
 
 select FirstName, LastName, Title, TitleOfCourtesy
 From dbo.Employees

 --- I need a list of our customers and the first name only of the customer representative.

 select ContactName,ContactTitle
 From dbo.Customers
 Where ContactName like '%'
 Order by ContactName 