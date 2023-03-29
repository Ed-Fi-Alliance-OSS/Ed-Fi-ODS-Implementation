/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		JOn hickam
 * Email:	jon.hickam@gmail.com
 * Date:	02-26-2023
 * Desc:	sessions 
 *
* 
* Alt Id: 001 
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/29/2023
* Alt Desc: Updated to reduce number of joins by using nmped_rpt.vw_district_location, added NOLOCKS
*/
CREATE OR ALTER VIEW nmped_rpt.vw_sessions AS 
SELECT
	 S.SchoolYear
	,S.SchoolId
	,School.SchoolName
	,School.EducationOrganizationId_District AS [DistrictId]
	,School.DistrictName
	,S.SessionName
	,S.BeginDate
	,S.EndDate
	,S.TotalInstructionalDays
	,TermDescriptor.CodeValue AS [TermCode]
	,TermDescriptor.[Description] AS [TermDescription]
	,SUBSTRING(CAST(School.EducationOrganizationId_District AS VARCHAR(10)),3,3) AS [DistrictCode]
FROM
	 edfi.[Session] S WITH (NOLOCK)
LEFT JOIN nmped_rpt.vw_district_location School WITH (NOLOCK)
	ON (School.EducationorganizationId_School = S.SchoolId)
LEFT JOIN edfi.Descriptor TermDescriptor WITH (NOLOCK)
	ON (TermDescriptor.DescriptorId = S.TermDescriptorId)