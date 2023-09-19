/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a studentSchoolAssociations view
 *			from the studentSchoolAssociations Ed-Fi Resource
 * Alt Id: 001 (Increment value each change)
 * By: Cody Misplay | App Doodle Doo
 * Email: cody.misplay@ped.nm.gov
 * Date: 04/18/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 *
 * Alt Id: 002
 * By: Jesse Kain | contractor
 * Email: douglas.kain@ped.nm.gov
 * Date: 06/12/2023
 * Alt Desc: Added columns  [DistrictOrgType],[LocationOrgType],[SchoolCategory]
 */

 CREATE OR ALTER VIEW nmped_rpt.vw_studentSchoolAssociations AS 
 
 --Alt Id: 001 - New CTE using control tables for descriptors
WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.GradeLevelDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.EntryGradeLevelReasonDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.EntryTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.ExitWithdrawTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.ResidencyStatusDescriptor WITH (NOLOCK))
)
 
 SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	-- Alt id 02 Added columns        [DistrictOrgType],[LocationOrgType],[SchoolCategory]
	,VDL.[DistrictOrgType]
	,VDL.[LocationOrgType]
	,VDL.[SchoolCategory]

	--resource documentation starts
	,S.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,EntryDate
	,CalendarCode
	,SchoolYear
	,EmployedWhileEnrolled
	,EntryGradeLevel.CodeValue			[EntryGradeLevelCode]
	,EntryGradeLevel.Description		[EntryGradeLevelDescription]
	,EntryGradeLevelReason.CodeValue	[EntryGradeLevelReasonCode]
	,EntryGradeLevelReason.Description	[EntryGradeLevelReasonDescription]
	,EntryType.CodeValue				[EntryTypeCode]
	,EntryType.Description				[EntryTypeDescription]
	,ExitWithdrawDate
	,ExitWithdrawType.CodeValue			[ExitWithdrawTypeCode]
	,ExitWithdrawType.Description		[ExitWithdrawTypeDescription]
	,FullTimeEquivalency
	,PrimarySchool
	,RepeatGradeIndicator
	,ResidencyStatus.CodeValue			[ResidencyStatusCode]
	,ResidencyStatus.Description		[ResidencyStatusDescription]
	,SchoolChoiceTransfer
	,TermCompletionIndicator

	--table CreateDate/LastModifiedDate
	,SSA.CreateDate
	,SSA.LastModifiedDate
	,SSA.Id AS [StudentSchoolAssociation_Id]
FROM 
	edfi.StudentSchoolAssociation SSA WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSA.StudentUSI
-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
	LEFT JOIN cte_Descriptors EntryGradeLevel WITH (NOLOCK)
		ON EntryGradeLevel.DescriptorId = SSA.EntryGradeLevelDescriptorId

	LEFT JOIN cte_Descriptors EntryGradeLevelReason WITH (NOLOCK)
		ON EntryGradeLevelReason.DescriptorId = SSA.EntryGradeLevelReasonDescriptorId

	LEFT JOIN cte_Descriptors EntryType WITH (NOLOCK)
		ON EntryType.DescriptorId = SSA.EntryTypeDescriptorId

	LEFT JOIN cte_Descriptors ExitWithdrawType WITH (NOLOCK)
		ON ExitWithdrawType.DescriptorId = SSA.ExitWithdrawTypeDescriptorId

	LEFT JOIN cte_Descriptors ResidencyStatus WITH (NOLOCK)
		ON ResidencyStatus.DescriptorId = SSA.ResidencyStatusDescriptorId
-- Alt Id: 001 - End Changes
	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId