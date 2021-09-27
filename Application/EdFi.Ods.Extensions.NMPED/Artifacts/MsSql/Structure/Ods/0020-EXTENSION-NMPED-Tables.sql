-- Table [nmped].[ClassPeriodDescriptor] --
CREATE TABLE [nmped].[ClassPeriodDescriptor] (
    [ClassPeriodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ClassPeriodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ClassPeriodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DirectCertificationStatusDescriptor] --
CREATE TABLE [nmped].[DirectCertificationStatusDescriptor] (
    [DirectCertificationStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DirectCertificationStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DirectCertificationStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DisciplineIncidentExtension] --
CREATE TABLE [nmped].[DisciplineIncidentExtension] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [DrugRelatedIndicator] [BIT] NOT NULL,
    [AlcoholRelatedIndicator] [BIT] NOT NULL,
    [GangRelatedIndicator] [BIT] NOT NULL,
    [HateCrimeRelatedIndicator] [BIT] NOT NULL,
    [SeriousBodilyInjuryIndicator] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [DisciplineIncidentExtension_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[DisciplineIncidentExtension] ADD CONSTRAINT [DisciplineIncidentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[IndustryCredentialDescriptor] --
CREATE TABLE [nmped].[IndustryCredentialDescriptor] (
    [IndustryCredentialDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IndustryCredentialDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IndustryCredentialDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[LevelOfEducationInstitutionDescriptor] --
CREATE TABLE [nmped].[LevelOfEducationInstitutionDescriptor] (
    [LevelOfEducationInstitutionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [LevelOfEducationInstitutionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [LevelOfEducationInstitutionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[NMPEDService] --
CREATE TABLE [nmped].[NMPEDService] (
    [ServiceDescriptorId] [INT] NOT NULL,
    [PrimaryIndicator] [BIT] NULL,
    [ServiceBeginDate] [DATE] NULL,
    [ServiceEndDate] [DATE] NULL,
    [ServiceFrequency] [INT] NULL,
    [ServiceProviderName] [NVARCHAR](255) NULL,
    [ServiceProviderTypeDescriptorId] [INT] NULL,
    [SerivceSettingDescriptorId] [INT] NULL,
    [ServiceDuration] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [NMPEDService_PK] PRIMARY KEY CLUSTERED (
        [ServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[NMPEDService] ADD CONSTRAINT [NMPEDService_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[NMPEDService] ADD CONSTRAINT [NMPEDService_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[NMPEDService] ADD CONSTRAINT [NMPEDService_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[ParticipationInformationDescriptor] --
CREATE TABLE [nmped].[ParticipationInformationDescriptor] (
    [ParticipationInformationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ParticipationInformationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ParticipationInformationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[ProgramDeliveryMethodDescriptor] --
CREATE TABLE [nmped].[ProgramDeliveryMethodDescriptor] (
    [ProgramDeliveryMethodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProgramDeliveryMethodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProgramDeliveryMethodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[ProgramIntensityDescriptor] --
CREATE TABLE [nmped].[ProgramIntensityDescriptor] (
    [ProgramIntensityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProgramIntensityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProgramIntensityDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SerivceSettingDescriptor] --
CREATE TABLE [nmped].[SerivceSettingDescriptor] (
    [SerivceSettingDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SerivceSettingDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SerivceSettingDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[ServiceProviderTypeDescriptor] --
CREATE TABLE [nmped].[ServiceProviderTypeDescriptor] (
    [ServiceProviderTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ServiceProviderTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ServiceProviderTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SpecialEducationLevelOfIntegrationDescriptor] --
CREATE TABLE [nmped].[SpecialEducationLevelOfIntegrationDescriptor] (
    [SpecialEducationLevelOfIntegrationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationLevelOfIntegrationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationLevelOfIntegrationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SpecialProgramCodeDescriptor] --
CREATE TABLE [nmped].[SpecialProgramCodeDescriptor] (
    [SpecialProgramCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialProgramCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialProgramCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[StaffEducationOrganizationAssignmentAssociationExtension] --
CREATE TABLE [nmped].[StaffEducationOrganizationAssignmentAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffClassificationDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [FullTimeEquivalency] [DECIMAL](5, 4) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [StaffClassificationDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StaffEducationOrganizationAssignmentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StaffExtension] --
CREATE TABLE [nmped].[StaffExtension] (
    [StaffUSI] [INT] NOT NULL,
    [HighestCompletedLevelOfEducationInstitutionDescriptorId] [INT] NOT NULL,
    [BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffExtension_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StaffExtension] ADD CONSTRAINT [StaffExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StaffSectionAssociationExtension] --
CREATE TABLE [nmped].[StaffSectionAssociationExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [ClassPeriodDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffSectionAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StaffSectionAssociationExtension] ADD CONSTRAINT [StaffSectionAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentCTEProgramAssociationExtension] --
CREATE TABLE [nmped].[StudentCTEProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ProgramDeliveryMethodDescriptorId] [INT] NOT NULL,
    [IndustryCredentialDescriptorId] [INT] NOT NULL,
    [CredentialEarnedDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentCTEProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentCTEProgramAssociationExtension] ADD CONSTRAINT [StudentCTEProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [nmped].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [YearsInUSSchool] [DATE] NULL,
    [Grade09Entry] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentProgramAssociationExtension] --
CREATE TABLE [nmped].[StudentProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ParticipationInformationDescriptorId] [INT] NOT NULL,
    [ProgramIntensityDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentProgramAssociationExtension] ADD CONSTRAINT [StudentProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentProgramAssociationNMPEDService] --
CREATE TABLE [nmped].[StudentProgramAssociationNMPEDService] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [ServiceDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentProgramAssociationNMPEDService_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [ServiceDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentProgramAssociationNMPEDService] ADD CONSTRAINT [StudentProgramAssociationNMPEDService_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] --
CREATE TABLE [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DirectCertificationStatusDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolFoodServiceProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] ADD CONSTRAINT [StudentSchoolFoodServiceProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentSectionAssociationExtension] --
CREATE TABLE [nmped].[StudentSectionAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialProgramCodeDescriptorId] [INT] NOT NULL,
    [AlternateCreditCourseCode] [NVARCHAR](60) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSectionAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSectionAssociationExtension] ADD CONSTRAINT [StudentSectionAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialEducationLevelOfIntegrationDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

