BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmassessments.NmStudentAssessment') AND name = N'UX_NmStudentAssessment_ChangeVersion')
    CREATE INDEX [UX_NmStudentAssessment_ChangeVersion] ON [nmassessments].[NmStudentAssessment] ([ChangeVersion] ASC)
    GO
COMMIT

