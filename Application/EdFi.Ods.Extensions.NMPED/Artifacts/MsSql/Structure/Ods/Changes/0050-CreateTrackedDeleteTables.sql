CREATE TABLE [tracked_deletes_nmped].[ClassPeriodDescriptor]
(
       ClassPeriodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ClassPeriodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[DirectCertificationStatusDescriptor]
(
       DirectCertificationStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DirectCertificationStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
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
CREATE TABLE [tracked_deletes_nmped].[NMPEDService]
(
       ServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_NMPEDService PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[ParticipationInformationDescriptor]
(
       ParticipationInformationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ParticipationInformationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
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
CREATE TABLE [tracked_deletes_nmped].[SpecialEducationLevelOfIntegrationDescriptor]
(
       SpecialEducationLevelOfIntegrationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationLevelOfIntegrationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
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
CREATE TABLE [tracked_deletes_nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)
