do $$
declare appId int;
declare educationOrganizationsResourceClaimId int;
declare systenDescriptorsResourceClaimId int;
declare peopleResourceClaimId int;
declare relationshipBasedDataResourceClaimId int;
declare authStrategyId int;
begin

select ApplicationId into appId
from dbo.Applications
where ApplicationName = 'Ed-Fi ODS API';

select ResourceClaimId into educationOrganizationsResourceClaimId
from dbo.ResourceClaims
where DisplayName = 'educationOrganizations';

select ResourceClaimId into systenDescriptorsResourceClaimId
from dbo.ResourceClaims
where DisplayName = 'systemDescriptors';

select ResourceClaimId into peopleResourceClaimId
from dbo.ResourceClaims
where DisplayName = 'people';

select ResourceClaimId into relationshipBasedDataResourceClaimId
from dbo.ResourceClaims
where DisplayName = 'relationshipBasedData';

-- Educational Organizations ---

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('university', 'university', 'http://ed-fi.org/ods/identity/claims/tpdm/university', educationOrganizationsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherPreparationProvider', 'teacherPreparationProvider', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProvider', educationOrganizationsResourceClaimId, appId);

--- People ---

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidate', 'teacherCandidate', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidate', peopleResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicant', 'applicant', 'http://ed-fi.org/ods/identity/claims/tpdm/applicant', peopleResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('prospect', 'prospect', 'http://ed-fi.org/ods/identity/claims/tpdm/prospect', peopleResourceClaimId, appId);

--- Relationships ---

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherPreparationProviderAssociations', 'teacherPreparationProviderAssociations', 'http://ed-fi.org/ods/identity/claims/tpdm/TeacherPreparationProviderAssociations', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateTeacherPreparationProviderAssociations', 'teacherCandidateTeacherPreparationProviderAssociations', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociations', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceMeasureCourseAssociation', 'performanceMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureCourseAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateTeacherPreparationProviderProgramAssociation', 'teacherCandidateTeacherPreparationProviderProgramAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderProgramAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateTeacherPreparationProviderAssociation', 'teacherCandidateTeacherPreparationProviderAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateStudentGrowthMeasures', 'teacherCandidateStudentGrowthMeasures', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasures', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateStudentGrowthMeasureSectionAssociation', 'teacherCandidateStudentGrowthMeasureSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureSectionAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', 'teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateStudentGrowthMeasureCourseAssociation', 'teacherCandidateStudentGrowthMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureCourseAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateStudentGrowthMeasure', 'teacherCandidateStudentGrowthMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasure', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateCourseTranscript', 'teacherCandidateCourseTranscript', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCourseTranscript', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateAcademicRecord', 'teacherCandidateAcademicRecord', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateAcademicRecord', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('talentManagementGoal', 'talentManagementGoal', 'http://ed-fi.org/ods/identity/claims/tpdm/talentManagementGoal', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffTeacherPreparationProviderProgramAssociation', 'staffTeacherPreparationProviderProgramAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderProgramAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffTeacherPreparationProviderAssociation', 'staffTeacherPreparationProviderAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffStudentGrowthMeasureSectionAssociation', 'staffStudentGrowthMeasureSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureSectionAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffStudentGrowthMeasureEducationOrganizationAssociation', 'staffStudentGrowthMeasureEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureEducationOrganizationAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffStudentGrowthMeasureCourseAssociation', 'staffStudentGrowthMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureCourseAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffStudentGrowthMeasure', 'staffStudentGrowthMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasure', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffProspectAssociation', 'staffProspectAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffProspectAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('fieldworkExperienceSectionAssociation', 'fieldworkExperienceSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperienceSectionAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationRating', 'staffEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationRating', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationElementRating', 'staffEvaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationElementRating', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationElement', 'staffEvaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationElement', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationComponentRating', 'staffEvaluationComponentRating', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationComponentRating', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationComponent', 'staffEvaluationComponent', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationComponent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluation', 'staffEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffApplicantAssociation', 'staffApplicantAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffApplicantAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('recruitmentEvent', 'recruitmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEvent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('openStaffPositionEvent', 'openStaffPositionEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEvent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('employmentSeparationEvent', 'employmentSeparationEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationEvent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('employmentEvent', 'employmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEvent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('educationOrganizationStudentAssessmentFacts', 'educationOrganizationStudentAssessmentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationStudentAssessmentFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('educationOrganizationStudentAcademicRecordFacts', 'educationOrganizationStudentAcademicRecordFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationStudentAcademicRecordFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('completerAsStaffAssociation', 'completerAsStaffAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/completerAsStaffAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicationEvent', 'applicationEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEvent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('application', 'application', 'http://ed-fi.org/ods/identity/claims/tpdm/application', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicantProspectAssociation', 'applicantProspectAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/applicantProspectAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentSectionAssociation', 'anonymizedStudentSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentSectionAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentEducationOrganizationAssociation', 'anonymizedStudentEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentEducationOrganizationAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentCourseTranscript', 'anonymizedStudentCourseTranscript', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseTranscript', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentCourseAssociation', 'anonymizedStudentCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentAssessmentSectionAssociation', 'anonymizedStudentAssessmentSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentSectionAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentAssessmentCourseAssociation', 'anonymizedStudentAssessmentCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentCourseAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentAssessment', 'anonymizedStudentAssessment', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessment', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudentAcademicRecord', 'anonymizedStudentAcademicRecord', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAcademicRecord', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('anonymizedStudent', 'anonymizedStudent', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherPreparationProviderProgram', 'teacherPreparationProviderProgram', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram', educationOrganizationsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateStaffAssociation', 'teacherCandidateStaffAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStaffAssociation', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricLevelResponse', 'rubricLevelResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricLevelResponse', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricLevel', 'rubricLevel', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricLevel', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubric', 'rubric', 'http://ed-fi.org/ods/identity/claims/tpdm/rubric', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('professionalDevelopmentEvent', 'professionalDevelopmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEvent', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceMeasure', 'performanceMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasure', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('sectionStudentFacts', 'sectionStudentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionStudentFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('sectionStudentAssessmentFacts', 'sectionStudentAssessmentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionStudentAssessmentFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('sectionStudentAcademicRecordFacts', 'sectionStudentAcademicRecordFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionStudentAcademicRecordFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('sectionCourseTranscriptFacts', 'sectionCourseTranscriptFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/sectionCourseTranscriptFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricLevelResponseFacts', 'rubricLevelResponseFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricLevelResponseFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceMeasureFacts', 'performanceMeasureFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('educationOrganizationCourseTranscriptFacts', 'educationOrganizationCourseTranscriptFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/educationOrganizationCourseTranscriptFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('courseStudentFacts', 'courseStudentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseStudentFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('courseStudentAssessmentFacts', 'courseStudentAssessmentFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseStudentAssessmentFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('courseStudentAcademicRecordFacts', 'courseStudentAcademicRecordFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseStudentAcademicRecordFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('courseCourseTranscriptFacts', 'courseCourseTranscriptFacts', 'http://ed-fi.org/ods/identity/claims/tpdm/courseCourseTranscriptFacts', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('professionalDevelopmentEventAttendance', 'professionalDevelopmentEventAttendance', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEventAttendance', relationshipBasedDataResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('fieldworkExperience', 'fieldworkExperience', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperience', educationOrganizationsResourceClaimId, appId);

--- Descriptors ---

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('programGatewayDescriptor', 'programGatewayDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/programGatewayDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('professionalDevelopmentOfferedByDescriptor', 'professionalDevelopmentOfferedByDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentOfferedByDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('previousCareerDescriptor', 'previousCareerDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/previousCareerDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceMeasureTypeDescriptor', 'performanceMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceMeasureInstanceDescriptor', 'performanceMeasureInstanceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceMeasureInstanceDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('openStaffPositionReasonDescriptor', 'openStaffPositionReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionReasonDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('openStaffPositionEventTypeDescriptor', 'openStaffPositionEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('openStaffPositionEventStatusDescriptor', 'openStaffPositionEventStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('levelTypeDescriptor', 'levelTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/levelTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('levelOfDegreeAwardedDescriptor', 'levelOfDegreeAwardedDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/levelOfDegreeAwardedDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('internalExternalHireDescriptor', 'internalExternalHireDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/internalExternalHireDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('hiringSourceDescriptor', 'hiringSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/hiringSourceDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('hireStatusDescriptor', 'hireStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/hireStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('genderDescriptor', 'genderDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/genderDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('fundingSourceDescriptor', 'fundingSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/fundingSourceDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('fieldworkTypeDescriptor', 'fieldworkTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('federalLocaleCodeDescriptor', 'federalLocaleCodeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/federalLocaleCodeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('englishLanguageExamDescriptor', 'englishLanguageExamDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/englishLanguageExamDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('employmentSeparationTypeDescriptor', 'employmentSeparationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('employmentSeparationReasonDescriptor', 'employmentSeparationReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationReasonDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('employmentEventTypeDescriptor', 'employmentEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEventTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationExamTypeDescriptor', 'certificationExamTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('boardCertificationTypeDescriptor', 'boardCertificationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/boardCertificationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('backgroundCheckTypeDescriptor', 'backgroundCheckTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicationStatusDescriptor', 'applicationStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicationSourceDescriptor', 'applicationSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationSourceDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicationEventTypeDescriptor', 'applicationEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('applicationEventResultDescriptor', 'applicationEventResultDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventResultDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('aidTypeDescriptor', 'aidTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/aidTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('backgroundCheckStatusDescriptor', 'backgroundCheckStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('withdrawReasonDescriptor', 'withdrawReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/withdrawReasonDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('valueTypeDescriptor', 'valueTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/valueTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('tppProgramPathwayDescriptor', 'tppProgramPathwayDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/tppProgramPathwayDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('tppDegreeTypeDescriptor', 'tppDegreeTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/tppDegreeTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('themeDescriptor', 'themeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/themeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherPreparationProgramTypeDescriptor', 'teacherPreparationProgramTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProgramTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('teacherCandidateCharacteristicDescriptor', 'teacherCandidateCharacteristicDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCharacteristicDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveyLevelDescriptor', 'surveyLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('studentGrowthTypeDescriptor', 'studentGrowthTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/studentGrowthTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationTypeDescriptor', 'staffEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationRatingLevelDescriptor', 'staffEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('staffEvaluationPeriodDescriptor', 'staffEvaluationPeriodDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/staffEvaluationPeriodDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('schoolStatusDescriptor', 'schoolStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/schoolStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('salaryTypeDescriptor', 'salaryTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/salaryTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricTypeDescriptor', 'rubricTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('prospectTypeDescriptor', 'prospectTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/prospectTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('recruitmentEventTypeDescriptor', 'recruitmentEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEventTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('coteachingStyleObservedDescriptor', 'coteachingStyleObservedDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/coteachingStyleObservedDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationExamStatusDescriptor', 'certificationExamStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationLevelDescriptor', 'certificationLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationRouteDescriptor', 'certificationRouteDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationStandardDescriptor', 'certificationStandardDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationStandardDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationFieldDescriptor', 'certificationFieldDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('credentialEventTypeDescriptor', 'credentialEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('credentialStatusDescriptor', 'credentialStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('degreeDescriptor', 'degreeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('educatorRoleDescriptor', 'educatorRoleDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationElementRatingLevelDescriptor', 'evaluationElementRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationPeriodDescriptor', 'evaluationPeriodDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationRatingLevelDescriptor', 'evaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationTypeDescriptor', 'evaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('goalTypeDescriptor', 'goalTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('instructionalSettingDescriptor', 'instructionalSettingDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('objectiveRatingLevelDescriptor', 'objectiveRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluationTypeDescriptor', 'performanceEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasureDatatypeDescriptor', 'quantitativeMeasureDatatypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasureTypeDescriptor', 'quantitativeMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricRatingLevelDescriptor', 'rubricRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certification', 'certification', 'http://ed-fi.org/ods/identity/claims/tpdm/certification', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationExam', 'certificationExam', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExam', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationExamResult', 'certificationExamResult', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResult', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('credentialEvent', 'credentialEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvent', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluation', 'evaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluation', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationElement', 'evaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationElementRating', 'evaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationObjective', 'evaluationObjective', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationObjectiveRating', 'evaluationObjectiveRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationRating', 'evaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('goal', 'goal', 'http://ed-fi.org/ods/identity/claims/tpdm/goal', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluation', 'performanceEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluationRating', 'performanceEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasure', 'quantitativeMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasure', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasureScore', 'quantitativeMeasureScore', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScore', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricDimension', 'rubricDimension', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveyResponseTeacherCandidateTargetAssociation', 'surveyResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociation', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveySectionAggregateResponse', 'surveySectionAggregateResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponse', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveySectionResponseTeacherCandidateTargetAssociation', 'surveySectionResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociation', systenDescriptorsResourceClaimId, appId);

insert into dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluationRatingLevelDescriptor', 'performanceEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

INSERT INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('accreditationStatusDescriptor', 'accreditationStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/accreditationStatusDescriptor', systenDescriptorsResourceClaimId, appId);

select AuthorizationStrategyId into authStrategyId from dbo.AuthorizationStrategies where AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

--- These Resources need explicit metadata ---
insert into dbo.ResourceClaimAuthorizationMetadatas
    (Action_ActionId
    ,AuthorizationStrategy_AuthorizationStrategyId
    ,ResourceClaim_ResourceClaimId
    ,ValidationRuleSetName)
select ac.ActionId, authStrategyId, ResourceClaimId, null
from dbo.ResourceClaims
inner join lateral
    (select ActionId
    from dbo.Actions
    where ActionName in ('Create', 'Read', 'Update', 'Delete')) as ac on true
where ResourceName in ('anonymizedStudent'
, 'anonymizedStudentAssessments'
, 'performanceMeasure'
, 'performanceMeasureCourseAssociation'
, 'professionalDevelopmentEvent'
, 'recruitmentEvent'
, 'staffTeacherPreparationProviderAssociation'
, 'anonymizedStudentAssessment'
, 'talentManagementGoal'
, 'teacherCandidate'
, 'teacherCandidateStudentGrowthMeasure'
, 'teacherCandidateTeacherPreparationProviderAssociation'
, 'anonymizedStudentSectionAssociation'
, 'applicant'
, 'applicantProspectAssociation'
, 'anonymizedStudentEducationOrganizationAssociation'
, 'anonymizedStudentCourseTranscript'
, 'anonymizedStudentCourseAssociation'
, 'anonymizedStudentAssessmentSectionAssociation'
, 'anonymizedStudentAssessmentCourseAssociation'
, 'anonymizedStudentAcademicRecord'
, 'prospect'
, 'performanceMeasureFact'
, 'educationOrganizationCourseTranscriptFacts'
, 'courseStudentFacts'
, 'courseStudentAssessmentFacts'
, 'courseStudentAcademicRecordFacts'
, 'courseCourseTranscriptFacts'
, 'staffEvaluationComponent'
, 'staffEvaluationComponentRating'
, 'staffApplicantAssociation'
, 'openStaffPositionEvent'
, 'employmentSeparationEvent'
, 'employmentEvent'
, 'educationOrganizationStudentAssessmentFacts'
, 'educationOrganizationStudentAcademicRecordFacts'
, 'completerAsStaffAssociation'
, 'applicationEvent'
, 'teacherPreparationProviderProgram'
, 'teacherCandidateTeacherPreparationProviderProgramAssociation'
, 'teacherCandidateStudentGrowthMeasureSectionAssociation'
, 'teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation'
, 'teacherCandidateStaffAssociation'
, 'teacherCandidateCourseTranscript'
, 'teacherCandidateAcademicRecord'
, 'staffTeacherPreparationProviderProgramAssociation'
, 'staffStudentGrowthMeasureSectionAssociation'
, 'staffStudentGrowthMeasureEducationOrganizationAssociation'
, 'staffStudentGrowthMeasureCourseAssociation'
, 'staffStudentGrowthMeasure'
, 'staffProspectAssociation'
, 'fieldworkExperienceSectionAssociation'
, 'staffEvaluationRating'
, 'staffEvaluationElementRating'
, 'staffEvaluationElement'
, 'staffEvaluation'
, 'sectionStudentFacts'
, 'sectionStudentAssessmentFacts'
, 'sectionStudentAcademicRecordFacts'
, 'sectionCourseTranscriptFacts'
, 'rubricLevelResponseFacts'
, 'rubricLevelResponse'
, 'rubricLevel'
, 'rubric'
, 'performanceMeasureFacts'
, 'teacherCandidateStudentGrowthMeasureCourseAssociation'
, 'application'
, 'professionalDevelopmentEventAttendance');

end $$
