-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TRIGGER [tpdm].[tpdm_AidTypeDescriptor_TR_DeleteTracking] ON [tpdm].[AidTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AidTypeDescriptor](AidTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.AidTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AidTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[AidTypeDescriptor] ENABLE TRIGGER [tpdm_AidTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAcademicRecord_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentAcademicRecord] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentAcademicRecord](AnonymizedStudentIdentifier, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    SELECT  AnonymizedStudentIdentifier, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] ENABLE TRIGGER [tpdm_AnonymizedStudentAcademicRecord_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAssessmentCourseAssociation_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentAssessmentCourseAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentAssessmentCourseAssociation](AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, TakenSchoolYear, Id, ChangeVersion)
    SELECT  AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, TakenSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ENABLE TRIGGER [tpdm_AnonymizedStudentAssessmentCourseAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAssessmentSectionAssociation_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentAssessmentSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentAssessmentSectionAssociation](AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear, Id, ChangeVersion)
    SELECT  AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ENABLE TRIGGER [tpdm_AnonymizedStudentAssessmentSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAssessment_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentAssessment](AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear, Id, ChangeVersion)
    SELECT  AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] ENABLE TRIGGER [tpdm_AnonymizedStudentAssessment_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentCourseAssociation_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentCourseAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentCourseAssociation](AnonymizedStudentIdentifier, BeginDate, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    SELECT  AnonymizedStudentIdentifier, BeginDate, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] ENABLE TRIGGER [tpdm_AnonymizedStudentCourseAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentCourseTranscript_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentCourseTranscript] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentCourseTranscript](AnonymizedStudentIdentifier, CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    SELECT  AnonymizedStudentIdentifier, CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] ENABLE TRIGGER [tpdm_AnonymizedStudentCourseTranscript_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentEducationOrganizationAssociation_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentEducationOrganizationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentEducationOrganizationAssociation](AnonymizedStudentIdentifier, BeginDate, EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    SELECT  AnonymizedStudentIdentifier, BeginDate, EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ENABLE TRIGGER [tpdm_AnonymizedStudentEducationOrganizationAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentSectionAssociation_TR_DeleteTracking] ON [tpdm].[AnonymizedStudentSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudentSectionAssociation](AnonymizedStudentIdentifier, BeginDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  AnonymizedStudentIdentifier, BeginDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] ENABLE TRIGGER [tpdm_AnonymizedStudentSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudent_TR_DeleteTracking] ON [tpdm].[AnonymizedStudent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[AnonymizedStudent](AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    SELECT  AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[AnonymizedStudent] ENABLE TRIGGER [tpdm_AnonymizedStudent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ApplicantProspectAssociation_TR_DeleteTracking] ON [tpdm].[ApplicantProspectAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ApplicantProspectAssociation](ApplicantIdentifier, EducationOrganizationId, ProspectIdentifier, Id, ChangeVersion)
    SELECT  ApplicantIdentifier, EducationOrganizationId, ProspectIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[ApplicantProspectAssociation] ENABLE TRIGGER [tpdm_ApplicantProspectAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_Applicant_TR_DeleteTracking] ON [tpdm].[Applicant] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[Applicant](ApplicantIdentifier, EducationOrganizationId, Id, ChangeVersion)
    SELECT  ApplicantIdentifier, EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Applicant] ENABLE TRIGGER [tpdm_Applicant_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ApplicationEventResultDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationEventResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ApplicationEventResultDescriptor](ApplicationEventResultDescriptorId, Id, ChangeVersion)
    SELECT  d.ApplicationEventResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationEventResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationEventResultDescriptor] ENABLE TRIGGER [tpdm_ApplicationEventResultDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ApplicationEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ApplicationEventTypeDescriptor](ApplicationEventTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ApplicationEventTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationEventTypeDescriptor] ENABLE TRIGGER [tpdm_ApplicationEventTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ApplicationEvent_TR_DeleteTracking] ON [tpdm].[ApplicationEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ApplicationEvent](ApplicantIdentifier, ApplicationEventTypeDescriptorId, ApplicationIdentifier, EducationOrganizationId, EventDate, SequenceNumber, Id, ChangeVersion)
    SELECT  ApplicantIdentifier, ApplicationEventTypeDescriptorId, ApplicationIdentifier, EducationOrganizationId, EventDate, SequenceNumber, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[ApplicationEvent] ENABLE TRIGGER [tpdm_ApplicationEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ApplicationSourceDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ApplicationSourceDescriptor](ApplicationSourceDescriptorId, Id, ChangeVersion)
    SELECT  d.ApplicationSourceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationSourceDescriptor] ENABLE TRIGGER [tpdm_ApplicationSourceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ApplicationStatusDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ApplicationStatusDescriptor](ApplicationStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ApplicationStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationStatusDescriptor] ENABLE TRIGGER [tpdm_ApplicationStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_Application_TR_DeleteTracking] ON [tpdm].[Application] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[Application](ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId, Id, ChangeVersion)
    SELECT  ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Application] ENABLE TRIGGER [tpdm_Application_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_BackgroundCheckStatusDescriptor_TR_DeleteTracking] ON [tpdm].[BackgroundCheckStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[BackgroundCheckStatusDescriptor](BackgroundCheckStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.BackgroundCheckStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BackgroundCheckStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[BackgroundCheckStatusDescriptor] ENABLE TRIGGER [tpdm_BackgroundCheckStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_BackgroundCheckTypeDescriptor_TR_DeleteTracking] ON [tpdm].[BackgroundCheckTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[BackgroundCheckTypeDescriptor](BackgroundCheckTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.BackgroundCheckTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BackgroundCheckTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[BackgroundCheckTypeDescriptor] ENABLE TRIGGER [tpdm_BackgroundCheckTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_BoardCertificationTypeDescriptor_TR_DeleteTracking] ON [tpdm].[BoardCertificationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[BoardCertificationTypeDescriptor](BoardCertificationTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.BoardCertificationTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BoardCertificationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[BoardCertificationTypeDescriptor] ENABLE TRIGGER [tpdm_BoardCertificationTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CertificationExamStatusDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationExamStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CertificationExamStatusDescriptor](CertificationExamStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.CertificationExamStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationExamStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationExamStatusDescriptor] ENABLE TRIGGER [tpdm_CertificationExamStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CertificationExamTypeDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationExamTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CertificationExamTypeDescriptor](CertificationExamTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CertificationExamTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationExamTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationExamTypeDescriptor] ENABLE TRIGGER [tpdm_CertificationExamTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CompleterAsStaffAssociation_TR_DeleteTracking] ON [tpdm].[CompleterAsStaffAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CompleterAsStaffAssociation](StaffUSI, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  StaffUSI, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[CompleterAsStaffAssociation] ENABLE TRIGGER [tpdm_CompleterAsStaffAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CoteachingStyleObservedDescriptor_TR_DeleteTracking] ON [tpdm].[CoteachingStyleObservedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CoteachingStyleObservedDescriptor](CoteachingStyleObservedDescriptorId, Id, ChangeVersion)
    SELECT  d.CoteachingStyleObservedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CoteachingStyleObservedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CoteachingStyleObservedDescriptor] ENABLE TRIGGER [tpdm_CoteachingStyleObservedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CourseCourseTranscriptFacts_TR_DeleteTracking] ON [tpdm].[CourseCourseTranscriptFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CourseCourseTranscriptFacts](CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[CourseCourseTranscriptFacts] ENABLE TRIGGER [tpdm_CourseCourseTranscriptFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CourseStudentAcademicRecordFacts_TR_DeleteTracking] ON [tpdm].[CourseStudentAcademicRecordFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CourseStudentAcademicRecordFacts](CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] ENABLE TRIGGER [tpdm_CourseStudentAcademicRecordFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CourseStudentAssessmentFacts_TR_DeleteTracking] ON [tpdm].[CourseStudentAssessmentFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CourseStudentAssessmentFacts](CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] ENABLE TRIGGER [tpdm_CourseStudentAssessmentFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_CourseStudentFacts_TR_DeleteTracking] ON [tpdm].[CourseStudentFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[CourseStudentFacts](CourseCode, EducationOrganizationId, FactAsOfDate, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, FactAsOfDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[CourseStudentFacts] ENABLE TRIGGER [tpdm_CourseStudentFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationCourseTranscriptFacts_TR_DeleteTracking] ON [tpdm].[EducationOrganizationCourseTranscriptFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EducationOrganizationCourseTranscriptFacts](EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] ENABLE TRIGGER [tpdm_EducationOrganizationCourseTranscriptFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationFacts_TR_DeleteTracking] ON [tpdm].[EducationOrganizationFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EducationOrganizationFacts](EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EducationOrganizationFacts] ENABLE TRIGGER [tpdm_EducationOrganizationFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationStudentAcademicRecordFacts_TR_DeleteTracking] ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EducationOrganizationStudentAcademicRecordFacts](EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ENABLE TRIGGER [tpdm_EducationOrganizationStudentAcademicRecordFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationStudentAssessmentFacts_TR_DeleteTracking] ON [tpdm].[EducationOrganizationStudentAssessmentFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EducationOrganizationStudentAssessmentFacts](EducationOrganizationId, FactAsOfDate, TakenSchoolYear, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactAsOfDate, TakenSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] ENABLE TRIGGER [tpdm_EducationOrganizationStudentAssessmentFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationStudentFacts_TR_DeleteTracking] ON [tpdm].[EducationOrganizationStudentFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EducationOrganizationStudentFacts](EducationOrganizationId, FactAsOfDate, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactAsOfDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFacts] ENABLE TRIGGER [tpdm_EducationOrganizationStudentFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EmploymentEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[EmploymentEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EmploymentEventTypeDescriptor](EmploymentEventTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.EmploymentEventTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EmploymentEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EmploymentEventTypeDescriptor] ENABLE TRIGGER [tpdm_EmploymentEventTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EmploymentEvent_TR_DeleteTracking] ON [tpdm].[EmploymentEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EmploymentEvent](EducationOrganizationId, EmploymentEventTypeDescriptorId, RequisitionNumber, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EmploymentEventTypeDescriptorId, RequisitionNumber, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EmploymentEvent] ENABLE TRIGGER [tpdm_EmploymentEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EmploymentSeparationEvent_TR_DeleteTracking] ON [tpdm].[EmploymentSeparationEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EmploymentSeparationEvent](EducationOrganizationId, EmploymentSeparationDate, RequisitionNumber, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EmploymentSeparationDate, RequisitionNumber, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[EmploymentSeparationEvent] ENABLE TRIGGER [tpdm_EmploymentSeparationEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EmploymentSeparationReasonDescriptor_TR_DeleteTracking] ON [tpdm].[EmploymentSeparationReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EmploymentSeparationReasonDescriptor](EmploymentSeparationReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.EmploymentSeparationReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EmploymentSeparationReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EmploymentSeparationReasonDescriptor] ENABLE TRIGGER [tpdm_EmploymentSeparationReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EmploymentSeparationTypeDescriptor_TR_DeleteTracking] ON [tpdm].[EmploymentSeparationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EmploymentSeparationTypeDescriptor](EmploymentSeparationTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.EmploymentSeparationTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EmploymentSeparationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EmploymentSeparationTypeDescriptor] ENABLE TRIGGER [tpdm_EmploymentSeparationTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_EnglishLanguageExamDescriptor_TR_DeleteTracking] ON [tpdm].[EnglishLanguageExamDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[EnglishLanguageExamDescriptor](EnglishLanguageExamDescriptorId, Id, ChangeVersion)
    SELECT  d.EnglishLanguageExamDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EnglishLanguageExamDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EnglishLanguageExamDescriptor] ENABLE TRIGGER [tpdm_EnglishLanguageExamDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_FederalLocaleCodeDescriptor_TR_DeleteTracking] ON [tpdm].[FederalLocaleCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[FederalLocaleCodeDescriptor](FederalLocaleCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.FederalLocaleCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FederalLocaleCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[FederalLocaleCodeDescriptor] ENABLE TRIGGER [tpdm_FederalLocaleCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_FieldworkTypeDescriptor_TR_DeleteTracking] ON [tpdm].[FieldworkTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[FieldworkTypeDescriptor](FieldworkTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.FieldworkTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FieldworkTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[FieldworkTypeDescriptor] ENABLE TRIGGER [tpdm_FieldworkTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_FundingSourceDescriptor_TR_DeleteTracking] ON [tpdm].[FundingSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[FundingSourceDescriptor](FundingSourceDescriptorId, Id, ChangeVersion)
    SELECT  d.FundingSourceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FundingSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[FundingSourceDescriptor] ENABLE TRIGGER [tpdm_FundingSourceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_GenderDescriptor_TR_DeleteTracking] ON [tpdm].[GenderDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[GenderDescriptor](GenderDescriptorId, Id, ChangeVersion)
    SELECT  d.GenderDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GenderDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[GenderDescriptor] ENABLE TRIGGER [tpdm_GenderDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_HireStatusDescriptor_TR_DeleteTracking] ON [tpdm].[HireStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[HireStatusDescriptor](HireStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.HireStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HireStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[HireStatusDescriptor] ENABLE TRIGGER [tpdm_HireStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_HiringSourceDescriptor_TR_DeleteTracking] ON [tpdm].[HiringSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[HiringSourceDescriptor](HiringSourceDescriptorId, Id, ChangeVersion)
    SELECT  d.HiringSourceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HiringSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[HiringSourceDescriptor] ENABLE TRIGGER [tpdm_HiringSourceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_InternalExternalHireDescriptor_TR_DeleteTracking] ON [tpdm].[InternalExternalHireDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[InternalExternalHireDescriptor](InternalExternalHireDescriptorId, Id, ChangeVersion)
    SELECT  d.InternalExternalHireDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InternalExternalHireDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[InternalExternalHireDescriptor] ENABLE TRIGGER [tpdm_InternalExternalHireDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_LevelOfDegreeAwardedDescriptor_TR_DeleteTracking] ON [tpdm].[LevelOfDegreeAwardedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[LevelOfDegreeAwardedDescriptor](LevelOfDegreeAwardedDescriptorId, Id, ChangeVersion)
    SELECT  d.LevelOfDegreeAwardedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfDegreeAwardedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[LevelOfDegreeAwardedDescriptor] ENABLE TRIGGER [tpdm_LevelOfDegreeAwardedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_LevelTypeDescriptor_TR_DeleteTracking] ON [tpdm].[LevelTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[LevelTypeDescriptor](LevelTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.LevelTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[LevelTypeDescriptor] ENABLE TRIGGER [tpdm_LevelTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEventStatusDescriptor_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionEventStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[OpenStaffPositionEventStatusDescriptor](OpenStaffPositionEventStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.OpenStaffPositionEventStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OpenStaffPositionEventStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionEventStatusDescriptor] ENABLE TRIGGER [tpdm_OpenStaffPositionEventStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[OpenStaffPositionEventTypeDescriptor](OpenStaffPositionEventTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.OpenStaffPositionEventTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OpenStaffPositionEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionEventTypeDescriptor] ENABLE TRIGGER [tpdm_OpenStaffPositionEventTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEvent_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[OpenStaffPositionEvent](EducationOrganizationId, EventDate, OpenStaffPositionEventTypeDescriptorId, RequisitionNumber, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EventDate, OpenStaffPositionEventTypeDescriptorId, RequisitionNumber, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionEvent] ENABLE TRIGGER [tpdm_OpenStaffPositionEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionReasonDescriptor_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[OpenStaffPositionReasonDescriptor](OpenStaffPositionReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.OpenStaffPositionReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OpenStaffPositionReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionReasonDescriptor] ENABLE TRIGGER [tpdm_OpenStaffPositionReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasureCourseAssociation_TR_DeleteTracking] ON [tpdm].[PerformanceMeasureCourseAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[PerformanceMeasureCourseAssociation](CourseCode, EducationOrganizationId, PerformanceMeasureIdentifier, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, PerformanceMeasureIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] ENABLE TRIGGER [tpdm_PerformanceMeasureCourseAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasureFacts_TR_DeleteTracking] ON [tpdm].[PerformanceMeasureFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[PerformanceMeasureFacts](EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[PerformanceMeasureFacts] ENABLE TRIGGER [tpdm_PerformanceMeasureFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasureInstanceDescriptor_TR_DeleteTracking] ON [tpdm].[PerformanceMeasureInstanceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[PerformanceMeasureInstanceDescriptor](PerformanceMeasureInstanceDescriptorId, Id, ChangeVersion)
    SELECT  d.PerformanceMeasureInstanceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceMeasureInstanceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[PerformanceMeasureInstanceDescriptor] ENABLE TRIGGER [tpdm_PerformanceMeasureInstanceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasureTypeDescriptor_TR_DeleteTracking] ON [tpdm].[PerformanceMeasureTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[PerformanceMeasureTypeDescriptor](PerformanceMeasureTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.PerformanceMeasureTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceMeasureTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[PerformanceMeasureTypeDescriptor] ENABLE TRIGGER [tpdm_PerformanceMeasureTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasure_TR_DeleteTracking] ON [tpdm].[PerformanceMeasure] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[PerformanceMeasure](PerformanceMeasureIdentifier, Id, ChangeVersion)
    SELECT  PerformanceMeasureIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[PerformanceMeasure] ENABLE TRIGGER [tpdm_PerformanceMeasure_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_PreviousCareerDescriptor_TR_DeleteTracking] ON [tpdm].[PreviousCareerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[PreviousCareerDescriptor](PreviousCareerDescriptorId, Id, ChangeVersion)
    SELECT  d.PreviousCareerDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PreviousCareerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[PreviousCareerDescriptor] ENABLE TRIGGER [tpdm_PreviousCareerDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ProfessionalDevelopmentEvent_TR_DeleteTracking] ON [tpdm].[ProfessionalDevelopmentEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ProfessionalDevelopmentEvent](ProfessionalDevelopmentTitle, Id, ChangeVersion)
    SELECT  ProfessionalDevelopmentTitle, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ENABLE TRIGGER [tpdm_ProfessionalDevelopmentEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ProfessionalDevelopmentOfferedByDescriptor_TR_DeleteTracking] ON [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ProfessionalDevelopmentOfferedByDescriptor](ProfessionalDevelopmentOfferedByDescriptorId, Id, ChangeVersion)
    SELECT  d.ProfessionalDevelopmentOfferedByDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProfessionalDevelopmentOfferedByDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] ENABLE TRIGGER [tpdm_ProfessionalDevelopmentOfferedByDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ProgramGatewayDescriptor_TR_DeleteTracking] ON [tpdm].[ProgramGatewayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ProgramGatewayDescriptor](ProgramGatewayDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramGatewayDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramGatewayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ProgramGatewayDescriptor] ENABLE TRIGGER [tpdm_ProgramGatewayDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ProspectProfessionalDevelopmentEventAttendance_TR_DeleteTracking] ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ProspectProfessionalDevelopmentEventAttendance](AttendanceDate, EducationOrganizationId, ProfessionalDevelopmentTitle, ProspectIdentifier, Id, ChangeVersion)
    SELECT  AttendanceDate, EducationOrganizationId, ProfessionalDevelopmentTitle, ProspectIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ENABLE TRIGGER [tpdm_ProspectProfessionalDevelopmentEventAttendance_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ProspectTypeDescriptor_TR_DeleteTracking] ON [tpdm].[ProspectTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ProspectTypeDescriptor](ProspectTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ProspectTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProspectTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ProspectTypeDescriptor] ENABLE TRIGGER [tpdm_ProspectTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_Prospect_TR_DeleteTracking] ON [tpdm].[Prospect] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[Prospect](EducationOrganizationId, ProspectIdentifier, Id, ChangeVersion)
    SELECT  EducationOrganizationId, ProspectIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Prospect] ENABLE TRIGGER [tpdm_Prospect_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_RecruitmentEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[RecruitmentEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[RecruitmentEventTypeDescriptor](RecruitmentEventTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.RecruitmentEventTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RecruitmentEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[RecruitmentEventTypeDescriptor] ENABLE TRIGGER [tpdm_RecruitmentEventTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_RecruitmentEvent_TR_DeleteTracking] ON [tpdm].[RecruitmentEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[RecruitmentEvent](EventDate, EventTitle, Id, ChangeVersion)
    SELECT  EventDate, EventTitle, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[RecruitmentEvent] ENABLE TRIGGER [tpdm_RecruitmentEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_RubricLevelResponseFacts_TR_DeleteTracking] ON [tpdm].[RubricLevelResponseFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[RubricLevelResponseFacts](EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[RubricLevelResponseFacts] ENABLE TRIGGER [tpdm_RubricLevelResponseFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_RubricLevelResponse_TR_DeleteTracking] ON [tpdm].[RubricLevelResponse] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[RubricLevelResponse](EducationOrganizationId, PerformanceMeasureIdentifier, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, PerformanceMeasureIdentifier, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[RubricLevelResponse] ENABLE TRIGGER [tpdm_RubricLevelResponse_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_RubricLevel_TR_DeleteTracking] ON [tpdm].[RubricLevel] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[RubricLevel](EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[RubricLevel] ENABLE TRIGGER [tpdm_RubricLevel_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_RubricTypeDescriptor_TR_DeleteTracking] ON [tpdm].[RubricTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[RubricTypeDescriptor](RubricTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.RubricTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RubricTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[RubricTypeDescriptor] ENABLE TRIGGER [tpdm_RubricTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_Rubric_TR_DeleteTracking] ON [tpdm].[Rubric] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[Rubric](EducationOrganizationId, RubricTitle, RubricTypeDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, RubricTitle, RubricTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Rubric] ENABLE TRIGGER [tpdm_Rubric_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SalaryTypeDescriptor_TR_DeleteTracking] ON [tpdm].[SalaryTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SalaryTypeDescriptor](SalaryTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.SalaryTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SalaryTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[SalaryTypeDescriptor] ENABLE TRIGGER [tpdm_SalaryTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SchoolStatusDescriptor_TR_DeleteTracking] ON [tpdm].[SchoolStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SchoolStatusDescriptor](SchoolStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[SchoolStatusDescriptor] ENABLE TRIGGER [tpdm_SchoolStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SectionCourseTranscriptFacts_TR_DeleteTracking] ON [tpdm].[SectionCourseTranscriptFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SectionCourseTranscriptFacts](FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[SectionCourseTranscriptFacts] ENABLE TRIGGER [tpdm_SectionCourseTranscriptFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SectionStudentAcademicRecordFacts_TR_DeleteTracking] ON [tpdm].[SectionStudentAcademicRecordFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SectionStudentAcademicRecordFacts](FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFacts] ENABLE TRIGGER [tpdm_SectionStudentAcademicRecordFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SectionStudentAssessmentFacts_TR_DeleteTracking] ON [tpdm].[SectionStudentAssessmentFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SectionStudentAssessmentFacts](FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear, Id, ChangeVersion)
    SELECT  FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] ENABLE TRIGGER [tpdm_SectionStudentAssessmentFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SectionStudentFacts_TR_DeleteTracking] ON [tpdm].[SectionStudentFacts] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SectionStudentFacts](FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    SELECT  FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[SectionStudentFacts] ENABLE TRIGGER [tpdm_SectionStudentFacts_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffApplicantAssociation_TR_DeleteTracking] ON [tpdm].[StaffApplicantAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffApplicantAssociation](ApplicantIdentifier, EducationOrganizationId, StaffUSI, Id, ChangeVersion)
    SELECT  ApplicantIdentifier, EducationOrganizationId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffApplicantAssociation] ENABLE TRIGGER [tpdm_StaffApplicantAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationComponentRating_TR_DeleteTracking] ON [tpdm].[StaffEvaluationComponentRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationComponentRating](ComponentRating, EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, ChangeVersion)
    SELECT  ComponentRating, EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffEvaluationComponentRating] ENABLE TRIGGER [tpdm_StaffEvaluationComponentRating_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationComponent_TR_DeleteTracking] ON [tpdm].[StaffEvaluationComponent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationComponent](EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffEvaluationComponent] ENABLE TRIGGER [tpdm_StaffEvaluationComponent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationElementRating_TR_DeleteTracking] ON [tpdm].[StaffEvaluationElementRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationElementRating](EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffEvaluationElementRating] ENABLE TRIGGER [tpdm_StaffEvaluationElementRating_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationElement_TR_DeleteTracking] ON [tpdm].[StaffEvaluationElement] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationElement](EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle, Id, ChangeVersion)
    SELECT  EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffEvaluationElement] ENABLE TRIGGER [tpdm_StaffEvaluationElement_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationPeriodDescriptor_TR_DeleteTracking] ON [tpdm].[StaffEvaluationPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationPeriodDescriptor](StaffEvaluationPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffEvaluationPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffEvaluationPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[StaffEvaluationPeriodDescriptor] ENABLE TRIGGER [tpdm_StaffEvaluationPeriodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationRatingLevelDescriptor_TR_DeleteTracking] ON [tpdm].[StaffEvaluationRatingLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationRatingLevelDescriptor](StaffEvaluationRatingLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffEvaluationRatingLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffEvaluationRatingLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[StaffEvaluationRatingLevelDescriptor] ENABLE TRIGGER [tpdm_StaffEvaluationRatingLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationRating_TR_DeleteTracking] ON [tpdm].[StaffEvaluationRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationRating](EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffEvaluationRating] ENABLE TRIGGER [tpdm_StaffEvaluationRating_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationTypeDescriptor_TR_DeleteTracking] ON [tpdm].[StaffEvaluationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluationTypeDescriptor](StaffEvaluationTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffEvaluationTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffEvaluationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[StaffEvaluationTypeDescriptor] ENABLE TRIGGER [tpdm_StaffEvaluationTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffEvaluation_TR_DeleteTracking] ON [tpdm].[StaffEvaluation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffEvaluation](EducationOrganizationId, SchoolYear, StaffEvaluationTitle, Id, ChangeVersion)
    SELECT  EducationOrganizationId, SchoolYear, StaffEvaluationTitle, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffEvaluation] ENABLE TRIGGER [tpdm_StaffEvaluation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffFieldworkAbsenceEvent_TR_DeleteTracking] ON [tpdm].[StaffFieldworkAbsenceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffFieldworkAbsenceEvent](AbsenceEventCategoryDescriptorId, EventDate, StaffUSI, Id, ChangeVersion)
    SELECT  AbsenceEventCategoryDescriptorId, EventDate, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] ENABLE TRIGGER [tpdm_StaffFieldworkAbsenceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffFieldworkExperienceSectionAssociation_TR_DeleteTracking] ON [tpdm].[StaffFieldworkExperienceSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffFieldworkExperienceSectionAssociation](BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI, Id, ChangeVersion)
    SELECT  BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] ENABLE TRIGGER [tpdm_StaffFieldworkExperienceSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffFieldworkExperience_TR_DeleteTracking] ON [tpdm].[StaffFieldworkExperience] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffFieldworkExperience](BeginDate, FieldworkIdentifier, StaffUSI, Id, ChangeVersion)
    SELECT  BeginDate, FieldworkIdentifier, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffFieldworkExperience] ENABLE TRIGGER [tpdm_StaffFieldworkExperience_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffProfessionalDevelopmentEventAttendance_TR_DeleteTracking] ON [tpdm].[StaffProfessionalDevelopmentEventAttendance] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffProfessionalDevelopmentEventAttendance](AttendanceDate, ProfessionalDevelopmentTitle, StaffUSI, Id, ChangeVersion)
    SELECT  AttendanceDate, ProfessionalDevelopmentTitle, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] ENABLE TRIGGER [tpdm_StaffProfessionalDevelopmentEventAttendance_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffProspectAssociation_TR_DeleteTracking] ON [tpdm].[StaffProspectAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffProspectAssociation](EducationOrganizationId, ProspectIdentifier, StaffUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, ProspectIdentifier, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffProspectAssociation] ENABLE TRIGGER [tpdm_StaffProspectAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasureCourseAssociation_TR_DeleteTracking] ON [tpdm].[StaffStudentGrowthMeasureCourseAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffStudentGrowthMeasureCourseAssociation](CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ENABLE TRIGGER [tpdm_StaffStudentGrowthMeasureCourseAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasureEducationOrganizationAssociation_TR_DeleteTracking] ON [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation](EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ENABLE TRIGGER [tpdm_StaffStudentGrowthMeasureEducationOrganizationAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasureSectionAssociation_TR_DeleteTracking] ON [tpdm].[StaffStudentGrowthMeasureSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffStudentGrowthMeasureSectionAssociation](FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    SELECT  FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ENABLE TRIGGER [tpdm_StaffStudentGrowthMeasureSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasure_TR_DeleteTracking] ON [tpdm].[StaffStudentGrowthMeasure] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffStudentGrowthMeasure](FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    SELECT  FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] ENABLE TRIGGER [tpdm_StaffStudentGrowthMeasure_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffTeacherPreparationProviderAssociation_TR_DeleteTracking] ON [tpdm].[StaffTeacherPreparationProviderAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffTeacherPreparationProviderAssociation](StaffUSI, TeacherPreparationProviderId, Id, ChangeVersion)
    SELECT  StaffUSI, TeacherPreparationProviderId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] ENABLE TRIGGER [tpdm_StaffTeacherPreparationProviderAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StaffTeacherPreparationProviderProgramAssociation_TR_DeleteTracking] ON [tpdm].[StaffTeacherPreparationProviderProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StaffTeacherPreparationProviderProgramAssociation](EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StaffUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StaffUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ENABLE TRIGGER [tpdm_StaffTeacherPreparationProviderProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_StudentGrowthTypeDescriptor_TR_DeleteTracking] ON [tpdm].[StudentGrowthTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[StudentGrowthTypeDescriptor](StudentGrowthTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentGrowthTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentGrowthTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[StudentGrowthTypeDescriptor] ENABLE TRIGGER [tpdm_StudentGrowthTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_SurveyLevelDescriptor_TR_DeleteTracking] ON [tpdm].[SurveyLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[SurveyLevelDescriptor](SurveyLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.SurveyLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SurveyLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[SurveyLevelDescriptor] ENABLE TRIGGER [tpdm_SurveyLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TPPDegreeTypeDescriptor_TR_DeleteTracking] ON [tpdm].[TPPDegreeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TPPDegreeTypeDescriptor](TPPDegreeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.TPPDegreeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TPPDegreeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[TPPDegreeTypeDescriptor] ENABLE TRIGGER [tpdm_TPPDegreeTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TPPProgramPathwayDescriptor_TR_DeleteTracking] ON [tpdm].[TPPProgramPathwayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TPPProgramPathwayDescriptor](TPPProgramPathwayDescriptorId, Id, ChangeVersion)
    SELECT  d.TPPProgramPathwayDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TPPProgramPathwayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[TPPProgramPathwayDescriptor] ENABLE TRIGGER [tpdm_TPPProgramPathwayDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TalentManagementGoal_TR_DeleteTracking] ON [tpdm].[TalentManagementGoal] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TalentManagementGoal](GoalTitle, SchoolYear, Id, ChangeVersion)
    SELECT  GoalTitle, SchoolYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TalentManagementGoal] ENABLE TRIGGER [tpdm_TalentManagementGoal_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateAcademicRecord_TR_DeleteTracking] ON [tpdm].[TeacherCandidateAcademicRecord] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateAcademicRecord](EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] ENABLE TRIGGER [tpdm_TeacherCandidateAcademicRecord_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateCharacteristicDescriptor_TR_DeleteTracking] ON [tpdm].[TeacherCandidateCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateCharacteristicDescriptor](TeacherCandidateCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.TeacherCandidateCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TeacherCandidateCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[TeacherCandidateCharacteristicDescriptor] ENABLE TRIGGER [tpdm_TeacherCandidateCharacteristicDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateCourseTranscript_TR_DeleteTracking] ON [tpdm].[TeacherCandidateCourseTranscript] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateCourseTranscript](CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId, Id, ChangeVersion)
    SELECT  CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] ENABLE TRIGGER [tpdm_TeacherCandidateCourseTranscript_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateFieldworkAbsenceEvent_TR_DeleteTracking] ON [tpdm].[TeacherCandidateFieldworkAbsenceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateFieldworkAbsenceEvent](AbsenceEventCategoryDescriptorId, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  AbsenceEventCategoryDescriptorId, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ENABLE TRIGGER [tpdm_TeacherCandidateFieldworkAbsenceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateFieldworkExperienceSectionAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation](BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateFieldworkExperienceSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateFieldworkExperience_TR_DeleteTracking] ON [tpdm].[TeacherCandidateFieldworkExperience] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateFieldworkExperience](BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] ENABLE TRIGGER [tpdm_TeacherCandidateFieldworkExperience_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateProfessionalDevelopmentEventAttendance_TR_DeleteTracking] ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance](AttendanceDate, ProfessionalDevelopmentTitle, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  AttendanceDate, ProfessionalDevelopmentTitle, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ENABLE TRIGGER [tpdm_TeacherCandidateProfessionalDevelopmentEventAttendance_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStaffAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateStaffAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateStaffAssociation](StaffUSI, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  StaffUSI, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateStaffAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasureCourseAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation](CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateStudentGrowthMeasureCourseAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation](EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    SELECT  EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasureSectionAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation](FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    SELECT  FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateStudentGrowthMeasureSectionAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasure_TR_DeleteTracking] ON [tpdm].[TeacherCandidateStudentGrowthMeasure] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasure](FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    SELECT  FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] ENABLE TRIGGER [tpdm_TeacherCandidateStudentGrowthMeasure_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateTeacherPreparationProviderAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateTeacherPreparationProviderAssociation](EntryDate, TeacherCandidateIdentifier, TeacherPreparationProviderId, Id, ChangeVersion)
    SELECT  EntryDate, TeacherCandidateIdentifier, TeacherPreparationProviderId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateTeacherPreparationProviderAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateTeacherPreparationProviderProgramAssociation_TR_DeleteTracking] ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation](BeginDate, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ENABLE TRIGGER [tpdm_TeacherCandidateTeacherPreparationProviderProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherCandidate_TR_DeleteTracking] ON [tpdm].[TeacherCandidate] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherCandidate](TeacherCandidateIdentifier, Id, ChangeVersion)
    SELECT  TeacherCandidateIdentifier, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherCandidate] ENABLE TRIGGER [tpdm_TeacherCandidate_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherPreparationProgramTypeDescriptor_TR_DeleteTracking] ON [tpdm].[TeacherPreparationProgramTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherPreparationProgramTypeDescriptor](TeacherPreparationProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.TeacherPreparationProgramTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TeacherPreparationProgramTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[TeacherPreparationProgramTypeDescriptor] ENABLE TRIGGER [tpdm_TeacherPreparationProgramTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherPreparationProviderProgram_TR_DeleteTracking] ON [tpdm].[TeacherPreparationProviderProgram] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherPreparationProviderProgram](EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] ENABLE TRIGGER [tpdm_TeacherPreparationProviderProgram_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_TeacherPreparationProvider_TR_DeleteTracking] ON [tpdm].[TeacherPreparationProvider] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[TeacherPreparationProvider](TeacherPreparationProviderId, Id, ChangeVersion)
    SELECT  d.TeacherPreparationProviderId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.TeacherPreparationProviderId = b.EducationOrganizationId
END
GO

ALTER TABLE [tpdm].[TeacherPreparationProvider] ENABLE TRIGGER [tpdm_TeacherPreparationProvider_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ThemeDescriptor_TR_DeleteTracking] ON [tpdm].[ThemeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ThemeDescriptor](ThemeDescriptorId, Id, ChangeVersion)
    SELECT  d.ThemeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ThemeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ThemeDescriptor] ENABLE TRIGGER [tpdm_ThemeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_University_TR_DeleteTracking] ON [tpdm].[University] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[University](UniversityId, Id, ChangeVersion)
    SELECT  d.UniversityId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.UniversityId = b.EducationOrganizationId
END
GO

ALTER TABLE [tpdm].[University] ENABLE TRIGGER [tpdm_University_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_ValueTypeDescriptor_TR_DeleteTracking] ON [tpdm].[ValueTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[ValueTypeDescriptor](ValueTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ValueTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ValueTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ValueTypeDescriptor] ENABLE TRIGGER [tpdm_ValueTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [tpdm].[tpdm_WithdrawReasonDescriptor_TR_DeleteTracking] ON [tpdm].[WithdrawReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_tpdm].[WithdrawReasonDescriptor](WithdrawReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.WithdrawReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.WithdrawReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[WithdrawReasonDescriptor] ENABLE TRIGGER [tpdm_WithdrawReasonDescriptor_TR_DeleteTracking]
GO


