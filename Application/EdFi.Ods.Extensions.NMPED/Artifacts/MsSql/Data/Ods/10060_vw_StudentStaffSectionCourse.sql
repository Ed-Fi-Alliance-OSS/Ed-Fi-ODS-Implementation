/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | App Dev III
* Email: cody.misplay@ped.nm.gov
* Date: 09/22/2023
* Desc: This view has been created to join Staff Section Assoc, Student Section Assoc,
*		Course Offering, Course (view), GradeLevels (view), District/Location (view) and
*		Student School Association. It is meant to be a basic view.
*
* Dependencies:
* - nmped_rpt.vw_district_location
* - nmped_rpt.vw_gradeLevels
* - nmped_rpt.vw_Courses
*
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_StudentStaffSectionCourse]
AS

WITH cte_Descriptors AS (
SELECT [DescriptorId]
	  ,[CodeValue]
	  ,[Description]
FROM edfi.Descriptor WITH (NOLOCK) 
WHERE DescriptorId IN (
	SELECT ClassroomPositionDescriptorId FROM edfi.ClassroomPositionDescriptor WITH (NOLOCK)
	UNION
	SELECT EntryTypeDescriptorId FROM edfi.EntryTypeDescriptor WITH (NOLOCK)
	UNION
	SELECT GradeLevelDescriptorId FROM edfi.GradeLevelDescriptor WITH (NOLOCK)
	UNION
	SELECT ExitWithdrawTypeDescriptorId FROM edfi.ExitWithdrawTypeDescriptor WITH (NOLOCK))
)
--, cte_StaffIdentification AS (
--SELECT  SIC.StaffUSI
--		,SIC.AssigningOrganizationIdentificationCode
--		,StaffIdSystem.CodeValue AS [StaffIdSystem]
--		,SIC.IdentificationCode
--FROM edfi.StaffIdentificationCode SIC WITH (NOLOCK)
--LEFT JOIN edfi.Descriptor StaffIdSystem WITH (NOLOCK) ON (StaffIdSystem.DescriptorId = SIC.StaffIdentificationSystemDescriptorId)
--WHERE StaffIdSystem.CodeValue IN ('SSN', 'Professional Certificate')
--)

SELECT 
	  -- Internal Student and Staff IDs
	   SSA.StudentUSI
	  ,STSA.StaffUSI

	  -- Staff Information
	  ,ST.StaffUniqueId
	  ,ST.LastSurname + ', ' + ST.FirstName AS [StaffName]
	  ,ST.FirstName AS [StaffFirstName]
	  ,ST.LastSurname AS [StaffLastName]
	  ,ST.BirthDate AS [StaffBirthDate]

	  -- Classroom Information
	  ,ClassroomPosition.CodeValue		AS [ClassroomPositionCode]
	  ,ClassroomPosition.[Description]	AS [ClassroomPositionDescription]

	  -- Student Information
	  ,S.StudentUniqueId
	  ,S.LastSurname + ', ' + S.FirstName AS [StudentName]
	  ,S.FirstName AS [StudentFirstName]
	  ,S.LastSurname AS [StudentLastName]
	  ,S.BirthDate AS [StudentBirthDate]

	  -- Four keys to Student/Staff Section data
	  ,SSA.LocalCourseCode
	  ,SSA.SectionIdentifier
	  ,SSA.SessionName
	  ,SSA.SchoolYear

	  -- Other Section Information
	  ,SSA.BeginDate AS [SectionBeginDate]
	  ,SSA.EndDate AS [SectionEndDate]

	  -- Local Course Offering Info
	  ,CO.LocalCourseTitle
	  
	  -- State-Level course Information
	  ,C.CourseCode
	  ,C.CourseTitle
	  ,C.AcademicSubjectCode
	  ,C.AcademicSubjectDescription

	  -- Grade Level Information
	  ,GL.GradeLevelCode AS [GradeLevel]
	  ,GL.GradeLevelOrder

	  -- Student School Data
	  ,SSCA.EntryDate
	  ,EntryTypeCode.CodeValue AS [EntryTypeCode]
	  ,SSCA.ExitWithdrawDate AS [ExitDate]
	  ,ExitTypeCode.CodeValue AS [ExitWithdrawTypeCode]

	  -- District/Location Information
	  ,VDL.EducationOrganizationId_District AS [DistrictId]
	  ,VDL.DistrictCode
	  ,VDL.DistrictName
	  ,VDL.EducationOrganizationId_School AS [SchoolId]
	  ,VDL.LocationCode
	  ,VDL.SchoolName
	  ,VDL.DistrictOrgType
	  ,VDL.LocationOrgType

FROM [edfi].[StudentSectionAssociation] SSA WITH (NOLOCK)

LEFT JOIN [edfi].[StaffSectionAssociation] STSA WITH (NOLOCK)
	ON (STSA.LocalCourseCode = SSA.LocalCourseCode
		AND STSA.SectionIdentifier = SSA.SectionIdentifier
		AND STSA.SessionName = SSA.SessionName
		AND STSA.SchoolId = SSA.SchoolId
		AND STSA.SchoolYear = SSA.SchoolYear)

-- This join only exists to get the CourseCode to match Courses
INNER JOIN [edfi].[CourseOffering] CO WITH (NOLOCK)
	ON (CO.LocalCourseCode = SSA.LocalCourseCode
		AND CO.SessionName = SSA.SessionName
		AND CO.SchoolId = SSA.SchoolId)

INNER JOIN [nmped_rpt].[vw_Courses] C WITH (NOLOCK)
	ON (C.CourseCode = CO.CourseCode)

INNER JOIN [edfi].[StudentSchoolAssociation] SSCA WITH (NOLOCK)
	ON (SSCA.SchoolId = SSA.SchoolId
		AND SSCA.StudentUSI = SSA.StudentUSI)

INNER JOIN [edfi].[Staff] ST WITH (NOLOCK)
	ON (ST.StaffUSI = STSA.StaffUSI)

INNER JOIN [edfi].[Student] S WITH (NOLOCK)
	ON (S.StudentUSI = SSA.StudentUSI)

INNER JOIN [nmped_rpt].[vw_gradeLevels] GL
	ON (GL.GradeLevelDescriptorId = SSCA.EntryGradeLevelDescriptorId)

LEFT JOIN cte_Descriptors ClassroomPosition WITH (NOLOCK)
	ON (ClassroomPosition.DescriptorId = STSA.ClassroomPositionDescriptorId)

LEFT JOIN cte_Descriptors EntryTypeCode
	ON (EntryTypeCode.DescriptorId = SSCA.EntryTypeDescriptorId)

LEFT JOIN cte_Descriptors ExitTypeCode
	ON (ExitTypeCode.DescriptorId = SSCA.ExitWithdrawTypeDescriptorId)

INNER JOIN [nmped_rpt].[vw_district_location] VDL
	ON (VDL.EducationOrganizationId_School = SSA.SchoolId)

GO