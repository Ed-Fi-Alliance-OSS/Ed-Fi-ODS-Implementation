-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE tracked_deletes_tpdm.AidTypeDescriptor
(
       AidTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AidTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudent
(
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentAcademicRecord
(
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentAcademicRecord_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentAssessment
(
       AdministrationDate DATE NOT NULL,
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       AssessmentIdentifier VARCHAR(60) NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TakenSchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentAssessment_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentAssessmentCourseAssociation
(
       AdministrationDate DATE NOT NULL,
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       AssessmentIdentifier VARCHAR(60) NOT NULL,
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TakenSchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentAssessmentCourseAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentAssessmentSectionAssociation
(
       AdministrationDate DATE NOT NULL,
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       AssessmentIdentifier VARCHAR(60) NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       TakenSchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentAssessmentSectionAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentCourseAssociation
(
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       BeginDate DATE NOT NULL,
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentCourseAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentCourseTranscript
(
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentCourseTranscript_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentEducationOrganizationAssociation
(
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       BeginDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentEducationOrganizationAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.AnonymizedStudentSectionAssociation
(
       AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
       BeginDate DATE NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnonymizedStudentSectionAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.Applicant
(
       ApplicantIdentifier VARCHAR(32) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT Applicant_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ApplicantProspectAssociation
(
       ApplicantIdentifier VARCHAR(32) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       ProspectIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ApplicantProspectAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.Application
(
       ApplicantIdentifier VARCHAR(32) NOT NULL,
       ApplicationIdentifier VARCHAR(20) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT Application_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ApplicationEvent
(
       ApplicantIdentifier VARCHAR(32) NOT NULL,
       ApplicationEventTypeDescriptorId INT NOT NULL,
       ApplicationIdentifier VARCHAR(20) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       EventDate DATE NOT NULL,
       SequenceNumber INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ApplicationEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ApplicationEventResultDescriptor
(
       ApplicationEventResultDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ApplicationEventResultDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ApplicationEventTypeDescriptor
(
       ApplicationEventTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ApplicationEventTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ApplicationSourceDescriptor
(
       ApplicationSourceDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ApplicationSourceDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ApplicationStatusDescriptor
(
       ApplicationStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ApplicationStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.BackgroundCheckStatusDescriptor
(
       BackgroundCheckStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT BackgroundCheckStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.BackgroundCheckTypeDescriptor
(
       BackgroundCheckTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT BackgroundCheckTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.BoardCertificationTypeDescriptor
(
       BoardCertificationTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT BoardCertificationTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CertificationExamStatusDescriptor
(
       CertificationExamStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CertificationExamStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CertificationExamTypeDescriptor
(
       CertificationExamTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CertificationExamTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CompleterAsStaffAssociation
(
       StaffUSI INT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CompleterAsStaffAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CoteachingStyleObservedDescriptor
(
       CoteachingStyleObservedDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CoteachingStyleObservedDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CourseCourseTranscriptFacts
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CourseCourseTranscriptFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CourseStudentAcademicRecordFacts
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CourseStudentAcademicRecordFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CourseStudentAssessmentFacts
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       TakenSchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CourseStudentAssessmentFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.CourseStudentFacts
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CourseStudentFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EducationOrganizationCourseTranscriptFacts
(
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EducationOrganizationCourseTranscriptFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EducationOrganizationFacts
(
       EducationOrganizationId INT NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EducationOrganizationFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EducationOrganizationStudentAcademicRecordFacts
(
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EducationOrganizationStudentAcademicRecordFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EducationOrganizationStudentAssessmentFacts
(
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       TakenSchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EducationOrganizationStudentAssessmentFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EducationOrganizationStudentFacts
(
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EducationOrganizationStudentFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EmploymentEvent
(
       EducationOrganizationId INT NOT NULL,
       EmploymentEventTypeDescriptorId INT NOT NULL,
       RequisitionNumber VARCHAR(20) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EmploymentEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EmploymentEventTypeDescriptor
(
       EmploymentEventTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EmploymentEventTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EmploymentSeparationEvent
(
       EducationOrganizationId INT NOT NULL,
       EmploymentSeparationDate DATE NOT NULL,
       RequisitionNumber VARCHAR(20) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EmploymentSeparationEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EmploymentSeparationReasonDescriptor
(
       EmploymentSeparationReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EmploymentSeparationReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EmploymentSeparationTypeDescriptor
(
       EmploymentSeparationTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EmploymentSeparationTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.EnglishLanguageExamDescriptor
(
       EnglishLanguageExamDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EnglishLanguageExamDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.FederalLocaleCodeDescriptor
(
       FederalLocaleCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT FederalLocaleCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.FieldworkTypeDescriptor
(
       FieldworkTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT FieldworkTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.FundingSourceDescriptor
(
       FundingSourceDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT FundingSourceDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.GenderDescriptor
(
       GenderDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT GenderDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.HireStatusDescriptor
(
       HireStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT HireStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.HiringSourceDescriptor
(
       HiringSourceDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT HiringSourceDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.InternalExternalHireDescriptor
(
       InternalExternalHireDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT InternalExternalHireDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.LevelOfDegreeAwardedDescriptor
(
       LevelOfDegreeAwardedDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LevelOfDegreeAwardedDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.LevelTypeDescriptor
(
       LevelTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LevelTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.OpenStaffPositionEvent
(
       EducationOrganizationId INT NOT NULL,
       EventDate DATE NOT NULL,
       OpenStaffPositionEventTypeDescriptorId INT NOT NULL,
       RequisitionNumber VARCHAR(20) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT OpenStaffPositionEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.OpenStaffPositionEventStatusDescriptor
(
       OpenStaffPositionEventStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT OpenStaffPositionEventStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.OpenStaffPositionEventTypeDescriptor
(
       OpenStaffPositionEventTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT OpenStaffPositionEventTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.OpenStaffPositionReasonDescriptor
(
       OpenStaffPositionReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT OpenStaffPositionReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.PerformanceMeasure
(
       PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PerformanceMeasure_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.PerformanceMeasureCourseAssociation
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PerformanceMeasureCourseAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.PerformanceMeasureFacts
(
       EducationOrganizationId INT NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       RubricTitle VARCHAR(255) NOT NULL,
       RubricTypeDescriptorId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PerformanceMeasureFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.PerformanceMeasureInstanceDescriptor
(
       PerformanceMeasureInstanceDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PerformanceMeasureInstanceDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.PerformanceMeasureTypeDescriptor
(
       PerformanceMeasureTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PerformanceMeasureTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.PreviousCareerDescriptor
(
       PreviousCareerDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PreviousCareerDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ProfessionalDevelopmentEvent
(
       ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProfessionalDevelopmentEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ProfessionalDevelopmentOfferedByDescriptor
(
       ProfessionalDevelopmentOfferedByDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProfessionalDevelopmentOfferedByDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ProgramGatewayDescriptor
(
       ProgramGatewayDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProgramGatewayDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.Prospect
(
       EducationOrganizationId INT NOT NULL,
       ProspectIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT Prospect_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ProspectProfessionalDevelopmentEventAttendance
(
       AttendanceDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
       ProspectIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProspectProfessionalDevelopmentEventAttendance_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ProspectTypeDescriptor
(
       ProspectTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProspectTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.RecruitmentEvent
(
       EventDate DATE NOT NULL,
       EventTitle VARCHAR(50) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RecruitmentEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.RecruitmentEventTypeDescriptor
(
       RecruitmentEventTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RecruitmentEventTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.Rubric
(
       EducationOrganizationId INT NOT NULL,
       RubricTitle VARCHAR(255) NOT NULL,
       RubricTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT Rubric_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.RubricLevel
(
       EducationOrganizationId INT NOT NULL,
       RubricLevelCode VARCHAR(64) NOT NULL,
       RubricTitle VARCHAR(255) NOT NULL,
       RubricTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RubricLevel_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.RubricLevelResponse
(
       EducationOrganizationId INT NOT NULL,
       PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
       RubricLevelCode VARCHAR(64) NOT NULL,
       RubricTitle VARCHAR(255) NOT NULL,
       RubricTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RubricLevelResponse_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.RubricLevelResponseFacts
(
       EducationOrganizationId INT NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       RubricLevelCode VARCHAR(64) NOT NULL,
       RubricTitle VARCHAR(255) NOT NULL,
       RubricTypeDescriptorId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RubricLevelResponseFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.RubricTypeDescriptor
(
       RubricTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RubricTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SalaryTypeDescriptor
(
       SalaryTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SalaryTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SchoolStatusDescriptor
(
       SchoolStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SchoolStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SectionCourseTranscriptFacts
(
       FactAsOfDate DATE NOT NULL,
       FactsAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SectionCourseTranscriptFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SectionStudentAcademicRecordFacts
(
       FactAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SectionStudentAcademicRecordFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SectionStudentAssessmentFacts
(
       FactAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       TakenSchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SectionStudentAssessmentFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SectionStudentFacts
(
       FactAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SectionStudentFacts_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffApplicantAssociation
(
       ApplicantIdentifier VARCHAR(32) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffApplicantAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluation
(
       EducationOrganizationId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffEvaluationTitle VARCHAR(50) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationComponent
(
       EducationOrganizationId INT NOT NULL,
       EvaluationComponent VARCHAR(50) NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffEvaluationTitle VARCHAR(50) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationComponent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationComponentRating
(
       ComponentRating DECIMAL(6, 3) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       EvaluationComponent VARCHAR(50) NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffEvaluationDate DATE NOT NULL,
       StaffEvaluationTitle VARCHAR(50) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationComponentRating_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationElement
(
       EducationOrganizationId INT NOT NULL,
       EvaluationComponent VARCHAR(50) NOT NULL,
       EvaluationElement VARCHAR(255) NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffEvaluationTitle VARCHAR(50) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationElement_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationElementRating
(
       EducationOrganizationId INT NOT NULL,
       EvaluationComponent VARCHAR(50) NOT NULL,
       EvaluationElement VARCHAR(255) NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffEvaluationDate DATE NOT NULL,
       StaffEvaluationTitle VARCHAR(50) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationElementRating_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationPeriodDescriptor
(
       StaffEvaluationPeriodDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationPeriodDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationRating
(
       EducationOrganizationId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffEvaluationDate DATE NOT NULL,
       StaffEvaluationTitle VARCHAR(50) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationRating_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationRatingLevelDescriptor
(
       StaffEvaluationRatingLevelDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationRatingLevelDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffEvaluationTypeDescriptor
(
       StaffEvaluationTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEvaluationTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffFieldworkAbsenceEvent
(
       AbsenceEventCategoryDescriptorId INT NOT NULL,
       EventDate DATE NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffFieldworkAbsenceEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffFieldworkExperience
(
       BeginDate DATE NOT NULL,
       FieldworkIdentifier VARCHAR(64) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffFieldworkExperience_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffFieldworkExperienceSectionAssociation
(
       BeginDate DATE NOT NULL,
       FieldworkIdentifier VARCHAR(64) NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffFieldworkExperienceSectionAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffProfessionalDevelopmentEventAttendance
(
       AttendanceDate DATE NOT NULL,
       ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffProfessionalDevelopmentEventAttendance_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffProspectAssociation
(
       EducationOrganizationId INT NOT NULL,
       ProspectIdentifier VARCHAR(32) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffProspectAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffStudentGrowthMeasure
(
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffStudentGrowthMeasure_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffStudentGrowthMeasureCourseAssociation
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffStudentGrowthMeasureCourseAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation
(
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffStudentGrowthMeasureEducationOrganizationAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffStudentGrowthMeasureSectionAssociation
(
       FactAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffStudentGrowthMeasureSectionAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffTeacherPreparationProviderAssociation
(
       StaffUSI INT NOT NULL,
       TeacherPreparationProviderId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffTeacherPreparationProviderAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StaffTeacherPreparationProviderProgramAssociation
(
       EducationOrganizationId INT NOT NULL,
       ProgramName VARCHAR(255) NOT NULL,
       ProgramTypeDescriptorId INT NOT NULL,
       StaffUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffTeacherPreparationProviderProgramAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.StudentGrowthTypeDescriptor
(
       StudentGrowthTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentGrowthTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.SurveyLevelDescriptor
(
       SurveyLevelDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SurveyLevelDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TPPDegreeTypeDescriptor
(
       TPPDegreeTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TPPDegreeTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TPPProgramPathwayDescriptor
(
       TPPProgramPathwayDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TPPProgramPathwayDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TalentManagementGoal
(
       GoalTitle VARCHAR(255) NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TalentManagementGoal_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidate
(
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidate_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateAcademicRecord
(
       EducationOrganizationId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateAcademicRecord_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateCharacteristicDescriptor
(
       TeacherCandidateCharacteristicDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateCharacteristicDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateCourseTranscript
(
       CourseAttemptResultDescriptorId INT NOT NULL,
       CourseCode VARCHAR(60) NOT NULL,
       CourseEducationOrganizationId INT NOT NULL,
       EducationOrganizationId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateCourseTranscript_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateFieldworkAbsenceEvent
(
       AbsenceEventCategoryDescriptorId INT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateFieldworkAbsenceEvent_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateFieldworkExperience
(
       BeginDate DATE NOT NULL,
       FieldworkIdentifier VARCHAR(64) NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateFieldworkExperience_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateFieldworkExperienceSectionAssociation
(
       BeginDate DATE NOT NULL,
       FieldworkIdentifier VARCHAR(64) NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateFieldworkExperienceSectionAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance
(
       AttendanceDate DATE NOT NULL,
       ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateProfessionalDevelopmentEventAttendance_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateStaffAssociation
(
       StaffUSI INT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateStaffAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasure
(
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateStudentGrowthMeasure_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation
(
       CourseCode VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateStudentGrowthMeasureCourseAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4
(
       EducationOrganizationId INT NOT NULL,
       FactAsOfDate DATE NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateStudentGrowthMeasureEducationOrgan_22b9a4_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation
(
       FactAsOfDate DATE NOT NULL,
       LocalCourseCode VARCHAR(60) NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       SectionIdentifier VARCHAR(255) NOT NULL,
       SessionName VARCHAR(60) NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateStudentGrowthMeasureSectionAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderAssociation
(
       EntryDate DATE NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       TeacherPreparationProviderId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateTeacherPreparationProviderAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation
(
       BeginDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       ProgramName VARCHAR(255) NOT NULL,
       ProgramTypeDescriptorId INT NOT NULL,
       TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherCandidateTeacherPreparationProviderProgramAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherPreparationProgramTypeDescriptor
(
       TeacherPreparationProgramTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherPreparationProgramTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherPreparationProvider
(
       TeacherPreparationProviderId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherPreparationProvider_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.TeacherPreparationProviderProgram
(
       EducationOrganizationId INT NOT NULL,
       ProgramName VARCHAR(255) NOT NULL,
       ProgramTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TeacherPreparationProviderProgram_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ThemeDescriptor
(
       ThemeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ThemeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.University
(
       UniversityId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT University_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.ValueTypeDescriptor
(
       ValueTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ValueTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_tpdm.WithdrawReasonDescriptor
(
       WithdrawReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT WithdrawReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

