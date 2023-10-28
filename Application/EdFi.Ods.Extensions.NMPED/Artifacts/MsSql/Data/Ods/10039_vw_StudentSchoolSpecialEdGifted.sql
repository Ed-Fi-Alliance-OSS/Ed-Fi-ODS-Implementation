/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Cody Misplay | App Doodle Doo
 * Email:	cody.misplay@ped.nm.gov
 * Date:	05/01/2023
 * Desc:	This script creates a Student School Association View for Special Education and Gifted Students.
 *			It uses the following tables:
 *
 * Alt Id: 001 (Increment value each change)
 * By:		<DEV NAME> | <DEV TITLE>
 * Email:	<DEV EMAIL>
 * Date:	<DATE OF UPDATE>
 * Alt Desc:<ALTERATION DESCRIPTION>
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_StudentSchoolSpecialEdGifted] AS 

-- Get Descriptors in CTE to improve performance
WITH cte_Descriptors AS (
SELECT [DescriptorId]
	  ,[Namespace]
	  ,[CodeValue]
	  ,[ShortDescription]
	  ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN (
	SELECT LevelOfIntegrationDescriptorId FROM nmped.LevelOfIntegrationDescriptor WITH (NOLOCK)
	UNION
	SELECT StudentCharacteristicDescriptorId FROM edfi.StudentCharacteristicDescriptor WITH (NOLOCK)
	UNION
	SELECT ProgramTypeDescriptorId FROM edfi.ProgramTypeDescriptor WITH (NOLOCK)
	UNION
	SELECT GradeLevelDescriptorId FROM edfi.GradeLevelDescriptor WITH (NOLOCK)
	UNION
	SELECT ExitWithdrawTypeDescriptorId FROM edfi.ExitWithdrawTypeDescriptor WITH (NOLOCK)
	UNION
	SELECT EntryTypeDescriptorId FROM edfi.EntryTypeDescriptor WITH (NOLOCK))
)

SELECT 
	--standard school/district columns :Stats: 260412, 263068 after join (?), 274794 after second join (?)
	 VDL.EducationOrganizationId_District AS [DistrictId]
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School AS [SchoolId]
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,SSA.StudentUSI
	,S.StudentUniqueId
	,S.LastSurname + ', ' + S.FirstName AS [StudentName]
	,S.BirthDate
	,SSA.EntryDate
	,EntryType.CodeValue AS [EntryTypeCode]
	,SSA.SchoolYear
	,EntryGradeLevel.CodeValue AS [GradeLevel]
	,SSA.ExitWithdrawDate AS [ExitDate]
	,ExitWithdrawType.CodeValue AS [ExitWithdrawTypeCode]
	,CASE WHEN SPED.SpecialEducationLevelOfIntegrationDescriptorId IS NULL THEN 'N' ELSE 'Y' END AS [SpecialEdIndicator]
	,SPED_Integration.CodeValue AS [SpecialEdLevelOfIntegration]
	,GSPA.BeginDate AS [SpecialEdBeginDate]
	,GSPA.EndDate AS [SpecialEdEndDate]
	,CASE WHEN SEOASCE.GiftedLevelOfIntegrationDescriptorId IS NULL THEN 'N' ELSE 'Y' END AS [GiftedIndicator]
	,Gifted_Integration.CodeValue AS [GiftedLevelOfIntegration]
FROM edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
-- Student Data Join
INNER JOIN edfi.Student S WITH (NOLOCK)
	ON (S.StudentUSI = SSA.StudentUSI)
-- District/Location Join
INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON (VDL.EducationOrganizationId_School = SSA.SchoolId)
-- Special Education Join - Only on District as Students may be off-site but receiving services from the district
LEFT JOIN nmped.StudentSpecialEducationProgramAssociationExtension SPED WITH (NOLOCK)
	ON (SPED.StudentUSI = SSA.StudentUSI
		AND (SPED.ProgramEducationOrganizationId = VDL.EducationOrganizationId_District))
-- Gifted student join (StudentEdOrgAssocStudentCharacteristic)
LEFT JOIN nmped.StudentEducationOrganizationAssociationStudentCharacteristicExtension SEOASCE WITH (NOLOCK)
	ON (SEOASCE.StudentUSI = SSA.StudentUSI
		AND (SEOASCE.EducationOrganizationId = VDL.EducationOrganizationId_School
			OR SEOASCE.EducationOrganizationId = VDL.EducationOrganizationId_District)
		AND SEOASCE.StudentCharacteristicDescriptorId = (SELECT DescriptorId FROM cte_Descriptors WHERE CodeValue = 'Gifted'))
-- General Student Program Association Join to get SPED EndDate
LEFT JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
	ON (GSPA.StudentUSI = SPED.StudentUSI
		AND GSPA.BeginDate = SPED.BeginDate
		AND GSPA.EducationOrganizationId = SPED.EducationOrganizationId
		AND GSPA.ProgramEducationOrganizationId = SPED.ProgramEducationOrganizationId
		AND GSPA.ProgramTypeDescriptorId = SPED.ProgramTypeDescriptorId
		AND GSPA.ProgramName = SPED.ProgramName)
-- Descriptor Joins - SSA
LEFT JOIN cte_Descriptors EntryGradeLevel WITH (NOLOCK)
	ON (EntryGradeLevel.DescriptorId = SSA.EntryGradeLevelDescriptorId)
LEFT JOIN cte_Descriptors ExitWithdrawType WITH (NOLOCK)
	ON (ExitWithdrawType.DescriptorId = SSA.ExitWithdrawTypeDescriptorId)
LEFT JOIN cte_Descriptors EntryType WITH (NOLOCK)
	ON (EntryType.DescriptorId = SSA.EntryTypeDescriptorId)
-- Descriptor Joins - SPED
LEFT JOIN cte_Descriptors SPED_Integration WITH (NOLOCK)
	ON (SPED_Integration.DescriptorId = SPED.SpecialEducationLevelOfIntegrationDescriptorId)
-- Descriptor Joins - Gifted
LEFT JOIN cte_Descriptors Gifted_Integration WITH (NOLOCK)
	ON (Gifted_Integration.DescriptorId = SEOASCE.GiftedLevelOfIntegrationDescriptorId)
LEFT JOIN cte_Descriptors Gifted_Characteristic WITH (NOLOCK)
	ON (Gifted_Characteristic.DescriptorId = SEOASCE.StudentCharacteristicDescriptorId)
GO

