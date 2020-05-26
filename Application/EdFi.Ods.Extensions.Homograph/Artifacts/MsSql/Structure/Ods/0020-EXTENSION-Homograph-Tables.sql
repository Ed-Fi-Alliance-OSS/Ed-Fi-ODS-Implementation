-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table [homograph].[Name] --
CREATE TABLE [homograph].[Name] (
    [FirstName] [NVARCHAR](75) NOT NULL,
    [LastSurname] [NVARCHAR](75) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Name_PK] PRIMARY KEY CLUSTERED (
        [FirstName] ASC,
        [LastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[Name] ADD CONSTRAINT [Name_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[Name] ADD CONSTRAINT [Name_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[Name] ADD CONSTRAINT [Name_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [homograph].[Parent] --
CREATE TABLE [homograph].[Parent] (
    [ParentFirstName] [NVARCHAR](75) NOT NULL,
    [ParentLastSurname] [NVARCHAR](75) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Parent_PK] PRIMARY KEY CLUSTERED (
        [ParentFirstName] ASC,
        [ParentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[Parent] ADD CONSTRAINT [Parent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[Parent] ADD CONSTRAINT [Parent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[Parent] ADD CONSTRAINT [Parent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [homograph].[ParentAddress] --
CREATE TABLE [homograph].[ParentAddress] (
    [City] [NVARCHAR](30) NOT NULL,
    [ParentFirstName] [NVARCHAR](75) NOT NULL,
    [ParentLastSurname] [NVARCHAR](75) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ParentAddress_PK] PRIMARY KEY CLUSTERED (
        [City] ASC,
        [ParentFirstName] ASC,
        [ParentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[ParentAddress] ADD CONSTRAINT [ParentAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [homograph].[ParentStudentSchoolAssociation] --
CREATE TABLE [homograph].[ParentStudentSchoolAssociation] (
    [ParentFirstName] [NVARCHAR](75) NOT NULL,
    [ParentLastSurname] [NVARCHAR](75) NOT NULL,
    [SchoolName] [NVARCHAR](100) NOT NULL,
    [StudentFirstName] [NVARCHAR](75) NOT NULL,
    [StudentLastSurname] [NVARCHAR](75) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ParentStudentSchoolAssociation_PK] PRIMARY KEY CLUSTERED (
        [ParentFirstName] ASC,
        [ParentLastSurname] ASC,
        [SchoolName] ASC,
        [StudentFirstName] ASC,
        [StudentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[ParentStudentSchoolAssociation] ADD CONSTRAINT [ParentStudentSchoolAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [homograph].[School] --
CREATE TABLE [homograph].[School] (
    [SchoolName] [NVARCHAR](100) NOT NULL,
    [SchoolYear] [NVARCHAR](20) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [School_PK] PRIMARY KEY CLUSTERED (
        [SchoolName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[School] ADD CONSTRAINT [School_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[School] ADD CONSTRAINT [School_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[School] ADD CONSTRAINT [School_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [homograph].[SchoolAddress] --
CREATE TABLE [homograph].[SchoolAddress] (
    [SchoolName] [NVARCHAR](100) NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolAddress_PK] PRIMARY KEY CLUSTERED (
        [SchoolName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[SchoolAddress] ADD CONSTRAINT [SchoolAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [homograph].[SchoolYearType] --
CREATE TABLE [homograph].[SchoolYearType] (
    [SchoolYear] [NVARCHAR](20) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SchoolYearType_PK] PRIMARY KEY CLUSTERED (
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[SchoolYearType] ADD CONSTRAINT [SchoolYearType_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[SchoolYearType] ADD CONSTRAINT [SchoolYearType_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[SchoolYearType] ADD CONSTRAINT [SchoolYearType_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [homograph].[Staff] --
CREATE TABLE [homograph].[Staff] (
    [StaffFirstName] [NVARCHAR](75) NOT NULL,
    [StaffLastSurname] [NVARCHAR](75) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Staff_PK] PRIMARY KEY CLUSTERED (
        [StaffFirstName] ASC,
        [StaffLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[Staff] ADD CONSTRAINT [Staff_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[Staff] ADD CONSTRAINT [Staff_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[Staff] ADD CONSTRAINT [Staff_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [homograph].[StaffAddress] --
CREATE TABLE [homograph].[StaffAddress] (
    [City] [NVARCHAR](30) NOT NULL,
    [StaffFirstName] [NVARCHAR](75) NOT NULL,
    [StaffLastSurname] [NVARCHAR](75) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffAddress_PK] PRIMARY KEY CLUSTERED (
        [City] ASC,
        [StaffFirstName] ASC,
        [StaffLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[StaffAddress] ADD CONSTRAINT [StaffAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [homograph].[StaffStudentSchoolAssociation] --
CREATE TABLE [homograph].[StaffStudentSchoolAssociation] (
    [SchoolName] [NVARCHAR](100) NOT NULL,
    [StaffFirstName] [NVARCHAR](75) NOT NULL,
    [StaffLastSurname] [NVARCHAR](75) NOT NULL,
    [StudentFirstName] [NVARCHAR](75) NOT NULL,
    [StudentLastSurname] [NVARCHAR](75) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffStudentSchoolAssociation_PK] PRIMARY KEY CLUSTERED (
        [SchoolName] ASC,
        [StaffFirstName] ASC,
        [StaffLastSurname] ASC,
        [StudentFirstName] ASC,
        [StudentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[StaffStudentSchoolAssociation] ADD CONSTRAINT [StaffStudentSchoolAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [homograph].[Student] --
CREATE TABLE [homograph].[Student] (
    [StudentFirstName] [NVARCHAR](75) NOT NULL,
    [StudentLastSurname] [NVARCHAR](75) NOT NULL,
    [SchoolYear] [NVARCHAR](20) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Student_PK] PRIMARY KEY CLUSTERED (
        [StudentFirstName] ASC,
        [StudentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[Student] ADD CONSTRAINT [Student_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[Student] ADD CONSTRAINT [Student_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[Student] ADD CONSTRAINT [Student_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [homograph].[StudentAddress] --
CREATE TABLE [homograph].[StudentAddress] (
    [City] [NVARCHAR](30) NOT NULL,
    [StudentFirstName] [NVARCHAR](75) NOT NULL,
    [StudentLastSurname] [NVARCHAR](75) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAddress_PK] PRIMARY KEY CLUSTERED (
        [City] ASC,
        [StudentFirstName] ASC,
        [StudentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[StudentAddress] ADD CONSTRAINT [StudentAddress_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [homograph].[StudentSchoolAssociation] --
CREATE TABLE [homograph].[StudentSchoolAssociation] (
    [SchoolName] [NVARCHAR](100) NOT NULL,
    [StudentFirstName] [NVARCHAR](75) NOT NULL,
    [StudentLastSurname] [NVARCHAR](75) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSchoolAssociation_PK] PRIMARY KEY CLUSTERED (
        [SchoolName] ASC,
        [StudentFirstName] ASC,
        [StudentLastSurname] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [homograph].[StudentSchoolAssociation] ADD CONSTRAINT [StudentSchoolAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [homograph].[StudentSchoolAssociation] ADD CONSTRAINT [StudentSchoolAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [homograph].[StudentSchoolAssociation] ADD CONSTRAINT [StudentSchoolAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

