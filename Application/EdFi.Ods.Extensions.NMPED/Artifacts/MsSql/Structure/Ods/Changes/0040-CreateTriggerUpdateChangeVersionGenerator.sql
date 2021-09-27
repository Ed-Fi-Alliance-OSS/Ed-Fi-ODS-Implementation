CREATE TRIGGER [nmped].[nmped_NMPEDService_TR_UpdateChangeVersion] ON [nmped].[NMPEDService] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[NMPEDService]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[NMPEDService] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

