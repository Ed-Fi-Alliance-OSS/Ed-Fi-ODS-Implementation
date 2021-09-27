BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.NMPEDService') AND name = N'UX_NMPEDService_ChangeVersion')
    CREATE INDEX [UX_NMPEDService_ChangeVersion] ON [nmped].[NMPEDService] ([ChangeVersion] ASC)
    GO
COMMIT

