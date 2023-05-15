CREATE TRIGGER [nmassessments].[nmassessments_NmStudentAssessment_TR_UpdateChangeVersion] ON [nmassessments].[NmStudentAssessment] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [nmassessments].[NmStudentAssessment]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [nmassessments].[NmStudentAssessment] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

