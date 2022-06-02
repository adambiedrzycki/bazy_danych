--Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki
--pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej
--TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.

--Zad. 1

USE AdventureWorks2019
GO
WITH TempEmployeeInfo
AS(
SELECT BusinessEntityID, Rate FROM
HumanResources.EmployeePayHistory)
SELECT Person.*
FROM Person.Person
INNER JOIN HumanResources.EmployeePayHistory
ON Person.Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID

-- Uzyskaj informacje na temat przychodów ze sprzeda¿y wed³ug firmy i kontaktu (za pomoc¹
-- CTE i bazy AdventureWorksL).

--Zad. 2

USE AdventureWorksLT2019
GO
WITH COMP_REVE
AS(
SELECT FirstName, LastName, CompanyName, TotalDue
FROM SalesLT.Customer
INNER JOIN SalesLT.SalesOrderHeader
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID)
SELECT (CompanyName + '(' + FirstName + ' ' + LastName + ')')
AS CompanyContact, TotalDue AS Revenue
FROM COMP_REVE
ORDER BY CompanyContact

--Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów.
--Wykorzystaj CTE i bazê AdventureWorksLT.--Zad. 3USE AdventureWorksLT2019GOWITH Cate_SaleValAS(SELECT SalesLT.ProductCategory.Name, UnitPrice, OrderQtyFROM SalesLT.ProductCategoryINNER JOIN SalesLT.ProductON SalesLT.ProductCategory.ProductCategoryID = SalesLT.Product.ProductCategoryIDINNER JOIN SalesLT.SalesOrderDetailON SalesLT.Product.ProductID = SalesOrderDetail.ProductID)SELECT Name AS Category, Sum(OrderQty * UnitPrice) AS SalesValueFROM Cate_SaleValGROUP BY Name