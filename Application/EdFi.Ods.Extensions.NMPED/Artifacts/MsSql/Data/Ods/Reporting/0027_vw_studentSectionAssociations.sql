/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a studentSectionAssociations view
 *			from the studentSectionAssociations Ed-Fi Resource
 */

CREATE OR ALTER VIEW nmped_rpt.vw_studentSectionAssociations AS 
WITH cte_Descriptors AS (
	SELECT
		 DescriptorId
		,CodeValue
		,Description
	FROM 
		edfi.Descriptor WITH (NOLOCK) 
	WHERE
		Namespace IN ('uri://ed-fi.org/RepeatIdentifierDescriptor'
					 ,'uri://ed-fi.org/AttemptStatusDescriptor'
					 ,'uri://nmped.org/SpecialProgramCodeDescriptor'))

SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,StudentUniqueId
	,FirstName
	,LastSurname
	,SSA.BeginDate
	,SSA.LocalCourseCode
	,SSA.SchoolId
	,SSA.SchoolYear
	,SSA.SectionIdentifier
	,SSA.SessionName
	,AttemptStatus.CodeValue			[AttemptStatusCode]
	,AttemptStatus.Description			[AttemptStatusDescription]
	,EndDate
	,HomeroomIndicator	
	,RepeatIdentifier.CodeValue			[RepeatIdentifierCode]
	,RepeatIdentifier.Description		[RepeatIdentifierDescription]
	,TeacherStudentDataLinkExclusion

	,SpecialProgramCode.CodeValue		[SpecialProgramCode]
	,SpecialProgramCode.Description		[SpecialProgramDescription]
	,AlternateCreditCourseCode

	--table CreateDate/LastModifiedDate
	,SSA.CreateDate										
	,SSA.LastModifiedDate
FROM
	edfi.StudentSectionAssociation SSA WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK) 
		ON S.StudentUSI = SSA.StudentUSI

	JOIN nmped.StudentSectionAssociationExtension SSAE WITH (NOLOCK)
		ON SSAE.BeginDate = SSA.BeginDate
		AND SSAE.LocalCourseCode = SSA.LocalCourseCode
		AND SSAE.SchoolId = SSA.SchoolId
		AND SSAE.SchoolYear = SSA.SchoolYear
		AND SSAE.SectionIdentifier = SSA.SectionIdentifier
		AND SSAE.SessionName = SSA.SessionName
		AND SSAE.StudentUSI = SSA.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId

	LEFT JOIN cte_Descriptors AttemptStatus WITH (NOLOCK)
		ON AttemptStatus.DescriptorId = SSA.AttemptStatusDescriptorId

	LEFT JOIN cte_Descriptors RepeatIdentifier WITH (NOLOCK)
		ON RepeatIdentifier.DescriptorId = SSA.RepeatIdentifierDescriptorId

	LEFT JOIN cte_Descriptors SpecialProgramCode WITH (NOLOCK)
		ON SpecialProgramCode.DescriptorId = SSAE.SpecialProgramCodeDescriptorId