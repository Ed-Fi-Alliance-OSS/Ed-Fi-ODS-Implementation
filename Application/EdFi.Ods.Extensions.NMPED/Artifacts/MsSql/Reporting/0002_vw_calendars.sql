/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-20-2023
 * Desc:	This script creates a Calendar view from the Calendars Ed-Fi Resource.
 *			This view COMBINES the resources Calendars and CalendarDates
 *
 */

 IF EXISTS 
(
	SELECT 
		1 
	FROM 
		sys.views
		JOIN sys.schemas
			ON views.schema_id = schemas.schema_id
	WHERE 
		views.name = 'vw_calendars'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_calendars;
GO

CREATE VIEW nmped_rpt.vw_calendars AS 
SELECT 
	SUBSTRING(CAST(C.SchoolId AS VARCHAR(10)), 3, 3)	'DistrictCode'
	,EO2.NameOfInstitution								'DistrictName'
	,C.SchoolId
	,EO.NameOfInstitution								'SchoolName'
	,C.CalendarCode
	,C.SchoolYear
	,C.CalendarTypeDescriptorId
	,CalendarType.CodeValue								'CalendarTypeCode'
	,CalendarType.Description							'CalendarTypeDescription'

	,CDCE.CalendarEventDescriptorId
	,CalendarEvent.CodeValue							'CalendarEventCode'
	,CalendarEvent.Description							'CalendarEventDescription'
	,CDCE.Date

	,C.CreateDate
	,C.LastModifiedDate
FROM 
	edfi.Calendar C WITH (NOLOCK)

	JOIN edfi.CalendarDate CD WITH (NOLOCK)
		ON C.CalendarCode = CD.CalendarCode
		AND C.SchoolId = CD.SchoolId
		AND C.SchoolYear = CD.SchoolYear

	JOIN edfi.CalendarDateCalendarEvent CDCE WITH (NOLOCK)
		ON CD.CalendarCode = CDCE.CalendarCode
		AND CD.Date = CDCE.Date
		AND CD.SchoolId = CDCE.SchoolId
		AND CD.SchoolYear = CDCE.SchoolYear

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = C.SchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(C.SchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'

	LEFT JOIN edfi.Descriptor CalendarEvent WITH (NOLOCK)
		ON CalendarEvent.DescriptorId = CDCE.CalendarEventDescriptorId

	LEFT JOIN edfi.Descriptor CalendarType WITH (NOLOCK)
		ON CalendarType.DescriptorId = C.CalendarTypeDescriptorId
