-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @ApplicationId INT;
DECLARE @educationOrganizationsResourceClaimId INT;
DECLARE @systenDescriptorsResourceClaimId INT;
DECLARE @peopleResourceClaimId INT;
DECLARE @relationshipBasedDataResourceClaimId INT;
DECLARE @AuthorizationStrategyId INT;

SELECT @ApplicationId = ApplicationId
FROM [dbo].[Applications] WHERE ApplicationName = 'Ed-Fi ODS API';

SELECT @educationOrganizationsResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE DisplayName = 'educationOrganizations';

SELECT @systenDescriptorsResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE DisplayName = 'systemDescriptors';

SELECT @peopleResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE DisplayName = 'people';

SELECT @relationshipBasedDataResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE DisplayName = 'relationshipBasedData';

-- Educational Organizations ---

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('university', 'university', 'http://ed-fi.org/ods/identity/claims/tpdm/university', @educationOrganizationsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherPreparationProvider', 'teacherPreparationProvider', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProvider', @educationOrganizationsResourceClaimId, @ApplicationId);

--- People ---

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidate', 'teacherCandidate', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidate', @peopleResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicant', 'applicant', 'http://ed-fi.org/ods/identity/claims/tpdm/applicant', @peopleResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('prospect', 'prospect', 'http://ed-fi.org/ods/identity/claims/tpdm/prospect', @peopleResourceClaimId, @ApplicationId);

--- Relationships ---

INSERT INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherPreparationProviderAssociations', 'teacherPreparationProviderAssociations', 'http://ed-fi.org/ods/identity/claims/tpdm/TeacherPreparationProviderAssociations', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateTeacherPreparationProviderAssociations', 'teacherCandidateTeacherPreparationProviderAssociations', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociations', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceMeasureCourseAssociation', 'performanceMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureCourseAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateTeacherPreparationProviderProgramAssociation', 'teacherCandidateTeacherPreparationProviderProgramAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderProgramAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateTeacherPreparationProviderAssociation', 'teacherCandidateTeacherPreparationProviderAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateStudentGrowthMeasures', 'teacherCandidateStudentGrowthMeasures', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasures', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateStudentGrowthMeasureSectionAssociation', 'teacherCandidateStudentGrowthMeasureSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureSectionAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', 'teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateStudentGrowthMeasureCourseAssociation', 'teacherCandidateStudentGrowthMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureCourseAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateStudentGrowthMeasure', 'teacherCandidateStudentGrowthMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasure', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateProfessionalDevelopmentEventAttendance', 'teacherCandidateProfessionalDevelopmentEventAttendance', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateProfessionalDevelopmentEventAttendance', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateCourseTranscript', 'teacherCandidateCourseTranscript', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCourseTranscript', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateAcademicRecord', 'teacherCandidateAcademicRecord', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateAcademicRecord', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('talentManagementGoal', 'talentManagementGoal', 'http://ed-fi.org/ods/identity/claims/tpdm/talentManagementGoal', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffTeacherPreparationProviderProgramAssociation', 'staffTeacherPreparationProviderProgramAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderProgramAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffTeacherPreparationProviderAssociation', 'staffTeacherPreparationProviderAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffStudentGrowthMeasureSectionAssociation', 'staffStudentGrowthMeasureSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureSectionAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffStudentGrowthMeasureEducationOrganizationAssociation', 'staffStudentGrowthMeasureEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureEducationOrganizationAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffStudentGrowthMeasureCourseAssociation', 'staffStudentGrowthMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureCourseAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffStudentGrowthMeasure', 'staffStudentGrowthMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasure', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffProspectAssociation', 'staffProspectAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffProspectAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffProfessionalDevelopmentEventAttendance', 'staffProfessionalDevelopmentEventAttendance', 'http://ed-fi.org/ods/identity/claims/tpdm/staffProfessionalDevelopmentEventAttendance', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffFieldworkExperienceSectionAssociation', 'staffFieldworkExperienceSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffFieldworkExperienceSectionAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffFieldworkExperience', 'staffFieldworkExperience', 'http://ed-fi.org/ods/identity/claims/tpdm/staffFieldworkExperience', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffFieldworkAbsenceEvent', 'staffFieldworkAbsenceEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/staffFieldworkAbsenceEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationRating', 'staffEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationElementRating', 'staffEvaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationElementRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationElement', 'staffEvaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationElement', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationComponentRating', 'staffEvaluationComponentRating', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationComponentRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationComponent', 'staffEvaluationComponent', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationComponent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluation', 'staffEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffApplicantAssociation', 'staffApplicantAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffApplicantAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('recruitmentEvent', 'recruitmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('prospectProfessionalDevelopmentEventAttendance', 'prospectProfessionalDevelopmentEventAttendance', 'http://ed-fi.org/ods/identity/claims/tpdm/prospectProfessionalDevelopmentEventAttendance', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('openStaffPositionEvent', 'openStaffPositionEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('employmentSeparationEvent', 'employmentSeparationEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('employmentEvent', 'employmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educationOrganizationStudentAssessmentFacts', 'educationOrganizationStudentAssessmentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationStudentAssessmentFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educationOrganizationStudentAcademicRecordFacts', 'educationOrganizationStudentAcademicRecordFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationStudentAcademicRecordFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('completerAsStaffAssociation', 'completerAsStaffAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/completerAsStaffAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicationEvent', 'applicationEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('application', 'application', 'http://ed-fi.org/ods/identity/claims/tpdm/application', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicantProspectAssociation', 'applicantProspectAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/applicantProspectAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentSectionAssociation', 'anonymizedStudentSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentSectionAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentEducationOrganizationAssociation', 'anonymizedStudentEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentEducationOrganizationAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentCourseTranscript', 'anonymizedStudentCourseTranscript', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseTranscript', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentCourseAssociation', 'anonymizedStudentCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentAssessmentSectionAssociation', 'anonymizedStudentAssessmentSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentSectionAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentAssessmentCourseAssociation', 'anonymizedStudentAssessmentCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentCourseAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentAssessment', 'anonymizedStudentAssessment', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessment', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudentAcademicRecord', 'anonymizedStudentAcademicRecord', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAcademicRecord', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('anonymizedStudent', 'anonymizedStudent', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherPreparationProviderProgram', 'teacherPreparationProviderProgram', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateStaffAssociation', 'teacherCandidateStaffAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStaffAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateFieldworkExperienceSectionAssociation', 'teacherCandidateFieldworkExperienceSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateFieldworkExperienceSectionAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateFieldworkExperience', 'teacherCandidateFieldworkExperience', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateFieldworkExperience', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateFieldworkAbsenceEvent', 'teacherCandidateFieldworkAbsenceEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateFieldworkAbsenceEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricLevelResponse', 'rubricLevelResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricLevelResponse', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricLevel', 'rubricLevel', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricLevel', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubric', 'rubric', 'http://ed-fi.org/ods/identity/claims/tpdm/rubric', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('professionalDevelopmentEvent', 'professionalDevelopmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceMeasure', 'performanceMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasure', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('sectionStudentFacts', 'sectionStudentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionStudentFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('sectionStudentAssessmentFacts', 'sectionStudentAssessmentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionStudentAssessmentFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('sectionStudentAcademicRecordFacts', 'sectionStudentAcademicRecordFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionStudentAcademicRecordFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('sectionCourseTranscriptFacts', 'sectionCourseTranscriptFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionCourseTranscriptFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricLevelResponseFacts', 'rubricLevelResponseFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricLevelResponseFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceMeasureFacts', 'performanceMeasureFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educationOrganizationStudentFacts', 'educationOrganizationStudentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationStudentFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educationOrganizationFacts', 'educationOrganizationFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educationOrganizationCourseTranscriptFacts', 'educationOrganizationCourseTranscriptFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationCourseTranscriptFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('courseStudentFacts', 'courseStudentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseStudentFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('courseStudentAssessmentFacts', 'courseStudentAssessmentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseStudentAssessmentFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('courseStudentAcademicRecordFacts', 'courseStudentAcademicRecordFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseStudentAcademicRecordFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('courseCourseTranscriptFacts', 'courseCourseTranscriptFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseCourseTranscriptFacts', @relationshipBasedDataResourceClaimId, @ApplicationId);

--- Descriptors ---

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('programGatewayDescriptor', 'programGatewayDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/programGatewayDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('professionalDevelopmentOfferedByDescriptor', 'professionalDevelopmentOfferedByDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentOfferedByDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('previousCareerDescriptor', 'previousCareerDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/previousCareerDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceMeasureTypeDescriptor', 'performanceMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceMeasureInstanceDescriptor', 'performanceMeasureInstanceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureInstanceDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('openStaffPositionReasonDescriptor', 'openStaffPositionReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionReasonDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('openStaffPositionEventTypeDescriptor', 'openStaffPositionEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('openStaffPositionEventStatusDescriptor', 'openStaffPositionEventStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('levelTypeDescriptor', 'levelTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/levelTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('levelOfDegreeAwardedDescriptor', 'levelOfDegreeAwardedDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/levelOfDegreeAwardedDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('internalExternalHireDescriptor', 'internalExternalHireDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/internalExternalHireDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('hiringSourceDescriptor', 'hiringSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/hiringSourceDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('hireStatusDescriptor', 'hireStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/hireStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('genderDescriptor', 'genderDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/genderDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('fundingSourceDescriptor', 'fundingSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/fundingSourceDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('fieldworkTypeDescriptor', 'fieldworkTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('federalLocaleCodeDescriptor', 'federalLocaleCodeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/federalLocaleCodeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('englishLanguageExamDescriptor', 'englishLanguageExamDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/englishLanguageExamDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('employmentSeparationTypeDescriptor', 'employmentSeparationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('employmentSeparationReasonDescriptor', 'employmentSeparationReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationReasonDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('employmentEventTypeDescriptor', 'employmentEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEventTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationExamTypeDescriptor', 'certificationExamTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('boardCertificationTypeDescriptor', 'boardCertificationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/boardCertificationTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('backgroundCheckTypeDescriptor', 'backgroundCheckTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicationStatusDescriptor', 'applicationStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicationSourceDescriptor', 'applicationSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationSourceDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicationEventTypeDescriptor', 'applicationEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('applicationEventResultDescriptor', 'applicationEventResultDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventResultDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('aidTypeDescriptor', 'aidTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/aidTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('backgroundCheckStatusDescriptor', 'backgroundCheckStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('withdrawReasonDescriptor', 'withdrawReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/withdrawReasonDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('valueTypeDescriptor', 'valueTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/valueTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('tppProgramPathwayDescriptor', 'tppProgramPathwayDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/tppProgramPathwayDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('tppDegreeTypeDescriptor', 'tppDegreeTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/tppDegreeTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('themeDescriptor', 'themeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/themeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherPreparationProgramTypeDescriptor', 'teacherPreparationProgramTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProgramTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('teacherCandidateCharacteristicDescriptor', 'teacherCandidateCharacteristicDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCharacteristicDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveyLevelDescriptor', 'surveyLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('studentGrowthTypeDescriptor', 'studentGrowthTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/studentGrowthTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationTypeDescriptor', 'staffEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationRatingLevelDescriptor', 'staffEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationRatingLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('staffEvaluationPeriodDescriptor', 'staffEvaluationPeriodDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationPeriodDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('schoolStatusDescriptor', 'schoolStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/schoolStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('salaryTypeDescriptor', 'salaryTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/salaryTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricTypeDescriptor', 'rubricTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('prospectTypeDescriptor', 'prospectTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/prospectTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('recruitmentEventTypeDescriptor', 'recruitmentEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEventTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('coteachingStyleObservedDescriptor', 'coteachingStyleObservedDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/coteachingStyleObservedDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationExamStatusDescriptor', 'certificationExamStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);
 
SELECT @AuthorizationStrategyId  = (SELECT AuthorizationStrategyId FROM [dbo].[AuthorizationStrategies] WHERE AuthorizationStrategyName = 'NoFurtherAuthorizationRequired');

--- These Resources need explicit metadata ---
INSERT INTO [dbo].[ResourceClaimAuthorizationMetadatas]
    ([Action_ActionId]
    ,[AuthorizationStrategy_AuthorizationStrategyId]
    ,[ResourceClaim_ResourceClaimId]
    ,[ValidationRuleSetName])
SELECT ac.ActionId, @AuthorizationStrategyId, ResourceClaimId, null
FROM [dbo].[ResourceClaims]
CROSS APPLY 
    (SELECT ActionId
    FROM [dbo].[Actions]
    WHERE ActionName IN ('Create', 'Read', 'Update', 'Delete')) AS ac
WHERE ResourceName IN ('anonymizedStudent'
, 'anonymizedStudentAssessments'
, 'performanceMeasure'
, 'performanceMeasureCourseAssociation'
, 'professionalDevelopmentEvent'
, 'recruitmentEvent'
, 'staffTeacherPreparationProviderAssociation'
, 'anonymizedStudentAssessment'
, 'talentManagementGoal'
, 'teacherCandidate'
, 'teacherCandidateFieldworkAbsenceEvent'
, 'teacherCandidateFieldworkExperience'
, 'teacherCandidateProfessionalDevelopmentEventAttendance'
, 'teacherCandidateStudentGrowthMeasure'
, 'teacherCandidateTeacherPreparationProviderAssociation');