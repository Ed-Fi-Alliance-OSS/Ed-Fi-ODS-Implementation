/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-20-2023
 * Desc:	This script creates a CalendarDates from the CalendarDates resource
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_calendarDates
AS
SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,CalendarEvent.CodeValue							'CalendarEventCode'
	,CalendarEvent.Description							'CalendarEventDescription'
	,CD.Date
	,CD.CalendarCode
	,CD.SchoolYear

	--table CreateDate/LastModifiedDate
	,CD.CreateDate
	,CD.LastModifiedDate
	,CD.Id AS [CalendarDateId]
FROM 
	edfi.CalendarDate CD WITH (NOLOCK)

	LEFT JOIN edfi.CalendarDateCalendarEvent CDCE WITH (NOLOCK)
		ON CD.CalendarCode = CDCE.CalendarCode
		AND CD.Date = CDCE.Date
		AND CD.SchoolId = CDCE.SchoolId
		AND CD.SchoolYear = CDCE.SchoolYear

	LEFT JOIN edfi.Descriptor CalendarEvent WITH (NOLOCK)
		ON CalendarEvent.DescriptorId = CDCE.CalendarEventDescriptorId

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = CD.SchoolId