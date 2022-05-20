BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.LocalEducationAgencyTransportation') AND name = N'UX_LocalEducationAgencyTransportation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LocalEducationAgencyTransportation_Id ON [nmped].[LocalEducationAgencyTransportation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StaffDevelopment') AND name = N'UX_StaffDevelopment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffDevelopment_Id ON [nmped].[StaffDevelopment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StaffEducationOrganizationDigitalEquity') AND name = N'UX_StaffEducationOrganizationDigitalEquity_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEducationOrganizationDigitalEquity_Id ON [nmped].[StaffEducationOrganizationDigitalEquity]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentEducationOrganizationAward') AND name = N'UX_StudentEducationOrganizationAward_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentEducationOrganizationAward_Id ON [nmped].[StudentEducationOrganizationAward]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSchoolAggregateSectionAttendance') AND name = N'UX_StudentSchoolAggregateSectionAttendance_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAggregateSectionAttendance_Id ON [nmped].[StudentSchoolAggregateSectionAttendance]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent') AND name = N'UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_Id ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.VehicleMileage') AND name = N'UX_VehicleMileage_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_VehicleMileage_Id ON [nmped].[VehicleMileage]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.VehicleSnapshot') AND name = N'UX_VehicleSnapshot_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_VehicleSnapshot_Id ON [nmped].[VehicleSnapshot]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

