-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table [grandbend].[Applicant] --
CREATE TABLE [grandbend].[Applicant] (
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PersonalTitlePrefix] [NVARCHAR](30) NULL,
    [FirstName] [NVARCHAR](75) NOT NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [MaidenName] [NVARCHAR](75) NULL,
    [SexDescriptorId] [INT] NULL,
    [BirthDate] [DATE] NULL,
    [HispanicLatinoEthnicity] [BIT] NULL,
    [CitizenshipStatusDescriptorId] [INT] NULL,
    [HighestCompletedLevelOfEducationDescriptorId] [INT] NULL,
    [YearsOfPriorProfessionalExperience] [DECIMAL](5, 2) NULL,
    [YearsOfPriorTeachingExperience] [DECIMAL](5, 2) NULL,
    [LoginId] [NVARCHAR](60) NULL,
    [HighlyQualifiedTeacher] [BIT] NULL,
    [HighlyQualifiedAcademicSubjectDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Applicant_PK] PRIMARY KEY CLUSTERED (
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [grandbend].[Applicant] ADD CONSTRAINT [Applicant_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [grandbend].[Applicant] ADD CONSTRAINT [Applicant_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [grandbend].[Applicant] ADD CONSTRAINT [Applicant_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [grandbend].[ApplicantAddress] --
CREATE TABLE [grandbend].[ApplicantAddress] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [ApplicantIdentifier] [NVARCHAR](32) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [ApartmentRoomSuiteNumber] [NVARCHAR](50) NULL,
    [BuildingSiteNumber] [NVARCHAR](20) NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [NameOfCounty] [NVARCHAR](30) NULL,
    [CountyFIPSCode] [NVARCHAR](5) NULL,
    [Latitude] [NVARCHAR](20) NULL,
    [Longitude] [NVARCHAR](20) NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ApplicantAddress_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [ApplicantIdentifier] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [grandbend].[ApplicantAddress] ADD CONSTRAINT [ApplicantAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [grandbend].[StaffExtension] --
CREATE TABLE [grandbend].[StaffExtension] (
    [StaffUSI] [INT] NOT NULL,
    [ProbationCompleteDate] [DATE] NULL,
    [Tenured] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffExtension_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [grandbend].[StaffExtension] ADD CONSTRAINT [StaffExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

