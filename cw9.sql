--Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki
--pracownika oraz jego danych, a nast�pnie zapisze je do tabeli tymczasowej
--TempEmployeeInfo. Rozwi�� w oparciu o AdventureWorks.

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

-- Uzyskaj informacje na temat przychod�w ze sprzeda�y wed�ug firmy i kontaktu (za pomoc�
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

--Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w.
--Wykorzystaj CTE i baz� AdventureWorksLT.--Zad. 3USE AdventureWorksLT2019GOWITH Cate_SaleValAS(SELECT SalesLT.ProductCategory.Name, UnitPrice, OrderQtyFROM SalesLT.ProductCategoryINNER JOIN SalesLT.ProductON SalesLT.ProductCategory.ProductCategoryID = SalesLT.Product.ProductCategoryIDINNER JOIN SalesLT.SalesOrderDetailON SalesLT.Product.ProductID = SalesOrderDetail.ProductID)SELECT Name AS Category, Sum(OrderQty * UnitPrice) AS SalesValueFROM Cate_SaleValGROUP BY Name