CREATE TRIGGER [nmped].[nmped_AnnualReviewDelayReasonDescriptor_TR_DeleteTracking] ON [nmped].[AnnualReviewDelayReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[AnnualReviewDelayReasonDescriptor](AnnualReviewDelayReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.AnnualReviewDelayReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AnnualReviewDelayReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[AnnualReviewDelayReasonDescriptor] ENABLE TRIGGER [nmped_AnnualReviewDelayReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_DentalExaminationVerificationCodeDescriptor_TR_DeleteTracking] ON [nmped].[DentalExaminationVerificationCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[DentalExaminationVerificationCodeDescriptor](DentalExaminationVerificationCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.DentalExaminationVerificationCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DentalExaminationVerificationCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DentalExaminationVerificationCodeDescriptor] ENABLE TRIGGER [nmped_DentalExaminationVerificationCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_DigitalEquityInternetAccessTypeDescriptor_TR_DeleteTracking] ON [nmped].[DigitalEquityInternetAccessTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[DigitalEquityInternetAccessTypeDescriptor](DigitalEquityInternetAccessTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DigitalEquityInternetAccessTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DigitalEquityInternetAccessTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DigitalEquityInternetAccessTypeDescriptor] ENABLE TRIGGER [nmped_DigitalEquityInternetAccessTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_DigitalEquityInternetPerformanceCodeDescriptor_TR_DeleteTracking] ON [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[DigitalEquityInternetPerformanceCodeDescriptor](DigitalEquityInternetPerformanceCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.DigitalEquityInternetPerformanceCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DigitalEquityInternetPerformanceCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] ENABLE TRIGGER [nmped_DigitalEquityInternetPerformanceCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_DigitalEquityPrimaryLearningDeviceAccessDescriptor_TR_DeleteTracking] ON [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor](DigitalEquityPrimaryLearningDeviceAccessDescriptorId, Id, ChangeVersion)
    SELECT  d.DigitalEquityPrimaryLearningDeviceAccessDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DigitalEquityPrimaryLearningDeviceAccessDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] ENABLE TRIGGER [nmped_DigitalEquityPrimaryLearningDeviceAccessDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_DigitalEquityPrimaryLearningDeviceTypeDescriptor_TR_DeleteTracking] ON [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor](DigitalEquityPrimaryLearningDeviceTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DigitalEquityPrimaryLearningDeviceTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DigitalEquityPrimaryLearningDeviceTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] ENABLE TRIGGER [nmped_DigitalEquityPrimaryLearningDeviceTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_DirectCertificationStatusDescriptor_TR_DeleteTracking] ON [nmped].[DirectCertificationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[DirectCertificationStatusDescriptor](DirectCertificationStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.DirectCertificationStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DirectCertificationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DirectCertificationStatusDescriptor] ENABLE TRIGGER [nmped_DirectCertificationStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_ExpectedDiplomaTypeDescriptor_TR_DeleteTracking] ON [nmped].[ExpectedDiplomaTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ExpectedDiplomaTypeDescriptor](ExpectedDiplomaTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ExpectedDiplomaTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ExpectedDiplomaTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ExpectedDiplomaTypeDescriptor] ENABLE TRIGGER [nmped_ExpectedDiplomaTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_GenderIdentityDescriptor_TR_DeleteTracking] ON [nmped].[GenderIdentityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[GenderIdentityDescriptor](GenderIdentityDescriptorId, Id, ChangeVersion)
    SELECT  d.GenderIdentityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GenderIdentityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[GenderIdentityDescriptor] ENABLE TRIGGER [nmped_GenderIdentityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_IndustryCredentialDescriptor_TR_DeleteTracking] ON [nmped].[IndustryCredentialDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[IndustryCredentialDescriptor](IndustryCredentialDescriptorId, Id, ChangeVersion)
    SELECT  d.IndustryCredentialDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IndustryCredentialDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[IndustryCredentialDescriptor] ENABLE TRIGGER [nmped_IndustryCredentialDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_LevelOfEducationInstitutionDescriptor_TR_DeleteTracking] ON [nmped].[LevelOfEducationInstitutionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[LevelOfEducationInstitutionDescriptor](LevelOfEducationInstitutionDescriptorId, Id, ChangeVersion)
    SELECT  d.LevelOfEducationInstitutionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfEducationInstitutionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[LevelOfEducationInstitutionDescriptor] ENABLE TRIGGER [nmped_LevelOfEducationInstitutionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_LevelOfIntegrationDescriptor_TR_DeleteTracking] ON [nmped].[LevelOfIntegrationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[LevelOfIntegrationDescriptor](LevelOfIntegrationDescriptorId, Id, ChangeVersion)
    SELECT  d.LevelOfIntegrationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfIntegrationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[LevelOfIntegrationDescriptor] ENABLE TRIGGER [nmped_LevelOfIntegrationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_LocalEducationAgencyTransportation_TR_DeleteTracking] ON [nmped].[LocalEducationAgencyTransportation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[LocalEducationAgencyTransportation](CategoryDescriptor01TransportationCategoryDescriptorId, CategoryDescriptor02TransportationCategoryDescriptorId, LocalEducationAgencyId, TransportationSetCodeDescriptorId, Id, ChangeVersion)
    SELECT  CategoryDescriptor01TransportationCategoryDescriptorId, CategoryDescriptor02TransportationCategoryDescriptorId, LocalEducationAgencyId, TransportationSetCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ENABLE TRIGGER [nmped_LocalEducationAgencyTransportation_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_MileageTypeDescriptor_TR_DeleteTracking] ON [nmped].[MileageTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[MileageTypeDescriptor](MileageTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.MileageTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MileageTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[MileageTypeDescriptor] ENABLE TRIGGER [nmped_MileageTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_MilitaryFamilyDescriptor_TR_DeleteTracking] ON [nmped].[MilitaryFamilyDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[MilitaryFamilyDescriptor](MilitaryFamilyDescriptorId, Id, ChangeVersion)
    SELECT  d.MilitaryFamilyDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MilitaryFamilyDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[MilitaryFamilyDescriptor] ENABLE TRIGGER [nmped_MilitaryFamilyDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_NMPEDClassPeriodDescriptor_TR_DeleteTracking] ON [nmped].[NMPEDClassPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[NMPEDClassPeriodDescriptor](NMPEDClassPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.NMPEDClassPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NMPEDClassPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[NMPEDClassPeriodDescriptor] ENABLE TRIGGER [nmped_NMPEDClassPeriodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_ParticipationInformationDescriptor_TR_DeleteTracking] ON [nmped].[ParticipationInformationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ParticipationInformationDescriptor](ParticipationInformationDescriptorId, Id, ChangeVersion)
    SELECT  d.ParticipationInformationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ParticipationInformationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ParticipationInformationDescriptor] ENABLE TRIGGER [nmped_ParticipationInformationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_PlannedPostGraduateActivityDescriptor_TR_DeleteTracking] ON [nmped].[PlannedPostGraduateActivityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[PlannedPostGraduateActivityDescriptor](PlannedPostGraduateActivityDescriptorId, Id, ChangeVersion)
    SELECT  d.PlannedPostGraduateActivityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PlannedPostGraduateActivityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[PlannedPostGraduateActivityDescriptor] ENABLE TRIGGER [nmped_PlannedPostGraduateActivityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_PreKClassTypeDescriptor_TR_DeleteTracking] ON [nmped].[PreKClassTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[PreKClassTypeDescriptor](PreKClassTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.PreKClassTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PreKClassTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[PreKClassTypeDescriptor] ENABLE TRIGGER [nmped_PreKClassTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_PrimaryAreaOfExceptionalityDescriptor_TR_DeleteTracking] ON [nmped].[PrimaryAreaOfExceptionalityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[PrimaryAreaOfExceptionalityDescriptor](PrimaryAreaOfExceptionalityDescriptorId, Id, ChangeVersion)
    SELECT  d.PrimaryAreaOfExceptionalityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PrimaryAreaOfExceptionalityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[PrimaryAreaOfExceptionalityDescriptor] ENABLE TRIGGER [nmped_PrimaryAreaOfExceptionalityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_ProgramDeliveryMethodDescriptor_TR_DeleteTracking] ON [nmped].[ProgramDeliveryMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ProgramDeliveryMethodDescriptor](ProgramDeliveryMethodDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramDeliveryMethodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramDeliveryMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ProgramDeliveryMethodDescriptor] ENABLE TRIGGER [nmped_ProgramDeliveryMethodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_ProgramIntensityDescriptor_TR_DeleteTracking] ON [nmped].[ProgramIntensityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ProgramIntensityDescriptor](ProgramIntensityDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramIntensityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramIntensityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ProgramIntensityDescriptor] ENABLE TRIGGER [nmped_ProgramIntensityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_RoadTypeDescriptor_TR_DeleteTracking] ON [nmped].[RoadTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[RoadTypeDescriptor](RoadTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.RoadTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RoadTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[RoadTypeDescriptor] ENABLE TRIGGER [nmped_RoadTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_ServiceProviderTypeDescriptor_TR_DeleteTracking] ON [nmped].[ServiceProviderTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ServiceProviderTypeDescriptor](ServiceProviderTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ServiceProviderTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ServiceProviderTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ServiceProviderTypeDescriptor] ENABLE TRIGGER [nmped_ServiceProviderTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_ServiceSettingDescriptor_TR_DeleteTracking] ON [nmped].[ServiceSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ServiceSettingDescriptor](ServiceSettingDescriptorId, Id, ChangeVersion)
    SELECT  d.ServiceSettingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ServiceSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ServiceSettingDescriptor] ENABLE TRIGGER [nmped_ServiceSettingDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_SpecialEducationEventReasonDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationEventReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[SpecialEducationEventReasonDescriptor](SpecialEducationEventReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationEventReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationEventReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationEventReasonDescriptor] ENABLE TRIGGER [nmped_SpecialEducationEventReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_SpecialEducationEventTypeDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[SpecialEducationEventTypeDescriptor](SpecialEducationEventTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationEventTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationEventTypeDescriptor] ENABLE TRIGGER [nmped_SpecialEducationEventTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_SpecialEducationNonComplianceReasonDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationNonComplianceReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[SpecialEducationNonComplianceReasonDescriptor](SpecialEducationNonComplianceReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationNonComplianceReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationNonComplianceReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationNonComplianceReasonDescriptor] ENABLE TRIGGER [nmped_SpecialEducationNonComplianceReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_SpecialProgramCodeDescriptor_TR_DeleteTracking] ON [nmped].[SpecialProgramCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[SpecialProgramCodeDescriptor](SpecialProgramCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialProgramCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialProgramCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialProgramCodeDescriptor] ENABLE TRIGGER [nmped_SpecialProgramCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StaffDevelopmentActivityCodeDescriptor_TR_DeleteTracking] ON [nmped].[StaffDevelopmentActivityCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StaffDevelopmentActivityCodeDescriptor](StaffDevelopmentActivityCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffDevelopmentActivityCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffDevelopmentActivityCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StaffDevelopmentActivityCodeDescriptor] ENABLE TRIGGER [nmped_StaffDevelopmentActivityCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StaffDevelopmentPurposeCodeDescriptor_TR_DeleteTracking] ON [nmped].[StaffDevelopmentPurposeCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StaffDevelopmentPurposeCodeDescriptor](StaffDevelopmentPurposeCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffDevelopmentPurposeCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffDevelopmentPurposeCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StaffDevelopmentPurposeCodeDescriptor] ENABLE TRIGGER [nmped_StaffDevelopmentPurposeCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StaffDevelopment_TR_DeleteTracking] ON [nmped].[StaffDevelopment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StaffDevelopment](EducationOrganizationId, StaffUSI, StartDate, Id, ChangeVersion)
    SELECT  EducationOrganizationId, StaffUSI, StartDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[StaffDevelopment] ENABLE TRIGGER [nmped_StaffDevelopment_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StaffEducationOrganizationDigitalEquity_TR_DeleteTracking] ON [nmped].[StaffEducationOrganizationDigitalEquity] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StaffEducationOrganizationDigitalEquity](EducationOrganizationId, SchoolYear, StaffUSI, StartDate, Id, ChangeVersion)
    SELECT  EducationOrganizationId, SchoolYear, StaffUSI, StartDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] ENABLE TRIGGER [nmped_StaffEducationOrganizationDigitalEquity_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StudentAwardTypeDescriptor_TR_DeleteTracking] ON [nmped].[StudentAwardTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StudentAwardTypeDescriptor](StudentAwardTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentAwardTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentAwardTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StudentAwardTypeDescriptor] ENABLE TRIGGER [nmped_StudentAwardTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StudentEducationOrganizationAward_TR_DeleteTracking] ON [nmped].[StudentEducationOrganizationAward] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StudentEducationOrganizationAward](AwardDate, EducationOrganizationId, SchoolYear, StudentAwardLanguageDescriptorId, StudentAwardTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  AwardDate, EducationOrganizationId, SchoolYear, StudentAwardLanguageDescriptorId, StudentAwardTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] ENABLE TRIGGER [nmped_StudentEducationOrganizationAward_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StudentSchoolAggregateSectionAttendance_TR_DeleteTracking] ON [nmped].[StudentSchoolAggregateSectionAttendance] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StudentSchoolAggregateSectionAttendance](BeginDate, SchoolId, SchoolYear, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, SchoolId, SchoolYear, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] ENABLE TRIGGER [nmped_StudentSchoolAggregateSectionAttendance_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_TR_DeleteTracking] ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent](BeginDate, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, SpecialEducationEventTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, SpecialEducationEventTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ENABLE TRIGGER [nmped_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_TransportationCategoryDescriptor_TR_DeleteTracking] ON [nmped].[TransportationCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[TransportationCategoryDescriptor](TransportationCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.TransportationCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TransportationCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[TransportationCategoryDescriptor] ENABLE TRIGGER [nmped_TransportationCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_TransportationSetCodeDescriptor_TR_DeleteTracking] ON [nmped].[TransportationSetCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[TransportationSetCodeDescriptor](TransportationSetCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.TransportationSetCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TransportationSetCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[TransportationSetCodeDescriptor] ENABLE TRIGGER [nmped_TransportationSetCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_TriennialReviewDelayReasonDescriptor_TR_DeleteTracking] ON [nmped].[TriennialReviewDelayReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[TriennialReviewDelayReasonDescriptor](TriennialReviewDelayReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.TriennialReviewDelayReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TriennialReviewDelayReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[TriennialReviewDelayReasonDescriptor] ENABLE TRIGGER [nmped_TriennialReviewDelayReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleBodyManufacturerDescriptor_TR_DeleteTracking] ON [nmped].[VehicleBodyManufacturerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleBodyManufacturerDescriptor](VehicleBodyManufacturerDescriptorId, Id, ChangeVersion)
    SELECT  d.VehicleBodyManufacturerDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleBodyManufacturerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleBodyManufacturerDescriptor] ENABLE TRIGGER [nmped_VehicleBodyManufacturerDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleChassisManufacturerDescriptor_TR_DeleteTracking] ON [nmped].[VehicleChassisManufacturerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleChassisManufacturerDescriptor](VehicleChassisManufacturerDescriptorId, Id, ChangeVersion)
    SELECT  d.VehicleChassisManufacturerDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleChassisManufacturerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleChassisManufacturerDescriptor] ENABLE TRIGGER [nmped_VehicleChassisManufacturerDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleFuelTypeDescriptor_TR_DeleteTracking] ON [nmped].[VehicleFuelTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleFuelTypeDescriptor](VehicleFuelTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.VehicleFuelTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleFuelTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleFuelTypeDescriptor] ENABLE TRIGGER [nmped_VehicleFuelTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleMileage_TR_DeleteTracking] ON [nmped].[VehicleMileage] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleMileage](LocalEducationAgencyId, MileageTypeDescriptorId, ReportingDate, RoadTypeDescriptorId, VehicleId, VehicleRouteDescriptorId, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, MileageTypeDescriptorId, ReportingDate, RoadTypeDescriptorId, VehicleId, VehicleRouteDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[VehicleMileage] ENABLE TRIGGER [nmped_VehicleMileage_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleRouteDescriptor_TR_DeleteTracking] ON [nmped].[VehicleRouteDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleRouteDescriptor](VehicleRouteDescriptorId, Id, ChangeVersion)
    SELECT  d.VehicleRouteDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleRouteDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleRouteDescriptor] ENABLE TRIGGER [nmped_VehicleRouteDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleSnapshot_TR_DeleteTracking] ON [nmped].[VehicleSnapshot] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleSnapshot](LocalEducationAgencyId, SchoolYear, VehicleId, VehicleIdentificationNumber, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, SchoolYear, VehicleId, VehicleIdentificationNumber, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[VehicleSnapshot] ENABLE TRIGGER [nmped_VehicleSnapshot_TR_DeleteTracking]
GO


CREATE TRIGGER [nmped].[nmped_VehicleTypeDescriptor_TR_DeleteTracking] ON [nmped].[VehicleTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[VehicleTypeDescriptor](VehicleTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.VehicleTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleTypeDescriptor] ENABLE TRIGGER [nmped_VehicleTypeDescriptor_TR_DeleteTracking]
GO


