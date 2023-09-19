/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a CourseOffering view from the courseOfferings resource
 *
 */


CREATE OR ALTER VIEW nmped_rpt.vw_courseOfferings AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,LocalCourseCode
	,CourseCode
	,SchoolYear
	,SessionName
--	,courseLevelCharacteristics not collected
--  ,curriculumUseds not collected
	,InstructionalTimePlanned
	,LocalCourseTitle
--	,offeredGradeLevels not collected
	,CO.CreateDate
	,CO.LastModifiedDate
	,CO.Id AS [CourseOfferingId]
FROM
	edfi.CourseOffering CO WITH (NOLOCK)

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = CO.SchoolId
