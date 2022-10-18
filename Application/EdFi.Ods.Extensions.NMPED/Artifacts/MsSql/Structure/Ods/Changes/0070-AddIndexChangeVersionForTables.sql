BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.LocalEducationAgencyTransportation') AND name = N'UX_LocalEducationAgencyTransportation_ChangeVersion')
    CREATE INDEX [UX_LocalEducationAgencyTransportation_ChangeVersion] ON [nmped].[LocalEducationAgencyTransportation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StaffDevelopment') AND name = N'UX_StaffDevelopment_ChangeVersion')
    CREATE INDEX [UX_StaffDevelopment_ChangeVersion] ON [nmped].[StaffDevelopment] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentCTEProgramAssociationCredential') AND name = N'UX_StudentCTEProgramAssociationCredential_ChangeVersion')
    CREATE INDEX [UX_StudentCTEProgramAssociationCredential_ChangeVersion] ON [nmped].[StudentCTEProgramAssociationCredential] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentEducationOrganizationAward') AND name = N'UX_StudentEducationOrganizationAward_ChangeVersion')
    CREATE INDEX [UX_StudentEducationOrganizationAward_ChangeVersion] ON [nmped].[StudentEducationOrganizationAward] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSpecialEducationAssociationEvent') AND name = N'UX_StudentSpecialEducationAssociationEvent_ChangeVersion')
    CREATE INDEX [UX_StudentSpecialEducationAssociationEvent_ChangeVersion] ON [nmped].[StudentSpecialEducationAssociationEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.VehicleMileage') AND name = N'UX_VehicleMileage_ChangeVersion')
    CREATE INDEX [UX_VehicleMileage_ChangeVersion] ON [nmped].[VehicleMileage] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.VehicleSnapshot') AND name = N'UX_VehicleSnapshot_ChangeVersion')
    CREATE INDEX [UX_VehicleSnapshot_ChangeVersion] ON [nmped].[VehicleSnapshot] ([ChangeVersion] ASC)
    GO
COMMIT

