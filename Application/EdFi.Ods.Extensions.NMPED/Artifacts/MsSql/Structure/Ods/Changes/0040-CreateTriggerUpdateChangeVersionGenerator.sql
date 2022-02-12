CREATE TRIGGER [nmped].[nmped_NMPEDService_TR_UpdateChangeVersion] ON [nmped].[NMPEDService] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmped].[NMPEDService]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmped].[NMPEDService] u
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

