/* NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a staffDevelopments view
 *			from the staffDevelopments Ed-Fi Resource
 */

CREATE OR ALTER VIEW [nmped_rpt].[vw_staffDevelopments] AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,S.StaffUniqueId
	,S.FirstName
	,S.LastSurname
	,StartDate
	,ActivityHours
	,EndDate
	,MentorIdUniqueId
	,Mentor.FirstName 'MentorFirstName'
	,Mentor.LastSurname 'MentorLastName'
	,MentorTraining
	,StaffCreditsEarned
	,StaffDevelopmentActivityCode.CodeValue		[StaffDevelopmentActivityCode]
	,StaffDevelopmentActivityCode.Description	[StaffDevelopmentActivityDescription]
	,StaffDevelopmentPurposeCode.CodeValue		[StaffDevelopmentPurposeCode]
	,StaffDevelopmentPurposeCode.Description	[StaffDevelopmentPurposeDescription]

	--table CreateDate/LastModifiedDate
	,SD.CreateDate										
	,SD.LastModifiedDate
	,SD.Id AS [StaffDevelopment_Id]
FROM
	nmped.StaffDevelopment SD WITH (NOLOCK)

	JOIN edfi.Staff S WITH (NOLOCK)
		ON S.StaffUSI = SD.StaffUSI

	LEFT JOIN edfi.Descriptor StaffDevelopmentActivityCode WITH (NOLOCK)
		ON StaffDevelopmentActivityCode.DescriptorId = SD.StaffDevelopmentActivityCodeDescriptorId

	LEFT JOIN edfi.Descriptor StaffDevelopmentPurposeCode WITH (NOLOCK)
		ON StaffDevelopmentPurposeCode.DescriptorId = SD.StaffDevelopmentPurposeCodeDescriptorId

	LEFT JOIN edfi.Staff Mentor WITH (NOLOCK)	
		ON Mentor.StaffUniqueId = SD.MentorIdUniqueId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SD.EducationOrganizationId
GO


