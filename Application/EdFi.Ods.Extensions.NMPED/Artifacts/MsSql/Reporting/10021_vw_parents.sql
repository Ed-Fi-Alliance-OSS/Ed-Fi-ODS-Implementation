/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-23-2023
 * Desc:	This script creates a Parent view from the 
 *			parents resource
 *			
 *			We are also combining the studentParentAssociation
 *			resource
 *
 * Alt Id:	001 (Increment value each change)
 * By:		Collin Neville | App Dev I
 * Email:	collin.neville@ped.nm.gov
 * Date:	04/19/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 */

CREATE OR ALTER VIEW nmped_rpt.vw_parents
AS 
--Alt Id: 001 - New CTE using control tables for descriptors
WITH cte_Descriptor AS ( 
	SELECT
		 DescriptorId
		,CodeValue
		,Description
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE DescriptorId IN (	SELECT * FROM edfi.LevelOfEducationDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.SexDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.ElectronicMailTypeDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.RelationDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.TelephoneNumberTypeDescriptor WITH (NOLOCK)

							)
)



SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,ParentUniqueId
--	,personReference not collected
--  ,parentAddress collected, not used
	,ElectronicMailType.CodeValue							[ElectronicMailTypeCode]
	,ElectronicMailType.Description							[ElectronicMailTypeDescription]
	,ElectronicMailAddress
	,PEM.DoNotPublishIndicator								[ParentElectronicMail_DoNotPublishIndicator]
	,PrimaryEmailAddressIndicator
	,P.FirstName
	,P.MiddleName
	,P.LastSurname
	,P.MaidenName
	,P.GenerationCodeSuffix
	,HighestCompletedLevelOfEducation.CodeValue				[HighestCompletedLevelOfEducationCode]
	,HighestCompletedLevelOfEducation.Description			[HighestCompletedLevelOfEducationDescription]
--	,InternationalAddresses not collected
	,LoginId
--	,personalIdentificationDocuments not collected
	,P.PersonalTitlePrefix
	,Sex.CodeValue											[SexCode]
	,Sex.Description										[SexDescription]
	,ParentTelephone_Home.TelephoneNumber					[Home_TelephoneNumber]
	,TelephoneNumberType_Home.CodeValue						[Home_TelephoneNumberTypeCode]
	,TelephoneNumberType_Home.Description					[Home_TelephoneNumberTypeDescription]
	,ParentTelephone_Home.DoNotPublishIndicator				[Home_DoNotPublishIndicator]
	,ParentTelephone_Home.OrderOfPriority					[Home_OrderOfPriority]
	,ParentTelephone_Home.TextMessageCapabilityIndicator	[Home_TextMessageCapabilityIndicator]
	,ParentTelephone_Mobile.TelephoneNumber					[Mobile_TelephoneNumber]
	,TelephoneNumberType_Mobile.CodeValue					[Mobile_TelephoneNumberTypeCode]
	,TelephoneNumberType_Mobile.Description					[Mobile_TelephoneNumberTypeDescription]
	,ParentTelephone_Mobile.DoNotPublishIndicator			[Mobile_DoNotPublishIndicator]
	,ParentTelephone_Mobile.OrderOfPriority					[Mobile_OrderOfPriority]
	,ParentTelephone_Mobile.TextMessageCapabilityIndicator	[Mobile_TextMessageCapabilityIndicator]
	,ContactPriority
	,ContactRestrictions
	,EmergencyContactStatus
	,LegalGuardian
	,LivesWith
	,PrimaryContactStatus
	,Relation.CodeValue										[RelationCode]
	,Relation.Description									[RelationDescription]
	,StudentUniqueId
	,S.StudentUSI
	,P.CreateDate
    ,SSA.EntryDate
	,SSA.ExitWithdrawDate
,P.LastModifiedDate
	,P.Id AS [ParentId]
FROM
	edfi.Parent P WITH (NOLOCK)

	LEFT JOIN edfi.StudentParentAssociation SPA WITH (NOLOCK)
		ON SPA.ParentUSI = P.ParentUSI

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SPA.StudentUSI

	LEFT JOIN edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
		ON SSA.StudentUSI = S.StudentUSI 

	LEFT JOIN edfi.ParentElectronicMail PEM	WITH (NOLOCK)
		ON PEM.ParentUSI = P.ParentUSI

-- Gets Parent MobileTelephone records
	LEFT JOIN (	SELECT 
					 TelephoneNumber
					,TelephoneNumberTypeDescriptorId
					,DoNotPublishIndicator
					,OrderOfPriority
					,TextMessageCapabilityIndicator
					,ParentUSI 
				FROM 
					edfi.ParentTelephone WITH (NOLOCK)
				WHERE 
					TelephoneNumberTypeDescriptorId = 2397) ParentTelephone_Mobile
		ON ParentTelephone_Mobile.ParentUSI = P.ParentUSI

-- Gets Parent HomeTelephone records
	LEFT JOIN (	SELECT
					 TelephoneNumber
					,TelephoneNumberTypeDescriptorId
					,DoNotPublishIndicator
					,OrderOfPriority
					,TextMessageCapabilityIndicator
					,ParentUSI 
				FROM 
					edfi.ParentTelephone WITH (NOLOCK)
				WHERE 
					TelephoneNumberTypeDescriptorId = 2395) ParentTelephone_Home
		ON ParentTelephone_Home.ParentUSI = P.ParentUSI

-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
	LEFT JOIN cte_Descriptor TelephoneNumberType_Mobile WITH (NOLOCK)
		ON TelephoneNumberType_Mobile.DescriptorId = ParentTelephone_Mobile.TelephoneNumberTypeDescriptorId

	LEFT JOIN cte_Descriptor TelephoneNumberType_Home WITH (NOLOCK)
		ON TelephoneNumberType_Home.DescriptorId = ParentTelephone_Home.TelephoneNumberTypeDescriptorId

	LEFT JOIN cte_Descriptor HighestCompletedLevelOfEducation WITH (NOLOCK)
		ON HighestCompletedLevelOfEducation.DescriptorId = P.HighestCompletedLevelOfEducationDescriptorId

	LEFT JOIN cte_Descriptor Sex WITH (NOLOCK)
		ON Sex.DescriptorId = P.SexDescriptorId

	LEFT JOIN cte_Descriptor ElectronicMailType WITH (NOLOCK)
		ON ElectronicMailType.DescriptorId = PEM.ElectronicMailTypeDescriptorId

	LEFT JOIN cte_Descriptor Relation WITH (NOLOCK)
		ON Relation.DescriptorId = SPA.RelationDescriptorId
-- Alt Id: 001 - End
	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId