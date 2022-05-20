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
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSchoolAggregateSectionAttendance') AND name = N'UX_StudentSchoolAggregateSectionAttendance_ChangeVersion')
    CREATE INDEX [UX_StudentSchoolAggregateSectionAttendance_ChangeVersion] ON [nmped].[StudentSchoolAggregateSectionAttendance] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent') AND name = N'UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_ChangeVersion')
    CREATE INDEX [UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_ChangeVersion] ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ([ChangeVersion] ASC)
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

