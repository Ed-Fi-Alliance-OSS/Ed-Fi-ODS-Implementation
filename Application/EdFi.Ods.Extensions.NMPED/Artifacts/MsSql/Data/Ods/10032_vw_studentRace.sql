/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	05-05-2023
 * Desc:	This script creates a Race
 *			view, to build into a StudEdOrgAssoc sub report
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_studentRace AS 
WITH cte_Descriptors AS (
	SELECT 
		 DescriptorId
		,CodeValue
		,Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE
		DescriptorId IN (
			SELECT DescriptorId FROM edfi.RaceDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM edfi.TribalAffiliationDescriptor WITH (NOLOCK) 
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

	,SEOAR.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,Race.CodeValue					'RaceCode'
	,Race.Description				'RaceDescription'
	,TribalAffiliation.CodeValue	'TribalAffiliationCode'
	,TribalAffiliation.Description	'TribalAffiliationDescription'
	,SEOAR.CreateDate

FROM
	edfi.StudentEducationOrganizationAssociationRace SEOAR WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOAR.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOAR.EducationOrganizationId

	LEFT JOIN edfi.StudentEducationOrganizationAssociationTribalAffiliation SEOATA WITH (NOLOCK)
		ON SEOATA.EducationOrganizationId = SEOAR.EducationOrganizationId
		AND SEOATA.StudentUSI = SEOAR.StudentUSI

	LEFT JOIN cte_Descriptors Race
		ON Race.DescriptorId = SEOAR.RaceDescriptorId
		
	LEFT JOIN cte_Descriptors TribalAffiliation
		ON TribalAffiliation.DescriptorId = SEOATA.TribalAffiliationDescriptorId
