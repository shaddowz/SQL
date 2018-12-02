USE [AdventureWorks2017]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[bsn](@in INT)
RETURNS INT
AS BEGIN
    DECLARE @x INT;
    DECLARE @y INT;
    DECLARE @bsn INT=@in;
    SET @x=11-(@bsn % 10);-- the check digit
    SET @y=1;
    WHILE(@bsn>0)BEGIN
        SET @bsn=FLOOR(@bsn / 10);
        SET @y=@y+1;
        SET @x=@x+(@bsn % 10)* @y;
    END;
    IF(@y<9)BEGIN
RETURN 13;
    END; 
    RETURN @x % 11;
END;
GO


