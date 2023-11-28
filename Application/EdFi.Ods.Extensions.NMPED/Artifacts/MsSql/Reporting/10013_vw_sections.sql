/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a sections view
 *			from the sections Ed-Fi Resource
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_sections] AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,S.SectionIdentifier
	,S.LocalCourseCode
	,CO.CourseCode						[StateCourseCode]
	,S.SchoolId
	,S.SchoolYear
	,S.SessionName
	,AvailableCreditConversion
	,AvailableCredits
	,AvailableCreditType.CodeValue		[AvailableCreditTypeCode]
	,AvailableCreditType.Description	[AvailableCreditTypeDescription]
	,EducationalEnvironment.CodeValue	[EducationalEnvironmentCode]
	,EducationalEnvironment.Description [EducationalEnvironmentDescription]
	,InstructionLanguage.CodeValue		[InstructionLanguageCode]
	,InstructionLanguage.Description	[InstructionLanguageDescription]
	,MediumOfInstruction.CodeValue		[MediumOfInstructionCode]
	,MediumOfInstruction.Description	[MediumOfInstructionDescription]
	,OfficialAttendancePeriod
	,PopulationServed.CodeValue			[PopulationServedCode]
	,PopulationServed.Description		[PopulationServedDescription]
	,SectionName
	,SequenceOfCourse

	,NMPEDClassPeriod.CodeValue			[NMPEDClassPeriodCode]
	,NMPEDClassPeriod.Description		[NMPEDClassPeriodDescription]
	,PreKClassType.CodeValue			[PreKClassTypeCode]
	,PreKClassType.Description			[PreKClassTypeDescription]


	--table CreateDate/LastModifiedDate
	,S.CreateDate										
	,S.LastModifiedDate
	,S.Id AS [SectionId]
FROM
	edfi.Section S WITH (NOLOCK)

	JOIN edfi.CourseOffering CO WITH (NOLOCK)
		ON CO.SchoolId = S.SchoolId
		AND CO.LocalCourseCode = S.LocalCourseCode
		AND CO.SessionName = S.SessionName

	LEFT JOIN nmped.SectionExtension SE WITH (NOLOCK)
		ON SE.LocalCourseCode = S.LocalCourseCode
		AND SE.SchoolId = S.SchoolId
		AND SE.SchoolYear = S.SchoolYear
		AND SE.SectionIdentifier = S.SectionIdentifier
		AND SE.SessionName = S.SessionName

	LEFT JOIN edfi.Descriptor AvailableCreditType WITH (NOLOCK)
		ON AvailableCreditType.DescriptorId = S.AvailableCreditTypeDescriptorId

	LEFT JOIN edfi.Descriptor EducationalEnvironment WITH (NOLOCK)
		ON EducationalEnvironment.DescriptorId = S.EducationalEnvironmentDescriptorId

	LEFT JOIN edfi.Descriptor InstructionLanguage WITH (NOLOCK)
		ON InstructionLanguage.DescriptorId = S.InstructionLanguageDescriptorId

	LEFT JOIN edfi.Descriptor MediumOfInstruction WITH (NOLOCK)
		ON MediumOfInstruction.DescriptorId = S.MediumOfInstructionDescriptorId

	LEFT JOIN edfi.Descriptor PopulationServed WITH (NOLOCK)
		ON PopulationServed.DescriptorId = S.PopulationServedDescriptorId

	LEFT JOIN edfi.Descriptor NMPEDClassPeriod WITH (NOLOCK)
		ON NMPEDClassPeriod.DescriptorId = SE.NMPEDClassPeriodDescriptorId

	LEFT JOIN edfi.Descriptor PreKClassType WITH (NOLOCK)
		ON PreKClassType.DescriptorId = SE.PreKClassTypeDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = S.SchoolId
GO


