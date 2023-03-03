/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-24-2023
 * Desc:	This script creates a StudentCTEProgramAssociation view
 *			from the:
 *						studentCTEProgramAssociations resource
 *						studentCTEProgramAssociationCredentials resource
 *			
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
		views.name = 'vw_studentCTEProgramAssociations'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_studentCTEProgramAssociations;
GO

CREATE VIEW vw_studentCTEProgramAssociations AS 
SELECT
	 SUBSTRING(CAST(SCTEPA.EducationOrganizationId AS VARCHAR(10)), 3, 3)	[DistrictCode]
	,EO2.NameOfInstitution													[DistrictName]
	,SUBSTRING(CAST(SCTEPA.EducationOrganizationId AS VARCHAR(10)), 6, 3)	[SchoolCode]
	,EO.NameOfInstitution													[SchoolName] 
	,SCTEPA.BeginDate
	,SCTEPA.ProgramEducationOrganizationId
	,SCTEPA.ProgramName
	,SCTEPA.ProgramTypeDescriptorId
	,ProgramType.CodeValue													[ProgramTypeCode]
	,ProgramType.Description												[ProgramTypeDescription]
	,StudentUniqueId
	,CareerPathwayDescriptorId
	,CareerPathway.CodeValue												[CareerPathwayCode]
	,CareerPathway.Description												[CareerPathwayDescription]
	,CIPCode
	,CTEProgramCompletionIndicator
	,PrimaryCTEProgramIndicator
--	,cteProgramServices not collected
	,EndDate
	,NonTraditionalGenderStatus
--	,participationStatus not collected
	,PrivateCTEProgram
--	,programParticipationStatuses not collected
	,ReasonExitedDescriptorId
	,ReasonExited.CodeValue													[ReasonExitedCode]
	,ReasonExited.Description												[ReasonExitedDescription]
	,ServedOutsideOfRegularSession
--	,services not collected
	,TechnicalSkillsAssessmentDescriptorId
	,TechnicalSkillsAssessment.CodeValue									[TechnicalSkillsAssessmentCode]
	,TechnicalSkillsAssessment.Description									[TechnicalSkillsAssessmentDescription]

	,CredentialEarnedDate
	,IndustryCredentialDescriptorId
	,IndustryCredential.CodeValue											[IndustryCredentialCode]
	,IndustryCredential.Description											[IndustryCredentialDescription]
	,ProgramDeliveryMethodDescriptorId
	,ProgramDeliveryMethod.CodeValue										[ProgramDeliveryMethodCode]
	,ProgramDeliveryMethod.Description										[ProgramDeliveryMethodDescription]

	,SCTEPACTEP.CreateDate
FROM 
	edfi.StudentCTEProgramAssociation SCTEPA WITH (NOLOCK)

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SCTEPA.StudentUSI

	LEFT JOIN edfi.StudentCTEProgramAssociationCTEProgram SCTEPACTEP WITH (NOLOCK)
		ON SCTEPA.BeginDate = SCTEPACTEP.BeginDate
		AND SCTEPA.EducationOrganizationId = SCTEPACTEP.EducationOrganizationId
		AND SCTEPA.ProgramEducationOrganizationId = SCTEPACTEP.ProgramEducationOrganizationId
		AND SCTEPA.ProgramName = SCTEPACTEP.ProgramName
		AND SCTEPA.ProgramTypeDescriptorId = SCTEPACTEP.ProgramTypeDescriptorId
		AND SCTEPA.StudentUSI = SCTEPACTEP.StudentUSI

	LEFT JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
		ON SCTEPA.BeginDate = GSPA.BeginDate
		AND SCTEPA.EducationOrganizationId = GSPA.EducationOrganizationId
		AND SCTEPA.ProgramEducationOrganizationId = GSPA.ProgramEducationOrganizationId
		AND SCTEPA.ProgramName = GSPA.ProgramName
		AND SCTEPA.ProgramTypeDescriptorId = GSPA.ProgramTypeDescriptorId
		AND SCTEPA.StudentUSI = GSPA.StudentUSI

	LEFT JOIN nmped.StudentCTEProgramAssociationCredential SCTEPAC WITH (NOLOCK)
		ON SCTEPAC.BeginDate = SCTEPA.BeginDate
		AND SCTEPAC.EducationOrganizationId = SCTEPA.EducationOrganizationId
		AND SCTEPAC.ProgramEducationOrganizationId = SCTEPA.ProgramEducationOrganizationId
		AND SCTEPAC.ProgramName = SCTEPA.ProgramName
		AND SCTEPAC.ProgramTypeDescriptorId = SCTEPA.ProgramTypeDescriptorId
		AND SCTEPAC.StudentUSI = SCTEPA.StudentUSI

	LEFT JOIN edfi.Descriptor ProgramType WITH (NOLOCK)
		ON ProgramType.DescriptorId = SCTEPA.ProgramTypeDescriptorId

	LEFT JOIN edfi.Descriptor CareerPathway WITH (NOLOCK)
		ON CareerPathway.DescriptorId = SCTEPACTEP.CareerPathwayDescriptorId

	LEFT JOIN edfi.Descriptor ReasonExited WITH (NOLOCK)
		ON ReasonExited.DescriptorId = GSPA.ReasonExitedDescriptorId

	LEFT JOIN edfi.Descriptor TechnicalSkillsAssessment WITH (NOLOCK)
		ON ReasonExited.DescriptorId = SCTEPA.TechnicalSkillsAssessmentDescriptorId

	LEFT JOIN edfi.Descriptor IndustryCredential WITH (NOLOCK)
		ON IndustryCredential.DescriptorId = SCTEPAC.IndustryCredentialDescriptorId

	LEFT JOIN edfi.Descriptor ProgramDeliveryMethod WITH (NOLOCK)
		ON ProgramDeliveryMethod.DescriptorId = SCTEPAC.ProgramDeliveryMethodDescriptorId

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = SCTEPA.EducationOrganizationId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(SCTEPA.EducationOrganizationId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'