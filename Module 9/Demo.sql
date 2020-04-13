--DEMO 1

EXEC sp_configure;
GO

EXEC xp_dirtree "D:\DemoFiles\Mod09",0,1;
GO

--DEMO 2

CREATE PROC Production.GetBlueProducts 
AS
SET NOCOUNT ON;
BEGIN
  SELECT p.ProductID,p.Name,p.Size,p.ListPrice 
  FROM Production.Product AS p
  WHERE p.Color = N'Blue' ORDER BY p.ProductID;
END;
GO

EXEC Production.GetBlueProducts;
GO

CREATE PROC Production.GetBlueProductsAndModels
AS
SET NOCOUNT ON;
BEGIN
  SELECT p.ProductID,p.Name,p.Size,p.ListPrice 
  FROM Production.Product AS p WHERE p.Color = N'Blue'
  ORDER BY p.ProductID;
  
  SELECT p.ProductID,pm.ProductModelID,pm.Name AS ModelName
  FROM Production.Product AS p
  INNER JOIN Production.ProductModel AS pm
  ON p.ProductModelID = pm.ProductModelID 
  ORDER BY p.ProductID, pm.ProductModelID;
END;
GO

EXEC Production.GetBlueProductsAndModels;
GO

ALTER PROC Production.GetBlueProductsAndModels
AS
SET NOCOUNT ON;
BEGIN
  SELECT p.ProductID,p.Name,p.Size,p.ListPrice 
  FROM Production.Product AS p WHERE p.Color = N'Blue'
  ORDER BY p.ProductID;
  
  SELECT p.ProductID,pm.ProductModelID,pm.Name AS ModelName
  FROM Production.Product AS p
  INNER JOIN Production.ProductModel AS pm
  ON p.ProductModelID = pm.ProductModelID 
  WHERE p.Color = N'Blue'
  ORDER BY p.ProductID, pm.ProductModelID;
END;
GO

EXEC Production.GetBlueProductsAndModels;
GO

SELECT SCHEMA_NAME(schema_id) AS SchemaName,
       name AS ProcedureName
FROM sys.procedures;
GO

--DEMO 3

USE tempdb;
GO

CREATE PROC dbo.DisplayExecutionContext
AS
SET NOCOUNT ON;
BEGIN
  SELECT * FROM sys.login_token;
  SELECT * FROM sys.user_token;
END
GO

EXEC dbo.DisplayExecutionContext;
GO

EXECUTE AS User = 'SecureUser';
GO

EXEC dbo.DisplayExecutionContext;
GO

REVERT;
GO

GRANT EXECUTE ON dbo.DisplayExecutionContext TO SecureUser;
GO

EXECUTE AS User = 'SecureUser';
GO

EXEC dbo.DisplayExecutionContext;
GO

REVERT;
GO

ALTER PROC dbo.DisplayExecutionContext
WITH EXECUTE AS OWNER
AS
SET NOCOUNT ON;
BEGIN
  SELECT * FROM sys.login_token;
  SELECT * FROM sys.user_token;
END
GO

EXECUTE AS User = 'SecureUser';
GO

EXEC dbo.DisplayExecutionContext;
GO

REVERT;
GO

DROP PROC dbo.DisplayExecutionContext;
GO