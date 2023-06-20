IF NOT EXISTS (
SELECT  schema_name
FROM    information_schema.schemata
WHERE   schema_name = 'nmped_rpt' ) -- ARCHIVE is the name of the schema I wanted to check for
 
BEGIN
EXEC sp_executesql N'CREATE SCHEMA nmped_rpt'   --ARCHIVE is the schema I want to create
END
GO

