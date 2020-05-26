-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE FUNCTION tracked_deletes_tpdm.AidTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AidTypeDescriptor(AidTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.AidTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.AidTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AidTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AidTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentAcademicRecord_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentAcademicRecord(AnonymizedStudentIdentifier, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.AnonymizedStudentIdentifier, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentAcademicRecord 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentAcademicRecord_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentAssessmentCourseAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentAssessmentCourseAssociation(AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, TakenSchoolYear, Id, ChangeVersion)
    VALUES (OLD.AdministrationDate, OLD.AnonymizedStudentIdentifier, OLD.AssessmentIdentifier, OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.TakenSchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentAssessmentCourseAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentAssessmentCourseAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentAssessmentSectionAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentAssessmentSectionAssociation(AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear, Id, ChangeVersion)
    VALUES (OLD.AdministrationDate, OLD.AnonymizedStudentIdentifier, OLD.AssessmentIdentifier, OLD.FactsAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.TakenSchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentAssessmentSectionAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentAssessmentSectionAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentAssessment_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentAssessment(AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear, Id, ChangeVersion)
    VALUES (OLD.AdministrationDate, OLD.AnonymizedStudentIdentifier, OLD.AssessmentIdentifier, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.TakenSchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentAssessment 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentAssessment_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentCourseAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentCourseAssociation(AnonymizedStudentIdentifier, BeginDate, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.AnonymizedStudentIdentifier, OLD.BeginDate, OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentCourseAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentCourseAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentCourseTranscript_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentCourseTranscript(AnonymizedStudentIdentifier, CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.AnonymizedStudentIdentifier, OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentCourseTranscript 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentCourseTranscript_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentEducationOrganizationAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentEducationOrganizationAssociation(AnonymizedStudentIdentifier, BeginDate, EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.AnonymizedStudentIdentifier, OLD.BeginDate, OLD.EducationOrganizationId, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentEducationOrganizationAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentEducationOrganizationAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudentSectionAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudentSectionAssociation(AnonymizedStudentIdentifier, BeginDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    VALUES (OLD.AnonymizedStudentIdentifier, OLD.BeginDate, OLD.FactsAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudentSectionAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudentSectionAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.AnonymizedStudent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.AnonymizedStudent(AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.AnonymizedStudentIdentifier, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.AnonymizedStudent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.AnonymizedStudent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ApplicantProspectAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ApplicantProspectAssociation(ApplicantIdentifier, EducationOrganizationId, ProspectIdentifier, Id, ChangeVersion)
    VALUES (OLD.ApplicantIdentifier, OLD.EducationOrganizationId, OLD.ProspectIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ApplicantProspectAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ApplicantProspectAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.Applicant_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.Applicant(ApplicantIdentifier, EducationOrganizationId, Id, ChangeVersion)
    VALUES (OLD.ApplicantIdentifier, OLD.EducationOrganizationId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.Applicant 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.Applicant_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ApplicationEventResultDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ApplicationEventResultDescriptor(ApplicationEventResultDescriptorId, Id, ChangeVersion)
    SELECT OLD.ApplicationEventResultDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ApplicationEventResultDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ApplicationEventResultDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ApplicationEventResultDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ApplicationEventTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ApplicationEventTypeDescriptor(ApplicationEventTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ApplicationEventTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ApplicationEventTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ApplicationEventTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ApplicationEventTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ApplicationEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ApplicationEvent(ApplicantIdentifier, ApplicationEventTypeDescriptorId, ApplicationIdentifier, EducationOrganizationId, EventDate, SequenceNumber, Id, ChangeVersion)
    VALUES (OLD.ApplicantIdentifier, OLD.ApplicationEventTypeDescriptorId, OLD.ApplicationIdentifier, OLD.EducationOrganizationId, OLD.EventDate, OLD.SequenceNumber, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ApplicationEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ApplicationEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ApplicationSourceDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ApplicationSourceDescriptor(ApplicationSourceDescriptorId, Id, ChangeVersion)
    SELECT OLD.ApplicationSourceDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ApplicationSourceDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ApplicationSourceDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ApplicationSourceDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ApplicationStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ApplicationStatusDescriptor(ApplicationStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.ApplicationStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ApplicationStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ApplicationStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ApplicationStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.Application_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.Application(ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId, Id, ChangeVersion)
    VALUES (OLD.ApplicantIdentifier, OLD.ApplicationIdentifier, OLD.EducationOrganizationId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.Application 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.Application_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.BackgroundCheckStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.BackgroundCheckStatusDescriptor(BackgroundCheckStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.BackgroundCheckStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.BackgroundCheckStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.BackgroundCheckStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.BackgroundCheckStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.BackgroundCheckTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.BackgroundCheckTypeDescriptor(BackgroundCheckTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.BackgroundCheckTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.BackgroundCheckTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.BackgroundCheckTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.BackgroundCheckTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.BoardCertificationTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.BoardCertificationTypeDescriptor(BoardCertificationTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.BoardCertificationTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.BoardCertificationTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.BoardCertificationTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.BoardCertificationTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CertificationExamStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CertificationExamStatusDescriptor(CertificationExamStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.CertificationExamStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CertificationExamStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CertificationExamStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CertificationExamStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CertificationExamTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CertificationExamTypeDescriptor(CertificationExamTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.CertificationExamTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CertificationExamTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CertificationExamTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CertificationExamTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CompleterAsStaffAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CompleterAsStaffAssociation(StaffUSI, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.StaffUSI, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CompleterAsStaffAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CompleterAsStaffAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CoteachingStyleObservedDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CoteachingStyleObservedDescriptor(CoteachingStyleObservedDescriptorId, Id, ChangeVersion)
    SELECT OLD.CoteachingStyleObservedDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CoteachingStyleObservedDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CoteachingStyleObservedDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CoteachingStyleObservedDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CourseCourseTranscriptFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CourseCourseTranscriptFacts(CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CourseCourseTranscriptFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CourseCourseTranscriptFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CourseStudentAcademicRecordFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CourseStudentAcademicRecordFacts(CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.SchoolYear, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CourseStudentAcademicRecordFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CourseStudentAcademicRecordFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CourseStudentAssessmentFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CourseStudentAssessmentFacts(CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.TakenSchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CourseStudentAssessmentFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CourseStudentAssessmentFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.CourseStudentFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.CourseStudentFacts(CourseCode, EducationOrganizationId, FactAsOfDate, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.CourseStudentFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.CourseStudentFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EducationOrganizationCourseTranscriptFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EducationOrganizationCourseTranscriptFacts(EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EducationOrganizationCourseTranscriptFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EducationOrganizationCourseTranscriptFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EducationOrganizationFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EducationOrganizationFacts(EducationOrganizationId, FactsAsOfDate, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactsAsOfDate, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EducationOrganizationFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EducationOrganizationFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EducationOrganizationStudentAcademicRecordFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EducationOrganizationStudentAcademicRecordFacts(EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.SchoolYear, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EducationOrganizationStudentAcademicRecordFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EducationOrganizationStudentAcademicRecordFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EducationOrganizationStudentAssessmentFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EducationOrganizationStudentAssessmentFacts(EducationOrganizationId, FactAsOfDate, TakenSchoolYear, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.TakenSchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EducationOrganizationStudentAssessmentFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EducationOrganizationStudentAssessmentFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EducationOrganizationStudentFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EducationOrganizationStudentFacts(EducationOrganizationId, FactAsOfDate, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EducationOrganizationStudentFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EducationOrganizationStudentFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EmploymentEventTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EmploymentEventTypeDescriptor(EmploymentEventTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.EmploymentEventTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EmploymentEventTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EmploymentEventTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EmploymentEventTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EmploymentEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EmploymentEvent(EducationOrganizationId, EmploymentEventTypeDescriptorId, RequisitionNumber, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.EmploymentEventTypeDescriptorId, OLD.RequisitionNumber, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EmploymentEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EmploymentEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EmploymentSeparationEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EmploymentSeparationEvent(EducationOrganizationId, EmploymentSeparationDate, RequisitionNumber, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.EmploymentSeparationDate, OLD.RequisitionNumber, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EmploymentSeparationEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EmploymentSeparationEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EmploymentSeparationReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EmploymentSeparationReasonDescriptor(EmploymentSeparationReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.EmploymentSeparationReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EmploymentSeparationReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EmploymentSeparationReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EmploymentSeparationReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EmploymentSeparationTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EmploymentSeparationTypeDescriptor(EmploymentSeparationTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.EmploymentSeparationTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EmploymentSeparationTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EmploymentSeparationTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EmploymentSeparationTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.EnglishLanguageExamDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.EnglishLanguageExamDescriptor(EnglishLanguageExamDescriptorId, Id, ChangeVersion)
    SELECT OLD.EnglishLanguageExamDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EnglishLanguageExamDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.EnglishLanguageExamDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.EnglishLanguageExamDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.FederalLocaleCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.FederalLocaleCodeDescriptor(FederalLocaleCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.FederalLocaleCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.FederalLocaleCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.FederalLocaleCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.FederalLocaleCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.FieldworkTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.FieldworkTypeDescriptor(FieldworkTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.FieldworkTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.FieldworkTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.FieldworkTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.FieldworkTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.FundingSourceDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.FundingSourceDescriptor(FundingSourceDescriptorId, Id, ChangeVersion)
    SELECT OLD.FundingSourceDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.FundingSourceDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.FundingSourceDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.FundingSourceDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.GenderDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.GenderDescriptor(GenderDescriptorId, Id, ChangeVersion)
    SELECT OLD.GenderDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.GenderDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.GenderDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.GenderDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.HireStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.HireStatusDescriptor(HireStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.HireStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.HireStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.HireStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.HireStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.HiringSourceDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.HiringSourceDescriptor(HiringSourceDescriptorId, Id, ChangeVersion)
    SELECT OLD.HiringSourceDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.HiringSourceDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.HiringSourceDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.HiringSourceDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.InternalExternalHireDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.InternalExternalHireDescriptor(InternalExternalHireDescriptorId, Id, ChangeVersion)
    SELECT OLD.InternalExternalHireDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.InternalExternalHireDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.InternalExternalHireDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.InternalExternalHireDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.LevelOfDegreeAwardedDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.LevelOfDegreeAwardedDescriptor(LevelOfDegreeAwardedDescriptorId, Id, ChangeVersion)
    SELECT OLD.LevelOfDegreeAwardedDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.LevelOfDegreeAwardedDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.LevelOfDegreeAwardedDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.LevelOfDegreeAwardedDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.LevelTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.LevelTypeDescriptor(LevelTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.LevelTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.LevelTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.LevelTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.LevelTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.OpenStaffPositionEventStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.OpenStaffPositionEventStatusDescriptor(OpenStaffPositionEventStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.OpenStaffPositionEventStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.OpenStaffPositionEventStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.OpenStaffPositionEventStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.OpenStaffPositionEventStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.OpenStaffPositionEventTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.OpenStaffPositionEventTypeDescriptor(OpenStaffPositionEventTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.OpenStaffPositionEventTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.OpenStaffPositionEventTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.OpenStaffPositionEventTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.OpenStaffPositionEventTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.OpenStaffPositionEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.OpenStaffPositionEvent(EducationOrganizationId, EventDate, OpenStaffPositionEventTypeDescriptorId, RequisitionNumber, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.EventDate, OLD.OpenStaffPositionEventTypeDescriptorId, OLD.RequisitionNumber, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.OpenStaffPositionEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.OpenStaffPositionEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.OpenStaffPositionReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.OpenStaffPositionReasonDescriptor(OpenStaffPositionReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.OpenStaffPositionReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.OpenStaffPositionReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.OpenStaffPositionReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.OpenStaffPositionReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.PerformanceMeasureCourseAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.PerformanceMeasureCourseAssociation(CourseCode, EducationOrganizationId, PerformanceMeasureIdentifier, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.PerformanceMeasureIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.PerformanceMeasureCourseAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.PerformanceMeasureCourseAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.PerformanceMeasureFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.PerformanceMeasureFacts(EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactsAsOfDate, OLD.RubricTitle, OLD.RubricTypeDescriptorId, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.PerformanceMeasureFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.PerformanceMeasureFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.PerformanceMeasureInstanceDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.PerformanceMeasureInstanceDescriptor(PerformanceMeasureInstanceDescriptorId, Id, ChangeVersion)
    SELECT OLD.PerformanceMeasureInstanceDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PerformanceMeasureInstanceDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.PerformanceMeasureInstanceDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.PerformanceMeasureInstanceDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.PerformanceMeasureTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.PerformanceMeasureTypeDescriptor(PerformanceMeasureTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.PerformanceMeasureTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PerformanceMeasureTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.PerformanceMeasureTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.PerformanceMeasureTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.PerformanceMeasure_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.PerformanceMeasure(PerformanceMeasureIdentifier, Id, ChangeVersion)
    VALUES (OLD.PerformanceMeasureIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.PerformanceMeasure 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.PerformanceMeasure_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.PreviousCareerDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.PreviousCareerDescriptor(PreviousCareerDescriptorId, Id, ChangeVersion)
    SELECT OLD.PreviousCareerDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PreviousCareerDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.PreviousCareerDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.PreviousCareerDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ProfessionalDevelopmentEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ProfessionalDevelopmentEvent(ProfessionalDevelopmentTitle, Id, ChangeVersion)
    VALUES (OLD.ProfessionalDevelopmentTitle, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ProfessionalDevelopmentEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ProfessionalDevelopmentEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ProfessionalDevelopmentOfferedByDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ProfessionalDevelopmentOfferedByDescriptor(ProfessionalDevelopmentOfferedByDescriptorId, Id, ChangeVersion)
    SELECT OLD.ProfessionalDevelopmentOfferedByDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ProfessionalDevelopmentOfferedByDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ProfessionalDevelopmentOfferedByDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ProfessionalDevelopmentOfferedByDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ProgramGatewayDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ProgramGatewayDescriptor(ProgramGatewayDescriptorId, Id, ChangeVersion)
    SELECT OLD.ProgramGatewayDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ProgramGatewayDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ProgramGatewayDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ProgramGatewayDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ProspectProfessionalDevelopmentEventAttendance_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ProspectProfessionalDevelopmentEventAttendance(AttendanceDate, EducationOrganizationId, ProfessionalDevelopmentTitle, ProspectIdentifier, Id, ChangeVersion)
    VALUES (OLD.AttendanceDate, OLD.EducationOrganizationId, OLD.ProfessionalDevelopmentTitle, OLD.ProspectIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ProspectProfessionalDevelopmentEventAttendance 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ProspectProfessionalDevelopmentEventAttendance_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ProspectTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ProspectTypeDescriptor(ProspectTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ProspectTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ProspectTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ProspectTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ProspectTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.Prospect_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.Prospect(EducationOrganizationId, ProspectIdentifier, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.ProspectIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.Prospect 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.Prospect_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.RecruitmentEventTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.RecruitmentEventTypeDescriptor(RecruitmentEventTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.RecruitmentEventTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.RecruitmentEventTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.RecruitmentEventTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.RecruitmentEventTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.RecruitmentEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.RecruitmentEvent(EventDate, EventTitle, Id, ChangeVersion)
    VALUES (OLD.EventDate, OLD.EventTitle, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.RecruitmentEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.RecruitmentEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.RubricLevelResponseFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.RubricLevelResponseFacts(EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactsAsOfDate, OLD.RubricLevelCode, OLD.RubricTitle, OLD.RubricTypeDescriptorId, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.RubricLevelResponseFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.RubricLevelResponseFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.RubricLevelResponse_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.RubricLevelResponse(EducationOrganizationId, PerformanceMeasureIdentifier, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.PerformanceMeasureIdentifier, OLD.RubricLevelCode, OLD.RubricTitle, OLD.RubricTypeDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.RubricLevelResponse 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.RubricLevelResponse_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.RubricLevel_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.RubricLevel(EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.RubricLevelCode, OLD.RubricTitle, OLD.RubricTypeDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.RubricLevel 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.RubricLevel_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.RubricTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.RubricTypeDescriptor(RubricTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.RubricTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.RubricTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.RubricTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.RubricTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.Rubric_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.Rubric(EducationOrganizationId, RubricTitle, RubricTypeDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.RubricTitle, OLD.RubricTypeDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.Rubric 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.Rubric_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SalaryTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SalaryTypeDescriptor(SalaryTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.SalaryTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SalaryTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SalaryTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SalaryTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SchoolStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SchoolStatusDescriptor(SchoolStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.SchoolStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SchoolStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SchoolStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SchoolStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SectionCourseTranscriptFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SectionCourseTranscriptFacts(FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.FactsAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SectionCourseTranscriptFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SectionCourseTranscriptFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SectionStudentAcademicRecordFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SectionStudentAcademicRecordFacts(FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SectionStudentAcademicRecordFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SectionStudentAcademicRecordFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SectionStudentAssessmentFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SectionStudentAssessmentFacts(FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.TakenSchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SectionStudentAssessmentFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SectionStudentAssessmentFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SectionStudentFacts_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SectionStudentFacts(FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SectionStudentFacts 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SectionStudentFacts_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffApplicantAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffApplicantAssociation(ApplicantIdentifier, EducationOrganizationId, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.ApplicantIdentifier, OLD.EducationOrganizationId, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffApplicantAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffApplicantAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationComponentRating_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationComponentRating(ComponentRating, EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.ComponentRating, OLD.EducationOrganizationId, OLD.EvaluationComponent, OLD.SchoolYear, OLD.StaffEvaluationDate, OLD.StaffEvaluationTitle, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationComponentRating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationComponentRating_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationComponent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationComponent(EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.EvaluationComponent, OLD.SchoolYear, OLD.StaffEvaluationTitle, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationComponent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationComponent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationElementRating_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationElementRating(EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.EvaluationComponent, OLD.EvaluationElement, OLD.SchoolYear, OLD.StaffEvaluationDate, OLD.StaffEvaluationTitle, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationElementRating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationElementRating_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationElement_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationElement(EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.EvaluationComponent, OLD.EvaluationElement, OLD.SchoolYear, OLD.StaffEvaluationTitle, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationElement 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationElement_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationPeriodDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationPeriodDescriptor(StaffEvaluationPeriodDescriptorId, Id, ChangeVersion)
    SELECT OLD.StaffEvaluationPeriodDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StaffEvaluationPeriodDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationPeriodDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationPeriodDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationRatingLevelDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationRatingLevelDescriptor(StaffEvaluationRatingLevelDescriptorId, Id, ChangeVersion)
    SELECT OLD.StaffEvaluationRatingLevelDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StaffEvaluationRatingLevelDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationRatingLevelDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationRatingLevelDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationRating_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationRating(EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.SchoolYear, OLD.StaffEvaluationDate, OLD.StaffEvaluationTitle, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationRating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationRating_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluationTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluationTypeDescriptor(StaffEvaluationTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.StaffEvaluationTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StaffEvaluationTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluationTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluationTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffEvaluation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffEvaluation(EducationOrganizationId, SchoolYear, StaffEvaluationTitle, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.SchoolYear, OLD.StaffEvaluationTitle, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffEvaluation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffEvaluation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffFieldworkAbsenceEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffFieldworkAbsenceEvent(AbsenceEventCategoryDescriptorId, EventDate, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.AbsenceEventCategoryDescriptorId, OLD.EventDate, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffFieldworkAbsenceEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffFieldworkAbsenceEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffFieldworkExperienceSectionAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffFieldworkExperienceSectionAssociation(BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.FieldworkIdentifier, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffFieldworkExperienceSectionAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffFieldworkExperienceSectionAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffFieldworkExperience_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffFieldworkExperience(BeginDate, FieldworkIdentifier, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.FieldworkIdentifier, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffFieldworkExperience 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffFieldworkExperience_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffProfessionalDevelopmentEventAttendance_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffProfessionalDevelopmentEventAttendance(AttendanceDate, ProfessionalDevelopmentTitle, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.AttendanceDate, OLD.ProfessionalDevelopmentTitle, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffProfessionalDevelopmentEventAttendance 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffProfessionalDevelopmentEventAttendance_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffProspectAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffProspectAssociation(EducationOrganizationId, ProspectIdentifier, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.ProspectIdentifier, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffProspectAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffProspectAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffStudentGrowthMeasureCourseAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffStudentGrowthMeasureCourseAssociation(CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.SchoolYear, OLD.StaffStudentGrowthMeasureIdentifier, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffStudentGrowthMeasureCourseAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffStudentGrowthMeasureCourseAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffStudentGrowthMeasureEducationOrganizatio_120788_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation(EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.SchoolYear, OLD.StaffStudentGrowthMeasureIdentifier, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffStudentGrowthMeasureEducationOrganizatio_120788_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffStudentGrowthMeasureSectionAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffStudentGrowthMeasureSectionAssociation(FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.StaffStudentGrowthMeasureIdentifier, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffStudentGrowthMeasureSectionAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffStudentGrowthMeasureSectionAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffStudentGrowthMeasure_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffStudentGrowthMeasure(FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.SchoolYear, OLD.StaffStudentGrowthMeasureIdentifier, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffStudentGrowthMeasure 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffStudentGrowthMeasure_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffTeacherPreparationProviderAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffTeacherPreparationProviderAssociation(StaffUSI, TeacherPreparationProviderId, Id, ChangeVersion)
    VALUES (OLD.StaffUSI, OLD.TeacherPreparationProviderId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffTeacherPreparationProviderAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffTeacherPreparationProviderAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StaffTeacherPreparationProviderProgramAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StaffTeacherPreparationProviderProgramAssociation(EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StaffUSI, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.StaffUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StaffTeacherPreparationProviderProgramAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StaffTeacherPreparationProviderProgramAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.StudentGrowthTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.StudentGrowthTypeDescriptor(StudentGrowthTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.StudentGrowthTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StudentGrowthTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.StudentGrowthTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.StudentGrowthTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.SurveyLevelDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.SurveyLevelDescriptor(SurveyLevelDescriptorId, Id, ChangeVersion)
    SELECT OLD.SurveyLevelDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SurveyLevelDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.SurveyLevelDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.SurveyLevelDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TPPDegreeTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TPPDegreeTypeDescriptor(TPPDegreeTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.TPPDegreeTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TPPDegreeTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TPPDegreeTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TPPDegreeTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TPPProgramPathwayDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TPPProgramPathwayDescriptor(TPPProgramPathwayDescriptorId, Id, ChangeVersion)
    SELECT OLD.TPPProgramPathwayDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TPPProgramPathwayDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TPPProgramPathwayDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TPPProgramPathwayDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TalentManagementGoal_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TalentManagementGoal(GoalTitle, SchoolYear, Id, ChangeVersion)
    VALUES (OLD.GoalTitle, OLD.SchoolYear, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TalentManagementGoal 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TalentManagementGoal_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateAcademicRecord_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateAcademicRecord(EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.SchoolYear, OLD.TeacherCandidateIdentifier, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateAcademicRecord 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateAcademicRecord_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateCharacteristicDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateCharacteristicDescriptor(TeacherCandidateCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT OLD.TeacherCandidateCharacteristicDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TeacherCandidateCharacteristicDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateCharacteristicDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateCharacteristicDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateCourseTranscript_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateCourseTranscript(CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId, Id, ChangeVersion)
    VALUES (OLD.CourseAttemptResultDescriptorId, OLD.CourseCode, OLD.CourseEducationOrganizationId, OLD.EducationOrganizationId, OLD.SchoolYear, OLD.TeacherCandidateIdentifier, OLD.TermDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateCourseTranscript 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateCourseTranscript_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateFieldworkAbsenceEvent_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateFieldworkAbsenceEvent(AbsenceEventCategoryDescriptorId, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.AbsenceEventCategoryDescriptorId, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateFieldworkAbsenceEvent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateFieldworkAbsenceEvent_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateFieldworkExperienceSectionAss_1a948e_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateFieldworkExperienceSectionAssociation(BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.FieldworkIdentifier, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateFieldworkExperienceSectionAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateFieldworkExperienceSectionAss_1a948e_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateFieldworkExperience_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateFieldworkExperience(BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.FieldworkIdentifier, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateFieldworkExperience 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateFieldworkExperience_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateProfessionalDevelopmentEventA_8c39c1_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance(AttendanceDate, ProfessionalDevelopmentTitle, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.AttendanceDate, OLD.ProfessionalDevelopmentTitle, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateProfessionalDevelopmentEventA_8c39c1_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateStaffAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateStaffAssociation(StaffUSI, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.StaffUSI, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateStaffAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateStaffAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureCourseAss_512fab_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation(CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    VALUES (OLD.CourseCode, OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.SchoolYear, OLD.TeacherCandidateIdentifier, OLD.TeacherCandidateStudentGrowthMeasureIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureCourseAss_512fab_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureEducation_22b9a4_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4(EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.FactAsOfDate, OLD.SchoolYear, OLD.TeacherCandidateIdentifier, OLD.TeacherCandidateStudentGrowthMeasureIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureEducation_22b9a4_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureSectionAs_b8b1b0_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation(FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.LocalCourseCode, OLD.SchoolId, OLD.SchoolYear, OLD.SectionIdentifier, OLD.SessionName, OLD.TeacherCandidateIdentifier, OLD.TeacherCandidateStudentGrowthMeasureIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureSectionAs_b8b1b0_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasure_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasure(FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier, Id, ChangeVersion)
    VALUES (OLD.FactAsOfDate, OLD.SchoolYear, OLD.TeacherCandidateIdentifier, OLD.TeacherCandidateStudentGrowthMeasureIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateStudentGrowthMeasure 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasure_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderAss_0dff08_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderAssociation(EntryDate, TeacherCandidateIdentifier, TeacherPreparationProviderId, Id, ChangeVersion)
    VALUES (OLD.EntryDate, OLD.TeacherCandidateIdentifier, OLD.TeacherPreparationProviderId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderAss_0dff08_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderPro_81475b_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation(BeginDate, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.EducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderPro_81475b_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherCandidate_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherCandidate(TeacherCandidateIdentifier, Id, ChangeVersion)
    VALUES (OLD.TeacherCandidateIdentifier, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherCandidate 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherCandidate_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherPreparationProgramTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherPreparationProgramTypeDescriptor(TeacherPreparationProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.TeacherPreparationProgramTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TeacherPreparationProgramTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherPreparationProgramTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherPreparationProgramTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherPreparationProviderProgram_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherPreparationProviderProgram(EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherPreparationProviderProgram 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherPreparationProviderProgram_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.TeacherPreparationProvider_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.TeacherPreparationProvider(TeacherPreparationProviderId, Id, ChangeVersion)
    SELECT OLD.TeacherPreparationProviderId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.EducationOrganization WHERE EducationOrganizationId = OLD.TeacherPreparationProviderId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.TeacherPreparationProvider 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.TeacherPreparationProvider_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ThemeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ThemeDescriptor(ThemeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ThemeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ThemeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ThemeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ThemeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.University_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.University(UniversityId, Id, ChangeVersion)
    SELECT OLD.UniversityId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.EducationOrganization WHERE EducationOrganizationId = OLD.UniversityId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.University 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.University_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.ValueTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.ValueTypeDescriptor(ValueTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ValueTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ValueTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.ValueTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.ValueTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_tpdm.WithdrawReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_tpdm.WithdrawReasonDescriptor(WithdrawReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.WithdrawReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.WithdrawReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.WithdrawReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_tpdm.WithdrawReasonDescriptor_TR_DelTrkg();

