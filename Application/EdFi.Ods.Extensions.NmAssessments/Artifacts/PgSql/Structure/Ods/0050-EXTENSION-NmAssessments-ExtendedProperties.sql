-- Extended Properties [nmassessments].[ItemDescriptionCodeDescriptor] --
COMMENT ON TABLE nmassessments.ItemDescriptionCodeDescriptor IS 'Code that further describes the assessment.';
COMMENT ON COLUMN nmassessments.ItemDescriptionCodeDescriptor.ItemDescriptionCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmassessments].[NmStudentAssessment] --
COMMENT ON TABLE nmassessments.NmStudentAssessment IS 'Entity that captures student assessments in a legacy STARs-like format';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.ItemDescriptionCodeDescriptorId IS 'Code that further describes the assessment.';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.TestDate IS 'The date the assessment was given';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.TestDescriptionDescriptorId IS 'Code that defines the assessment.';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.StandardAchievedCodeDescriptorId IS 'Indication of whether or not the assessment standard was achieved.';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.ScoringModelCodeDescriptorId IS 'The Measurement used to determine the outcomes the respective assessment.';
COMMENT ON COLUMN nmassessments.NmStudentAssessment.RawScore IS 'Score of administered test. Need not be a RAW Score.';

-- Extended Properties [nmassessments].[ScoringModelCodeDescriptor] --
COMMENT ON TABLE nmassessments.ScoringModelCodeDescriptor IS 'The Measurement used to determine the outcomes the respective assessment.';
COMMENT ON COLUMN nmassessments.ScoringModelCodeDescriptor.ScoringModelCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmassessments].[StandardAchievedCodeDescriptor] --
COMMENT ON TABLE nmassessments.StandardAchievedCodeDescriptor IS 'Indication of whether or not the assessment standard was achieved.';
COMMENT ON COLUMN nmassessments.StandardAchievedCodeDescriptor.StandardAchievedCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmassessments].[TestDescriptionDescriptor] --
COMMENT ON TABLE nmassessments.TestDescriptionDescriptor IS 'Code that defines the assessment.';
COMMENT ON COLUMN nmassessments.TestDescriptionDescriptor.TestDescriptionDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

