-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudent') AND name = N'UX_AnonymizedStudent_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudent_ChangeVersion] ON [tpdm].[AnonymizedStudent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAcademicRecord') AND name = N'UX_AnonymizedStudentAcademicRecord_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentAcademicRecord_ChangeVersion] ON [tpdm].[AnonymizedStudentAcademicRecord] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAssessment') AND name = N'UX_AnonymizedStudentAssessment_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentAssessment_ChangeVersion] ON [tpdm].[AnonymizedStudentAssessment] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAssessmentCourseAssociation') AND name = N'UX_AnonymizedStudentAssessmentCourseAssociation_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentAssessmentCourseAssociation_ChangeVersion] ON [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAssessmentSectionAssociation') AND name = N'UX_AnonymizedStudentAssessmentSectionAssociation_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentAssessmentSectionAssociation_ChangeVersion] ON [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentCourseAssociation') AND name = N'UX_AnonymizedStudentCourseAssociation_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentCourseAssociation_ChangeVersion] ON [tpdm].[AnonymizedStudentCourseAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentCourseTranscript') AND name = N'UX_AnonymizedStudentCourseTranscript_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentCourseTranscript_ChangeVersion] ON [tpdm].[AnonymizedStudentCourseTranscript] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentEducationOrganizationAssociation') AND name = N'UX_AnonymizedStudentEducationOrganizationAssociation_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentEducationOrganizationAssociation_ChangeVersion] ON [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentSectionAssociation') AND name = N'UX_AnonymizedStudentSectionAssociation_ChangeVersion')
    CREATE INDEX [UX_AnonymizedStudentSectionAssociation_ChangeVersion] ON [tpdm].[AnonymizedStudentSectionAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Applicant') AND name = N'UX_Applicant_ChangeVersion')
    CREATE INDEX [UX_Applicant_ChangeVersion] ON [tpdm].[Applicant] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ApplicantProspectAssociation') AND name = N'UX_ApplicantProspectAssociation_ChangeVersion')
    CREATE INDEX [UX_ApplicantProspectAssociation_ChangeVersion] ON [tpdm].[ApplicantProspectAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Application') AND name = N'UX_Application_ChangeVersion')
    CREATE INDEX [UX_Application_ChangeVersion] ON [tpdm].[Application] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ApplicationEvent') AND name = N'UX_ApplicationEvent_ChangeVersion')
    CREATE INDEX [UX_ApplicationEvent_ChangeVersion] ON [tpdm].[ApplicationEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CompleterAsStaffAssociation') AND name = N'UX_CompleterAsStaffAssociation_ChangeVersion')
    CREATE INDEX [UX_CompleterAsStaffAssociation_ChangeVersion] ON [tpdm].[CompleterAsStaffAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseCourseTranscriptFacts') AND name = N'UX_CourseCourseTranscriptFacts_ChangeVersion')
    CREATE INDEX [UX_CourseCourseTranscriptFacts_ChangeVersion] ON [tpdm].[CourseCourseTranscriptFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseStudentAcademicRecordFacts') AND name = N'UX_CourseStudentAcademicRecordFacts_ChangeVersion')
    CREATE INDEX [UX_CourseStudentAcademicRecordFacts_ChangeVersion] ON [tpdm].[CourseStudentAcademicRecordFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseStudentAssessmentFacts') AND name = N'UX_CourseStudentAssessmentFacts_ChangeVersion')
    CREATE INDEX [UX_CourseStudentAssessmentFacts_ChangeVersion] ON [tpdm].[CourseStudentAssessmentFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseStudentFacts') AND name = N'UX_CourseStudentFacts_ChangeVersion')
    CREATE INDEX [UX_CourseStudentFacts_ChangeVersion] ON [tpdm].[CourseStudentFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationCourseTranscriptFacts') AND name = N'UX_EducationOrganizationCourseTranscriptFacts_ChangeVersion')
    CREATE INDEX [UX_EducationOrganizationCourseTranscriptFacts_ChangeVersion] ON [tpdm].[EducationOrganizationCourseTranscriptFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationFacts') AND name = N'UX_EducationOrganizationFacts_ChangeVersion')
    CREATE INDEX [UX_EducationOrganizationFacts_ChangeVersion] ON [tpdm].[EducationOrganizationFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationStudentAcademicRecordFacts') AND name = N'UX_EducationOrganizationStudentAcademicRecordFacts_ChangeVersion')
    CREATE INDEX [UX_EducationOrganizationStudentAcademicRecordFacts_ChangeVersion] ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationStudentAssessmentFacts') AND name = N'UX_EducationOrganizationStudentAssessmentFacts_ChangeVersion')
    CREATE INDEX [UX_EducationOrganizationStudentAssessmentFacts_ChangeVersion] ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationStudentFacts') AND name = N'UX_EducationOrganizationStudentFacts_ChangeVersion')
    CREATE INDEX [UX_EducationOrganizationStudentFacts_ChangeVersion] ON [tpdm].[EducationOrganizationStudentFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EmploymentEvent') AND name = N'UX_EmploymentEvent_ChangeVersion')
    CREATE INDEX [UX_EmploymentEvent_ChangeVersion] ON [tpdm].[EmploymentEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EmploymentSeparationEvent') AND name = N'UX_EmploymentSeparationEvent_ChangeVersion')
    CREATE INDEX [UX_EmploymentSeparationEvent_ChangeVersion] ON [tpdm].[EmploymentSeparationEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.OpenStaffPositionEvent') AND name = N'UX_OpenStaffPositionEvent_ChangeVersion')
    CREATE INDEX [UX_OpenStaffPositionEvent_ChangeVersion] ON [tpdm].[OpenStaffPositionEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.PerformanceMeasure') AND name = N'UX_PerformanceMeasure_ChangeVersion')
    CREATE INDEX [UX_PerformanceMeasure_ChangeVersion] ON [tpdm].[PerformanceMeasure] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.PerformanceMeasureCourseAssociation') AND name = N'UX_PerformanceMeasureCourseAssociation_ChangeVersion')
    CREATE INDEX [UX_PerformanceMeasureCourseAssociation_ChangeVersion] ON [tpdm].[PerformanceMeasureCourseAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.PerformanceMeasureFacts') AND name = N'UX_PerformanceMeasureFacts_ChangeVersion')
    CREATE INDEX [UX_PerformanceMeasureFacts_ChangeVersion] ON [tpdm].[PerformanceMeasureFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ProfessionalDevelopmentEvent') AND name = N'UX_ProfessionalDevelopmentEvent_ChangeVersion')
    CREATE INDEX [UX_ProfessionalDevelopmentEvent_ChangeVersion] ON [tpdm].[ProfessionalDevelopmentEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Prospect') AND name = N'UX_Prospect_ChangeVersion')
    CREATE INDEX [UX_Prospect_ChangeVersion] ON [tpdm].[Prospect] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ProspectProfessionalDevelopmentEventAttendance') AND name = N'UX_ProspectProfessionalDevelopmentEventAttendance_ChangeVersion')
    CREATE INDEX [UX_ProspectProfessionalDevelopmentEventAttendance_ChangeVersion] ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RecruitmentEvent') AND name = N'UX_RecruitmentEvent_ChangeVersion')
    CREATE INDEX [UX_RecruitmentEvent_ChangeVersion] ON [tpdm].[RecruitmentEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Rubric') AND name = N'UX_Rubric_ChangeVersion')
    CREATE INDEX [UX_Rubric_ChangeVersion] ON [tpdm].[Rubric] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RubricLevel') AND name = N'UX_RubricLevel_ChangeVersion')
    CREATE INDEX [UX_RubricLevel_ChangeVersion] ON [tpdm].[RubricLevel] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RubricLevelResponse') AND name = N'UX_RubricLevelResponse_ChangeVersion')
    CREATE INDEX [UX_RubricLevelResponse_ChangeVersion] ON [tpdm].[RubricLevelResponse] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RubricLevelResponseFacts') AND name = N'UX_RubricLevelResponseFacts_ChangeVersion')
    CREATE INDEX [UX_RubricLevelResponseFacts_ChangeVersion] ON [tpdm].[RubricLevelResponseFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionCourseTranscriptFacts') AND name = N'UX_SectionCourseTranscriptFacts_ChangeVersion')
    CREATE INDEX [UX_SectionCourseTranscriptFacts_ChangeVersion] ON [tpdm].[SectionCourseTranscriptFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionStudentAcademicRecordFacts') AND name = N'UX_SectionStudentAcademicRecordFacts_ChangeVersion')
    CREATE INDEX [UX_SectionStudentAcademicRecordFacts_ChangeVersion] ON [tpdm].[SectionStudentAcademicRecordFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionStudentAssessmentFacts') AND name = N'UX_SectionStudentAssessmentFacts_ChangeVersion')
    CREATE INDEX [UX_SectionStudentAssessmentFacts_ChangeVersion] ON [tpdm].[SectionStudentAssessmentFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionStudentFacts') AND name = N'UX_SectionStudentFacts_ChangeVersion')
    CREATE INDEX [UX_SectionStudentFacts_ChangeVersion] ON [tpdm].[SectionStudentFacts] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffApplicantAssociation') AND name = N'UX_StaffApplicantAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffApplicantAssociation_ChangeVersion] ON [tpdm].[StaffApplicantAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluation') AND name = N'UX_StaffEvaluation_ChangeVersion')
    CREATE INDEX [UX_StaffEvaluation_ChangeVersion] ON [tpdm].[StaffEvaluation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationComponent') AND name = N'UX_StaffEvaluationComponent_ChangeVersion')
    CREATE INDEX [UX_StaffEvaluationComponent_ChangeVersion] ON [tpdm].[StaffEvaluationComponent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationComponentRating') AND name = N'UX_StaffEvaluationComponentRating_ChangeVersion')
    CREATE INDEX [UX_StaffEvaluationComponentRating_ChangeVersion] ON [tpdm].[StaffEvaluationComponentRating] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationElement') AND name = N'UX_StaffEvaluationElement_ChangeVersion')
    CREATE INDEX [UX_StaffEvaluationElement_ChangeVersion] ON [tpdm].[StaffEvaluationElement] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationElementRating') AND name = N'UX_StaffEvaluationElementRating_ChangeVersion')
    CREATE INDEX [UX_StaffEvaluationElementRating_ChangeVersion] ON [tpdm].[StaffEvaluationElementRating] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationRating') AND name = N'UX_StaffEvaluationRating_ChangeVersion')
    CREATE INDEX [UX_StaffEvaluationRating_ChangeVersion] ON [tpdm].[StaffEvaluationRating] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffFieldworkAbsenceEvent') AND name = N'UX_StaffFieldworkAbsenceEvent_ChangeVersion')
    CREATE INDEX [UX_StaffFieldworkAbsenceEvent_ChangeVersion] ON [tpdm].[StaffFieldworkAbsenceEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffFieldworkExperience') AND name = N'UX_StaffFieldworkExperience_ChangeVersion')
    CREATE INDEX [UX_StaffFieldworkExperience_ChangeVersion] ON [tpdm].[StaffFieldworkExperience] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffFieldworkExperienceSectionAssociation') AND name = N'UX_StaffFieldworkExperienceSectionAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffFieldworkExperienceSectionAssociation_ChangeVersion] ON [tpdm].[StaffFieldworkExperienceSectionAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffProfessionalDevelopmentEventAttendance') AND name = N'UX_StaffProfessionalDevelopmentEventAttendance_ChangeVersion')
    CREATE INDEX [UX_StaffProfessionalDevelopmentEventAttendance_ChangeVersion] ON [tpdm].[StaffProfessionalDevelopmentEventAttendance] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffProspectAssociation') AND name = N'UX_StaffProspectAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffProspectAssociation_ChangeVersion] ON [tpdm].[StaffProspectAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasure') AND name = N'UX_StaffStudentGrowthMeasure_ChangeVersion')
    CREATE INDEX [UX_StaffStudentGrowthMeasure_ChangeVersion] ON [tpdm].[StaffStudentGrowthMeasure] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasureCourseAssociation') AND name = N'UX_StaffStudentGrowthMeasureCourseAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffStudentGrowthMeasureCourseAssociation_ChangeVersion] ON [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation') AND name = N'UX_StaffStudentGrowthMeasureEducationOrganizationAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffStudentGrowthMeasureEducationOrganizationAssociation_ChangeVersion] ON [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasureSectionAssociation') AND name = N'UX_StaffStudentGrowthMeasureSectionAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffStudentGrowthMeasureSectionAssociation_ChangeVersion] ON [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffTeacherPreparationProviderAssociation') AND name = N'UX_StaffTeacherPreparationProviderAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffTeacherPreparationProviderAssociation_ChangeVersion] ON [tpdm].[StaffTeacherPreparationProviderAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffTeacherPreparationProviderProgramAssociation') AND name = N'UX_StaffTeacherPreparationProviderProgramAssociation_ChangeVersion')
    CREATE INDEX [UX_StaffTeacherPreparationProviderProgramAssociation_ChangeVersion] ON [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TalentManagementGoal') AND name = N'UX_TalentManagementGoal_ChangeVersion')
    CREATE INDEX [UX_TalentManagementGoal_ChangeVersion] ON [tpdm].[TalentManagementGoal] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidate') AND name = N'UX_TeacherCandidate_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidate_ChangeVersion] ON [tpdm].[TeacherCandidate] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateAcademicRecord') AND name = N'UX_TeacherCandidateAcademicRecord_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateAcademicRecord_ChangeVersion] ON [tpdm].[TeacherCandidateAcademicRecord] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateCourseTranscript') AND name = N'UX_TeacherCandidateCourseTranscript_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateCourseTranscript_ChangeVersion] ON [tpdm].[TeacherCandidateCourseTranscript] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateFieldworkAbsenceEvent') AND name = N'UX_TeacherCandidateFieldworkAbsenceEvent_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateFieldworkAbsenceEvent_ChangeVersion] ON [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateFieldworkExperience') AND name = N'UX_TeacherCandidateFieldworkExperience_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateFieldworkExperience_ChangeVersion] ON [tpdm].[TeacherCandidateFieldworkExperience] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateFieldworkExperienceSectionAssociation') AND name = N'UX_TeacherCandidateFieldworkExperienceSectionAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateFieldworkExperienceSectionAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance') AND name = N'UX_TeacherCandidateProfessionalDevelopmentEventAttendance_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateProfessionalDevelopmentEventAttendance_ChangeVersion] ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStaffAssociation') AND name = N'UX_TeacherCandidateStaffAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateStaffAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateStaffAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasure') AND name = N'UX_TeacherCandidateStudentGrowthMeasure_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateStudentGrowthMeasure_ChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasure] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation') AND name = N'UX_TeacherCandidateStudentGrowthMeasureCourseAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateStudentGrowthMeasureCourseAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation') AND name = N'UX_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation') AND name = N'UX_TeacherCandidateStudentGrowthMeasureSectionAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateStudentGrowthMeasureSectionAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateTeacherPreparationProviderAssociation') AND name = N'UX_TeacherCandidateTeacherPreparationProviderAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateTeacherPreparationProviderAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation') AND name = N'UX_TeacherCandidateTeacherPreparationProviderProgramAssociation_ChangeVersion')
    CREATE INDEX [UX_TeacherCandidateTeacherPreparationProviderProgramAssociation_ChangeVersion] ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherPreparationProviderProgram') AND name = N'UX_TeacherPreparationProviderProgram_ChangeVersion')
    CREATE INDEX [UX_TeacherPreparationProviderProgram_ChangeVersion] ON [tpdm].[TeacherPreparationProviderProgram] ([ChangeVersion] ASC)
    GO
COMMIT

