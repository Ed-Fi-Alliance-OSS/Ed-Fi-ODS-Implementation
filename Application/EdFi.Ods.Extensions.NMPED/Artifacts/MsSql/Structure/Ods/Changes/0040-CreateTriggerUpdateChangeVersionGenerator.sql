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

CREATE TRIGGER [nmped].[nmped_StudentCTEProgramAssociationCredential_TR_UpdateChangeVersion] ON [nmped].[StudentCTEProgramAssociationCredential] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StudentCTEProgramAssociationCredential]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StudentCTEProgramAssociationCredential] u
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

CREATE TRIGGER [nmped].[nmped_StudentSpecialEducationAssociationEvent_TR_UpdateChangeVersion] ON [nmped].[StudentSpecialEducationAssociationEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[StudentSpecialEducationAssociationEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[StudentSpecialEducationAssociationEvent] u
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

