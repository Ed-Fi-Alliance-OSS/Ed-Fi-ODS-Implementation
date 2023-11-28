/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-10-2023
 * Desc:	This script creates a studentLanuageInstructionProgramAssociations view 
 *			from the studentLanuageInstructionProgramAssociations resource
 * 
 * ALT ID 001: Added LEP (Limited English Proficiency)
 * By: Collin Neville
 */


CREATE  OR ALTER   VIEW [nmped_rpt].[vw_studentLanguageInstructionProgramAssociations] AS
SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,StudentUniqueId
	,SLIPA.StudentUSI
	,FirstName
	,LastSurname
	,SLIPA.BeginDate
	,SLIPA.EducationOrganizationId
	,LEP.CodeValue					[LEP Code] --Alt ID 001
	,LEP.Description				[LEP]
	,SLIPA.ProgramName
	,ProgramType.CodeValue			[ProgramTypeCode]
	,ProgramType.Description		[ProgramTypeDescription]
	,Dosage
	,EndDate
	,EnglishLearnerParticipation
	,ReasonExited.CodeValue			[ReasonExitedCode]
	,ReasonExited.Description		[ReasonExitedDescription]
	,ServedOutsideOfRegularSession

	/* Alt ID 001 Start */ 
	,CASE	WHEN ISNUMERIC(RIGHT(SLIPA.ProgramName, 1)) = 0 THEN NULL
			ELSE RIGHT(SLIPA.ProgramName, 1)
	 END 'Participation Information Code'
	,CASE	WHEN ISNUMERIC(RIGHT(SLIPA.ProgramName, 1)) = 0 THEN NULL
			ELSE 
				(SELECT Description
				 FROM	edfi.Descriptor
				 WHERE	NameSpace = 'uri://nmped.org/ParticipationInformationDescriptor'
				 AND CodeValue =	RIGHT(SLIPA.ProgramName, 1)
				)
	 END 'Participation Information'
	 /* Alt ID 001 End */ 
	--table CreateDate/LastModifiedDate
	,GSPA.CreateDate
	,GSPA.LastModifiedDate
FROM 
	edfi.StudentLanguageInstructionProgramAssociation SLIPA WITH (NOLOCK)

	LEFT JOIN edfi.StudentEducationOrganizationAssociation SEOA WITH (NOLOCK)
		ON SEOA.StudentUSI = SLIPA.StudentUSI
		AND (SEOA.EducationOrganizationId = SLIPA.ProgramEducationOrganizationId
			OR (LEFT(SEOA.EducationOrganizationId, 5) + '000' = SLIPA.EducationOrganizationId
				AND SLIPA.EducationOrganizationId = SLIPA.ProgramEducationOrganizationId))

	INNER JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
		ON GSPA.BeginDate = SLIPA.BeginDate
		AND GSPA.EducationOrganizationId = SLIPA.EducationOrganizationId
		AND GSPA.ProgramEducationOrganizationId = SLIPA.ProgramEducationOrganizationId
		AND GSPA.ProgramName = SLIPA.ProgramName
		AND GSPA.ProgramTypeDescriptorId = SLIPA.ProgramTypeDescriptorId
		AND GSPA.StudentUSI = SLIPA.StudentUSI

	INNER JOIN edfi.Student S WITH (NOLOCK)
		ON SLIPA.StudentUSI = S.StudentUSI

	LEFT JOIN edfi.Descriptor ProgramType WITH (NOLOCK)
		ON ProgramType.DescriptorId = SLIPA.ProgramTypeDescriptorId

	LEFT JOIN edfi.Descriptor ReasonExited WITH (NOLOCK)
		ON ReasonExited.DescriptorId = GSPA.ReasonExitedDescriptorId

	LEFT JOIN edfi.Descriptor LEP WITH (NOLOCK)
		ON LEP.DescriptorId = SEOA.LimitedEnglishProficiencyDescriptorId

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SLIPA.EducationOrganizationId