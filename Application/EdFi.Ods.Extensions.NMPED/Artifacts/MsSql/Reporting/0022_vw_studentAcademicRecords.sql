/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-23-2023
 * Desc:	This script creates a studentAcademicRecord view
 *			from the studentAcademicRecords resource
 *			
 */


CREATE OR ALTER VIEW nmped_rpt.vw_studentAcademicRecords AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,Term.CodeValue										[TermCode]
	,Term.Description									[TermDescription]
	,SAR.SchoolYear
	,StudentUniqueId
--	,academicHonors not collected
--	,classRanking not collected
	,CumulativeAttemptedCreditConversion
	,CumulativeAttemptedCredits
	,CumulativeAttemptedCreditType.CodeValue			[CumulativeAttemptedCreditTypeCode]
	,CumulativeAttemptedCreditType.Description			[CumulativeAttemptedCreditTypeDescription]
	,CumulativeEarnedCreditConversion
	,CumulativeEarnedCreditType.CodeValue				[CumulativeEarnedCreditTypeCode]
	,CumulativeEarnedCreditType.Description				[CumulativeEarnedCreditTypeDescription]
	,CumulativeGradePointAverage
	,CumulativeGradePointsEarned

	,DiplomaType.CodeValue								[DiplomaTypeCode]
	,DiplomaType.Description							[DiplomaTypeDescription]
	,DiplomaAwardDate
	,AchievementCategory.CodeValue						[AchievementCategoryCode]
	,AchievementCategory.Description					[AchievementCategoryDescription]
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
	,SessionAttemptedCreditType.CodeValue				[SessionAttemptedCreditTypeCode]
	,SessionAttemptedCreditType.Description				[SessionAttemptedCreditTypeDescription]
	,SessionEarnedCreditConversion
	,SessionEarnedCredits
	,SessionEarnedCreditType.CodeValue					[SessionEarnedCreditTypeCode]
	,SessionEarnedCreditType.Description				[SessionEarnedCreditTypeDescription]
	,SessionGradePointAverage
	,SessionGradePointsEarned
	,SAR.CreateDate
	,SAR.LastModifiedDate
FROM
	edfi.StudentAcademicRecord SAR WITH (NOLOCK)

	INNER JOIN edfi.Student S WITH (NOLOCK)
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

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId