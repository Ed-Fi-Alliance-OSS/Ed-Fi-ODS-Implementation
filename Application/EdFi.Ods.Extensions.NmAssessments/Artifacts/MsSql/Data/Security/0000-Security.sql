-- Setting the application to Ed-Fi ODS API
DECLARE @ApplicationId INT
SELECT @ApplicationId = ApplicationId FROM [dbo].[Applications] WHERE ApplicationName = 'Ed-Fi ODS API';

-- Getting the Claim Ids that we will use.  
DECLARE @RelationshipBasedDataClaimId INT
SELECT @RelationshipBasedDataClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'relationshipBasedData';

DECLARE @PrimaryRelationshipsClaimId INT
SELECT @PrimaryRelationshipsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'primaryRelationships';

DECLARE @DescriptorsClaimId INT
SELECT @DescriptorsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'systemDescriptors';

-- *** Extension Claims - Use this section to add NMPED specific additions to the model ***
-- *** These should include any MetaEd defined extensions that are not "Additions" to and Ed-Fi core model element ***

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('nmStudentAssessment', 'nmStudentAssessment'
        ,'http://ed-fi.org/ods/identity/claims/nm-assessments/nmStudentAssessment'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

-- *** Descriptors Security -- Adding these under the inherited permissions from System Descriptors ***
-- *** These inserts should match the MetaEd entries under NMPEDMEtaED.Decriptor ***


INSERT INTO ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId) VALUES
('standardAchievedCodeDescriptor','standardAchievedCodeDescriptor','http://ed-fi.org/ods/identity/claims/nm-assessments/standardAchievedCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('itemDescriptionCodeDescriptor','itemDescriptionCodeDescriptor','http://ed-fi.org/ods/identity/claims/nm-assessments/itemDescriptionCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('scoringModelCodeDescriptor','scoringModelCodeDescriptor','http://ed-fi.org/ods/identity/claims/nm-assessments/scoringModelCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('testDescriptionDescriptor','testDescriptionDescriptor','http://ed-fi.org/ods/identity/claims/nm-assessments/testDescriptionDescriptor',@DescriptorsClaimId,@ApplicationId);