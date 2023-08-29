/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Cody Misplay | App Dev III
 * Email:	Cody.Misplay@ped.nm.gov
 * Date:	07-10-2023
 * Desc:	This script creates a view tying together StaffSectionAssociation, SectionProgram and Course.
 *			It also joins to StaffEducationOrganizationEmploymentAssociation and StaffIdentificationCode 
 *			to get EmploymentStatusCode, StaffId, and CertNum (if available).
 */

CREATE OR ALTER     VIEW [nmped_rpt].[vw_StaffSection_Program_Course] AS 
WITH cte_Descriptors AS (
SELECT [DescriptorId]
	  ,[CodeValue]
	  ,[Description]
FROM edfi.Descriptor WITH (NOLOCK) 
WHERE [Namespace] IN ('uri://nmped.org/ProgramTypeDescriptor', 'uri://ed-fi.org/ClassroomPositionDescriptor','uri://nmped.org/EmploymentStatusDescriptor')
), cte_StaffIdentification AS (
SELECT  SIC.StaffUSI
		,SIC.AssigningOrganizationIdentificationCode
		,StaffIdSystem.CodeValue AS [StaffIdSystem]
		,SIC.IdentificationCode
FROM edfi.StaffIdentificationCode SIC WITH (NOLOCK)
LEFT JOIN edfi.Descriptor StaffIdSystem WITH (NOLOCK) ON (StaffIdSystem.DescriptorId = SIC.StaffIdentificationSystemDescriptorId)
WHERE StaffIdSystem.CodeValue IN ('SSN', 'Professional Certificate')
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
	,Employment.CodeValue AS [EmploymentStatusCode]
	,Employment.[Description] AS [EmploymentStatusDescription]
	,ID_SSN.IdentificationCode AS [StaffId]
	,ID_Cert.IdentificationCode AS [CertNum]

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

	LEFT JOIN cte_StaffIdentification ID_SSN
		ON (ID_SSN.StaffUSI = S.StaffUSI AND ID_SSN.StaffIdSystem = 'SSN')

	LEFT JOIN cte_StaffIdentification ID_Cert
		ON (ID_Cert.StaffUSI = S.StaffUSI AND ID_Cert.StaffIdSystem = 'Professional Certificate')

	LEFT JOIN edfi.StaffEducationOrganizationEmploymentAssociation SEOEA WITH (NOLOCK)
		ON (SEOEA.StaffUSI = S.StaffUSI
			AND (SEOEA.EducationOrganizationId = VDL.EducationOrganizationId_School
				OR SEOEA.EducationOrganizationId = VDL.EducationOrganizationId_District))

	LEFT JOIN cte_Descriptors Employment
		ON (Employment.DescriptorId = SEOEA.EmploymentStatusDescriptorId)

GO
