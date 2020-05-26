-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE [tracked_deletes_tpdm].[AidTypeDescriptor]
(
       AidTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AidTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudent]
(
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentAcademicRecord]
(
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentAcademicRecord PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentAssessment]
(
       AdministrationDate [DATE] NOT NULL,
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TakenSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentAssessment PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentAssessmentCourseAssociation]
(
       AdministrationDate [DATE] NOT NULL,
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TakenSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentAssessmentCourseAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentAssessmentSectionAssociation]
(
       AdministrationDate [DATE] NOT NULL,
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       TakenSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentAssessmentSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentCourseAssociation]
(
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       BeginDate [DATE] NOT NULL,
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentCourseAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentCourseTranscript]
(
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentCourseTranscript PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentEducationOrganizationAssociation]
(
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentEducationOrganizationAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[AnonymizedStudentSectionAssociation]
(
       AnonymizedStudentIdentifier [NVARCHAR](60) NOT NULL,
       BeginDate [DATE] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AnonymizedStudentSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[Applicant]
(
       ApplicantIdentifier [NVARCHAR](32) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_Applicant PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ApplicantProspectAssociation]
(
       ApplicantIdentifier [NVARCHAR](32) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProspectIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ApplicantProspectAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[Application]
(
       ApplicantIdentifier [NVARCHAR](32) NOT NULL,
       ApplicationIdentifier [NVARCHAR](20) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_Application PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ApplicationEvent]
(
       ApplicantIdentifier [NVARCHAR](32) NOT NULL,
       ApplicationEventTypeDescriptorId [INT] NOT NULL,
       ApplicationIdentifier [NVARCHAR](20) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       SequenceNumber [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ApplicationEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ApplicationEventResultDescriptor]
(
       ApplicationEventResultDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ApplicationEventResultDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ApplicationEventTypeDescriptor]
(
       ApplicationEventTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ApplicationEventTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ApplicationSourceDescriptor]
(
       ApplicationSourceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ApplicationSourceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ApplicationStatusDescriptor]
(
       ApplicationStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ApplicationStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[BackgroundCheckStatusDescriptor]
(
       BackgroundCheckStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_BackgroundCheckStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[BackgroundCheckTypeDescriptor]
(
       BackgroundCheckTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_BackgroundCheckTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[BoardCertificationTypeDescriptor]
(
       BoardCertificationTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_BoardCertificationTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CertificationExamStatusDescriptor]
(
       CertificationExamStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CertificationExamStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CertificationExamTypeDescriptor]
(
       CertificationExamTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CertificationExamTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CompleterAsStaffAssociation]
(
       StaffUSI [INT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CompleterAsStaffAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CoteachingStyleObservedDescriptor]
(
       CoteachingStyleObservedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CoteachingStyleObservedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CourseCourseTranscriptFacts]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseCourseTranscriptFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CourseStudentAcademicRecordFacts]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseStudentAcademicRecordFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CourseStudentAssessmentFacts]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       TakenSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseStudentAssessmentFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[CourseStudentFacts]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseStudentFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EducationOrganizationCourseTranscriptFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationCourseTranscriptFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EducationOrganizationFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EducationOrganizationStudentAcademicRecordFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationStudentAcademicRecordFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EducationOrganizationStudentAssessmentFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       TakenSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationStudentAssessmentFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EducationOrganizationStudentFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationStudentFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EmploymentEvent]
(
       EducationOrganizationId [INT] NOT NULL,
       EmploymentEventTypeDescriptorId [INT] NOT NULL,
       RequisitionNumber [NVARCHAR](20) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EmploymentEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EmploymentEventTypeDescriptor]
(
       EmploymentEventTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EmploymentEventTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EmploymentSeparationEvent]
(
       EducationOrganizationId [INT] NOT NULL,
       EmploymentSeparationDate [DATE] NOT NULL,
       RequisitionNumber [NVARCHAR](20) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EmploymentSeparationEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EmploymentSeparationReasonDescriptor]
(
       EmploymentSeparationReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EmploymentSeparationReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EmploymentSeparationTypeDescriptor]
(
       EmploymentSeparationTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EmploymentSeparationTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[EnglishLanguageExamDescriptor]
(
       EnglishLanguageExamDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EnglishLanguageExamDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[FederalLocaleCodeDescriptor]
(
       FederalLocaleCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_FederalLocaleCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[FieldworkTypeDescriptor]
(
       FieldworkTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_FieldworkTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[FundingSourceDescriptor]
(
       FundingSourceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_FundingSourceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[GenderDescriptor]
(
       GenderDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GenderDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[HireStatusDescriptor]
(
       HireStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_HireStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[HiringSourceDescriptor]
(
       HiringSourceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_HiringSourceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[InternalExternalHireDescriptor]
(
       InternalExternalHireDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_InternalExternalHireDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[LevelOfDegreeAwardedDescriptor]
(
       LevelOfDegreeAwardedDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LevelOfDegreeAwardedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[LevelTypeDescriptor]
(
       LevelTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LevelTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[OpenStaffPositionEvent]
(
       EducationOrganizationId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       OpenStaffPositionEventTypeDescriptorId [INT] NOT NULL,
       RequisitionNumber [NVARCHAR](20) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OpenStaffPositionEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[OpenStaffPositionEventStatusDescriptor]
(
       OpenStaffPositionEventStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OpenStaffPositionEventStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[OpenStaffPositionEventTypeDescriptor]
(
       OpenStaffPositionEventTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OpenStaffPositionEventTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[OpenStaffPositionReasonDescriptor]
(
       OpenStaffPositionReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OpenStaffPositionReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[PerformanceMeasure]
(
       PerformanceMeasureIdentifier [NVARCHAR](64) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceMeasure PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[PerformanceMeasureCourseAssociation]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       PerformanceMeasureIdentifier [NVARCHAR](64) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceMeasureCourseAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[PerformanceMeasureFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       RubricTitle [NVARCHAR](255) NOT NULL,
       RubricTypeDescriptorId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceMeasureFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[PerformanceMeasureInstanceDescriptor]
(
       PerformanceMeasureInstanceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceMeasureInstanceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[PerformanceMeasureTypeDescriptor]
(
       PerformanceMeasureTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceMeasureTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[PreviousCareerDescriptor]
(
       PreviousCareerDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PreviousCareerDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ProfessionalDevelopmentEvent]
(
       ProfessionalDevelopmentTitle [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProfessionalDevelopmentEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ProfessionalDevelopmentOfferedByDescriptor]
(
       ProfessionalDevelopmentOfferedByDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProfessionalDevelopmentOfferedByDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ProgramGatewayDescriptor]
(
       ProgramGatewayDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramGatewayDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[Prospect]
(
       EducationOrganizationId [INT] NOT NULL,
       ProspectIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_Prospect PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ProspectProfessionalDevelopmentEventAttendance]
(
       AttendanceDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProfessionalDevelopmentTitle [NVARCHAR](60) NOT NULL,
       ProspectIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProspectProfessionalDevelopmentEventAttendance PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ProspectTypeDescriptor]
(
       ProspectTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProspectTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[RecruitmentEvent]
(
       EventDate [DATE] NOT NULL,
       EventTitle [NVARCHAR](50) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RecruitmentEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[RecruitmentEventTypeDescriptor]
(
       RecruitmentEventTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RecruitmentEventTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[Rubric]
(
       EducationOrganizationId [INT] NOT NULL,
       RubricTitle [NVARCHAR](255) NOT NULL,
       RubricTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_Rubric PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[RubricLevel]
(
       EducationOrganizationId [INT] NOT NULL,
       RubricLevelCode [NVARCHAR](64) NOT NULL,
       RubricTitle [NVARCHAR](255) NOT NULL,
       RubricTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RubricLevel PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[RubricLevelResponse]
(
       EducationOrganizationId [INT] NOT NULL,
       PerformanceMeasureIdentifier [NVARCHAR](64) NOT NULL,
       RubricLevelCode [NVARCHAR](64) NOT NULL,
       RubricTitle [NVARCHAR](255) NOT NULL,
       RubricTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RubricLevelResponse PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[RubricLevelResponseFacts]
(
       EducationOrganizationId [INT] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       RubricLevelCode [NVARCHAR](64) NOT NULL,
       RubricTitle [NVARCHAR](255) NOT NULL,
       RubricTypeDescriptorId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RubricLevelResponseFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[RubricTypeDescriptor]
(
       RubricTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RubricTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SalaryTypeDescriptor]
(
       SalaryTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SalaryTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SchoolStatusDescriptor]
(
       SchoolStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SchoolStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SectionCourseTranscriptFacts]
(
       FactAsOfDate [DATE] NOT NULL,
       FactsAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SectionCourseTranscriptFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SectionStudentAcademicRecordFacts]
(
       FactAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SectionStudentAcademicRecordFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SectionStudentAssessmentFacts]
(
       FactAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       TakenSchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SectionStudentAssessmentFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SectionStudentFacts]
(
       FactAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SectionStudentFacts PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffApplicantAssociation]
(
       ApplicantIdentifier [NVARCHAR](32) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffApplicantAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluation]
(
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffEvaluationTitle [NVARCHAR](50) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationComponent]
(
       EducationOrganizationId [INT] NOT NULL,
       EvaluationComponent [NVARCHAR](50) NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffEvaluationTitle [NVARCHAR](50) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationComponent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationComponentRating]
(
       ComponentRating [DECIMAL](6, 3) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       EvaluationComponent [NVARCHAR](50) NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffEvaluationDate [DATE] NOT NULL,
       StaffEvaluationTitle [NVARCHAR](50) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationComponentRating PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationElement]
(
       EducationOrganizationId [INT] NOT NULL,
       EvaluationComponent [NVARCHAR](50) NOT NULL,
       EvaluationElement [NVARCHAR](255) NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffEvaluationTitle [NVARCHAR](50) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationElement PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationElementRating]
(
       EducationOrganizationId [INT] NOT NULL,
       EvaluationComponent [NVARCHAR](50) NOT NULL,
       EvaluationElement [NVARCHAR](255) NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffEvaluationDate [DATE] NOT NULL,
       StaffEvaluationTitle [NVARCHAR](50) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationElementRating PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationPeriodDescriptor]
(
       StaffEvaluationPeriodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationPeriodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationRating]
(
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffEvaluationDate [DATE] NOT NULL,
       StaffEvaluationTitle [NVARCHAR](50) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationRating PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationRatingLevelDescriptor]
(
       StaffEvaluationRatingLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationRatingLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffEvaluationTypeDescriptor]
(
       StaffEvaluationTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffEvaluationTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffFieldworkAbsenceEvent]
(
       AbsenceEventCategoryDescriptorId [INT] NOT NULL,
       EventDate [DATE] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffFieldworkAbsenceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffFieldworkExperience]
(
       BeginDate [DATE] NOT NULL,
       FieldworkIdentifier [NVARCHAR](64) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffFieldworkExperience PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffFieldworkExperienceSectionAssociation]
(
       BeginDate [DATE] NOT NULL,
       FieldworkIdentifier [NVARCHAR](64) NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffFieldworkExperienceSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffProfessionalDevelopmentEventAttendance]
(
       AttendanceDate [DATE] NOT NULL,
       ProfessionalDevelopmentTitle [NVARCHAR](60) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffProfessionalDevelopmentEventAttendance PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffProspectAssociation]
(
       EducationOrganizationId [INT] NOT NULL,
       ProspectIdentifier [NVARCHAR](32) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffProspectAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffStudentGrowthMeasure]
(
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffStudentGrowthMeasure PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffStudentGrowthMeasureCourseAssociation]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffStudentGrowthMeasureCourseAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation]
(
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StaffStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffStudentGrowthMeasureEducationOrganizationAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffStudentGrowthMeasureSectionAssociation]
(
       FactAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StaffStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffStudentGrowthMeasureSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffTeacherPreparationProviderAssociation]
(
       StaffUSI [INT] NOT NULL,
       TeacherPreparationProviderId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffTeacherPreparationProviderAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StaffTeacherPreparationProviderProgramAssociation]
(
       EducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](255) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StaffUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffTeacherPreparationProviderProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[StudentGrowthTypeDescriptor]
(
       StudentGrowthTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentGrowthTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[SurveyLevelDescriptor]
(
       SurveyLevelDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SurveyLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TPPDegreeTypeDescriptor]
(
       TPPDegreeTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TPPDegreeTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TPPProgramPathwayDescriptor]
(
       TPPProgramPathwayDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TPPProgramPathwayDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TalentManagementGoal]
(
       GoalTitle [NVARCHAR](255) NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TalentManagementGoal PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidate]
(
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidate PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateAcademicRecord]
(
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateAcademicRecord PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateCharacteristicDescriptor]
(
       TeacherCandidateCharacteristicDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateCharacteristicDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateCourseTranscript]
(
       CourseAttemptResultDescriptorId [INT] NOT NULL,
       CourseCode [NVARCHAR](60) NOT NULL,
       CourseEducationOrganizationId [INT] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateCourseTranscript PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateFieldworkAbsenceEvent]
(
       AbsenceEventCategoryDescriptorId [INT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateFieldworkAbsenceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateFieldworkExperience]
(
       BeginDate [DATE] NOT NULL,
       FieldworkIdentifier [NVARCHAR](64) NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateFieldworkExperience PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation]
(
       BeginDate [DATE] NOT NULL,
       FieldworkIdentifier [NVARCHAR](64) NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateFieldworkExperienceSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance]
(
       AttendanceDate [DATE] NOT NULL,
       ProfessionalDevelopmentTitle [NVARCHAR](60) NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateProfessionalDevelopmentEventAttendance PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateStaffAssociation]
(
       StaffUSI [INT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateStaffAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasure]
(
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateStudentGrowthMeasure PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation]
(
       CourseCode [NVARCHAR](60) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateStudentGrowthMeasureCourseAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation]
(
       EducationOrganizationId [INT] NOT NULL,
       FactAsOfDate [DATE] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation]
(
       FactAsOfDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TeacherCandidateStudentGrowthMeasureIdentifier [NVARCHAR](64) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateStudentGrowthMeasureSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateTeacherPreparationProviderAssociation]
(
       EntryDate [DATE] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       TeacherPreparationProviderId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateTeacherPreparationProviderAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](255) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       TeacherCandidateIdentifier [NVARCHAR](32) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherCandidateTeacherPreparationProviderProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherPreparationProgramTypeDescriptor]
(
       TeacherPreparationProgramTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherPreparationProgramTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherPreparationProvider]
(
       TeacherPreparationProviderId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherPreparationProvider PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[TeacherPreparationProviderProgram]
(
       EducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](255) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeacherPreparationProviderProgram PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ThemeDescriptor]
(
       ThemeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ThemeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[University]
(
       UniversityId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_University PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[ValueTypeDescriptor]
(
       ValueTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ValueTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_tpdm].[WithdrawReasonDescriptor]
(
       WithdrawReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_WithdrawReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

