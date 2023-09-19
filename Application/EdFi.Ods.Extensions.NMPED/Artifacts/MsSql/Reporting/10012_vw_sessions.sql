/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a sessions view
 *			from the sessions Ed-Fi Resource
 */

 CREATE OR ALTER VIEW nmped_rpt.vw_sessions AS 
 SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,SessionName
	,SchoolYear
	,BeginDate
	,EndDate
	,Term.CodeValue		[TermCode]
	,Term.Description	[TermDescription]
	,TotalInstructionalDays

	--table CreateDate/LastModifiedDate
	,S.CreateDate										
	,S.LastModifiedDate
	,S.Id AS [Session_Id]
FROM
	edfi.Session S WITH (NOLOCK)

	LEFT JOIN edfi.Descriptor Term WITH (NOLOCK)
		ON Term.DescriptorId = S.TermDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = S.SchoolId
