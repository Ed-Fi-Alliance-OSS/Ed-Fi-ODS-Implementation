IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'nmped')
EXEC sys.sp_executesql N'CREATE SCHEMA [nmped]'
GO
