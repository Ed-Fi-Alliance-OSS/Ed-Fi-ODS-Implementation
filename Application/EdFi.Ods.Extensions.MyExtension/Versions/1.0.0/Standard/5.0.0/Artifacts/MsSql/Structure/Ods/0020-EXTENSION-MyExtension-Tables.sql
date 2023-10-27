-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table [myextension].[InstitutionControlDescriptor] --
CREATE TABLE [myextension].[InstitutionControlDescriptor] (
    [InstitutionControlDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InstitutionControlDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InstitutionControlDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [myextension].[InstitutionLevelDescriptor] --
CREATE TABLE [myextension].[InstitutionLevelDescriptor] (
    [InstitutionLevelDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InstitutionLevelDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InstitutionLevelDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [myextension].[PostSecondaryOrganization] --
CREATE TABLE [myextension].[PostSecondaryOrganization] (
    [NameOfInstitution] [NVARCHAR](75) NOT NULL,
    [AcceptanceIndicator] [BIT] NOT NULL,
    [InstitutionControlDescriptorId] [INT] NOT NULL,
    [InstitutionLevelDescriptorId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PostSecondaryOrganization_PK] PRIMARY KEY CLUSTERED (
        [NameOfInstitution] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [myextension].[PostSecondaryOrganization] ADD CONSTRAINT [PostSecondaryOrganization_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [myextension].[PostSecondaryOrganization] ADD CONSTRAINT [PostSecondaryOrganization_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [myextension].[PostSecondaryOrganization] ADD CONSTRAINT [PostSecondaryOrganization_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [myextension].[SpecialEducationGraduationStatusDescriptor] --
CREATE TABLE [myextension].[SpecialEducationGraduationStatusDescriptor] (
    [SpecialEducationGraduationStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationGraduationStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationGraduationStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [myextension].[StudentAcademicRecordClassRankingExtension] --
CREATE TABLE [myextension].[StudentAcademicRecordClassRankingExtension] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [SpecialEducationGraduationStatusDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAcademicRecordClassRankingExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [myextension].[StudentAcademicRecordClassRankingExtension] ADD CONSTRAINT [StudentAcademicRecordClassRankingExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [myextension].[StudentAcademicRecordExtension] --
CREATE TABLE [myextension].[StudentAcademicRecordExtension] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [NameOfInstitution] [NVARCHAR](75) NULL,
    [SubmissionCertificationDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAcademicRecordExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [myextension].[StudentAcademicRecordExtension] ADD CONSTRAINT [StudentAcademicRecordExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [myextension].[StudentAcademicRecordStudentCensusBlockGroup] --
CREATE TABLE [myextension].[StudentAcademicRecordStudentCensusBlockGroup] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [StudentCensusBlockGroup] [NVARCHAR](12) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAcademicRecordStudentCensusBlockGroup_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [myextension].[StudentAcademicRecordStudentCensusBlockGroup] ADD CONSTRAINT [StudentAcademicRecordStudentCensusBlockGroup_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [myextension].[StudentAcademicRecordStudentCensusBlockGroupPeriod] --
CREATE TABLE [myextension].[StudentAcademicRecordStudentCensusBlockGroupPeriod] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAcademicRecordStudentCensusBlockGroupPeriod_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC,
        [TermDescriptorId] ASC,
        [BeginDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [myextension].[StudentAcademicRecordStudentCensusBlockGroupPeriod] ADD CONSTRAINT [StudentAcademicRecordStudentCensusBlockGroupPeriod_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [myextension].[SubmissionCertificationDescriptor] --
CREATE TABLE [myextension].[SubmissionCertificationDescriptor] (
    [SubmissionCertificationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SubmissionCertificationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SubmissionCertificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

