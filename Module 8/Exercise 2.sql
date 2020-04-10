USE AdventureWorks2016CTP3;
GO

CREATE VIEW Sales.NewCustomer
AS
SELECT CustomerID, FirstName, LastName 
FROM Sales.CustomerPII;
GO

INSERT INTO Sales.NewCustomer
VALUES
(10001,'Ed', 'Kish'),
(10002, 'Kermit', 'Albritton');
GO

SELECT * FROM Sales.NewCustomer 
ORDER BY CustomerID
