BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'identification.StudentIdentifier') AND name = N'UX_StudentIdentifier_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentIdentifier_Id ON [identification].[StudentIdentifier]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

