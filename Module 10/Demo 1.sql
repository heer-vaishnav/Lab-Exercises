USE tempdb;
GO

--Using DATEADD function

CREATE FUNCTION dbo.EndOfPreviousMonth (@DateToTest date)
RETURNS date
AS BEGIN
  RETURN DATEADD(day, 0 - DAY(@DateToTest), @DateToTest);
END;
GO

SELECT dbo.EndOfPreviousMonth(SYSDATETIME());
SELECT dbo.EndOfPreviousMonth('2017-06-01');
GO

SELECT OBJECTPROPERTY(OBJECT_ID('dbo.EndOfPreviousMonth'),'IsDeterministic');
GO

DROP FUNCTION dbo.EndOfPreviousMonth;
GO

--Using EOMONTH function

CREATE FUNCTION dbo.EndOfPreviousMonth (@DateToTest date)
RETURNS date
AS BEGIN
  RETURN EOMONTH ( dateadd(month, -1, @DateToTest ));
END;
GO

SELECT dbo.EndOfPreviousMonth(SYSDATETIME());
SELECT dbo.EndOfPreviousMonth('2020-03-01');
GO

DROP FUNCTION dbo.EndOfPreviousMonth;
GO
