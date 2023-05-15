
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

