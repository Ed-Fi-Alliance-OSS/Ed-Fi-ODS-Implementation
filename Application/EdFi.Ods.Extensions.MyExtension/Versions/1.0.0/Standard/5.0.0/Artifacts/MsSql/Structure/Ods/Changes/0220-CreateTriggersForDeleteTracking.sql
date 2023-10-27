-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DROP TRIGGER IF EXISTS [myextension].[myextension_InstitutionControlDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [myextension].[myextension_InstitutionControlDescriptor_TR_DeleteTracking] ON [myextension].[InstitutionControlDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.InstitutionControlDescriptorId, b.CodeValue, b.Namespace, b.Id, 'myextension.InstitutionControlDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstitutionControlDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [myextension].[InstitutionControlDescriptor] ENABLE TRIGGER [myextension_InstitutionControlDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [myextension].[myextension_InstitutionLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [myextension].[myextension_InstitutionLevelDescriptor_TR_DeleteTracking] ON [myextension].[InstitutionLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.InstitutionLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'myextension.InstitutionLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstitutionLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [myextension].[InstitutionLevelDescriptor] ENABLE TRIGGER [myextension_InstitutionLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [myextension].[myextension_PostSecondaryOrganization_TR_DeleteTracking]
GO

CREATE TRIGGER [myextension].[myextension_PostSecondaryOrganization_TR_DeleteTracking] ON [myextension].[PostSecondaryOrganization] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_myextension].[PostSecondaryOrganization](OldNameOfInstitution, Id, Discriminator, ChangeVersion)
    SELECT d.NameOfInstitution, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [myextension].[PostSecondaryOrganization] ENABLE TRIGGER [myextension_PostSecondaryOrganization_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [myextension].[myextension_SpecialEducationGraduationStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [myextension].[myextension_SpecialEducationGraduationStatusDescriptor_TR_DeleteTracking] ON [myextension].[SpecialEducationGraduationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialEducationGraduationStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'myextension.SpecialEducationGraduationStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationGraduationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [myextension].[SpecialEducationGraduationStatusDescriptor] ENABLE TRIGGER [myextension_SpecialEducationGraduationStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [myextension].[myextension_SubmissionCertificationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [myextension].[myextension_SubmissionCertificationDescriptor_TR_DeleteTracking] ON [myextension].[SubmissionCertificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SubmissionCertificationDescriptorId, b.CodeValue, b.Namespace, b.Id, 'myextension.SubmissionCertificationDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SubmissionCertificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [myextension].[SubmissionCertificationDescriptor] ENABLE TRIGGER [myextension_SubmissionCertificationDescriptor_TR_DeleteTracking]
GO


