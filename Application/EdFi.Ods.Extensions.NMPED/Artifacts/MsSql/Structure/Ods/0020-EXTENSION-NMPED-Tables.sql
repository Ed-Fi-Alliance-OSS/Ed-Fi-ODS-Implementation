-- Table [nmped].[AnnualReviewDelayReasonDescriptor] --
CREATE TABLE [nmped].[AnnualReviewDelayReasonDescriptor] (
    [AnnualReviewDelayReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AnnualReviewDelayReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AnnualReviewDelayReasonDescriptorId] ASC
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

-- Table [nmped].[DirectCertificationStatusDescriptor] --
CREATE TABLE [nmped].[DirectCertificationStatusDescriptor] (
    [DirectCertificationStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DirectCertificationStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DirectCertificationStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[DisciplineActionExtension] --
CREATE TABLE [nmped].[DisciplineActionExtension] (
    [DisciplineActionIdentifier] [NVARCHAR](20) NOT NULL,
    [DisciplineDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DisciplineActionDetailedResponse] [NVARCHAR](1024) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [DisciplineActionExtension_PK] PRIMARY KEY CLUSTERED (
        [DisciplineActionIdentifier] ASC,
        [DisciplineDate] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[DisciplineActionExtension] ADD CONSTRAINT [DisciplineActionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
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

-- Table [nmped].[ExpectedDiplomaTypeDescriptor] --
CREATE TABLE [nmped].[ExpectedDiplomaTypeDescriptor] (
    [ExpectedDiplomaTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ExpectedDiplomaTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ExpectedDiplomaTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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

-- Table [nmped].[LevelOfIntegrationDescriptor] --
CREATE TABLE [nmped].[LevelOfIntegrationDescriptor] (
    [LevelOfIntegrationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [LevelOfIntegrationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [LevelOfIntegrationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[LocalEducationAgencyTransportation] --
CREATE TABLE [nmped].[LocalEducationAgencyTransportation] (
    [CategoryDescriptor01TransportationCategoryDescriptorId] [INT] NOT NULL,
    [CategoryDescriptor02TransportationCategoryDescriptorId] [INT] NOT NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
    [TransportationSetCodeDescriptorId] [INT] NOT NULL,
    [Count] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [LocalEducationAgencyTransportation_PK] PRIMARY KEY CLUSTERED (
        [CategoryDescriptor01TransportationCategoryDescriptorId] ASC,
        [CategoryDescriptor02TransportationCategoryDescriptorId] ASC,
        [LocalEducationAgencyId] ASC,
        [TransportationSetCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD CONSTRAINT [LocalEducationAgencyTransportation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD CONSTRAINT [LocalEducationAgencyTransportation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD CONSTRAINT [LocalEducationAgencyTransportation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[MileageTypeDescriptor] --
CREATE TABLE [nmped].[MileageTypeDescriptor] (
    [MileageTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MileageTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MileageTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[MilitaryFamilyDescriptor] --
CREATE TABLE [nmped].[MilitaryFamilyDescriptor] (
    [MilitaryFamilyDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MilitaryFamilyDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MilitaryFamilyDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[NMPEDClassPeriodDescriptor] --
CREATE TABLE [nmped].[NMPEDClassPeriodDescriptor] (
    [NMPEDClassPeriodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NMPEDClassPeriodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NMPEDClassPeriodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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

-- Table [nmped].[PreKClassTypeDescriptor] --
CREATE TABLE [nmped].[PreKClassTypeDescriptor] (
    [PreKClassTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PreKClassTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PreKClassTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[PrimaryAreaOfExceptionalityDescriptor] --
CREATE TABLE [nmped].[PrimaryAreaOfExceptionalityDescriptor] (
    [PrimaryAreaOfExceptionalityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PrimaryAreaOfExceptionalityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PrimaryAreaOfExceptionalityDescriptorId] ASC
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

-- Table [nmped].[RoadTypeDescriptor] --
CREATE TABLE [nmped].[RoadTypeDescriptor] (
    [RoadTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [RoadTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [RoadTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SectionExtension] --
CREATE TABLE [nmped].[SectionExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [NMPEDClassPeriodDescriptorId] [INT] NULL,
    [PreKClassTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
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

-- Table [nmped].[SpecialEducationNonComplianceReasonDescriptor] --
CREATE TABLE [nmped].[SpecialEducationNonComplianceReasonDescriptor] (
    [SpecialEducationNonComplianceReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationNonComplianceReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationNonComplianceReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[SpecialEducationReferralCodeDescriptor] --
CREATE TABLE [nmped].[SpecialEducationReferralCodeDescriptor] (
    [SpecialEducationReferralCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationReferralCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationReferralCodeDescriptorId] ASC
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
    [MentorTraining] [BIT] NULL,
    [MentorIdUniqueId] [NVARCHAR](32) NULL,
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

-- Table [nmped].[StaffEducationOrganizationEmploymentAssociationExtension] --
CREATE TABLE [nmped].[StaffEducationOrganizationEmploymentAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EmploymentStatusDescriptorId] [INT] NOT NULL,
    [HireDate] [DATE] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [TeacherOrPrincipalYearsInDistrict] [INT] NULL,
    [TeacherOrPrincipalYearsOverall] [INT] NULL,
    [HighestCompletedLevelOfEducationInstitutionDescriptorId] [INT] NULL,
    [BaccalaureateLevelOfEducationInstitutionDescriptorId] [INT] NULL,
    [NationalCertified] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationEmploymentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EmploymentStatusDescriptorId] ASC,
        [HireDate] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StaffEducationOrganizationEmploymentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationEmploymentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentAwardTypeDescriptor] --
CREATE TABLE [nmped].[StudentAwardTypeDescriptor] (
    [StudentAwardTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentAwardTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentAwardTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[StudentCTEProgramAssociationCredential] --
CREATE TABLE [nmped].[StudentCTEProgramAssociationCredential] (
    [BeginDate] [DATE] NOT NULL,
    [CredentialEarnedDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [IndustryCredentialDescriptorId] [INT] NOT NULL,
    [ProgramDeliveryMethodDescriptorId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentCTEProgramAssociationCredential_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [CredentialEarnedDate] ASC,
        [EducationOrganizationId] ASC,
        [IndustryCredentialDescriptorId] ASC,
        [ProgramDeliveryMethodDescriptorId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ADD CONSTRAINT [StudentCTEProgramAssociationCredential_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ADD CONSTRAINT [StudentCTEProgramAssociationCredential_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ADD CONSTRAINT [StudentCTEProgramAssociationCredential_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [nmped].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Grade09Entry] [DATE] NULL,
    [DentalExaminationVerificationCodeDescriptorId] [INT] NULL,
    [MilitaryFamilyDescriptorId] [INT] NULL,
    [GenderIdentityDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentEducationOrganizationAssociationStudentCharacteristicExtension] --
CREATE TABLE [nmped].[StudentEducationOrganizationAssociationStudentCharacteristicExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentCharacteristicDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [GiftedLevelOfIntegrationDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationStudentCharacteristicExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentCharacteristicDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentEducationOrganizationAssociationStudentCharacteristicExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationStudentCharacteristicExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
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
    [BEPProgramLanguageDescriptorId] [INT] NULL,
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

-- Table [nmped].[StudentProgramAssociationServiceExtension] --
CREATE TABLE [nmped].[StudentProgramAssociationServiceExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [ServiceDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ServiceFrequency] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentProgramAssociationServiceExtension_PK] PRIMARY KEY CLUSTERED (
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
ALTER TABLE [nmped].[StudentProgramAssociationServiceExtension] ADD CONSTRAINT [StudentProgramAssociationServiceExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] --
CREATE TABLE [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DirectCertificationStatusDescriptorId] [INT] NULL,
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

-- Table [nmped].[StudentSpecialEducationAssociationEvent] --
CREATE TABLE [nmped].[StudentSpecialEducationAssociationEvent] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [SpecialEducationEventTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialEducationEventReasonDescriptorId] [INT] NULL,
    [SpecialEducationNonComplianceReasonDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSpecialEducationAssociationEvent_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [EventDate] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [SpecialEducationEventTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ADD CONSTRAINT [StudentSpecialEducationAssociationEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ADD CONSTRAINT [StudentSpecialEducationAssociationEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ADD CONSTRAINT [StudentSpecialEducationAssociationEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
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
    [ExpectedDiplomaTypeDescriptorId] [INT] NULL,
    [BrailleInstruction] [BIT] NULL,
    [AlternateInstruction] [BIT] NOT NULL,
    [PrimaryAreaOfExceptionalityDescriptorId] [INT] NOT NULL,
    [SpecialEducationReferralCodeDescriptorId] [INT] NULL,
    [ChildCountEducationOrganizationId] [INT] NULL,
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

-- Table [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension] --
CREATE TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [SpecialEducationProgramServiceDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [IntegratedServicesStatus] [BIT] NULL,
    [ServiceDuration] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [SpecialEducationProgramServiceDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [nmped].[TransportationCategoryDescriptor] --
CREATE TABLE [nmped].[TransportationCategoryDescriptor] (
    [TransportationCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TransportationCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TransportationCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[TransportationSetCodeDescriptor] --
CREATE TABLE [nmped].[TransportationSetCodeDescriptor] (
    [TransportationSetCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TransportationSetCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TransportationSetCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[TriennialReviewDelayReasonDescriptor] --
CREATE TABLE [nmped].[TriennialReviewDelayReasonDescriptor] (
    [TriennialReviewDelayReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TriennialReviewDelayReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TriennialReviewDelayReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[VehicleBodyManufacturerDescriptor] --
CREATE TABLE [nmped].[VehicleBodyManufacturerDescriptor] (
    [VehicleBodyManufacturerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VehicleBodyManufacturerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VehicleBodyManufacturerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[VehicleChassisManufacturerDescriptor] --
CREATE TABLE [nmped].[VehicleChassisManufacturerDescriptor] (
    [VehicleChassisManufacturerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VehicleChassisManufacturerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VehicleChassisManufacturerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[VehicleFuelTypeDescriptor] --
CREATE TABLE [nmped].[VehicleFuelTypeDescriptor] (
    [VehicleFuelTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VehicleFuelTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VehicleFuelTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[VehicleMileage] --
CREATE TABLE [nmped].[VehicleMileage] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [MileageTypeDescriptorId] [INT] NOT NULL,
    [ReportingDate] [DATE] NOT NULL,
    [RoadTypeDescriptorId] [INT] NOT NULL,
    [VehicleId] [NVARCHAR](255) NOT NULL,
    [VehicleRouteDescriptorId] [INT] NOT NULL,
    [DailyMileage] [DECIMAL](5, 1) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [VehicleMileage_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [MileageTypeDescriptorId] ASC,
        [ReportingDate] ASC,
        [RoadTypeDescriptorId] ASC,
        [VehicleId] ASC,
        [VehicleRouteDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[VehicleMileage] ADD CONSTRAINT [VehicleMileage_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[VehicleMileage] ADD CONSTRAINT [VehicleMileage_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[VehicleMileage] ADD CONSTRAINT [VehicleMileage_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[VehicleRouteDescriptor] --
CREATE TABLE [nmped].[VehicleRouteDescriptor] (
    [VehicleRouteDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VehicleRouteDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VehicleRouteDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmped].[VehicleSnapshot] --
CREATE TABLE [nmped].[VehicleSnapshot] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [VehicleId] [NVARCHAR](255) NOT NULL,
    [VehicleIdentificationNumber] [NVARCHAR](21) NOT NULL,
    [LicensePlateNumber] [NVARCHAR](10) NOT NULL,
    [ManufacturerYear] [INT] NOT NULL,
    [VehicleBodyManufacturerDescriptorId] [INT] NOT NULL,
    [VehicleChassisManufacturerDescriptorId] [INT] NOT NULL,
    [GrossVehicleWeightRating] [INT] NOT NULL,
    [VehicleFuelTypeDescriptorId] [INT] NOT NULL,
    [SpecialLiftEquipmentIndicator] [BIT] NOT NULL,
    [SeatingCapacity] [INT] NOT NULL,
    [RegisteredOwnerCode] [NVARCHAR](20) NOT NULL,
    [OdometerMileage] [INT] NOT NULL,
    [OdometerReadingDate] [DATE] NOT NULL,
    [NumberOfDaysInUse] [INT] NOT NULL,
    [VehicleUseIndicator] [BIT] NOT NULL,
    [VehicleTypeDescriptorId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [VehicleSnapshot_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [SchoolYear] ASC,
        [VehicleId] ASC,
        [VehicleIdentificationNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmped].[VehicleSnapshot] ADD CONSTRAINT [VehicleSnapshot_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmped].[VehicleSnapshot] ADD CONSTRAINT [VehicleSnapshot_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmped].[VehicleSnapshot] ADD CONSTRAINT [VehicleSnapshot_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmped].[VehicleTypeDescriptor] --
CREATE TABLE [nmped].[VehicleTypeDescriptor] (
    [VehicleTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VehicleTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VehicleTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

