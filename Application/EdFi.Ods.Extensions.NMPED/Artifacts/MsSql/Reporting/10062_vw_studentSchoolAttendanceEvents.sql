/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-01-2023
 * Desc:	This script creates a StudentSectionAttendanceEvent view
 *			from the:
 *						studentSectionAttendanceEvents resource
 *						studentSchoolAttendanceEvents resource
 *			
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_studentSchoolAttendanceEvents AS 
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
	,SSAE.StudentUSI
	,S.FirstName
	,S.LastSurname
	,AttendanceEventCategory.CodeValue		[AttendanceEventCategoryCode]
	,AttendanceEventCategory.Description	[AttendanceEventCategoryDescription]
	,EventDate
	,SchoolYear
	,SessionName
	,ArrivalTime
	,AttendanceEventReason
	,DepartureTime
	,EducationalEnvironment.CodeValue		[EducationalEnvironmentCode]
	,EducationalEnvironment.Description		[EducationalEnvironmentDescription]
	,EventDuration
	,SchoolAttendanceDuration

	--table CreateDate/LastModifiedDate
	,SSAE.CreateDate
	,SSAE.LastModifiedDate
	,SSAE.Id AS [StudentSchoolAttendanceEvent_Id]
FROM
	edfi.StudentSchoolAttendanceEvent SSAE WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSAE.StudentUSI

	LEFT JOIN edfi.Descriptor AttendanceEventCategory WITH (NOLOCK)
		ON AttendanceEventCategory.DescriptorId = SSAE.AttendanceEventCategoryDescriptorId

	LEFT JOIN edfi.Descriptor EducationalEnvironment WITH (NOLOCK)
		ON EducationalEnvironment.DescriptorId = SSAE.EducationalEnvironmentDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSAE.SchoolId