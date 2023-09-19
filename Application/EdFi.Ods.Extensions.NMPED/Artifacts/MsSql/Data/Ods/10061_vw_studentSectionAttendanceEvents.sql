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

CREATE OR ALTER VIEW nmped_rpt.vw_studentSectionAttendanceEvents AS 
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
	,AttendanceEventCategory.CodeValue					[AttendanceEventCode]
	,AttendanceEventCategory.Description				[AttendanceEventDescription]
	,SSAE.EventDate
	,SSAE.LocalCourseCode
	,SSAE.SchoolYear
	,SSAE.SectionIdentifier
	,SSAE.SessionName
	,SSAE.ArrivalTime
	,SSAE.AttendanceEventReason
	,ClassPeriodName
	,SSAE.DepartureTime
	,EducationalEnvironment.CodeValue					[EducationalEnvironmentCode]
	,EducationalEnvironment.Description					[EducationalEnvironmentDescription]
	,SSAE.EventDuration
	,SectionAttendanceDuration

	--table CreateDate/LastModifiedDate
	,SSAE.CreateDate
	,SSAE.LastModifiedDate
	,SSAE.Id AS [StudentSectionAttendanceEvent_Id]
FROM
	edfi.StudentSectionAttendanceEvent SSAE WITH (NOLOCK)

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSAE.StudentUSI

	LEFT JOIN edfi.StudentSectionAttendanceEventClassPeriod SSAECP WITH (NOLOCK)
		ON SSAECP.AttendanceEventCategoryDescriptorId = SSAE.AttendanceEventCategoryDescriptorId
		AND SSAECP.EventDate = SSAE.EventDate
		AND SSAECP.LocalCourseCode = SSAE.LocalCourseCode
		AND SSAECP.SchoolId = SSAE.SchoolId
		AND SSAECP.SchoolYear = SSAE.SchoolYear
		AND SSAECP.SectionIdentifier = SSAE.SectionIdentifier
		AND SSAECP.SessionName = SSAE.SessionName
		AND SSAECP.StudentUSI = SSAE.StudentUSI

	LEFT JOIN edfi.Descriptor AttendanceEventCategory WITH (NOLOCK)
		ON AttendanceEventCategory.DescriptorId = SSAE.AttendanceEventCategoryDescriptorId

	LEFT JOIN edfi.Descriptor EducationalEnvironment WITH (NOLOCK)
		ON EducationalEnvironment.DescriptorId = SSAE.EducationalEnvironmentDescriptorId
	
	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSAE.SchoolId