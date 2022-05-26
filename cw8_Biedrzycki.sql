--ZAD.1
CREATE FUNCTION fun_Fibonacci(@max int)
RETURNS @liczby TABLE(number_fib int)
AS
BEGIN
	Declare @n1 int = 0,@n2 int = 1,@i int = 0,@temp int
	Insert Into @liczby Values(@n1),(@n2)
	WHILE (@i<=@max-2)
	BEGIN 
		Insert Into @liczby Values(@n2+@n1)
		set @temp = @n2
		Set @n2 = @n2 + @n1
		Set @n1 = @temp
		Set @i += 1
	END	
	RETURN 
END

SELECT * from dbo.fun_Fibonacci(15)

--ZAD.2

USE AdventureWorks2019
GO
CREATE TRIGGER TriggerUpperLetters
ON Person.Person
AFTER INSERT
AS
BEGIN
UPDATE Person.Person SET Person.LastName = UPPER(Person.LastName) WHERE LastName IN (SELECT LastName FROM INSERTED)
END

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())

INSERT INTO Person.Person (BusinessEntityID,FirstName,MiddleName,LastName,PersonType) VALUES (20778,'Adam','Mikolaj','Biedrzycki','SC')
GO

SELECT * FROM Person.BusinessEntity
SELECT * FROM Person.Person

--zad3

CREATE TRIGGER taxCHECK
ON Sales.SalesTaxRate
AFTER INSERT ,UPDATE , DELETE
AS
BEGIN
DECLARE @NewTaxRate int, @TaxRate int
SELECT @NewTaxRate = TaxRate FROM inserted SalesTaxRate
SELECT @TaxRate = TaxRate FROM deleted
IF @NewTaxRate > 1.3* @TaxRate
PRINT 'KOMUNIKAT O B£ÊDZIE'
END


SELECT * FROM Sales.SalesTaxRate;


UPDATE Sales.SalesTaxRate 
set TaxRate =  10.00
where SalesTaxRateID = 9;

