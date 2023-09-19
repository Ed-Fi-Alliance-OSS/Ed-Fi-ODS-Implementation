/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-20-2023
 * Desc:	This script creates a Calendar view from the Calendars Ed-Fi Resource.
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_calendars
AS 

SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,CalendarCode
	,SchoolYear
	,CalendarType.CodeValue				[CalendarTypeCode]
	,CalendarType.Description			[CalendarTypeDescription]
	,(	SELECT TOP 1 
			VGL.GradeLevelCode
		FROM 
			edfi.CalendarGradeLevel COGL WITH (NOLOCK) 
		
			LEFT JOIN nmped_rpt.vw_gradeLevels VGL WITH (NOLOCK)
				ON (VGL.GradeLevelDescriptorId = COGL.GradeLevelDescriptorId)
		WHERE
			COGL.CalendarCode = C.CalendarCode
			AND COGL.SchoolId = C.SchoolId
		ORDER BY
			VGL.[GradeLevelOrder] ASC) [MinGradeLvl]

	,(	SELECT TOP 1
			VGL.GradeLevelCode
		FROM 
			edfi.CalendarGradeLevel COGL WITH (NOLOCK)
			
			LEFT JOIN nmped_rpt.vw_gradeLevels VGL WITH (NOLOCK)
				ON (VGL.GradeLevelDescriptorId = COGL.GradeLevelDescriptorId)
		WHERE
			COGL.CalendarCode = C.CalendarCode 
			AND COGL.SchoolId = C.SchoolId
		ORDER BY
			VGL.[GradeLevelOrder] DESC) [MaxGradeLvl]

	,[GradeRange]=STUFF((	SELECT 
								',' + VGL.GradeLevelCode
							FROM 
								edfi.CalendarGradeLevel COGL WITH (NOLOCK)

								LEFT JOIN nmped_rpt.vw_gradeLevels VGL WITH (NOLOCK)
								ON (VGL.GradeLevelDescriptorId = COGL.GradeLevelDescriptorId) 
							WHERE
								COGL.CalendarCode = C.CalendarCode
								AND COGL.SchoolId = C.SchoolId
							ORDER BY 
								VGL.[GradeLevelOrder] ASC FOR XML PATH(''))
					,1
					,1
					,'')
	,C.CreateDate
	,C.LastModifiedDate
	,C.Id AS [CalendarId]
FROM
	edfi.Calendar C WITH (NOLOCK)

	LEFT JOIN edfi.Descriptor CalendarType WITH (NOLOCK)
		ON CalendarType.DescriptorId = C.CalendarTypeDescriptorId

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = C.SchoolId