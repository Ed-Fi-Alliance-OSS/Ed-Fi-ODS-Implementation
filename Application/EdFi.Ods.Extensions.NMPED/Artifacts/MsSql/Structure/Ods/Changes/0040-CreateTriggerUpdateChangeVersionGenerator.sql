CREATE TRIGGER [nmped].[nmped_LocalEducationAgencyTransportation_TR_UpdateChangeVersion] ON [nmped].[LocalEducationAgencyTransportation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[LocalEducationAgencyTransportation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[LocalEducationAgencyTransportation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_StaffDevelopment_TR_UpdateChangeVersion] ON [nmped].[StaffDevelopment] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StaffDevelopment]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StaffDevelopment] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_StaffEducationOrganizationDigitalEquity_TR_UpdateChangeVersion] ON [nmped].[StaffEducationOrganizationDigitalEquity] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StaffEducationOrganizationDigitalEquity]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StaffEducationOrganizationDigitalEquity] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_StudentEducationOrganizationAward_TR_UpdateChangeVersion] ON [nmped].[StudentEducationOrganizationAward] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StudentEducationOrganizationAward]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StudentEducationOrganizationAward] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_StudentSchoolAggregateSectionAttendance_TR_UpdateChangeVersion] ON [nmped].[StudentSchoolAggregateSectionAttendance] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StudentSchoolAggregateSectionAttendance]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StudentSchoolAggregateSectionAttendance] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_TR_UpdateChangeVersion] ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_VehicleMileage_TR_UpdateChangeVersion] ON [nmped].[VehicleMileage] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[VehicleMileage]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[VehicleMileage] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [nmped].[nmped_VehicleSnapshot_TR_UpdateChangeVersion] ON [nmped].[VehicleSnapshot] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[VehicleSnapshot]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[VehicleSnapshot] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

