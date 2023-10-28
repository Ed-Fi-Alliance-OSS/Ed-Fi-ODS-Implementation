CREATE TRIGGER [nmassessments].[nmassessments_ItemDescriptionCodeDescriptor_TR_DeleteTracking] ON [nmassessments].[ItemDescriptionCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmassessments].[ItemDescriptionCodeDescriptor](ItemDescriptionCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.ItemDescriptionCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ItemDescriptionCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[ItemDescriptionCodeDescriptor] ENABLE TRIGGER [nmassessments_ItemDescriptionCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmassessments].[nmassessments_NmStudentAssessment_TR_DeleteTracking] ON [nmassessments].[NmStudentAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmassessments].[NmStudentAssessment](EducationOrganizationId, ItemDescriptionCodeDescriptorId, StudentUSI, TestDate, TestDescriptionDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, ItemDescriptionCodeDescriptorId, StudentUSI, TestDate, TestDescriptionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] ENABLE TRIGGER [nmassessments_NmStudentAssessment_TR_DeleteTracking]
GO


CREATE TRIGGER [nmassessments].[nmassessments_ScoringModelCodeDescriptor_TR_DeleteTracking] ON [nmassessments].[ScoringModelCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmassessments].[ScoringModelCodeDescriptor](ScoringModelCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.ScoringModelCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ScoringModelCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[ScoringModelCodeDescriptor] ENABLE TRIGGER [nmassessments_ScoringModelCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmassessments].[nmassessments_StandardAchievedCodeDescriptor_TR_DeleteTracking] ON [nmassessments].[StandardAchievedCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmassessments].[StandardAchievedCodeDescriptor](StandardAchievedCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.StandardAchievedCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StandardAchievedCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[StandardAchievedCodeDescriptor] ENABLE TRIGGER [nmassessments_StandardAchievedCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [nmassessments].[nmassessments_TestDescriptionDescriptor_TR_DeleteTracking] ON [nmassessments].[TestDescriptionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_nmassessments].[TestDescriptionDescriptor](TestDescriptionDescriptorId, Id, ChangeVersion)
    SELECT  d.TestDescriptionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TestDescriptionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[TestDescriptionDescriptor] ENABLE TRIGGER [nmassessments_TestDescriptionDescriptor_TR_DeleteTracking]
GO


