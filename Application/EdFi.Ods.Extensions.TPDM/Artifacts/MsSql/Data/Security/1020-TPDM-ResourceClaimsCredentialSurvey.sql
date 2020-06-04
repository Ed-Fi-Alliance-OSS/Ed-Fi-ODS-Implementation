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
VALUES ('certificationFieldDescriptor', 'certificationFieldDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationLevelDescriptor', 'certificationLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationRouteDescriptor', 'certificationRouteDescriptors, 'http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationStandardDescriptor', 'certificationStandardDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationStandardDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('credentialEventTypeDescriptor', 'credentialEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('credentialStatusDescriptor', 'credentialStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('degreeDescriptor', 'degreeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('educatorRoleDescriptor', 'educatorRoleDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationElementRatingLevelDescriptor', 'evaluationElementRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationPeriodDescriptor', 'evaluationPeriodDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationRatingLevelDescriptor', 'evaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationTypeDescriptor', 'evaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('goalTypeDescriptor', 'goalTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('instructionalSettingDescriptor', 'instructionalSettingDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('objectiveRatingLevelDescriptor', 'objectiveRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluationRatingLevelDescriptor', 'performanceEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluationTypeDescriptor', 'performanceEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureDatatypeDescriptor', 'quantitativeMeasureDatatypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureDatatypeDescriptor', 'quantitativeMeasureDatatypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptors', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureTypeDescriptor', 'quantitativeMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricRatingLevelDescriptor', 'rubricRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor', @systenDescriptorsResourceClaimId, @ApplicationId);

-- Relationship --

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certification', 'certification', 'http://ed-fi.org/ods/identity/claims/tpdm/certification', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationExam', 'certificationExam', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExam', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('certificationExamResult', 'certificationExamResult', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResult', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('credentialEvent', 'credentialEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvent', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluation', 'evaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationElement', 'evaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationElementRating', 'evaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationObjective', 'evaluationObjective', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationObjectiveRating', 'evaluationObjectiveRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('evaluationRating', 'evaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('goal', 'goal', 'http://ed-fi.org/ods/identity/claims/tpdm/goal', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluation', 'performanceEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('performanceEvaluationRating', 'performanceEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasure', 'quantitativeMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasure', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('quantitativeMeasureScore', 'quantitativeMeasureScore', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScore', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('rubricDimension', 'rubricDimension', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveyResponseTeacherCandidateTargetAssociation', 'surveyResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveySectionAggregateResponse', 'surveySectionAggregateResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponse', @relationshipBasedDataResourceClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
VALUES ('surveySectionResponseTeacherCandidateTargetAssociation', 'surveySectionResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociation', @relationshipBasedDataResourceClaimId, @ApplicationId);

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
    , 'evaluationObjective'
    , 'evaluationObjectiveRating'
    , 'evaluationRating'
    , 'goal'
    , 'performanceEvaluation'
    , 'performanceEvaluationRating'
    , 'quantitativeMeasure'
    , 'quantitativeMeasureScore'
    , 'rubricDimension'
    , 'surveyResponseTeacherCandidateTargetAssociation'
    , 'surveySectionAggregateResponse'
    , 'surveySectionResponseTeacherCandidateTargetAssociation');
