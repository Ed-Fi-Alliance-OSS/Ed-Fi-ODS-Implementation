/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-23-2023
 * Desc:	This script creates a Program view from the programs resource
 *			
 *			We are also combining the studentProgramAssociations resource
 *
 * Alt Id: 001 (Increment value each change)
 * By: Cody Misplay | App Doodle Doo
 * Email: cody.misplay@ped.nm.gov
 * Date: 04/18/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentProgramAssociations] AS 
--Alt Id: 001 - New CTE using control tables for descriptors
WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.ProgramTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.ReasonExitedDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.ParticipationInformationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.ProgramIntensityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.LanguageDescriptor WITH (NOLOCK))
--WHERE DescriptorId IN -- Alternate WHERE clause for descriptors used by this view, in case they aren't in control tables
--(SELECT D.DescriptorId FROM edfi.Descriptor D WITH (NOLOCK)
--WHERE D.[Namespace] IN ('uri://nmped.org/ProgramTypeDescriptor'
--,'uri://tpdm.ed-fi.org/ProgramTypeDescriptor','uri://ed-fi.org/ReasonExitedDescriptor'
--,'uri://tpdm.ed-fi.org/ReasonExitedDescriptor','uri://nmped.org/ParticipationInformationDescriptor'
--,'uri://nmped.org/ProgramIntensityDescriptor', 'uri://nmped.org/LanguageDescriptor'))
)
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName

	--resource documentation starts													[SchoolName]
	,StudentUniqueId
	,S.StudentUSI
	,FirstName
	,LastSurname
	,GSPA.BeginDate
	,P.ProgramName
	,ProgramType.CodeValue													[ProgramTypeCode]
	,ProgramType.Description												[ProgramTypeDescription]
	,ProgramId
	,EndDate
--	,participationStatus not collected
--	,programParticipationStatuses not collected
	,ReasonExited.CodeValue													[ReasonExitedCode]
	,ReasonExited.Description												[ReasonExitedDescription]
	,ServedOutsideOfRegularSession
--	,services not collected
	,BEPProgramLanguage.CodeValue											[BEPProgramLanguageCode]
	,BEPProgramLanguage.Description											[BEPProgramLanguageDescription]
	,ParticipationInformation.CodeValue										[ParticipationInformationCode]
	,ParticipationInformation.Description									[ParticipationInformationDescription]
	,ProgramIntensity.CodeValue												[ProgramIntensityCode]
	,ProgramIntensity.Description											[ProgramIntensityDescription]
	
	--table CreateDate/LastModifiedDate
	,GSPA.CreateDate
	,GSPA.LastModifiedDate
	,GSPA.Id AS [StudentProgramAssociation_Id]
FROM
	edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON GSPA.StudentUSI = S.StudentUSI

	JOIN edfi.Program P WITH (NOLOCK)
		ON P.EducationOrganizationId = GSPA.ProgramEducationOrganizationId
		AND P.ProgramName = GSPA.ProgramName
		AND P.ProgramTypeDescriptorId = GSPA.ProgramTypeDescriptorId

	JOIN nmped.StudentProgramAssociationExtension SPAE WITH (NOLOCK)
		ON SPAE.BeginDate = GSPA.BeginDate
		AND SPAE.EducationOrganizationId = GSPA.EducationOrganizationId
		AND SPAE.ProgramEducationOrganizationId = GSPA.ProgramEducationOrganizationId
		AND SPAE.ProgramName = GSPA.ProgramName
		AND SPAE.ProgramTypeDescriptorId = GSPA.ProgramTypeDescriptorId
		AND SPAE.StudentUSI = GSPA.StudentUSI
-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
	LEFT JOIN cte_Descriptors ProgramType WITH (NOLOCK)
		ON ProgramType.DescriptorId = GSPA.ProgramTypeDescriptorId

	LEFT JOIN cte_Descriptors ReasonExited WITH (NOLOCK)
		ON ReasonExited.DescriptorId = GSPA.ReasonExitedDescriptorId

	LEFT JOIN cte_Descriptors ParticipationInformation WITH (NOLOCK)
		ON ParticipationInformation.DescriptorId = SPAE.ParticipationInformationDescriptorId

	LEFT JOIN cte_Descriptors ProgramIntensity WITH (NOLOCK)
		ON ProgramIntensity.DescriptorId = SPAE.ProgramIntensityDescriptorId

	LEFT JOIN cte_Descriptors BEPProgramLanguage WITH (NOLOCK)
		ON BEPProgramLanguage.DescriptorId = SPAE.BEPProgramLanguageDescriptorId
-- Alt Id: 001 - End Changes
	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = GSPA.EducationOrganizationId
GO