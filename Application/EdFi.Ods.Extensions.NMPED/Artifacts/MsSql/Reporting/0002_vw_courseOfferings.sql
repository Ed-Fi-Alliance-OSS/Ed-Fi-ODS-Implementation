/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a CourseOffering view from the courseOfferings resource
 *			The view also combines the resource courses.
 *
 */

USE [NM_Staging_EdFi_v5.3.0_Ods]

IF EXISTS 
(
	SELECT 
		1 
	FROM 
		sys.views
		JOIN sys.schemas
			ON views.schema_id = schemas.schema_id
	WHERE 
		views.name = 'vw_courseOfferings'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_courseOfferings;
GO

CREATE VIEW nmped_rpt.vw_courseOfferings AS 
SELECT
	 SUBSTRING(CAST(CO.SchoolId AS VARCHAR(10)), 3, 3)	[DistrictCode]
	,EO2.NameOfInstitution								[DistrictName]
	,SchoolId
	,EO.NameOfInstitution								[SchoolName]
	,LocalCourseCode
	,C.CourseCode
	,SchoolYear
	,SessionName
--	,courseLevelCharacteristics not collected
--  ,curriculumUseds not collected
	,InstructionalTimePlanned
	,LocalCourseTitle
--	,offeredGradeLevels not collected

	,C.EducationOrganizationId
--	,identificationCodes not collected
	,AcademicSubjectDescriptorId
	,AcademicSubject.CodeValue							[AcademicSubjectCode]
	,AcademicSubject.Description						[AcademicSubjectDescription]
	,CareerPathwayDescriptorId
	,CareerPathway.CodeValue							[CareerPathwayCode]
	,CareerPathway.Description							[CareerPathwayDescription]
--	,competencyLevels not collected
	,CourseDefinedByDescriptorId 
	,CourseDefinedBy.CodeValue							[CourseDefinedByCode]
	,CourseDefinedBy.Description						[CourseDefinedByDescription]
	,CourseDescription
	,CourseGPAApplicabilityDescriptorId
	,CourseGPAApplicability.CodeValue					[CourseGPAApplicabilityCode]
	,CourseGPAApplicability.Description					[CourseGPAApplicabilityDescription]
	,CourseTitle
	,DateCourseAdopted
	,HighSchoolCourseRequirement
--	,learningObjectives not collected
--	,learningStandards not collected
--	,learningCharacteristics not collected
	,MaxCompletionsForCredit
	,MaximumAvailableCreditConversion
	,MaximumAvailableCredits
	,MaximumAvailableCreditTypeDescriptorId
	,MaximumAvailableCreditType.CodeValue				[MaximumAvailableCreditTypeCode]
	,MaximumAvailableCreditType.Description				[MaximumAvailableCreditTypeDescription]
	,MinimumAvailableCreditConversion
	,MinimumAvailableCredits
	,MinimumAvailableCreditTypeDescriptorId
	,MinimumAvailableCreditType.CodeValue				[MinimumAvailableCreditTypeCode]
	,MinimumAvailableCreditType.Description				[MinimumAvailableCreditTypeDescription]
	,NumberOfParts
--	,offeredGradeLevels not collected
	,TimeRequiredForCompletion

	,CO.CreateDate
	,CO.LastModifiedDate
FROM
	edfi.CourseOffering CO WITH (NOLOCK)

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = CO.SchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(CO.SchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'

	LEFT JOIN edfi.Course C WITH (NOLOCK)
		ON C.CourseCode = CO.CourseCode
		--AND C.EducationOrganizationId = CO.EducationOrganizationId

	LEFT JOIN edfi.Descriptor AcademicSubject WITH (NOLOCK)
		ON AcademicSubject.DescriptorId = C.AcademicSubjectDescriptorId

	LEFT JOIN edfi.Descriptor CareerPathway WITH (NOLOCK)
		ON CareerPathway.DescriptorId = C.CareerPathwayDescriptorId

	LEFT JOIN edfi.Descriptor CourseDefinedBy WITH (NOLOCK)
		ON CourseDefinedBy.DescriptorId = C.CourseDefinedByDescriptorId

	LEFT JOIN edfi.Descriptor CourseGPAApplicability WITH (NOLOCK)
		ON CourseGPAApplicability.DescriptorId = C.CourseGPAApplicabilityDescriptorId	
		
	LEFT JOIN edfi.Descriptor MaximumAvailableCreditType WITH (NOLOCK)
		ON CourseGPAApplicability.DescriptorId = C.MaximumAvailableCreditTypeDescriptorId	

	LEFT JOIN edfi.Descriptor MinimumAvailableCreditType WITH (NOLOCK)
		ON MinimumAvailableCreditType.DescriptorId = C.MinimumAvailableCreditTypeDescriptorId	
