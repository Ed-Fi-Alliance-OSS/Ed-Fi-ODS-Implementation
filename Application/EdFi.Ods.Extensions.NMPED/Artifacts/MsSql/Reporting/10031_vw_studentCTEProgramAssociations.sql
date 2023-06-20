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

CREATE OR ALTER VIEW nmped_rpt.vw_studentCTEProgramAssociations AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName		
	
	--resource documentation starts
	,StudentUniqueId
	,S.StudentUSI
	,FirstName
	,LastSurname
	,SCTEPA.BeginDate
	,SCTEPA.ProgramEducationOrganizationId
	,SCTEPA.ProgramName
	,ProgramType.CodeValue													[ProgramTypeCode]
	,ProgramType.Description												[ProgramTypeDescription]

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
	,ReasonExited.CodeValue													[ReasonExitedCode]
	,ReasonExited.Description												[ReasonExitedDescription]
	,ServedOutsideOfRegularSession
--	,services not collected
	,TechnicalSkillsAssessment.CodeValue									[TechnicalSkillsAssessmentCode]
	,TechnicalSkillsAssessment.Description									[TechnicalSkillsAssessmentDescription]
	,CredentialEarnedDate
	,IndustryCredential.CodeValue											[IndustryCredentialCode]
	,IndustryCredential.Description											[IndustryCredentialDescription]
	,ProgramDeliveryMethod.CodeValue										[ProgramDeliveryMethodCode]
	,ProgramDeliveryMethod.Description										[ProgramDeliveryMethodDescription]

	--table CreateDate/LastModifiedDate
	,SCTEPACTEP.CreateDate
FROM 
	edfi.StudentCTEProgramAssociation SCTEPA WITH (NOLOCK)

	INNER JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SCTEPA.StudentUSI

	LEFT JOIN edfi.StudentCTEProgramAssociationCTEProgram SCTEPACTEP WITH (NOLOCK)
		ON SCTEPA.BeginDate = SCTEPACTEP.BeginDate
		AND SCTEPA.EducationOrganizationId = SCTEPACTEP.EducationOrganizationId
		AND SCTEPA.ProgramEducationOrganizationId = SCTEPACTEP.ProgramEducationOrganizationId
		AND SCTEPA.ProgramName = SCTEPACTEP.ProgramName
		AND SCTEPA.ProgramTypeDescriptorId = SCTEPACTEP.ProgramTypeDescriptorId
		AND SCTEPA.StudentUSI = SCTEPACTEP.StudentUSI

	JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
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

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SCTEPA.EducationOrganizationId