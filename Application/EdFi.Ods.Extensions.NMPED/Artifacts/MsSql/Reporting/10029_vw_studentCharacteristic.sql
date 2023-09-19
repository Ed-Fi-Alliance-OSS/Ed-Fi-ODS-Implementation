

/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a studentCharacteristic
 *			view, to build into a StudEdOrgAssoc sub report
 *
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentCharacteristic] AS 
WITH cte_Descriptors AS (
	SELECT 
		 DescriptorId
		,CodeValue
		,Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE
		DescriptorId IN (
			SELECT DescriptorId FROM edfi.StudentCharacteristicDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM nmped.LevelOfIntegrationDescriptor WITH (NOLOCK) 
	)
)

SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName 
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName 

	,SEOASC.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,StudentCharacteristic.CodeValue		'StudentCharacteristicCode'
	,StudentCharacteristic.Description		'StudentCharacteristicDescription'
	,GiftedLevelOfIntegration.CodeValue		'GiftedLevelOfIntegrationCode'
	,GiftedLevelOfIntegration.Description	'GiftedLevelOfIntegrationDescription'

	,SEOASC.CreateDate

FROM
	edfi.StudentEducationOrganizationAssociationStudentCharacteristic SEOASC WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOASC.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOASC.EducationOrganizationId

	LEFT JOIN nmped.StudentEducationOrganizationAssociationStudentCharacteristicExtension SEOASCE WITH (NOLOCK)
		ON SEOASCE.EducationOrganizationId = SEOASC.EducationOrganizationId
		AND SEOASCE.StudentCharacteristicDescriptorId = SEOASC.StudentCharacteristicDescriptorId
		AND SEOASCE.StudentUSI = SEOASC.StudentUSI

	LEFT JOIN cte_Descriptors StudentCharacteristic
		ON StudentCharacteristic.DescriptorId = SEOASC.StudentCharacteristicDescriptorId

	LEFT JOIN cte_Descriptors GiftedLevelOfIntegration
		ON GiftedLevelOfIntegration.DescriptorId = SEOASCE.GiftedLevelOfIntegrationDescriptorId
GO

