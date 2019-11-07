---usinig Northwind

--- What is the order number and the date of each order sold by each employee?

select OrderID, OrderDate, EmployeeID
From dbo.Orders
Order by EmployeeID

--- List each territory by region?
Select T.TerritoryDescription, R.RegionDescription
From dbo.Territories as T
inner join dbo.Region as R
on T.RegionID= R.RegionID
Order by R.RegionDescription

--- What is the supplier name for each product alphabetically by supplier?
Select S.CompanyName, P.ProductName
From dbo.Suppliers as S
inner join dbo.Products as P
on S.SupplierID = P.SupplierID
Order by S.CompanyName asc;

---For every order on May 5, 1998, how many of each item was ordered, and what was the price of the item
Select MAX(O.OrderDate), SUM(D.Quantity),MAX(D.UnitPrice), D.ProductID
From dbo.Orders as O
Inner Join dbo.[Order Details] as D
on O.OrderID = D.OrderID
Where O.Orderdate= '19980505'
Group by D.ProductID
Order by D.ProductID;

---For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and what was the price of the item?
select O.OrderDate, P.ProductName, Sum(D.Quantity) as QTY, P.UnitPrice
From dbo.Products as P
Inner join dbo.[Order Details] as D
on D.ProductID = P.ProductID
Inner join dbo.Orders as O
on O.OrderID = D.OrderID
where O.Orderdate = '19980505'
Group by P.ProductName, P.Unitprice, O.Orderdate

--- For every order in May, 1998, what was the customer’s name and the shipper’s name?
Select C.ContactName, O.ShipName
From dbo.Customers as C
Inner join dbo.Orders as O
on C.CustomerID = O.CustomerID
Where MONTH(O.OrderDate) = 5
and YEAR(O.OrderDate) = 1998


---What is the customer’s name and the employee’s name for every order shipped to France?
Select C.CompanyName, E.FirstName, E.LastName



---- 
