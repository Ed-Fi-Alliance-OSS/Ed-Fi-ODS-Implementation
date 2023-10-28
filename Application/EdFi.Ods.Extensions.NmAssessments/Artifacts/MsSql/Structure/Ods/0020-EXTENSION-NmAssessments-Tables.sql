-- Table [nmassessments].[ItemDescriptionCodeDescriptor] --
CREATE TABLE [nmassessments].[ItemDescriptionCodeDescriptor] (
    [ItemDescriptionCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ItemDescriptionCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ItemDescriptionCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmassessments].[NmStudentAssessment] --
CREATE TABLE [nmassessments].[NmStudentAssessment] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ItemDescriptionCodeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TestDate] [DATE] NOT NULL,
    [TestDescriptionDescriptorId] [INT] NOT NULL,
    [StandardAchievedCodeDescriptorId] [INT] NULL,
    [ScoringModelCodeDescriptorId] [INT] NULL,
    [RawScore] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [NmStudentAssessment_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ItemDescriptionCodeDescriptorId] ASC,
        [StudentUSI] ASC,
        [TestDate] ASC,
        [TestDescriptionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD CONSTRAINT [NmStudentAssessment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD CONSTRAINT [NmStudentAssessment_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD CONSTRAINT [NmStudentAssessment_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [nmassessments].[ScoringModelCodeDescriptor] --
CREATE TABLE [nmassessments].[ScoringModelCodeDescriptor] (
    [ScoringModelCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ScoringModelCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ScoringModelCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmassessments].[StandardAchievedCodeDescriptor] --
CREATE TABLE [nmassessments].[StandardAchievedCodeDescriptor] (
    [StandardAchievedCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StandardAchievedCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StandardAchievedCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [nmassessments].[TestDescriptionDescriptor] --
CREATE TABLE [nmassessments].[TestDescriptionDescriptor] (
    [TestDescriptionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TestDescriptionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TestDescriptionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

