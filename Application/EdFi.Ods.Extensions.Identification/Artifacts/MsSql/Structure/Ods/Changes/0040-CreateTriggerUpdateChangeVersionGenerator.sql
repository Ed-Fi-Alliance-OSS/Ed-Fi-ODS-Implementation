CREATE TRIGGER [identification].[identification_StudentIdentifier_TR_UpdateChangeVersion] ON [identification].[StudentIdentifier] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [identification].[StudentIdentifier]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [identification].[StudentIdentifier] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

