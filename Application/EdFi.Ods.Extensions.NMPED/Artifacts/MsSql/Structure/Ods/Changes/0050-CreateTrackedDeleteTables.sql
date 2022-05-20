CREATE TABLE [tracked_deletes_nmped].[AnnualReviewDelayReasonDescriptor]
(
       AnnualReviewDelayReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnnualReviewDelayReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DentalExaminationVerificationCodeDescriptor]
(
       DentalExaminationVerificationCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DentalExaminationVerificationCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DigitalEquityInternetAccessTypeDescriptor]
(
       DigitalEquityInternetAccessTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DigitalEquityInternetAccessTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DigitalEquityInternetPerformanceCodeDescriptor]
(
       DigitalEquityInternetPerformanceCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DigitalEquityInternetPerformanceCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor]
(
       DigitalEquityPrimaryLearningDeviceAccessDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DigitalEquityPrimaryLearningDeviceAccessDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor]
(
       DigitalEquityPrimaryLearningDeviceTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DigitalEquityPrimaryLearningDeviceTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DirectCertificationStatusDescriptor]
(
       DirectCertificationStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DirectCertificationStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ExpectedDiplomaTypeDescriptor]
(
       ExpectedDiplomaTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ExpectedDiplomaTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[GenderIdentityDescriptor]
(
       GenderIdentityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GenderIdentityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[IndustryCredentialDescriptor]
(
       IndustryCredentialDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IndustryCredentialDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[LevelOfEducationInstitutionDescriptor]
(
       LevelOfEducationInstitutionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LevelOfEducationInstitutionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[LevelOfIntegrationDescriptor]
(
       LevelOfIntegrationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LevelOfIntegrationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[LocalEducationAgencyTransportation]
(
       CategoryDescriptor01TransportationCategoryDescriptorId [INT] NOT NULL,
       CategoryDescriptor02TransportationCategoryDescriptorId [INT] NOT NULL,
       LocalEducationAgencyId [INT] NOT NULL,
       TransportationSetCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocalEducationAgencyTransportation PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[MileageTypeDescriptor]
(
       MileageTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MileageTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[MilitaryFamilyDescriptor]
(
       MilitaryFamilyDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MilitaryFamilyDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[NMPEDClassPeriodDescriptor]
(
       NMPEDClassPeriodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_NMPEDClassPeriodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ParticipationInformationDescriptor]
(
       ParticipationInformationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ParticipationInformationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[PlannedPostGraduateActivityDescriptor]
(
       PlannedPostGraduateActivityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PlannedPostGraduateActivityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[PreKClassTypeDescriptor]
(
       PreKClassTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PreKClassTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[PrimaryAreaOfExceptionalityDescriptor]
(
       PrimaryAreaOfExceptionalityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PrimaryAreaOfExceptionalityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ProgramDeliveryMethodDescriptor]
(
       ProgramDeliveryMethodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramDeliveryMethodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ProgramIntensityDescriptor]
(
       ProgramIntensityDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramIntensityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[RoadTypeDescriptor]
(
       RoadTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RoadTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ServiceProviderTypeDescriptor]
(
       ServiceProviderTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ServiceProviderTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ServiceSettingDescriptor]
(
       ServiceSettingDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ServiceSettingDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialEducationEventReasonDescriptor]
(
       SpecialEducationEventReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationEventReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialEducationEventTypeDescriptor]
(
       SpecialEducationEventTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationEventTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialEducationNonComplianceReasonDescriptor]
(
       SpecialEducationNonComplianceReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationNonComplianceReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialProgramCodeDescriptor]
(
       SpecialProgramCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialProgramCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StaffDevelopment]
(
       EducationOrganizationId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       StartDate [DATE] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffDevelopment PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StaffDevelopmentActivityCodeDescriptor]
(
       StaffDevelopmentActivityCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffDevelopmentActivityCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StaffDevelopmentPurposeCodeDescriptor]
(
       StaffDevelopmentPurposeCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffDevelopmentPurposeCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StaffEducationOrganizationDigitalEquity]
(
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       StartDate [DATE] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEducationOrganizationDigitalEquity PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StudentAwardTypeDescriptor]
(
       StudentAwardTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentAwardTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StudentEducationOrganizationAward]
(
       AwardDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StudentAwardLanguageDescriptorId [INT] NOT NULL,
       StudentAwardTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentEducationOrganizationAward PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StudentSchoolAggregateSectionAttendance]
(
       BeginDate [DATE] NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentSchoolAggregateSectionAttendance PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       SpecialEducationEventTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[TransportationCategoryDescriptor]
(
       TransportationCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TransportationCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[TransportationSetCodeDescriptor]
(
       TransportationSetCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TransportationSetCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[TriennialReviewDelayReasonDescriptor]
(
       TriennialReviewDelayReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TriennialReviewDelayReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleBodyManufacturerDescriptor]
(
       VehicleBodyManufacturerDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleBodyManufacturerDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleChassisManufacturerDescriptor]
(
       VehicleChassisManufacturerDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleChassisManufacturerDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleFuelTypeDescriptor]
(
       VehicleFuelTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleFuelTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleMileage]
(
       LocalEducationAgencyId [INT] NOT NULL,
       MileageTypeDescriptorId [INT] NOT NULL,
       ReportingDate [DATE] NOT NULL,
       RoadTypeDescriptorId [INT] NOT NULL,
       VehicleId [NVARCHAR](255) NOT NULL,
       VehicleRouteDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleMileage PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleRouteDescriptor]
(
       VehicleRouteDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleRouteDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleSnapshot]
(
       LocalEducationAgencyId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       VehicleId [NVARCHAR](255) NOT NULL,
       VehicleIdentificationNumber [NVARCHAR](21) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleSnapshot PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[VehicleTypeDescriptor]
(
       VehicleTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VehicleTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
