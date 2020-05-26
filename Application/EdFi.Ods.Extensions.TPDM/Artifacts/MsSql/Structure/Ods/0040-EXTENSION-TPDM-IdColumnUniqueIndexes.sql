-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudent') AND name = N'UX_AnonymizedStudent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudent_Id ON [tpdm].[AnonymizedStudent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAcademicRecord') AND name = N'UX_AnonymizedStudentAcademicRecord_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentAcademicRecord_Id ON [tpdm].[AnonymizedStudentAcademicRecord]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAssessment') AND name = N'UX_AnonymizedStudentAssessment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentAssessment_Id ON [tpdm].[AnonymizedStudentAssessment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAssessmentCourseAssociation') AND name = N'UX_AnonymizedStudentAssessmentCourseAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentAssessmentCourseAssociation_Id ON [tpdm].[AnonymizedStudentAssessmentCourseAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentAssessmentSectionAssociation') AND name = N'UX_AnonymizedStudentAssessmentSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentAssessmentSectionAssociation_Id ON [tpdm].[AnonymizedStudentAssessmentSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentCourseAssociation') AND name = N'UX_AnonymizedStudentCourseAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentCourseAssociation_Id ON [tpdm].[AnonymizedStudentCourseAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentCourseTranscript') AND name = N'UX_AnonymizedStudentCourseTranscript_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentCourseTranscript_Id ON [tpdm].[AnonymizedStudentCourseTranscript]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentEducationOrganizationAssociation') AND name = N'UX_AnonymizedStudentEducationOrganizationAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentEducationOrganizationAssociation_Id ON [tpdm].[AnonymizedStudentEducationOrganizationAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.AnonymizedStudentSectionAssociation') AND name = N'UX_AnonymizedStudentSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AnonymizedStudentSectionAssociation_Id ON [tpdm].[AnonymizedStudentSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Applicant') AND name = N'UX_Applicant_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Applicant_Id ON [tpdm].[Applicant]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ApplicantProspectAssociation') AND name = N'UX_ApplicantProspectAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ApplicantProspectAssociation_Id ON [tpdm].[ApplicantProspectAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Application') AND name = N'UX_Application_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Application_Id ON [tpdm].[Application]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ApplicationEvent') AND name = N'UX_ApplicationEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ApplicationEvent_Id ON [tpdm].[ApplicationEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CompleterAsStaffAssociation') AND name = N'UX_CompleterAsStaffAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CompleterAsStaffAssociation_Id ON [tpdm].[CompleterAsStaffAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseCourseTranscriptFacts') AND name = N'UX_CourseCourseTranscriptFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseCourseTranscriptFacts_Id ON [tpdm].[CourseCourseTranscriptFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseStudentAcademicRecordFacts') AND name = N'UX_CourseStudentAcademicRecordFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseStudentAcademicRecordFacts_Id ON [tpdm].[CourseStudentAcademicRecordFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseStudentAssessmentFacts') AND name = N'UX_CourseStudentAssessmentFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseStudentAssessmentFacts_Id ON [tpdm].[CourseStudentAssessmentFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.CourseStudentFacts') AND name = N'UX_CourseStudentFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CourseStudentFacts_Id ON [tpdm].[CourseStudentFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationCourseTranscriptFacts') AND name = N'UX_EducationOrganizationCourseTranscriptFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationCourseTranscriptFacts_Id ON [tpdm].[EducationOrganizationCourseTranscriptFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationFacts') AND name = N'UX_EducationOrganizationFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationFacts_Id ON [tpdm].[EducationOrganizationFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationStudentAcademicRecordFacts') AND name = N'UX_EducationOrganizationStudentAcademicRecordFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationStudentAcademicRecordFacts_Id ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationStudentAssessmentFacts') AND name = N'UX_EducationOrganizationStudentAssessmentFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationStudentAssessmentFacts_Id ON [tpdm].[EducationOrganizationStudentAssessmentFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EducationOrganizationStudentFacts') AND name = N'UX_EducationOrganizationStudentFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EducationOrganizationStudentFacts_Id ON [tpdm].[EducationOrganizationStudentFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EmploymentEvent') AND name = N'UX_EmploymentEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EmploymentEvent_Id ON [tpdm].[EmploymentEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.EmploymentSeparationEvent') AND name = N'UX_EmploymentSeparationEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_EmploymentSeparationEvent_Id ON [tpdm].[EmploymentSeparationEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.OpenStaffPositionEvent') AND name = N'UX_OpenStaffPositionEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_OpenStaffPositionEvent_Id ON [tpdm].[OpenStaffPositionEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.PerformanceMeasure') AND name = N'UX_PerformanceMeasure_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PerformanceMeasure_Id ON [tpdm].[PerformanceMeasure]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.PerformanceMeasureCourseAssociation') AND name = N'UX_PerformanceMeasureCourseAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PerformanceMeasureCourseAssociation_Id ON [tpdm].[PerformanceMeasureCourseAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.PerformanceMeasureFacts') AND name = N'UX_PerformanceMeasureFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PerformanceMeasureFacts_Id ON [tpdm].[PerformanceMeasureFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ProfessionalDevelopmentEvent') AND name = N'UX_ProfessionalDevelopmentEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProfessionalDevelopmentEvent_Id ON [tpdm].[ProfessionalDevelopmentEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Prospect') AND name = N'UX_Prospect_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Prospect_Id ON [tpdm].[Prospect]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.ProspectProfessionalDevelopmentEventAttendance') AND name = N'UX_ProspectProfessionalDevelopmentEventAttendance_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProspectProfessionalDevelopmentEventAttendance_Id ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RecruitmentEvent') AND name = N'UX_RecruitmentEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RecruitmentEvent_Id ON [tpdm].[RecruitmentEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.Rubric') AND name = N'UX_Rubric_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Rubric_Id ON [tpdm].[Rubric]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RubricLevel') AND name = N'UX_RubricLevel_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RubricLevel_Id ON [tpdm].[RubricLevel]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RubricLevelResponse') AND name = N'UX_RubricLevelResponse_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RubricLevelResponse_Id ON [tpdm].[RubricLevelResponse]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.RubricLevelResponseFacts') AND name = N'UX_RubricLevelResponseFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RubricLevelResponseFacts_Id ON [tpdm].[RubricLevelResponseFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionCourseTranscriptFacts') AND name = N'UX_SectionCourseTranscriptFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SectionCourseTranscriptFacts_Id ON [tpdm].[SectionCourseTranscriptFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionStudentAcademicRecordFacts') AND name = N'UX_SectionStudentAcademicRecordFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SectionStudentAcademicRecordFacts_Id ON [tpdm].[SectionStudentAcademicRecordFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionStudentAssessmentFacts') AND name = N'UX_SectionStudentAssessmentFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SectionStudentAssessmentFacts_Id ON [tpdm].[SectionStudentAssessmentFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.SectionStudentFacts') AND name = N'UX_SectionStudentFacts_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SectionStudentFacts_Id ON [tpdm].[SectionStudentFacts]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffApplicantAssociation') AND name = N'UX_StaffApplicantAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffApplicantAssociation_Id ON [tpdm].[StaffApplicantAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluation') AND name = N'UX_StaffEvaluation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEvaluation_Id ON [tpdm].[StaffEvaluation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationComponent') AND name = N'UX_StaffEvaluationComponent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEvaluationComponent_Id ON [tpdm].[StaffEvaluationComponent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationComponentRating') AND name = N'UX_StaffEvaluationComponentRating_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEvaluationComponentRating_Id ON [tpdm].[StaffEvaluationComponentRating]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationElement') AND name = N'UX_StaffEvaluationElement_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEvaluationElement_Id ON [tpdm].[StaffEvaluationElement]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationElementRating') AND name = N'UX_StaffEvaluationElementRating_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEvaluationElementRating_Id ON [tpdm].[StaffEvaluationElementRating]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffEvaluationRating') AND name = N'UX_StaffEvaluationRating_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffEvaluationRating_Id ON [tpdm].[StaffEvaluationRating]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffFieldworkAbsenceEvent') AND name = N'UX_StaffFieldworkAbsenceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffFieldworkAbsenceEvent_Id ON [tpdm].[StaffFieldworkAbsenceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffFieldworkExperience') AND name = N'UX_StaffFieldworkExperience_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffFieldworkExperience_Id ON [tpdm].[StaffFieldworkExperience]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffFieldworkExperienceSectionAssociation') AND name = N'UX_StaffFieldworkExperienceSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffFieldworkExperienceSectionAssociation_Id ON [tpdm].[StaffFieldworkExperienceSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffProfessionalDevelopmentEventAttendance') AND name = N'UX_StaffProfessionalDevelopmentEventAttendance_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffProfessionalDevelopmentEventAttendance_Id ON [tpdm].[StaffProfessionalDevelopmentEventAttendance]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffProspectAssociation') AND name = N'UX_StaffProspectAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffProspectAssociation_Id ON [tpdm].[StaffProspectAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasure') AND name = N'UX_StaffStudentGrowthMeasure_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffStudentGrowthMeasure_Id ON [tpdm].[StaffStudentGrowthMeasure]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasureCourseAssociation') AND name = N'UX_StaffStudentGrowthMeasureCourseAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffStudentGrowthMeasureCourseAssociation_Id ON [tpdm].[StaffStudentGrowthMeasureCourseAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation') AND name = N'UX_StaffStudentGrowthMeasureEducationOrganizationAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffStudentGrowthMeasureEducationOrganizationAssociation_Id ON [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffStudentGrowthMeasureSectionAssociation') AND name = N'UX_StaffStudentGrowthMeasureSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffStudentGrowthMeasureSectionAssociation_Id ON [tpdm].[StaffStudentGrowthMeasureSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffTeacherPreparationProviderAssociation') AND name = N'UX_StaffTeacherPreparationProviderAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffTeacherPreparationProviderAssociation_Id ON [tpdm].[StaffTeacherPreparationProviderAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.StaffTeacherPreparationProviderProgramAssociation') AND name = N'UX_StaffTeacherPreparationProviderProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StaffTeacherPreparationProviderProgramAssociation_Id ON [tpdm].[StaffTeacherPreparationProviderProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TalentManagementGoal') AND name = N'UX_TalentManagementGoal_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TalentManagementGoal_Id ON [tpdm].[TalentManagementGoal]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidate') AND name = N'UX_TeacherCandidate_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidate_Id ON [tpdm].[TeacherCandidate]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateAcademicRecord') AND name = N'UX_TeacherCandidateAcademicRecord_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateAcademicRecord_Id ON [tpdm].[TeacherCandidateAcademicRecord]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateCourseTranscript') AND name = N'UX_TeacherCandidateCourseTranscript_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateCourseTranscript_Id ON [tpdm].[TeacherCandidateCourseTranscript]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateFieldworkAbsenceEvent') AND name = N'UX_TeacherCandidateFieldworkAbsenceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateFieldworkAbsenceEvent_Id ON [tpdm].[TeacherCandidateFieldworkAbsenceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateFieldworkExperience') AND name = N'UX_TeacherCandidateFieldworkExperience_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateFieldworkExperience_Id ON [tpdm].[TeacherCandidateFieldworkExperience]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateFieldworkExperienceSectionAssociation') AND name = N'UX_TeacherCandidateFieldworkExperienceSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateFieldworkExperienceSectionAssociation_Id ON [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance') AND name = N'UX_TeacherCandidateProfessionalDevelopmentEventAttendance_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateProfessionalDevelopmentEventAttendance_Id ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStaffAssociation') AND name = N'UX_TeacherCandidateStaffAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateStaffAssociation_Id ON [tpdm].[TeacherCandidateStaffAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasure') AND name = N'UX_TeacherCandidateStudentGrowthMeasure_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateStudentGrowthMeasure_Id ON [tpdm].[TeacherCandidateStudentGrowthMeasure]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation') AND name = N'UX_TeacherCandidateStudentGrowthMeasureCourseAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateStudentGrowthMeasureCourseAssociation_Id ON [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation') AND name = N'UX_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_Id ON [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation') AND name = N'UX_TeacherCandidateStudentGrowthMeasureSectionAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateStudentGrowthMeasureSectionAssociation_Id ON [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateTeacherPreparationProviderAssociation') AND name = N'UX_TeacherCandidateTeacherPreparationProviderAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateTeacherPreparationProviderAssociation_Id ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation') AND name = N'UX_TeacherCandidateTeacherPreparationProviderProgramAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherCandidateTeacherPreparationProviderProgramAssociation_Id ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'tpdm.TeacherPreparationProviderProgram') AND name = N'UX_TeacherPreparationProviderProgram_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_TeacherPreparationProviderProgram_Id ON [tpdm].[TeacherPreparationProviderProgram]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

