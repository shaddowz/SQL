USE [AdventureWorks2017]
GO

/****** Object:  UserDefinedFunction [dbo].[zoek]    Script Date: 12/2/2018 9:00:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--- use: SELECT * FROM ZOEK ('columnname')
CREATE FUNCTION [dbo].[zoek] (@name NVARCHAR(255))
RETURNS TABLE
AS 

RETURN


SELECT COLUMNS.NAME AS ColumnName, TABLES.NAME  AS TableName
FROM sys.COLUMNS 
INNER JOIN sys.TABLES ON TABLES.OBJECT_ID = COLUMNS.OBJECT_ID
WHERE COLUMNS.NAME LIKE '%' + @name + '%' 
GO


