IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmassessments].[NmStudentAssessment]') AND name = 'ChangeVersion')
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

