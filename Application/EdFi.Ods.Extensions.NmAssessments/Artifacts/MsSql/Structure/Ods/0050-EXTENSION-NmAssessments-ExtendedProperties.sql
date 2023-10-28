-- Extended Properties [nmassessments].[ItemDescriptionCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code that further describes the assessment.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'ItemDescriptionCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'ItemDescriptionCodeDescriptor', @level2type=N'COLUMN', @level2name=N'ItemDescriptionCodeDescriptorId'
GO

-- Extended Properties [nmassessments].[NmStudentAssessment] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Entity that captures student assessments in a legacy STARs-like format', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code that further describes the assessment.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'ItemDescriptionCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the assessment was given', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'TestDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code that defines the assessment.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'TestDescriptionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indication of whether or not the assessment standard was achieved.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'StandardAchievedCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Measurement used to determine the outcomes the respective assessment.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'ScoringModelCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Score of administered test. Need not be a RAW Score.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'NmStudentAssessment', @level2type=N'COLUMN', @level2name=N'RawScore'
GO

-- Extended Properties [nmassessments].[ScoringModelCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Measurement used to determine the outcomes the respective assessment.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'ScoringModelCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'ScoringModelCodeDescriptor', @level2type=N'COLUMN', @level2name=N'ScoringModelCodeDescriptorId'
GO

-- Extended Properties [nmassessments].[StandardAchievedCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indication of whether or not the assessment standard was achieved.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'StandardAchievedCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'StandardAchievedCodeDescriptor', @level2type=N'COLUMN', @level2name=N'StandardAchievedCodeDescriptorId'
GO

-- Extended Properties [nmassessments].[TestDescriptionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code that defines the assessment.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'TestDescriptionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmassessments', @level1type=N'TABLE', @level1name=N'TestDescriptionDescriptor', @level2type=N'COLUMN', @level2name=N'TestDescriptionDescriptorId'
GO

