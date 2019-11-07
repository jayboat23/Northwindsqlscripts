--Create a report that shows the product name and supplier id for all products supplied by Exotic Liquids, Grandma Kelly’s Homestead, and Tokyo Traders.

select p.ProductName, S.SupplierID, S.CompanyName
from dbo.Suppliers as S
join dbo.Products as p
on S.SupplierID = p.SupplierID
Where S.CompanyName like '%Exotic Liquids%'
or S.CompanyName like '%Grandma Kelly’s Homestead%'
or S.CompanyName like '%Tokyo Traders%';

---Create a report that shows all products by name that are in the Seafood category.

select P.ProductName, C.CategoryName, C.Description
From dbo.Categories as C
 join dbo.Products as P
on C.CategoryID = P.CategoryID
Where C.CategoryName like 'Seafood%'
order by C.CategoryName;

---Create a report that shows all companies by name that sell products in CategoryID 8
select C.CategoryID, C.Description, C.CategoryName, P.ProductName
from dbo.Suppliers as S
Join dbo.Products as P
on S.SupplierID = P.SupplierID
Join dbo.Categories as C
on P.CategoryID = C.CategoryID
where C.CategoryID = N'8';

---Create a report that shows all companies by name that sell products in the Seafood category.
select C.CategoryID, C.Description, C.CategoryName, P.ProductName, S.CompanyName
from dbo.Suppliers as S
Join dbo.Products as P
on S.SupplierID = P.SupplierID
Join dbo.Categories as C
on P.CategoryID = C.CategoryID
where C.CategoryID = N'8'
order by S.CompanyName;

---Create a report that lists the ten most expensive products.

Select TOP(10)P.UnitPrice, P.ProductName, D.OrderID
From dbo.Products as P
Join dbo.[Order Details] as D
on P.ProductID = D.ProductID    
order by  D.UnitPrice desc;

--or 


SELECT TOP(10) UnitPrice, ProductName
FROM dbo.Products
ORDER BY UnitPrice DESC;

SELECT TOP(10) UnitPrice, ProductName
FROM dbo.Products
WHERE ProductName IN (SELECT P.ProductName
					FROM dbo.Products AS P)
ORDER BY UnitPrice DESC;

---Create a report that shows the date of the last order by all employees.

SELECT E.EmployeeID, MAX(O.orderdate) AS latestorder
FROM dbo.Employees as E
JOIN dbo.Orders as O
	ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID
ORDER BY E.EmployeeID, latestorder;

SELECT O.EmployeeID, MAX(O.OrderDate) AS latestorder
FROM dbo.Orders as O
WHERE O.EmployeeID = (SELECT E.EmployeeID
						FROM dbo.Employees AS E
						WHERE E.EmployeeID = O.EmployeeID)
GROUP BY O.EmployeeID
ORDER BY O.EmployeeID, latestorder;
---------