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
 */

CREATE OR ALTER VIEW nmped_rpt.vw_studentLanguageInstructionProgramAssociations AS
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
	,SLIPA.StudentUSI
	,FirstName
	,LastSurname
	,SLIPA.BeginDate
	,SLIPA.EducationOrganizationId
	,SLIPA.ProgramName
	,ProgramType.CodeValue			[ProgramTypeCode]
	,ProgramType.Description		[ProgramTypeDescription]
	,Dosage
	,EndDate
	,EnglishLearnerParticipation
	,ReasonExited.CodeValue			[ReasonExitedCode]
	,ReasonExited.Description		[ReasonExitedDescription]
	,ServedOutsideOfRegularSession

	--table CreateDate/LastModifiedDate
	,GSPA.CreateDate
	,GSPA.LastModifiedDate
FROM 
	edfi.StudentLanguageInstructionProgramAssociation SLIPA WITH (NOLOCK)

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

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SLIPA.EducationOrganizationId;