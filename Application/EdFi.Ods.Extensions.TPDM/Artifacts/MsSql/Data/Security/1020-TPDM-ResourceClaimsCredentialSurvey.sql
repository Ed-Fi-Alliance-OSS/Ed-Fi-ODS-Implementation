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

-- Descriptors --

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationFieldDescriptor', 'certificationFieldDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('credentialEventTypeDescriptor', 'credentialEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('degreeDescriptor', 'degreeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educatorRoleDescriptor', 'educatorRoleDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationElementRatingLevelDescriptor', 'evaluationElementRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationTypeDescriptor', 'evaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('goalTypeDescriptor', 'goalTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('instructionalSettingDescriptor', 'instructionalSettingDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('objectiveRatingLevelDescriptor', 'objectiveRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluationRatingLevelDescriptor', 'performanceEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluationTypeDescriptor', 'performanceEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureDatatypeDescriptor', 'quantitativeMeasureDatatypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureTypeDescriptor', 'quantitativeMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricRatingLevelDescriptor', 'rubricRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

-- Relationship --

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certification', 'certification', 'http://ed-fi.org/ods/identity/claims/tpdm/certifications', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationExam', 'certificationExam', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExams', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationExamResult', 'certificationExamResult', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResults', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('credentialEvent', 'credentialEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvents', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluation', 'evaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluations', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationElement', 'evaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElements', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationElementRating', 'evaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatings', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationObjective', 'evaluationObjective', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectives', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationObjectiveRating', 'evaluationObjectiveRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRatings', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationRating', 'evaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatings', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('goal', 'goal', 'http://ed-fi.org/ods/identity/claims/tpdm/goals', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluation', 'performanceEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluations', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluationRating', 'performanceEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatings', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasure', 'quantitativeMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasures', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureScore', 'quantitativeMeasureScore', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScores', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricDimension', 'rubricDimension', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimensions', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveyResponseTeacherCandidateTargetAssociation', 'surveyResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociations', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveySectionAggregateResponse', 'surveySectionAggregateResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponses', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveySectionResponseTeacherCandidateTargetAssociation', 'surveySectionResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociations', @relationshipBasedDataResourceClaimId, @ApplicationId);

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
WHERE ResourceName IN (
    'certification'
    , 'certificationExam'
    , 'certificationExamResult'
    , 'credentialEvent'
    , 'evaluation'
    , 'evaluationElement'
    , 'evaluationElementRating'
    , 'goal'
    , 'performanceEvaluation'
    , 'quantitativeMeasure'
    , 'quantitativeMeasureScore'
    , 'rubricDimension'
    , 'surveyResponseTeacherCandidateTargetAssociation'
    , 'surveySectionAggregateResponse'
    , 'surveySectionResponseTeacherCandidateTargetAssociation');
