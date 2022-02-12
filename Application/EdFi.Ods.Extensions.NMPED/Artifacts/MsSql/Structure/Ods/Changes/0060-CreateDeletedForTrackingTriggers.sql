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


CREATE TRIGGER [nmped].[nmped_ClassPeriodDescriptor_TR_DeleteTracking] ON [nmped].[ClassPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[ClassPeriodDescriptor](ClassPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.ClassPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ClassPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ClassPeriodDescriptor] ENABLE TRIGGER [nmped_ClassPeriodDescriptor_TR_DeleteTracking]
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


CREATE TRIGGER [nmped].[nmped_NMPEDService_TR_DeleteTracking] ON [nmped].[NMPEDService] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[NMPEDService](ServiceDescriptorId, Id, ChangeVersion)
    SELECT  ServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[NMPEDService] ENABLE TRIGGER [nmped_NMPEDService_TR_DeleteTracking]
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


CREATE TRIGGER [nmped].[nmped_SpecialEducationLevelOfIntegrationDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationLevelOfIntegrationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[SpecialEducationLevelOfIntegrationDescriptor](SpecialEducationLevelOfIntegrationDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationLevelOfIntegrationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationLevelOfIntegrationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationLevelOfIntegrationDescriptor] ENABLE TRIGGER [nmped_SpecialEducationLevelOfIntegrationDescriptor_TR_DeleteTracking]
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


CREATE TRIGGER [nmped].[nmped_StudentAwardLanguageDescriptor_TR_DeleteTracking] ON [nmped].[StudentAwardLanguageDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StudentAwardLanguageDescriptor](StudentAwardLanguageDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentAwardLanguageDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentAwardLanguageDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StudentAwardLanguageDescriptor] ENABLE TRIGGER [nmped_StudentAwardLanguageDescriptor_TR_DeleteTracking]
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


CREATE TRIGGER [nmped].[nmped_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_TR_DeleteTracking] ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ENABLE TRIGGER [nmped_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_TR_DeleteTracking]
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


