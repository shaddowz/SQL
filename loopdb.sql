
 
  --make a temptable WITH all the databases that are online
--SELECT au_SQLDatabaseName, au_ID INTO #tempRJ
--  FROM [SysData].[dbo].[tbl_Audits]
--WHERE au_StatementsPriority <> 999
--AND au_active = 1

 --make a temptable WITH all the databases that are online
 DROP TABLE IF EXISTS #tempRJ
  DROP TABLE IF EXISTS #tempRJ2

  SELECT name AS [dbname]
  INTO #tempRJ
  FROM master.sys.databases 
  WHERE name LIKE '%shaddowz%' OR name LIKE '%AdventureWorks2017%'

  
--create a temp table to store all the things
create table #temprj2
(
dbname nvarchar(255),
--inQueryVar1 int,
ShouldGoIn int,
ShouldGoOut int,
Corrected int
);
DECLARE @db NVARCHAR(255)
DECLARE @cmd NVARCHAR(4000)
-- DECLARE @inQueryVar1 NVARCHAR(255)

While (SELECT COUNT(*) FROM #tempRJ) > 0

BEGIN
  SELECT TOP 1 @db = dbname FROM #tempRJ

 -- SET @auid = (SELECT au_id FROM #tempRJ WHERE au_SQLDatabaseName = @db)
  SET @cmd = '

  SELECT Count(*) From [''' +@db+ '''].dbo.A1

  ' 

