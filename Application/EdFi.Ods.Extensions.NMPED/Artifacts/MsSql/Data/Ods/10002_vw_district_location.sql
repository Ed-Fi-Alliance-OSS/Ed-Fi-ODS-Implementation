/****** Object:  View [nmped_rpt].[vw_district_location]    Script Date: 6/20/2023 12:32:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Johnathon Garcia | Ed-Fi Student View
* Email: johnathon.garcia@ped.nm.gov
* Date: 3/1/2023
* Desc: This view is to give a representation of the District and School associated together.

* Alt Id:	001
* By:		Collin Neville | App Dev I
* Email:	collin.neville@ped.nm.gov
* Date:		03/22/2023
* Alt Desc:	Added the first Day and last day for each school,
*			calculated from edfi.CalendarDate
*
* Alt Id:	002
* By:		Collin Neville | App Dev I
* Email:	collin.neville@ped.nm.gov
* Date:		03/24/2023
* Alt Desc:	Adding district records in the school column to account
*			for local charters sending school codes for district ownership
*
* Alt Id:	003
* By:		Collin Neville | App Dev I
* Email:	collin.neville@ped.nm.gov
* Date:		05/17/2023
* Alt Desc:	Adding DistrictOrgType and LocationOrgType to differentiate between Charter/School/State etc.
*/

CREATE OR ALTER   VIEW [nmped_rpt].[vw_district_location] AS 
/* 001 Start Block */
WITH cte_CalendarDays AS (
	SELECT
		 CD.SchoolId
		,MIN(CD.Date) 'FirstDay'
		,MAX(CD.Date) 'LastDay'
		,COUNT(DISTINCT CD.Date) 'NumDays'
	FROM 
		edfi.CalendarDate CD WITH (NOLOCK)
		JOIN edfi.CalendarDateCalendarEvent CDCE WITH (NOLOCK)	
			ON CDCE.CalendarCode = CD.CalendarCode
			AND CDCE.Date = CD.Date
			AND CDCE.SchoolId = CD.SchoolId
			AND CDCE.SchoolYear = CD.SchoolYear
		JOIN edfi.Descriptor CalendarEvent WITH (NOLOCK)
			ON CalendarEvent.DescriptorId = CDCE.CalendarEventDescriptorId
			AND CalendarEvent.CodeValue IN ('ELTP','ELTP+K5P', 'Instructional Day', 'K5P')
	GROUP BY 
		CD.SchoolId
)
/* 001 End Block */

SELECT DISTINCT
	 EO_Dist.EducationOrganizationId					[EducationOrganizationId_District]
	,LEFT(RIGHT(EO_Dist.EducationOrganizationId, 6), 3)	[DistrictCode]
	,EO_Dist.NameOfInstitution							[DistrictName]
	,S.SchoolId											[EducationOrganizationId_School]
	,RIGHT(EO_School.EducationOrganizationId, 3)		[LocationCode]
	,EO_School.NameOfInstitution						[SchoolName]
	,EO_School.CreateDate								[EducationOrganization_CreateDate]
	,EO_School.LastModifiedDate							[EducationOrganization_LastModifiedDate]
	,cte_CalendarDays.FirstDay --001				
	,cte_CalendarDays.LastDay --001
	,cte_CalendarDays.NumDays --001						[Total_Session_Days]
	,LEACategory.CodeValue								[DistrictOrgType] --003
	,EOCategory.CodeValue								[LocationOrgType] --003
	,SchoolCat.ShortDescription							[SchoolCategory]

FROM edfi.School S WITH (NOLOCK)

	JOIN edfi.EducationOrganization EO_School WITH (NOLOCK)
		ON EO_School.EducationOrganizationId = S.SchoolId 

	JOIN edfi.EducationOrganization EO_Dist WITH (NOLOCK)
		ON EO_Dist.EducationOrganizationId = S.LocalEducationAgencyId
	-- 003 Start Block
	JOIN edfi.EducationOrganizationCategory EOC WITH (NOLOCK)
		ON EOC.EducationOrganizationId = S.SchoolId
	
	JOIN edfi.Descriptor EOCategory WITH (NOLOCK)
		ON EOCategory.DescriptorId = EOC.EducationOrganizationCategoryDescriptorId

	LEFT JOIN edfi.LocalEducationAgency LEA WITH (NOLOCK)
		ON LEA.LocalEducationAgencyId = EO_Dist.EducationOrganizationId

	LEFT JOIN edfi.Descriptor LEACategory WITH (NOLOCK)
		ON LEACategory.DescriptorId = LEA.LocalEducationAgencyCategoryDescriptorId
	-- 003 End Block
	LEFT JOIN cte_CalendarDays 
		ON cte_CalendarDays.SchoolId = S.SchoolId

	LEFT JOIN edfi.SchoolCategory SC WITH (NOLOCK)	
		ON SC.SchoolId = S.SchoolId

	LEFT JOIN edfi.Descriptor SchoolCat WITH (NOLOCK)
		ON SchoolCat.DescriptorId = SC.SchoolCategoryDescriptorId

/* 002 Start Block */ 
UNION 

SELECT 
	 EO.EducationOrganizationId					[EducationOrganizationId_District]
	,LEFT(RIGHT(EO.EducationOrganizationId, 6), 3) [DistrictCode]
	,EO.NameOfInstitution						[DistrictName]
	,EO.EducationOrganizationId					[EducationOrganizationId_School]
	,RIGHT(EO.EducationOrganizationId, 3)		[LocationCode]
	,EO.NameOfInstitution						[SchoolName]
	,EO.CreateDate								[EducationOrganization_CreateDate]
	,EO.LastModifiedDate						[EducationOrganization_LastModifiedDate]
	,NULL 										[FirstDay]
	,NULL 										[LastDay]
	,NULL										[Total_Days_In_Session]
	,CASE
		WHEN EO.EducationOrganizationId = '35000000'
		THEN 'State'
		ELSE LEACategory.CodeValue	END AS		[DistrictOrgType] --003
	,EOCategory.CodeValue						[LocationOrgType] --003
	,'Central Office'							[SchoolCategory]
FROM
	edfi.EducationOrganization EO WITH (NOLOCK)
-- 003 Start Block
	JOIN edfi.EducationOrganizationCategory EOC WITH (NOLOCK)
		ON EOC.EducationOrganizationId = EO.EducationOrganizationId
	
	JOIN edfi.Descriptor EOCategory WITH (NOLOCK)
		ON EOCategory.DescriptorId = EOC.EducationOrganizationCategoryDescriptorId

	LEFT JOIN edfi.LocalEducationAgency LEA WITH (NOLOCK)
		ON LEA.LocalEducationAgencyId = EO.EducationOrganizationId

	LEFT JOIN edfi.Descriptor LEACategory WITH (NOLOCK)
		ON LEACategory.DescriptorId = LEA.LocalEducationAgencyCategoryDescriptorId
-- 003 End Block
WHERE
	EO.EducationOrganizationId LIKE '%000'
/* 002 End Block */

GO


