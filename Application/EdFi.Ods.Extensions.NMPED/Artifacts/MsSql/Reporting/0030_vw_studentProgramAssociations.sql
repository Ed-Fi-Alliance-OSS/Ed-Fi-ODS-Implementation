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

CREATE OR ALTER VIEW nmped_rpt.vw_studentProgramAssociations AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName

	--resource documentation starts													[SchoolName] 
	,GSPA.BeginDate
	,P.ProgramName
	,ProgramType.CodeValue													[ProgramTypeCode]
	,ProgramType.Description												[ProgramTypeDescription]
	,ProgramId
	,StudentUniqueId
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

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = GSPA.EducationOrganizationId