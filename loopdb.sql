USE [master]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[loop] 

 AS 

 DROP TABLE IF EXISTS #databaseList

  SELECT name AS [dbname]
	--,something as auid
  INTO #databaseList
  FROM master.sys.databases 
  WHERE name LIKE '%shaddowz%' OR name LIKE '%AdventureWorks2017%'

DECLARE @db NVARCHAR(255)
DECLARE @cmd NVARCHAR(4000)
-- DECLARE @auid NVARCHAR(255)

While (SELECT COUNT(*) FROM #databaseList) > 0

BEGIN
  SELECT TOP 1 @db = dbname FROM #databaseList

 -- SET @auid = (SELECT auid FROM #databaseList WHERE dbname = @db)
  SET @cmd = '

  SELECT Count(*) as [HowMany from '+@db+'] From [' +@db+ '].dbo.A1
  where [a] = ''a'' 
  --WHERE auID = '''+@db+'''
  UNION
  ' 

  print @cmd
  EXEC(@cmd) 

  DELETE FROM #databaseList WHERE dbname = @db
END
 
