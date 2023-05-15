BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmassessments.NmStudentAssessment') AND name = N'UX_NmStudentAssessment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_NmStudentAssessment_Id ON [nmassessments].[NmStudentAssessment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

