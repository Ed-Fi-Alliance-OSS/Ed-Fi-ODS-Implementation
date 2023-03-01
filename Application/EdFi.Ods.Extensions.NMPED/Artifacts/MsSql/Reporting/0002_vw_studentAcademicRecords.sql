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
		views.name = 'vw_studentAcademicRecords'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_studentAcademicRecords;
GO

CREATE VIEW nmped_rpt.vw_studentAcademicRecords AS 
SELECT
	 SUBSTRING(CAST(SSA.SchoolId AS VARCHAR(10)), 3, 3)	[DistrictCode]
	,EO2.NameOfInstitution								[DistrictName]
	,SSA.SchoolId
	,EO.NameOfInstitution								[SchoolName] 
	,SAR.TermDescriptorId
	,Term.CodeValue										[TermCode]
	,Term.Description									[TermDescription]
	,SAR.SchoolYear
	,StudentUniqueId
--	,academicHonors not collected
--	,classRanking not collected
	,CumulativeAttemptedCreditConversion
	,CumulativeAttemptedCredits
	,CumulativeAttemptedCreditTypeDescriptorId 
	,CumulativeAttemptedCreditType.CodeValue			[CumulativeAttemptedCreditTypeCode]
	,CumulativeAttemptedCreditType.Description			[CumulativeAttemptedCreditTypeDescription]
	,CumulativeEarnedCreditConversion
	,CumulativeEarnedCreditTypeDescriptorId 
	,CumulativeEarnedCreditType.CodeValue				[CumulativeEarnedCreditTypeCode]
	,CumulativeEarnedCreditType.Description				[CumulativeEarnedCreditTypeDescription]
	,CumulativeGradePointAverage
	,CumulativeGradePointsEarned

	,DiplomaTypeDescriptorId
	,DiplomaType.CodeValue								[DiplomaTypeCode]
	,DiplomaType.Description							[DiplomaTypeDescription]
	,DiplomaAwardDate
	,AchievementCategoryDescriptorId 
	,AchievementCategory.CodeValue						[AchievementCategoryCode]
	,AchievementCategory.Description					[AchievementCategoryDescription]
	,DiplomaLevelDescriptorId
	,DiplomaLevel.CodeValue								[DiplomaLevelCode]
	,DiplomaLevel.Description							[DiplomaLevelDescription]
	,AchievementCategorySystem
	,AchievementTitle
	,Criteria
	,CriteriaURL
	,CTECompleter
	,DiplomaAwardExpiresDate
	,DiplomaDescription
	,EvidenceStatement
	,ImageURL
	,IssuerName
	,IssuerOriginURL
	
--	,gradePointAverages not collected
	,GradeValueQualifier
	,ProjectedGraduationDate
--	,recognitions not collected
--	,reportCards not collected
	,SessionAttemptedCreditConversion
	,SessionAttemptedCredits
	,SessionAttemptedCreditTypeDescriptorId
	,SessionAttemptedCreditType.CodeValue				[SessionAttemptedCreditTypeCode]
	,SessionAttemptedCreditType.Description				[SessionAttemptedCreditTypeDescription]
	,SessionEarnedCreditConversion
	,SessionEarnedCredits
	,SessionEarnedCreditTypeDescriptorId
	,SessionEarnedCreditType.CodeValue					[SessionEarnedCreditTypeCode]
	,SessionEarnedCreditType.Description				[SessionEarnedCreditTypeDescription]
	,SessionGradePointAverage
	,SessionGradePointsEarned
	,SAR.CreateDate
	,SAR.LastModifiedDate
FROM
	edfi.StudentAcademicRecord SAR WITH (NOLOCK)

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SAR.StudentUSI

	JOIN edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
		ON SSA.StudentUSI = S.StudentUSI

	LEFT JOIN edfi.StudentAcademicRecordDiploma SARD WITH (NOLOCK)
		ON SARD.EducationOrganizationId = SAR.EducationOrganizationId
		AND SARD.SchoolYear = SAR.SchoolYear
		AND SARD.StudentUSI = SAR.StudentUSI
		AND SARD.TermDescriptorId = SAR.TermDescriptorId

	LEFT JOIN edfi.Descriptor CumulativeEarnedCreditType WITH (NOLOCK)
		ON CumulativeEarnedCreditType.DescriptorId = SAR.CumulativeEarnedCreditTypeDescriptorId

	LEFT JOIN edfi.Descriptor CumulativeAttemptedCreditType WITH (NOLOCK)
		ON CumulativeAttemptedCreditType.DescriptorId = SAR.CumulativeAttemptedCreditTypeDescriptorId

	LEFT JOIN edfi.Descriptor Term WITH (NOLOCK)
		ON Term.DescriptorId = SAR.TermDescriptorId

	LEFT JOIN edfi.Descriptor SessionEarnedCreditType WITH (NOLOCK)
		ON SessionEarnedCreditType.DescriptorId = SAR.SessionEarnedCreditTypeDescriptorId

	LEFT JOIN edfi.Descriptor SessionAttemptedCreditType WITH (NOLOCK)
		ON SessionAttemptedCreditType.DescriptorId = SAR.SessionAttemptedCreditTypeDescriptorId

	LEFT JOIN edfi.Descriptor DiplomaType WITH (NOLOCK)
		ON DiplomaType.DescriptorId = SARD.DiplomaTypeDescriptorId

	LEFT JOIN edfi.Descriptor AchievementCategory WITH (NOLOCK)
		ON AchievementCategory.DescriptorId = SARD.AchievementCategoryDescriptorId

	LEFT JOIN edfi.Descriptor DiplomaLevel WITH (NOLOCK)
		ON DiplomaLevel.DescriptorId = SARD.DiplomaLevelDescriptorId

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = SSA.SchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(SSA.SchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'