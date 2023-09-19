

/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	05-05-2023
 * Desc:	This script creates a Language
 *			view, to build into a StudEdOrgAssoc sub report
 *
 */
CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentLanguage] AS
WITH cte_Descriptors AS 
(	SELECT
		DescriptorId,
		CodeValue,
		Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE
		Namespace IN (	'uri://nmped.org/LanguageDescriptor',
						'uri://ed-fi.org/LanguageUseDescriptor')
)

SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName 
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName 

	--resource documentation starts
	,SEOAL.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,Language.CodeValue				'LanguageCode'
	,Language.Description			'LanguageDescription'
	,LanguageUse.CodeValue			'LanguageUseCode'
	,LanguageUse.Description		'LanguageUseDescription'

	,SEOAL.CreateDate

FROM 
	edfi.StudentEducationOrganizationAssociationLanguage SEOAL WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOAL.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON SEOAL.EducationOrganizationId = VDL.EducationOrganizationId_School

	LEFT JOIN edfi.StudentEducationOrganizationAssociationLanguageUse SEOALU WITH (NOLOCK)
		ON SEOALU.EducationOrganizationId = SEOAL.EducationOrganizationId
		AND SEOALU.LanguageDescriptorId = SEOAL.LanguageDescriptorId
		AND SEOALU.StudentUSI = SEOAL.StudentUSI

	LEFT JOIN cte_Descriptors Language WITH (NOLOCK)
		ON Language.DescriptorId = SEOAL.LanguageDescriptorId

	LEFT JOIN cte_Descriptors LanguageUse WITH (NOLOCK) 
		ON LanguageUse.DescriptorId = SEOALU.LanguageUseDescriptorId
GO

