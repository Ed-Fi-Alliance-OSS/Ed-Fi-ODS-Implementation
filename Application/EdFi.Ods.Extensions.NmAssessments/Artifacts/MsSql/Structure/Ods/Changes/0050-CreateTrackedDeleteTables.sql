CREATE TABLE [tracked_deletes_nmassessments].[ItemDescriptionCodeDescriptor]
(
       ItemDescriptionCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ItemDescriptionCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmassessments].[NmStudentAssessment]
(
       EducationOrganizationId [INT] NOT NULL,
       ItemDescriptionCodeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       TestDate [DATE] NOT NULL,
       TestDescriptionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_NmStudentAssessment PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmassessments].[ScoringModelCodeDescriptor]
(
       ScoringModelCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ScoringModelCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmassessments].[StandardAchievedCodeDescriptor]
(
       StandardAchievedCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StandardAchievedCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
CREATE TABLE [tracked_deletes_nmassessments].[TestDescriptionDescriptor]
(
       TestDescriptionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TestDescriptionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
