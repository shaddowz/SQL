USE [master]
GO
/****** Object:  StoredProcedure [dbo].[loop]    Script Date: 12/2/2018 11:59:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[loop] 

  AS 

  --make a temptable WITH all the databases that are online
--SELECT au_SQLDatabaseName, au_ID INTO #tempRJ
--  FROM [SysData].[dbo].[tbl_Audits]
--WHERE au_StatementsPriority <> 999
--AND au_active = 1

 --make a temptable WITH all the databases that are online
 DROP TABLE IF EXISTS #databaseList
 DROP TABLE IF EXISTS #tempRJ2

  SELECT name AS [dbname]
  INTO #tempRJ
  FROM master.sys.databases 
  WHERE name LIKE '%shaddowz%' OR name LIKE '%AdventureWorks2017%'

  
--create a temp table to store all the things
create table #temprj2
(
dbname nvarchar(255),
--auid int,
);
DECLARE @db NVARCHAR(255)
DECLARE @cmd NVARCHAR(4000)
-- DECLARE @inQueryVar1 NVARCHAR(255)

While (SELECT COUNT(*) FROM #tempRJ) > 0

BEGIN
  SELECT TOP 1 @db = dbname FROM #tempRJ

 -- SET @auid = (SELECT au_id FROM #tempRJ WHERE au_SQLDatabaseName = @db)
  SET @cmd = '

  SELECT Count(*) as [HowMany from '+@db+'] From [' +@db+ '].dbo.A1
  where [a] = ''a'' 
  --WHERE au_SQLDatabasename = '''+@db+'''
  ' 

  print @cmd --see the query IN the messages windows, if you run it
  EXEC(@cmd) --execute the query
  /*done WITH table, remove FROM temp table to decrement loop*/
  DELETE FROM #tempRJ WHERE dbname = @db
END
 

--SELECT * FROM #temprj2
--drop table #tempRJ
--drop table #temprj2

