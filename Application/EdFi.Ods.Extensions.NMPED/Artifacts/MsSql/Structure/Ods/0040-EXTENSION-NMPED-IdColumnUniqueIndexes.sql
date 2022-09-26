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
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentEducationOrganizationAward') AND name = N'UX_StudentEducationOrganizationAward_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentEducationOrganizationAward_Id ON [nmped].[StudentEducationOrganizationAward]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSpecialEducationAssociationEvent') AND name = N'UX_StudentSpecialEducationAssociationEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSpecialEducationAssociationEvent_Id ON [nmped].[StudentSpecialEducationAssociationEvent]
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

