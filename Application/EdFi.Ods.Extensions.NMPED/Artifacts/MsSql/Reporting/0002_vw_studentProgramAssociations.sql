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
 */

IF EXISTS 
(
	SELECT 
		1 
	FROM 
		sys.views
		JOIN sys.schemas
			ON views.schema_id = schemas.schema_id
	WHERE 
		views.name = 'vw_studentProgramAssociations'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_studentProgramAssociations;
GO

CREATE VIEW nmped_rpt.vw_studentProgramAssociations AS 
SELECT
	 SUBSTRING(CAST(GSPA.EducationOrganizationId AS VARCHAR(10)), 3, 3)		[DistrictCode]
	,EO2.NameOfInstitution													[DistrictName]
	,GSPA.EducationOrganizationId
	,EO.NameOfInstitution													[SchoolName] 
	,GSPA.BeginDate
	,P.ProgramName
	,P.ProgramTypeDescriptorId
	,ProgramType.CodeValue													[ProgramTypeCode]
	,ProgramType.Description												[ProgramTypeDescription]
	,ProgramId
	,StudentUniqueId
	,EndDate
--	,participationStatus not collected
--	,programParticipationStatuses not collected
	,ReasonExitedDescriptorId
	,ReasonExited.CodeValue													[ReasonExitedCode]
	,ReasonExited.Description												[ReasonExitedDescription]
	,ServedOutsideOfRegularSession
--	,services not collected
	,BEPProgramLanguageDescriptorId
	,BEPProgramLanguage.CodeValue											[BEPProgramLanguageCode]
	,BEPProgramLanguage.Description											[BEPProgramLanguageDescription]
	,ParticipationInformationDescriptorId
	,ParticipationInformation.CodeValue										[ParticipationInformationCode]
	,ParticipationInformation.Description									[ParticipationInformationDescription]
	,ProgramIntensityDescriptorId
	,ProgramIntensity.CodeValue												[ProgramIntensityCode]
	,ProgramIntensity.Description											[ProgramIntensityDescription]
	,GSPA.CreateDate
	,GSPA.LastModifiedDate
FROM
	edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON GSPA.StudentUSI = S.StudentUSI

	JOIN edfi.Program P WITH (NOLOCK)
		ON P.EducationOrganizationId = GSPA.ProgramEducationOrganizationId
		AND P.ProgramName = GSPA.ProgramName
		AND P.ProgramTypeDescriptorId = GSPA.ProgramTypeDescriptorId

	LEFT JOIN nmped.StudentProgramAssociationExtension SPAE WITH (NOLOCK)
		ON SPAE.BeginDate = GSPA.BeginDate
		AND SPAE.EducationOrganizationId = GSPA.EducationOrganizationId
		AND SPAE.ProgramEducationOrganizationId = GSPA.ProgramEducationOrganizationId
		AND SPAE.ProgramName = GSPA.ProgramName
		AND SPAE.ProgramTypeDescriptorId = GSPA.ProgramTypeDescriptorId
		AND SPAE.StudentUSI = GSPA.StudentUSI
	
	LEFT JOIN edfi.Descriptor ProgramType WITH (NOLOCK)
		ON ProgramType.DescriptorId = GSPA.ProgramTypeDescriptorId

	LEFT JOIN edfi.Descriptor ReasonExited WITH (NOLOCK)
		ON ReasonExited.DescriptorId = GSPA.ReasonExitedDescriptorId

	LEFT JOIN edfi.Descriptor ParticipationInformation WITH (NOLOCK)
		ON ParticipationInformation.DescriptorId = SPAE.ParticipationInformationDescriptorId

	LEFT JOIN edfi.Descriptor ProgramIntensity WITH (NOLOCK)
		ON ProgramIntensity.DescriptorId = SPAE.ProgramIntensityDescriptorId

	LEFT JOIN edfi.Descriptor BEPProgramLanguage WITH (NOLOCK)
		ON BEPProgramLanguage.DescriptorId = SPAE.BEPProgramLanguageDescriptorId

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = GSPA.EducationOrganizationId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(GSPA.EducationOrganizationId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'