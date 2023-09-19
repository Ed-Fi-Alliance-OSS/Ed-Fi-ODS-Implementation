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
 *			I am using an inner join on StudentAcademicRecordDiploma
 *			because we only use SAR records that have a corresponding
 *			SARD record. This is shown in the v4 document, where 
 *			StudentAcademicRecordDiploma is the only table used from
 *			this resource.
 *	
 * Alt Id:	001 (Increment value each change)
 * By:		Collin Neville | App Dev I
 * Email:	collin.neville@ped.nm.gov
 * Date:	04/19/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 */



CREATE OR ALTER VIEW nmped_rpt.vw_studentAcademicRecords AS 
WITH cte_Descriptors AS 
--Alt Id: 001 - New CTE using control tables for descriptors
(
	SELECT 
		*
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE DescriptorId IN (	SELECT * FROM edfi.CreditTypeDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.TermDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.DiplomaTypeDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.AchievementCategoryDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.DiplomaLevelDescriptor WITH (NOLOCK))
							

)

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
	,Term.CodeValue										[TermCode]
	,Term.Description									[TermDescription]
	,SAR.SchoolYear
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
	,SAR.Id AS [StudentAcademicRecord_Id]
FROM
	edfi.StudentAcademicRecord SAR WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SAR.StudentUSI

	JOIN edfi.StudentAcademicRecordDiploma SARD WITH (NOLOCK)
		ON SARD.EducationOrganizationId = SAR.EducationOrganizationId
		AND SARD.SchoolYear = SAR.SchoolYear
		AND SARD.StudentUSI = SAR.StudentUSI
		AND SARD.TermDescriptorId = SAR.TermDescriptorId
-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
	LEFT JOIN cte_Descriptors CumulativeEarnedCreditType WITH (NOLOCK)
		ON CumulativeEarnedCreditType.DescriptorId = SAR.CumulativeEarnedCreditTypeDescriptorId

	LEFT JOIN cte_Descriptors CumulativeAttemptedCreditType WITH (NOLOCK)
		ON CumulativeAttemptedCreditType.DescriptorId = SAR.CumulativeAttemptedCreditTypeDescriptorId

	LEFT JOIN cte_Descriptors Term WITH (NOLOCK)
		ON Term.DescriptorId = SAR.TermDescriptorId

	LEFT JOIN cte_Descriptors SessionEarnedCreditType WITH (NOLOCK)
		ON SessionEarnedCreditType.DescriptorId = SAR.SessionEarnedCreditTypeDescriptorId

	LEFT JOIN cte_Descriptors SessionAttemptedCreditType WITH (NOLOCK)
		ON SessionAttemptedCreditType.DescriptorId = SAR.SessionAttemptedCreditTypeDescriptorId

	LEFT JOIN cte_Descriptors DiplomaType WITH (NOLOCK)
		ON DiplomaType.DescriptorId = SARD.DiplomaTypeDescriptorId

	LEFT JOIN cte_Descriptors AchievementCategory WITH (NOLOCK)
		ON AchievementCategory.DescriptorId = SARD.AchievementCategoryDescriptorId

	LEFT JOIN cte_Descriptors DiplomaLevel WITH (NOLOCK)
		ON DiplomaLevel.DescriptorId = SARD.DiplomaLevelDescriptorId
-- Alt Id: 001 - End Changes
	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SAR.EducationOrganizationId