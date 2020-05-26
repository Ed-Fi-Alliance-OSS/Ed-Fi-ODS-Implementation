-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudent_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAcademicRecord_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentAcademicRecord] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentAcademicRecord]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentAcademicRecord] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAssessment_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentAssessment] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentAssessment]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentAssessment] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAssessmentCourseAssociation_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentAssessmentCourseAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentAssessmentCourseAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentAssessmentCourseAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentAssessmentSectionAssociation_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentAssessmentSectionAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentAssessmentSectionAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentAssessmentSectionAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentCourseAssociation_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentCourseAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentCourseAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentCourseAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentCourseTranscript_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentCourseTranscript] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentCourseTranscript]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentCourseTranscript] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentEducationOrganizationAssociation_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentEducationOrganizationAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentEducationOrganizationAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentEducationOrganizationAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_AnonymizedStudentSectionAssociation_TR_UpdateChangeVersion] ON [tpdm].[AnonymizedStudentSectionAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[AnonymizedStudentSectionAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[AnonymizedStudentSectionAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_Applicant_TR_UpdateChangeVersion] ON [tpdm].[Applicant] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[Applicant]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[Applicant] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicantProspectAssociation_TR_UpdateChangeVersion] ON [tpdm].[ApplicantProspectAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[ApplicantProspectAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[ApplicantProspectAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_Application_TR_UpdateChangeVersion] ON [tpdm].[Application] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[Application]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[Application] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicationEvent_TR_UpdateChangeVersion] ON [tpdm].[ApplicationEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[ApplicationEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[ApplicationEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_CompleterAsStaffAssociation_TR_UpdateChangeVersion] ON [tpdm].[CompleterAsStaffAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[CompleterAsStaffAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[CompleterAsStaffAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_CourseCourseTranscriptFacts_TR_UpdateChangeVersion] ON [tpdm].[CourseCourseTranscriptFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[CourseCourseTranscriptFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[CourseCourseTranscriptFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_CourseStudentAcademicRecordFacts_TR_UpdateChangeVersion] ON [tpdm].[CourseStudentAcademicRecordFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[CourseStudentAcademicRecordFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[CourseStudentAcademicRecordFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_CourseStudentAssessmentFacts_TR_UpdateChangeVersion] ON [tpdm].[CourseStudentAssessmentFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[CourseStudentAssessmentFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[CourseStudentAssessmentFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_CourseStudentFacts_TR_UpdateChangeVersion] ON [tpdm].[CourseStudentFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[CourseStudentFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[CourseStudentFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationCourseTranscriptFacts_TR_UpdateChangeVersion] ON [tpdm].[EducationOrganizationCourseTranscriptFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EducationOrganizationCourseTranscriptFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EducationOrganizationCourseTranscriptFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationFacts_TR_UpdateChangeVersion] ON [tpdm].[EducationOrganizationFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EducationOrganizationFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EducationOrganizationFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationStudentAcademicRecordFacts_TR_UpdateChangeVersion] ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EducationOrganizationStudentAcademicRecordFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EducationOrganizationStudentAcademicRecordFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationStudentAssessmentFacts_TR_UpdateChangeVersion] ON [tpdm].[EducationOrganizationStudentAssessmentFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EducationOrganizationStudentAssessmentFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EducationOrganizationStudentAssessmentFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EducationOrganizationStudentFacts_TR_UpdateChangeVersion] ON [tpdm].[EducationOrganizationStudentFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EducationOrganizationStudentFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EducationOrganizationStudentFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EmploymentEvent_TR_UpdateChangeVersion] ON [tpdm].[EmploymentEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EmploymentEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EmploymentEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_EmploymentSeparationEvent_TR_UpdateChangeVersion] ON [tpdm].[EmploymentSeparationEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[EmploymentSeparationEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[EmploymentSeparationEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEvent_TR_UpdateChangeVersion] ON [tpdm].[OpenStaffPositionEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[OpenStaffPositionEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[OpenStaffPositionEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasure_TR_UpdateChangeVersion] ON [tpdm].[PerformanceMeasure] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[PerformanceMeasure]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[PerformanceMeasure] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasureCourseAssociation_TR_UpdateChangeVersion] ON [tpdm].[PerformanceMeasureCourseAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[PerformanceMeasureCourseAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[PerformanceMeasureCourseAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceMeasureFacts_TR_UpdateChangeVersion] ON [tpdm].[PerformanceMeasureFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[PerformanceMeasureFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[PerformanceMeasureFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_ProfessionalDevelopmentEvent_TR_UpdateChangeVersion] ON [tpdm].[ProfessionalDevelopmentEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[ProfessionalDevelopmentEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[ProfessionalDevelopmentEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_Prospect_TR_UpdateChangeVersion] ON [tpdm].[Prospect] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[Prospect]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[Prospect] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_ProspectProfessionalDevelopmentEventAttendance_TR_UpdateChangeVersion] ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[ProspectProfessionalDevelopmentEventAttendance]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[ProspectProfessionalDevelopmentEventAttendance] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_RecruitmentEvent_TR_UpdateChangeVersion] ON [tpdm].[RecruitmentEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[RecruitmentEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[RecruitmentEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_Rubric_TR_UpdateChangeVersion] ON [tpdm].[Rubric] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[Rubric]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[Rubric] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_RubricLevel_TR_UpdateChangeVersion] ON [tpdm].[RubricLevel] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[RubricLevel]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[RubricLevel] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_RubricLevelResponse_TR_UpdateChangeVersion] ON [tpdm].[RubricLevelResponse] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[RubricLevelResponse]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[RubricLevelResponse] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_RubricLevelResponseFacts_TR_UpdateChangeVersion] ON [tpdm].[RubricLevelResponseFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[RubricLevelResponseFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[RubricLevelResponseFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_SectionCourseTranscriptFacts_TR_UpdateChangeVersion] ON [tpdm].[SectionCourseTranscriptFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[SectionCourseTranscriptFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[SectionCourseTranscriptFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_SectionStudentAcademicRecordFacts_TR_UpdateChangeVersion] ON [tpdm].[SectionStudentAcademicRecordFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[SectionStudentAcademicRecordFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[SectionStudentAcademicRecordFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_SectionStudentAssessmentFacts_TR_UpdateChangeVersion] ON [tpdm].[SectionStudentAssessmentFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[SectionStudentAssessmentFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[SectionStudentAssessmentFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_SectionStudentFacts_TR_UpdateChangeVersion] ON [tpdm].[SectionStudentFacts] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[SectionStudentFacts]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[SectionStudentFacts] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffApplicantAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffApplicantAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffApplicantAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffApplicantAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEvaluation_TR_UpdateChangeVersion] ON [tpdm].[StaffEvaluation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffEvaluation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffEvaluation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationComponent_TR_UpdateChangeVersion] ON [tpdm].[StaffEvaluationComponent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffEvaluationComponent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffEvaluationComponent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationComponentRating_TR_UpdateChangeVersion] ON [tpdm].[StaffEvaluationComponentRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffEvaluationComponentRating]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffEvaluationComponentRating] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationElement_TR_UpdateChangeVersion] ON [tpdm].[StaffEvaluationElement] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffEvaluationElement]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffEvaluationElement] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationElementRating_TR_UpdateChangeVersion] ON [tpdm].[StaffEvaluationElementRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffEvaluationElementRating]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffEvaluationElementRating] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEvaluationRating_TR_UpdateChangeVersion] ON [tpdm].[StaffEvaluationRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffEvaluationRating]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffEvaluationRating] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffFieldworkAbsenceEvent_TR_UpdateChangeVersion] ON [tpdm].[StaffFieldworkAbsenceEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffFieldworkAbsenceEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffFieldworkAbsenceEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffFieldworkExperience_TR_UpdateChangeVersion] ON [tpdm].[StaffFieldworkExperience] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffFieldworkExperience]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffFieldworkExperience] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffFieldworkExperienceSectionAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffFieldworkExperienceSectionAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffFieldworkExperienceSectionAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffFieldworkExperienceSectionAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffProfessionalDevelopmentEventAttendance_TR_UpdateChangeVersion] ON [tpdm].[StaffProfessionalDevelopmentEventAttendance] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffProfessionalDevelopmentEventAttendance]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffProfessionalDevelopmentEventAttendance] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffProspectAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffProspectAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffProspectAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffProspectAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasure_TR_UpdateChangeVersion] ON [tpdm].[StaffStudentGrowthMeasure] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffStudentGrowthMeasure]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffStudentGrowthMeasure] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasureCourseAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffStudentGrowthMeasureCourseAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffStudentGrowthMeasureCourseAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffStudentGrowthMeasureCourseAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasureEducationOrganizationAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffStudentGrowthMeasureSectionAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffStudentGrowthMeasureSectionAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffStudentGrowthMeasureSectionAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffStudentGrowthMeasureSectionAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffTeacherPreparationProviderAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffTeacherPreparationProviderAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffTeacherPreparationProviderAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffTeacherPreparationProviderAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_StaffTeacherPreparationProviderProgramAssociation_TR_UpdateChangeVersion] ON [tpdm].[StaffTeacherPreparationProviderProgramAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[StaffTeacherPreparationProviderProgramAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[StaffTeacherPreparationProviderProgramAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TalentManagementGoal_TR_UpdateChangeVersion] ON [tpdm].[TalentManagementGoal] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TalentManagementGoal]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TalentManagementGoal] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidate_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidate] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidate]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidate] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateAcademicRecord_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateAcademicRecord] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateAcademicRecord]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateAcademicRecord] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateCourseTranscript_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateCourseTranscript] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateCourseTranscript]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateCourseTranscript] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateFieldworkAbsenceEvent_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateFieldworkAbsenceEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateFieldworkAbsenceEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateFieldworkAbsenceEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateFieldworkExperience_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateFieldworkExperience] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateFieldworkExperience]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateFieldworkExperience] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateFieldworkExperienceSectionAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateProfessionalDevelopmentEventAttendance_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStaffAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateStaffAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateStaffAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateStaffAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasure_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasure] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateStudentGrowthMeasure]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateStudentGrowthMeasure] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasureCourseAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateStudentGrowthMeasureSectionAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateTeacherPreparationProviderAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherCandidateTeacherPreparationProviderProgramAssociation_TR_UpdateChangeVersion] ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [tpdm].[tpdm_TeacherPreparationProviderProgram_TR_UpdateChangeVersion] ON [tpdm].[TeacherPreparationProviderProgram] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [tpdm].[TeacherPreparationProviderProgram]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [tpdm].[TeacherPreparationProviderProgram] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

