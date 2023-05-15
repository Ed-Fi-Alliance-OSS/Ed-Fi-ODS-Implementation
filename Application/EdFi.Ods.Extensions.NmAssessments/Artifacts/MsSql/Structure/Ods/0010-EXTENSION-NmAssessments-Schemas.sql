IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'nmassessments')
EXEC sys.sp_executesql N'CREATE SCHEMA [nmassessments]'
GO
