CREATE TABLE [tracked_deletes_nmped].[DirectCertificationStatusDescriptor]
(
       DirectCertificationStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DirectCertificationStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmped].[SpecialEducationLevelOfIntegrationDescriptor]
(
       SpecialEducationLevelOfIntegrationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationLevelOfIntegrationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
