-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

do $$
declare appId INT;
declare educationOrganizationsResourceClaimId INT;
declare systenDescriptorsResourceClaimId INT;
declare peopleResourceClaimId INT;
declare relationshipBasedDataResourceClaimId INT;
declare authStrategyId INT;

begin

select ApplicationId into appId
from dbo.Applications where ApplicationName = 'Ed-Fi ODS API';

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

-- Descriptors --

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationFieldDescriptor', 'certificationFieldDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationLevelDescriptor', 'certificationLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationRouteDescriptor', 'certificationRouteDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationStandardDescriptor', 'certificationStandardDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationStandardDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('credentialEventTypeDescriptor', 'credentialEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('credentialStatusDescriptor', 'credentialStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('degreeDescriptor', 'degreeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('educatorRoleDescriptor', 'educatorRoleDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationElementRatingLevelDescriptor', 'evaluationElementRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationPeriodDescriptor', 'evaluationPeriodDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationRatingLevelDescriptor', 'evaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationTypeDescriptor', 'evaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('goalTypeDescriptor', 'goalTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('instructionalSettingDescriptor', 'instructionalSettingDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('objectiveRatingLevelDescriptor', 'objectiveRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluationRatingLevelDescriptor', 'performanceEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluationTypeDescriptor', 'performanceEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasureDatatypeDescriptor', 'quantitativeMeasureDatatypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasureTypeDescriptor', 'quantitativeMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptor', systenDescriptorsResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricRatingLevelDescriptor', 'rubricRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor', systenDescriptorsResourceClaimId, appId);

-- Relationship --

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certification', 'certification', 'http://ed-fi.org/ods/identity/claims/tpdm/certification', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationExam', 'certificationExam', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExam', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('certificationExamResult', 'certificationExamResult', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResult', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('credentialEvent', 'credentialEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvent', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluation', 'evaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluation', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationElement', 'evaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationElementRating', 'evaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationObjective', 'evaluationObjective', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationObjectiveRating', 'evaluationObjectiveRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('evaluationRating', 'evaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('goal', 'goal', 'http://ed-fi.org/ods/identity/claims/tpdm/goal', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluation', 'performanceEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('performanceEvaluationRating', 'performanceEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasure', 'quantitativeMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasure', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('quantitativeMeasureScore', 'quantitativeMeasureScore', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScore', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('rubricDimension', 'rubricDimension', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveyResponseTeacherCandidateTargetAssociation', 'surveyResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociation', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveySectionAggregateResponse', 'surveySectionAggregateResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponse', relationshipBasedDataResourceClaimId, appId);

insert INTO dbo.ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
values ('surveySectionResponseTeacherCandidateTargetAssociation', 'surveySectionResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociation', relationshipBasedDataResourceClaimId, appId);

select AuthorizationStrategyId into authStrategyId from dbo.AuthorizationStrategies where AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

--- These Resources need explicit metadata ---
insert INTO dbo.ResourceClaimAuthorizationMetadatas
    (Action_ActionId
    ,AuthorizationStrategy_authorizationStrategyId
    ,ResourceClaim_ResourceClaimId
    ,ValidationRuleSetName)
select ac.ActionId, authStrategyId, ResourceClaimId, null
from dbo.ResourceClaims
inner join lateral
    (select ActionId
    from dbo.Actions
    where ActionName in ('Create', 'Read', 'Update', 'Delete')) as ac on true
where ResourceName IN (
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


end $$