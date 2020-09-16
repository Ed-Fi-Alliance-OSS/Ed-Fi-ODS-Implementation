IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'identification')
EXEC sys.sp_executesql N'CREATE SCHEMA [identification]'
GO
