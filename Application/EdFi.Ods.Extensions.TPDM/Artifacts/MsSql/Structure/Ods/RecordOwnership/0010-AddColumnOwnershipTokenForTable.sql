-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[ApplicantProspectAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[CompleterAsStaffAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffApplicantAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffProspectAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[Applicant] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[Application] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[ApplicationEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[CourseCourseTranscriptFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[CourseStudentFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EducationOrganizationFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EducationOrganizationStudentFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EmploymentEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[EmploymentSeparationEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[OpenStaffPositionEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[PerformanceMeasure] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[PerformanceMeasureFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[Prospect] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[RecruitmentEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[Rubric] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[RubricLevel] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[RubricLevelResponse] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[RubricLevelResponseFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[SectionCourseTranscriptFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[SectionStudentFacts] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffEvaluation] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffEvaluationComponent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffEvaluationComponentRating] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffEvaluationElement] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffEvaluationElementRating] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffEvaluationRating] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffFieldworkExperience] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TalentManagementGoal] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidate] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] ADD [CreatedByOwnershipTokenId] SMALLINT NULL;

