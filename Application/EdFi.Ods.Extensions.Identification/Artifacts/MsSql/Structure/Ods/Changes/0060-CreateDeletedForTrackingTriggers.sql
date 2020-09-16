CREATE TRIGGER [identification].[identification_StudentIdentifier_TR_DeleteTracking] ON [identification].[StudentIdentifier] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_identification].[StudentIdentifier](Identifier, Namespace, Id, ChangeVersion)
    SELECT  Identifier, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [identification].[StudentIdentifier] ENABLE TRIGGER [identification_StudentIdentifier_TR_DeleteTracking]
GO


