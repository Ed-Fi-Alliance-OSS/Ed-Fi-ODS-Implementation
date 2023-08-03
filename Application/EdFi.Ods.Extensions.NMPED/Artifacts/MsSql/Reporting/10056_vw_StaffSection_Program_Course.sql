/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Cody Misplay | App Dev III
 * Email:	Cody.Misplay@ped.nm.gov
 * Date:	07-10-2023
 * Desc:	This script creates a view tying together StaffSectionAssociation, SectionProgram and Course.
 *			It also joins to vw_StaffClassifications to get EmploymentStatusCode, StaffId, and CertNum (if available)
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_StaffSection_Program_Course] AS 
WITH cte_Descriptors AS (
SELECT [DescriptorId]
	  ,[CodeValue]
	  ,[Description]
FROM edfi.Descriptor WITH (NOLOCK) 
WHERE [Namespace] IN ('uri://nmped.org/ProgramTypeDescriptor', 'uri://ed-fi.org/ClassroomPositionDescriptor')
)

SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District AS [DistrictId]
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School AS [SchoolId]
	,VDL.LocationCode
	,VDL.SchoolName	
	,VDL.DistrictOrgType
	,VDL.LocationOrgType

	-- Resource documentation starts - Staff table
	,S.StaffUSI
	,S.StaffUniqueId
	,S.FirstName
	,S.LastSurname
	,S.LastSurname + ', ' + S.FirstName AS [FullName]
	-- StaffSectionAssociation table
	,SSA.LocalCourseCode
	,SSA.SchoolYear
	,SSA.SectionIdentifier
	,SSA.SessionName
	,SSA.BeginDate
	,ClassroomPosition.CodeValue		AS [ClassroomPositionCode]
	,ClassroomPosition.[Description]	AS [ClassroomPositionDescription]
	,SSA.EndDate
	,SSA.HighlyQualifiedTeacher
	,SSA.PercentageContribution
	,SSA.TeacherStudentDataLinkExclusion

	-- Course Information
	,C.CourseCode AS [StateCourseCode]
	,C.CourseTitle AS [StateCourseTitle]

	-- Section Program Information
	,SP.ProgramName
	,ProgramType.CodeValue AS [ProgramTypeCode]

	-- Extended staff data
	,SC.EmploymentStatusCode
	,SC.EmploymentStatusDescription
	,SC.CertNum
	,SC.StaffId

FROM edfi.StaffSectionAssociation SSA WITH (NOLOCK) --65,758 raw

	LEFT JOIN edfi.Staff S WITH (NOLOCK)
		ON (S.StaffUSI = SSA.StaffUSI)

	LEFT JOIN cte_Descriptors ClassroomPosition WITH (NOLOCK)
		ON (ClassroomPosition.DescriptorId = SSA.ClassroomPositionDescriptorId)

	LEFT JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON (VDL.EducationOrganizationId_School = SSA.SchoolId)

	LEFT JOIN edfi.CourseOffering CO WITH (NOLOCK)
		ON (CO.LocalCourseCode = SSA.LocalCourseCode 
			AND CO.SchoolId = SSA.SchoolId
			AND CO.SessionName = SSA.SessionName
			AND CO.SchoolYear = SSA.SchoolYear)

	LEFT JOIN edfi.Course C WITH (NOLOCK)
		ON (C.CourseCode = CO.CourseCode)

	LEFT JOIN edfi.SectionProgram SP WITH (NOLOCK)
		ON (SP.LocalCourseCode = SSA.LocalCourseCode 
			AND SP.SchoolId = SSA.SchoolId
			AND SP.SessionName = SSA.SessionName
			AND SP.SectionIdentifier = SSA.SectionIdentifier
			AND SP.SchoolYear = SSA.SchoolYear)

	LEFT JOIN cte_Descriptors ProgramType
		ON (ProgramType.DescriptorId = SP.ProgramTypeDescriptorId)

	LEFT JOIN nmped_rpt.vw_StaffClassifications SC
		ON (SC.StaffUSI = SSA.StaffUSI
			AND SC.SchoolId = SSA.SchoolId)

GO


