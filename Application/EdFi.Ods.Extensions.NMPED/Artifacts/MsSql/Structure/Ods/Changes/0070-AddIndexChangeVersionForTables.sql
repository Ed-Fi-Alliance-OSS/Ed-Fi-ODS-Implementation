BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.NMPEDService') AND name = N'UX_NMPEDService_ChangeVersion')
    CREATE INDEX [UX_NMPEDService_ChangeVersion] ON [nmped].[NMPEDService] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StaffDevelopment') AND name = N'UX_StaffDevelopment_ChangeVersion')
    CREATE INDEX [UX_StaffDevelopment_ChangeVersion] ON [nmped].[StaffDevelopment] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StaffEducationOrganizationDigitalEquity') AND name = N'UX_StaffEducationOrganizationDigitalEquity_ChangeVersion')
    CREATE INDEX [UX_StaffEducationOrganizationDigitalEquity_ChangeVersion] ON [nmped].[StaffEducationOrganizationDigitalEquity] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentEducationOrganizationAward') AND name = N'UX_StudentEducationOrganizationAward_ChangeVersion')
    CREATE INDEX [UX_StudentEducationOrganizationAward_ChangeVersion] ON [nmped].[StudentEducationOrganizationAward] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent') AND name = N'UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_ChangeVersion')
    CREATE INDEX [UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_ChangeVersion] ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ([ChangeVersion] ASC)
    GO
COMMIT

