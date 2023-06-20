/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Johnathon Garcia | Ed-Fi Student View
* Email: johnathon.garcia@ped.nm.gov
* Date: 3/1/2023
* Desc: This view is to give a representation of the District and School associated together.

* Alt Id:	001
* By:		Collin Neville | Nunya bizness
* Email:	collin.neville@ped.nm.gov
* Date:		03/22/2023
* Alt Desc:	Added the first Day and last day for each school,
*			calculated from edfi.CalendarDate

* Alt Id:	002
* By:		Collin Neville | Nunya bizness
* Email:	collin.neville@ped.nm.gov
* Date:		03/24/2023
* Alt Desc:	Adding district records in the school column to account
*			for local charters sending school codes for district ownership
*/


CREATE OR ALTER VIEW nmped_rpt.vw_district_location AS 
SELECT DISTINCT
	 EO_Dist.EducationOrganizationId					[EducationOrganizationId_District]
	,LEFT(RIGHT(EO_Dist.EducationOrganizationId, 6), 3)	[DistrictCode]
	,EO_Dist.NameOfInstitution							[DistrictName]
	,S.SchoolId											[EducationOrganizationId_School]
	,RIGHT(EO_School.EducationOrganizationId, 3)		[LocationCode]
	,EO_School.NameOfInstitution						[SchoolName]
	,EO_School.CreateDate								[EducationOrganization_CreateDate]
	,EO_School.LastModifiedDate							[EducationOrganization_LastModifiedDate]
	,MIN(CD.Date) OVER (PARTITION BY CD.SchoolId)		[FirstDay]	--001
	,MAX(CD.Date) OVER (PARTITION BY CD.SchoolId)		[LastDay]	--001

FROM edfi.School S WITH (NOLOCK)

JOIN edfi.EducationOrganization EO_School WITH (NOLOCK)
	ON EO_School.EducationOrganizationId = S.SchoolId 

JOIN edfi.EducationOrganization EO_Dist WITH (NOLOCK)
	ON EO_Dist.EducationOrganizationId = S.LocalEducationAgencyId

LEFT JOIN edfi.CalendarDate CD WITH (NOLOCK) --001
	ON CD.SchoolId = S.SchoolId

/* 002 Start Block */ 
UNION 

SELECT 
	 EducationOrganizationId					[EducationOrganizationId_District]
	,LEFT(RIGHT(EducationOrganizationId, 6), 3) [DistrictCode]
	,EO.NameOfInstitution						[DistrictName]
	,EducationOrganizationId					[EducationOrganizationId_School]
	,RIGHT(EducationOrganizationId, 3)			[LocationCode]
	,EO.NameOfInstitution						[SchoolName]
	,EO.CreateDate								[EducationOrganization_CreateDate]
	,EO.LastModifiedDate						[EducationOrganization_LastModifiedDate]
	,NULL 										[FirstDay]
	,NULL 										[LastDay]
FROM
	edfi.EducationOrganization EO WITH (NOLOCK)
WHERE
	EducationOrganizationId LIKE '%000'
/* 002 End Block */

GO