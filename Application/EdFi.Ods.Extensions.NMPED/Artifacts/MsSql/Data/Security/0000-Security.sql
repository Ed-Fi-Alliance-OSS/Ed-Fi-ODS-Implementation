--SELECT @ApplicationId
DECLARE @ApplicationId INT
SELECT @ApplicationId = ApplicationId FROM [dbo].[Applications] WHERE ApplicationName = 'Ed-Fi ODS API';

-- Getting the Claim Ids that we will use.  
DECLARE @RelationshipBasedDataClaimId INT
SELECT @RelationshipBasedDataClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'relationshipBasedData';

DECLARE @PrimaryRelationshipsClaimId INT
SELECT @PrimaryRelationshipsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'primaryRelationships';

-- *** Transportation Claims ***
INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('localEducationAgencyTransportation', 'localEducationAgencyTransportation'
        ,'http://ed-fi.org/ods/identity/claims/nmped/localEducationAgencyTransportation'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('vehicleSnapshot', 'vehicleSnapshot'
        ,'http://ed-fi.org/ods/identity/claims/nmped/vehicleSnapshot'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('vehicleMileage', 'vehicleMileage'
        ,'http://ed-fi.org/ods/identity/claims/nmped/vehicleMileage'
        ,@RelationshipBasedDataClaimId, @ApplicationId);


-- *** Descriptors Security ***
	-- Base Parent nmpedDescriptors parent claim
--INSERT INTO [dbo].ResourceClaims ([DisplayName],[ResourceName]
--								 ,[ClaimName],[ParentResourceClaimId],[Application_ApplicationId])
--VALUES ('nmpedDescriptors','nmpedDescriptors',
--		'http://nmped.org/ods/identity/claims/nmped/descriptors',
--		null,@ApplicationId);

--DECLARE @NMPEDDescrioptorsClaimId INT
--SELECT @NMPEDDescrioptorsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'nmpedDescriptors';
---- Insert the ResourceClaimAuthorizationMetadatas: We want these resources to have full CRUD.
--INSERT INTO [dbo].[ResourceClaimAuthorizationMetadatas] ([Action_ActionId],[AuthorizationStrategy_AuthorizationStrategyId],ResourceClaim_ResourceClaimId)
--SELECT ActionId, 1, @NMPEDDescrioptorsClaimId
--FROM [dbo].[Actions];
---- Insert the ClaimSetResourceClaims full CRUD for the following claim sets 'SIS Vendor', 'Ed-Fi Sandbox', 'District Hosted SIS Vendor'
--INSERT INTO [dbo].[ClaimSetResourceClaims] (Action_ActionId,ClaimSet_ClaimSetId,ResourceClaim_ResourceClaimId)
--SELECT ActionId, ClaimSetId, @NMPEDDescrioptorsClaimId
--	FROM ClaimSets 
--	Join Actions on 1=1
--where ClaimSetName in ('SIS Vendor', 'Ed-Fi Sandbox', 'District Hosted SIS Vendor');

---- Adding Claim for: vehicle FuelType 
--INSERT INTO [dbo].[ResourceClaims] ( [DisplayName],[ResourceName]
--                                     ,[ClaimName]     
--                                     ,[ParentResourceClaimId],[Application_ApplicationId])
--VALUES ('vehicleFuelType','vehicleFuelType'
--        ,'http://nmped.org/ods/identity/claims/nmped/vehicleFuelType'
--        ,@NMPEDDescrioptorsClaimId,@ApplicationId);

