

/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a IdentificationCode
 *			view, to build into a StudEdOrgAssoc sub report
 *
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentIdentificationCode] AS 
SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName 
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName 

	,SEOASIC.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,IdentificationCode
	,StudentIdentificationSystem.CodeValue		'StudentIdentificationSystemCode'
	,StudentIdentificationSystem.Description	'StudentIdentificationSystemDescription'
	,AssigningOrganizationIdentificationCode

	,SEOASIC.CreateDate
FROM
	edfi.StudentEducationOrganizationAssociationStudentIdentificationCode SEOASIC WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOASIC.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOASIC.EducationOrganizationId

	LEFT JOIN edfi.Descriptor StudentIdentificationSystem WITH (NOLOCK)
		ON StudentIdentificationSystem.DescriptorId = SEOASIC.StudentIdentificationSystemDescriptorId

GO

