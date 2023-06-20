/*
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-16-2023
 * Desc:	This script creates a StudentSpecialEducationProgramAssociation view
 *			from the:
 *						studentSpecialEducationProgramAssociations resource
 *			BECAUSE A STUDENT CAN HAVE MULTIPLE SERVICES, AND MULTIPLE STAFF IDS ASSIGNED,
 *			THIS VIEW CAN HAVE MULTIPLE ROWS FOR A STUDENT
 *			
 * https://edfistg.ped.state.nm.us/v5.3.0_NM_Staging/docs/swagger/index.html?urls.primaryName=Resources
 *
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentSpecialEducationProgramAssociations]
AS 

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
SELECT * FROM edfi.DisabilityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.DisabilityDeterminationSourceTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.DisabilityDesignationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.ReasonExitedDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.SpecialEducationSettingDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.SpecialEducationProgramServiceDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.AnnualReviewDelayReasonDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.ExpectedDiplomaTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.LevelOfIntegrationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.PlannedPostGraduateActivityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.PrimaryAreaOfExceptionalityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.SpecialEducationReferralCodeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.TriennialReviewDelayReasonDescriptor WITH (NOLOCK))
)

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
	,S.StudentUSI
	,S.FirstName
	,S.LastSurname
	,SSEPA.BeginDate
	,SSEPA.ProgramName
	,ProgramType.CodeValue							[ProgramTypeCode]
	,ProgramType.Description						[ProgramTypeDescription]


	--disability subcollection
	,Disability.CodeValue							[DisabilityCode]
	,Disability.Description							[DisabilityDescription]
	,DisabilityDeterminationSourceType.CodeValue	[DisabilityDeterminationSourceTypeCode]
	,DisabilityDeterminationSourceType.Description	[DisabilityDeterminationSourceTypeDescription]
	,DisabilityDiagnosis
	,OrderOfDisability
	,DisabilityDesignation.CodeValue				[DisabilityDesignationCode]
	,DisabilityDesignation.Description				[DisabilityDesignationDescription]
	-- end 

	,EndDate
	,IdeaEligibility
	,IEPBeginDate
	,IEPEndDate
	,IEPReviewDate
	,LastEvaluationDate
	,MedicallyFragile
	,MultiplyDisabled
--	,participationStatus not collected
--	,programParticipationStatuses not collected
	,ReasonExited.CodeValue							[ReasonExitedCode]
	,ReasonExited.Description						[ReasonExitedDescription]
	,SchoolHoursPerWeek
	,ServedOutsideOfRegularSession
	
	--serviceProvider subcollection
	,SSEPASP.PrimaryProvider
	,Staff.StaffUniqueId							[SpecialEducationStaffUniqueId]
	--end

	,SpecialEducationHoursPerWeek
	
	--services subcollection
	,SpecialEducationProgramService.CodeValue		[SpecialEducationProgramServiceCode]
	,SpecialEducationProgramService.Description		[SpecialEducationProgramServiceDescription]
	,Staff_Service.StaffUniqueId					[SpecialEducationProgramServiceStaffUniqueId]
	,PrimaryIndicator
	,ServiceBeginDate
	,ServiceEndDate
	,IntegratedServicesStatus
	,ServiceDuration
	--end
	
	,SpecialEducationSetting.CodeValue				[SpecialEducationSettingCode]
	,SpecialEducationSetting.Description			[SpecialEducationSettingDescription]

	--extensions
	,AnnualReviewDelayReason.CodeValue				[AnnualReviewDelayReasonCode]
	,AnnualReviewDelayReason.Description			[AnnualReviewDelayReasonDescription]
	,ExpectedDiplomaType.CodeValue					[ExpectedDiplomaTypeCode]
	,ExpectedDiplomaType.Description				[ExpectedDiplomaTypeDescription]
	,SpecialEducationLevelOfIntegration.CodeValue	[SpecialEducationLevelOfIntegrationCode]
	,SpecialEducationLevelOfIntegration.Description [SpecialEducationLevelOfIntegrationDescription]
	,PlannedPostGraduateActivity.CodeValue			[PlannedPostGraduateActivityCode]
	,PlannedPostGraduateActivity.Description		[PlannedPostGraduateActivityDescription]
	,PrimaryAreaOfExceptionality.CodeValue			[PrimaryAreaOfExceptionalityCode]
	,PrimaryAreaOfExceptionality.Description		[PrimaryAreaOfExceptionalityDescription]
	,SpecialEducationReferralCode.CodeValue			[SpecialEducationReferralCodeCode]
	,SpecialEducationReferralCode.Description		[SpecialEducationReferralCodeDescription]
	,TriennialReviewDelayReason.CodeValue			[TriennialReviewDelayReasonCode]
	,TriennialReviewDelayReason.Description			[TriennialReviewDelayReasonDescription]
	,AlternateInstruction
	,BrailleInstruction
	,ChildCountEducationOrganizationId

FROM 
	edfi.StudentSpecialEducationProgramAssociation SSEPA WITH (NOLOCK)

	JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
		ON GSPA.BeginDate = SSEPA.BeginDate
		AND GSPA.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND GSPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND GSPA.ProgramName = SSEPA.ProgramName
		AND GSPA.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND GSPA.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN nmped.StudentSpecialEducationProgramAssociationExtension SSEPAE WITH (NOLOCK)
		ON SSEPAE.BeginDate = SSEPA.BeginDate
		AND SSEPAE.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPAE.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPAE.ProgramName = SSEPA.ProgramName
		AND SSEPAE.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPAE.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationDisability SSEPAD WITH (NOLOCK)
		ON SSEPAD.BeginDate = SSEPA.BeginDate
		AND SSEPAD.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPAD.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPAD.ProgramName = SSEPA.ProgramName
		AND SSEPAD.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPAD.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation SSEPADD WITH (NOLOCK)
		ON SSEPADD.BeginDate = SSEPA.BeginDate
		AND SSEPADD.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPADD.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPADD.ProgramName = SSEPA.ProgramName
		AND SSEPADD.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPADD.StudentUSI = SSEPA.StudentUSI 

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationServiceProvider SSEPASP WITH (NOLOCK)
		ON SSEPASP.BeginDate = SSEPA.BeginDate
		AND SSEPASP.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPASP.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPASP.ProgramName = SSEPA.ProgramName
		AND SSEPASP.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPASP.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService SSEPASEPS WITH (NOLOCK)
		ON SSEPASEPS.BeginDate = SSEPA.BeginDate
		AND SSEPASEPS.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPASEPS.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPASEPS.ProgramName = SSEPA.ProgramName
		AND SSEPASEPS.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPASEPS.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider SSEPASEPSP WITH (NOLOCK)
		ON SSEPASEPSP.BeginDate = SSEPASEPS.BeginDate
		AND SSEPASEPSP.EducationOrganizationId = SSEPASEPS.EducationOrganizationId
		AND SSEPASEPSP.ProgramEducationOrganizationId = SSEPASEPS.ProgramEducationOrganizationId
		AND SSEPASEPSP.ProgramName = SSEPASEPS.ProgramName
		AND SSEPASEPSP.ProgramTypeDescriptorId = SSEPASEPS.ProgramTypeDescriptorId
		AND SSEPASEPSP.SpecialEducationProgramServiceDescriptorId = SSEPASEPS.SpecialEducationProgramServiceDescriptorId
		AND SSEPASEPSP.StudentUSI = SSEPASEPS.StudentUSI

	LEFT JOIN nmped.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension SSEPASEPSE WITH (NOLOCK)
		ON SSEPASEPSE.BeginDate = SSEPASEPS.BeginDate
		AND SSEPASEPSE.EducationOrganizationId = SSEPASEPS.EducationOrganizationId
		AND SSEPASEPSE.ProgramEducationOrganizationId = SSEPASEPS.ProgramEducationOrganizationId
		AND SSEPASEPSE.ProgramName = SSEPASEPS.ProgramName
		AND SSEPASEPSE.ProgramTypeDescriptorId = SSEPASEPS.ProgramTypeDescriptorId
		AND SSEPASEPSE.SpecialEducationProgramServiceDescriptorId = SSEPASEPS.SpecialEducationProgramServiceDescriptorId
		AND SSEPASEPSE.StudentUSI = SSEPASEPS.StudentUSI

	LEFT JOIN edfi.Staff Staff WITH (NOLOCK)
		ON Staff.StaffUSI = SSEPASP.StaffUSI

	LEFT JOIN edfi.Staff Staff_Service WITH (NOLOCK)
		ON Staff_Service.StaffUSI = SSEPASEPSP.StaffUSI

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN cte_Descriptors ProgramType
		ON ProgramType.DescriptorId = SSEPA.ProgramTypeDescriptorId

	LEFT JOIN cte_Descriptors Disability
		ON Disability.DescriptorId = SSEPAD.DisabilityDescriptorId

	LEFT JOIN cte_Descriptors DisabilityDeterminationSourceType
		ON DisabilityDeterminationSourceType.DescriptorId = SSEPAD.DisabilityDeterminationSourceTypeDescriptorId

	LEFT JOIN cte_Descriptors DisabilityDesignation
		ON DisabilityDesignation.DescriptorId = SSEPADD.DisabilityDesignationDescriptorId

	LEFT JOIN cte_Descriptors ReasonExited
		ON ReasonExited.DescriptorId = GSPA.ReasonExitedDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationSetting
		ON SpecialEducationSetting.DescriptorId = SSEPA.SpecialEducationSettingDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationProgramService
		ON SpecialEducationProgramService.DescriptorId = SSEPASEPS.SpecialEducationProgramServiceDescriptorId

	LEFT JOIN cte_Descriptors AnnualReviewDelayReason
		ON AnnualReviewDelayReason.DescriptorId = SSEPAE.AnnualReviewDelayReasonDescriptorId

	LEFT JOIN cte_Descriptors ExpectedDiplomaType
		ON ExpectedDiplomaType.DescriptorId = SSEPAE.ExpectedDiplomaTypeDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationLevelOfIntegration
		ON SpecialEducationLevelOfIntegration.DescriptorId = SSEPAE.SpecialEducationLevelOfIntegrationDescriptorId

	LEFT JOIN cte_Descriptors PlannedPostGraduateActivity
		ON PlannedPostGraduateActivity.DescriptorId = SSEPAE.PlannedPostGraduateActivityDescriptorId

	LEFT JOIN cte_Descriptors PrimaryAreaOfExceptionality
		ON PrimaryAreaOfExceptionality.DescriptorId = SSEPAE.PrimaryAreaOfExceptionalityDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationReferralCode
		ON SpecialEducationReferralCode.DescriptorId = SSEPAE.SpecialEducationReferralCodeDescriptorId

	LEFT JOIN cte_Descriptors TriennialReviewDelayReason
		ON TriennialReviewDelayReason.DescriptorId = SSEPAE.TriennialReviewDelayReasonDescriptorId

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSEPA.EducationOrganizationId
GO
