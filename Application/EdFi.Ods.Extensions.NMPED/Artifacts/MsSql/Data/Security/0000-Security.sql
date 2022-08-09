--SELECT @ApplicationId
DECLARE @ApplicationId INT
SELECT @ApplicationId = ApplicationId FROM [dbo].[Applications] WHERE ApplicationName = 'Ed-Fi ODS API';

-- Getting the Claim Ids that we will use.  
DECLARE @RelationshipBasedDataClaimId INT
SELECT @RelationshipBasedDataClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'relationshipBasedData';

DECLARE @PrimaryRelationshipsClaimId INT
SELECT @PrimaryRelationshipsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'primaryRelationships';

DECLARE @DescriptorsClaimId INT
SELECT @DescriptorsClaimId = ResourceClaimId FROM [dbo].[ResourceClaims] WHERE ResourceName = 'systemDescriptors';

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
		
INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('staffDevelopment', 'staffDevelopment'
        ,'http://ed-fi.org/ods/identity/claims/nmped/staffDevelopment'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('staffEducationOrganizationDigitalEquity', 'staffEducationOrganizationDigitalEquity'
        ,'http://ed-fi.org/ods/identity/claims/nmped/staffEducationOrganizationDigitalEquity'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('studentEducationOrganizationAward', 'studentEducationOrganizationAward'
        ,'http://ed-fi.org/ods/identity/claims/nmped/studentEducationOrganizationAward'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('studentSchoolAggregateSectionAttendance', 'studentSchoolAggregateSectionAttendance'
        ,'http://ed-fi.org/ods/identity/claims/nmped/studentSchoolAggregateSectionAttendance'
        ,@RelationshipBasedDataClaimId, @ApplicationId);

INSERT INTO [dbo].[ResourceClaims] ([DisplayName], [ResourceName] 
								   ,[ClaimName] 
								   ,[ParentResourceClaimId], [Application_ApplicationId])
VALUES ('studentSpecialEducationProgramAssociationSpecialEducationProgramEvent', 'studentSpecialEducationProgramAssociationSpecialEducationProgramEvent'
        ,'http://ed-fi.org/ods/identity/claims/nmped/studentSpecialEducationProgramAssociationSpecialEducationProgramEvent'
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

INSERT INTO ResourceClaims (DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId) VALUES
('annualReviewDelayReasonDescriptor','annualReviewDelayReasonDescriptor','http://ed-fi.org/ods/identity/claims/nmped/annualReviewDelayReasonDescriptor',@DescriptorsClaimId,@ApplicationId),
('dentalExaminationVerificationCodeDescriptor','dentalExaminationVerificationCodeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/dentalExaminationVerificationCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('digitalEquityInternetAccessTypeDescriptor','digitalEquityInternetAccessTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/digitalEquityInternetAccessTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('digitalEquityInternetPerformanceCodeDescriptor','digitalEquityInternetPerformanceCodeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/digitalEquityInternetPerformanceCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('digitalEquityPrimaryLearningDeviceAccessDescriptor','digitalEquityPrimaryLearningDeviceAccessDescriptor','http://ed-fi.org/ods/identity/claims/nmped/digitalEquityPrimaryLearningDeviceAccessDescriptor',@DescriptorsClaimId,@ApplicationId),
('digitalEquityPrimaryLearningDeviceTypeDescriptor','digitalEquityPrimaryLearningDeviceTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/digitalEquityPrimaryLearningDeviceTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('directCertificationStatusDescriptor','directCertificationStatusDescriptor','http://ed-fi.org/ods/identity/claims/nmped/directCertificationStatusDescriptor',@DescriptorsClaimId,@ApplicationId),
('expectedDiplomaTypeDescriptor','expectedDiplomaTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/expectedDiplomaTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('genderIdentityDescriptor','genderIdentityDescriptor','http://ed-fi.org/ods/identity/claims/nmped/genderIdentityDescriptor',@DescriptorsClaimId,@ApplicationId),
('industryCredentialDescriptor','industryCredentialDescriptor','http://ed-fi.org/ods/identity/claims/nmped/industryCredentialDescriptor',@DescriptorsClaimId,@ApplicationId),
('levelOfEducationInstitutionDescriptor','levelOfEducationInstitutionDescriptor','http://ed-fi.org/ods/identity/claims/nmped/levelOfEducationInstitutionDescriptor',@DescriptorsClaimId,@ApplicationId),
('mileageTypeDescriptor','mileageTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/mileageTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('militaryFamilyDescriptor','militaryFamilyDescriptor','http://ed-fi.org/ods/identity/claims/nmped/militaryFamilyDescriptor',@DescriptorsClaimId,@ApplicationId),
('nMPEDClassPeriodDescriptor','nMPEDClassPeriodDescriptor','http://ed-fi.org/ods/identity/claims/nmped/nMPEDClassPeriodDescriptor',@DescriptorsClaimId,@ApplicationId),
('participationInformationDescriptor','participationInformationDescriptor','http://ed-fi.org/ods/identity/claims/nmped/participationInformationDescriptor',@DescriptorsClaimId,@ApplicationId),
('plannedPostGraduateActivityDescriptor','plannedPostGraduateActivityDescriptor','http://ed-fi.org/ods/identity/claims/nmped/plannedPostGraduateActivityDescriptor',@DescriptorsClaimId,@ApplicationId),
('preKClassTypeDescriptor','preKClassTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/preKClassTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('primaryAreaOfExceptionalityDescriptor','primaryAreaOfExceptionalityDescriptor','http://ed-fi.org/ods/identity/claims/nmped/primaryAreaOfExceptionalityDescriptor',@DescriptorsClaimId,@ApplicationId),
('programDeliveryMethodDescriptor','programDeliveryMethodDescriptor','http://ed-fi.org/ods/identity/claims/nmped/programDeliveryMethodDescriptor',@DescriptorsClaimId,@ApplicationId),
('programIntensityDescriptor','programIntensityDescriptor','http://ed-fi.org/ods/identity/claims/nmped/programIntensityDescriptor',@DescriptorsClaimId,@ApplicationId),
('roadTypeDescriptor','roadTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/roadTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('serviceProviderTypeDescriptor','serviceProviderTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/serviceProviderTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('serviceSettingDescriptor','serviceSettingDescriptor','http://ed-fi.org/ods/identity/claims/nmped/serviceSettingDescriptor',@DescriptorsClaimId,@ApplicationId),
('specialEducationEventReasonDescriptor','specialEducationEventReasonDescriptor','http://ed-fi.org/ods/identity/claims/nmped/specialEducationEventReasonDescriptor',@DescriptorsClaimId,@ApplicationId),
('specialEducationEventTypeDescriptor','specialEducationEventTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/specialEducationEventTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('levelOfIntegrationDescriptor','levelOfIntegrationDescriptor','http://ed-fi.org/ods/identity/claims/nmped/levelOfIntegrationDescriptor',@DescriptorsClaimId,@ApplicationId),
('specialEducationNonComplianceReasonDescriptor','specialEducationNonComplianceReasonDescriptor','http://ed-fi.org/ods/identity/claims/nmped/specialEducationNonComplianceReasonDescriptor',@DescriptorsClaimId,@ApplicationId),
('specialProgramCodeDescriptor','specialProgramCodeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/specialProgramCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('staffDevelopmentActivityCodeDescriptor','staffDevelopmentActivityCodeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/staffDevelopmentActivityCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('staffDevelopmentPurposeCodeDescriptor','staffDevelopmentPurposeCodeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/staffDevelopmentPurposeCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('studentAwardLanguageDescriptor','studentAwardLanguageDescriptor','http://ed-fi.org/ods/identity/claims/nmped/studentAwardLanguageDescriptor',@DescriptorsClaimId,@ApplicationId),
('studentAwardTypeDescriptor','studentAwardTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/studentAwardTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('transportationCategoryDescriptor','transportationCategoryDescriptor','http://ed-fi.org/ods/identity/claims/nmped/transportationCategoryDescriptor',@DescriptorsClaimId,@ApplicationId),
('transportationSetCodeDescriptor','transportationSetCodeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/transportationSetCodeDescriptor',@DescriptorsClaimId,@ApplicationId),
('triennialReviewDelayReasonDescriptor','triennialReviewDelayReasonDescriptor','http://ed-fi.org/ods/identity/claims/nmped/triennialReviewDelayReasonDescriptor',@DescriptorsClaimId,@ApplicationId),
('vehicleBodyManufacturerDescriptor','vehicleBodyManufacturerDescriptor','http://ed-fi.org/ods/identity/claims/nmped/vehicleBodyManufacturerDescriptor',@DescriptorsClaimId,@ApplicationId),
('vehicleChassisManufacturerDescriptor','vehicleChassisManufacturerDescriptor','http://ed-fi.org/ods/identity/claims/nmped/vehicleChassisManufacturerDescriptor',@DescriptorsClaimId,@ApplicationId),
('vehicleFuelTypeDescriptor','vehicleFuelTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/vehicleFuelTypeDescriptor',@DescriptorsClaimId,@ApplicationId),
('vehicleRouteDescriptor','vehicleRouteDescriptor','http://ed-fi.org/ods/identity/claims/nmped/vehicleRouteDescriptor',@DescriptorsClaimId,@ApplicationId),
('vehicleTypeDescriptor','vehicleTypeDescriptor','http://ed-fi.org/ods/identity/claims/nmped/vehicleTypeDescriptor',@DescriptorsClaimId,@ApplicationId);