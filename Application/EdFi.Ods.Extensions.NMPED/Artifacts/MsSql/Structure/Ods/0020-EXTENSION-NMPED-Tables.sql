-- Table [nmped].[AnnualReviewDelayReasonDescriptor] --
CREATE TABLE [nmped].[AnnualReviewDelayReasonDescriptor] (
    [AnnualReviewDelayReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AnnualReviewDelayReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AnnualReviewDelayReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[ClassPeriodDescriptor] --
CREATE TABLE [nmped].[ClassPeriodDescriptor] (
    [ClassPeriodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ClassPeriodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ClassPeriodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DentalExaminationVerificationCodeDescriptor] --
CREATE TABLE [nmped].[DentalExaminationVerificationCodeDescriptor] (
    [DentalExaminationVerificationCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DentalExaminationVerificationCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DentalExaminationVerificationCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DigitalEquityInternetAccessTypeDescriptor] --
CREATE TABLE [nmped].[DigitalEquityInternetAccessTypeDescriptor] (
    [DigitalEquityInternetAccessTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DigitalEquityInternetAccessTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DigitalEquityInternetAccessTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] --
CREATE TABLE [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] (
    [DigitalEquityInternetPerformanceCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DigitalEquityInternetPerformanceCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DigitalEquityInternetPerformanceCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] --
CREATE TABLE [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] (
    [DigitalEquityPrimaryLearningDeviceAccessDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DigitalEquityPrimaryLearningDeviceAccessDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DigitalEquityPrimaryLearningDeviceAccessDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] --
CREATE TABLE [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] (
    [DigitalEquityPrimaryLearningDeviceTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DigitalEquityPrimaryLearningDeviceTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DigitalEquityPrimaryLearningDeviceTypeDescriptorId] ASC
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

-- Table [nmped].[GenderIdentityDescriptor] --
CREATE TABLE [nmped].[GenderIdentityDescriptor] (
    [GenderIdentityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [GenderIdentityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [GenderIdentityDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
    [ServiceSettingDescriptorId] [INT] NULL,
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

-- Table [nmped].[PlannedPostGraduateActivityDescriptor] --
CREATE TABLE [nmped].[PlannedPostGraduateActivityDescriptor] (
    [PlannedPostGraduateActivityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PlannedPostGraduateActivityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PlannedPostGraduateActivityDescriptorId] ASC
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

-- Table [nmped].[ServiceProviderTypeDescriptor] --
CREATE TABLE [nmped].[ServiceProviderTypeDescriptor] (
    [ServiceProviderTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ServiceProviderTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ServiceProviderTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[ServiceSettingDescriptor] --
CREATE TABLE [nmped].[ServiceSettingDescriptor] (
    [ServiceSettingDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ServiceSettingDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ServiceSettingDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SpecialEducationEventReasonDescriptor] --
CREATE TABLE [nmped].[SpecialEducationEventReasonDescriptor] (
    [SpecialEducationEventReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationEventReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationEventReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SpecialEducationEventTypeDescriptor] --
CREATE TABLE [nmped].[SpecialEducationEventTypeDescriptor] (
    [SpecialEducationEventTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationEventTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationEventTypeDescriptorId] ASC
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

-- Table [nmped].[SpecialEducationNonComplianceReasonDescriptor] --
CREATE TABLE [nmped].[SpecialEducationNonComplianceReasonDescriptor] (
    [SpecialEducationNonComplianceReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationNonComplianceReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationNonComplianceReasonDescriptorId] ASC
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

-- Table [nmped].[StaffDevelopment] --
CREATE TABLE [nmped].[StaffDevelopment] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [StartDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [StaffDevelopmentActivityCodeDescriptorId] [INT] NOT NULL,
    [StaffDevelopmentPurposeCodeDescriptorId] [INT] NULL,
    [ActivityHours] [INT] NOT NULL,
    [StaffCreditsEarned] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffDevelopment_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StaffUSI] ASC,
        [StartDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StaffDevelopment] ADD CONSTRAINT [StaffDevelopment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StaffDevelopment] ADD CONSTRAINT [StaffDevelopment_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StaffDevelopment] ADD CONSTRAINT [StaffDevelopment_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[StaffDevelopmentActivityCodeDescriptor] --
CREATE TABLE [nmped].[StaffDevelopmentActivityCodeDescriptor] (
    [StaffDevelopmentActivityCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffDevelopmentActivityCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffDevelopmentActivityCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[StaffDevelopmentPurposeCodeDescriptor] --
CREATE TABLE [nmped].[StaffDevelopmentPurposeCodeDescriptor] (
    [StaffDevelopmentPurposeCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffDevelopmentPurposeCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffDevelopmentPurposeCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[StaffEducationOrganizationDigitalEquity] --
CREATE TABLE [nmped].[StaffEducationOrganizationDigitalEquity] (
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [StartDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [DigitalEquityPrimaryLearningDeviceTypeDescriptorId] [INT] NOT NULL,
    [SchoolProvidedDevice] [BIT] NOT NULL,
    [DigitalEquityPrimaryLearningDeviceAccessDescriptorId] [INT] NOT NULL,
    [DigitalEquityInternetAccessTypeDescriptorId] [INT] NOT NULL,
    [DigitalEquityInternetPerformanceCodeDescriptorId] [INT] NOT NULL,
    [InternetAccessInResidence] [BIT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationDigitalEquity_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StaffUSI] ASC,
        [StartDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] ADD CONSTRAINT [StaffEducationOrganizationDigitalEquity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] ADD CONSTRAINT [StaffEducationOrganizationDigitalEquity_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] ADD CONSTRAINT [StaffEducationOrganizationDigitalEquity_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[StaffExtension] --
CREATE TABLE [nmped].[StaffExtension] (
    [StaffUSI] [INT] NOT NULL,
    [HighestCompletedLevelOfEducationInstitutionDescriptorId] [INT] NULL,
    [BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId] [INT] NULL,
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
    [ClassPeriodDescriptorId] [INT] NULL,
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

-- Table [nmped].[StudentAwardLanguageDescriptor] --
CREATE TABLE [nmped].[StudentAwardLanguageDescriptor] (
    [StudentAwardLanguageDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentAwardLanguageDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentAwardLanguageDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[StudentAwardTypeDescriptor] --
CREATE TABLE [nmped].[StudentAwardTypeDescriptor] (
    [StudentAwardTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentAwardTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentAwardTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
    [Grade09Entry] [DATE] NULL,
    [DentalExaminationVerificationCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentEducationOrganizationAward] --
CREATE TABLE [nmped].[StudentEducationOrganizationAward] (
    [AwardDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentAwardLanguageDescriptorId] [INT] NOT NULL,
    [StudentAwardTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAward_PK] PRIMARY KEY CLUSTERED (
        [AwardDate] ASC,
        [EducationOrganizationId] ASC,
        [SchoolYear] ASC,
        [StudentAwardLanguageDescriptorId] ASC,
        [StudentAwardTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD CONSTRAINT [StudentEducationOrganizationAward_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD CONSTRAINT [StudentEducationOrganizationAward_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD CONSTRAINT [StudentEducationOrganizationAward_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[StudentExtension] --
CREATE TABLE [nmped].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [GenderIdentityDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentExtension] ADD CONSTRAINT [StudentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentProgramAssociationExtension] --
CREATE TABLE [nmped].[StudentProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ParticipationInformationDescriptorId] [INT] NULL,
    [ProgramIntensityDescriptorId] [INT] NULL,
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

-- Table [nmped].[StudentSchoolAggregateSectionAttendance] --
CREATE TABLE [nmped].[StudentSchoolAggregateSectionAttendance] (
    [BeginDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EndDate] [DATE] NULL,
    [NumberOfScheduledPeriods] [INT] NULL,
    [NumberOfPeriodsAttended] [INT] NULL,
    [NumberOfPeriodsExcused] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSchoolAggregateSectionAttendance_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] ADD CONSTRAINT [StudentSchoolAggregateSectionAttendance_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] ADD CONSTRAINT [StudentSchoolAggregateSectionAttendance_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] ADD CONSTRAINT [StudentSchoolAggregateSectionAttendance_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
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
    [SpecialProgramCodeDescriptorId] [INT] NULL,
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
    [AnnualReviewDelayReasonDescriptorId] [INT] NULL,
    [TriennialReviewDelayReasonDescriptorId] [INT] NULL,
    [PlannedPostGraduateActivityDescriptorId] [INT] NULL,
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

-- Table [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] --
CREATE TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [SpecialEducationEventTypeDescriptorId] [INT] NOT NULL,
    [SpecialEducationEventReasonDescriptorId] [INT] NULL,
    [SpecialEducationNonComplianceReasonDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[TriennialReviewDelayReasonDescriptor] --
CREATE TABLE [nmped].[TriennialReviewDelayReasonDescriptor] (
    [TriennialReviewDelayReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TriennialReviewDelayReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TriennialReviewDelayReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

