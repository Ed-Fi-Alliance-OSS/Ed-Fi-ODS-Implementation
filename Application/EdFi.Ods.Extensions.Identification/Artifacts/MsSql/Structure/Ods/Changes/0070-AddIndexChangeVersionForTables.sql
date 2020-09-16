BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'identification.StudentIdentifier') AND name = N'UX_StudentIdentifier_ChangeVersion')
    CREATE INDEX [UX_StudentIdentifier_ChangeVersion] ON [identification].[StudentIdentifier] ([ChangeVersion] ASC)
    GO
COMMIT

