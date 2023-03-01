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
 *			I am excluding parentAddress, since it is not included in the v4 document.
 *			However, parentAddress is being populated.
				Same with parentOtherName
 *			I can include this later though
 */


 IF EXISTS 
(
	SELECT 
		1 
	FROM 
		sys.views
		JOIN sys.schemas
			ON views.schema_id = schemas.schema_id
	WHERE 
		views.name = 'vw_parents'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_parents;
GO

CREATE VIEW nmped_rpt.vw_parents AS 
SELECT
	 SUBSTRING(CAST(SSA.SchoolId AS VARCHAR(10)), 3, 3)		[DistrictCode]
	,EO2.NameOfInstitution									[DistrictName]
	,SSA.SchoolId
	,EO.NameOfInstitution									[SchoolName]
	,ParentUniqueId
--	,personReference not collected
--  ,parentAddress collected, not used
	,PEM.ElectronicMailTypeDescriptorId
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
	,HighestCompletedLevelOfEducationDescriptorId	
	,HighestCompletedLevelOfEducation.CodeValue				[HighestCompletedLevelOfEducationCode]
	,HighestCompletedLevelOfEducation.Description			[HighestCompletedLevelOfEducationDescription]
--	,InternationalAddresses not collected
	,LoginId
--	,personalIdentificationDocuments not collected
	,P.PersonalTitlePrefix
	,SexDescriptorId 
	,Sex.CodeValue											[SexCode]
	,Sex.Description										[SexDescription]
	,TelephoneNumberTypeDescriptorId
	,TelephoneNumberType.CodeValue							[TelephoneNumberTypeCode]
	,TelephoneNumberType.Description						[TelephoneNumberTypeDescription]
	,PT.DoNotPublishIndicator								[ParentTelephone_DoNotPublishIndicator]
	,TelephoneNumber
	,OrderOfPriority
	,TextMessageCapabilityIndicator
	
	,P.CreateDate
	,P.LastModifiedDate

	,ContactPriority
	,ContactRestrictions
	,EmergencyContactStatus
	,LegalGuardian
	,LivesWith
	,PrimaryContactStatus
	,RelationDescriptorId
	,Relation.CodeValue										[RelationCode]
	,Relation.Description									[RelationDescription]
	,StudentUniqueId
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

	LEFT JOIN edfi.ParentTelephone PT WITH (NOLOCK)
		ON PT.ParentUSI = P.ParentUSI

	LEFT JOIN edfi.Descriptor HighestCompletedLevelOfEducation WITH (NOLOCK)
		ON HighestCompletedLevelOfEducation.DescriptorId = P.HighestCompletedLevelOfEducationDescriptorId

	LEFT JOIN edfi.Descriptor Sex WITH (NOLOCK)
		ON Sex.DescriptorId = P.SexDescriptorId

	LEFT JOIN edfi.Descriptor ElectronicMailType WITH (NOLOCK)
		ON ElectronicMailType.DescriptorId = PEM.ElectronicMailTypeDescriptorId

	LEFT JOIN edfi.Descriptor TelephoneNumberType WITH (NOLOCK)
		ON TelephoneNumberType.DescriptorId = PT.TelephoneNumberTypeDescriptorId

	LEFT JOIN edfi.Descriptor Relation WITH (NOLOCK)
		ON Relation.DescriptorId = SPA.RelationDescriptorId

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = SSA.SchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(SSA.SchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'