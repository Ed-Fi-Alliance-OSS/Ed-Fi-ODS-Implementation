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
CREATE TABLE [tracked_deletes_nmped].[ProgramDeliveryMethodDescriptor]
(
       ProgramDeliveryMethodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramDeliveryMethodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialEducationLevelOfIntegrationDescriptor]
(
       SpecialEducationLevelOfIntegrationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationLevelOfIntegrationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialProgramCodeDescriptor]
(
       SpecialProgramCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialProgramCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
