/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	11-02-2023
 * Desc:	This script creates an attendance view from the nmassessments.NmStudentAssessment table
			With LEFT JOIN to studschoolassoc, 20_205 rows
			w/o LEFT JOIN, 20_091

			With LEFT JOIN to studschoolassoc w/ DISTINCT, 20_092 rows (we have a winner)
			w/o LEFT JOIN w/ DISTINCT, 20_091 rows
 */

CREATE VIEW [nmped_rpt].[vw_Assessments] AS 
WITH	cte_Descriptors AS	(
SELECT  [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM	edfi.Descriptor WITH (NOLOCK)
WHERE	DescriptorId IN
( -- Control Table Query
	SELECT * FROM nmassessments.ItemDescriptionCodeDescriptor WITH (NOLOCK)
	UNION
	SELECT * FROM nmassessments.ScoringModelCodeDescriptor WITH (NOLOCK)
	UNION
	SELECT * FROM nmassessments.StandardAchievedCodeDescriptor WITH (NOLOCK)
	UNION
	SELECT * FROM nmassessments.TestDescriptionDescriptor WITH (NOLOCK)
)
							)
SELECT DISTINCT 
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

	,SA.TestDate
	,TestDescription.CodeValue			'TestDescription_CV'
	,TestDescription.Description		'TestDescription'
	,StandardAchievedCode.CodeValue		'StandardAchievedCode_CV'
	,StandardAchievedCode.Description	'StandardAchievedCode'
	,ItemDescriptionCode.CodeValue		'ItemDescriptionCode_CV'
	,ItemDescriptionCode.Description	'ItemDescriptionCode'
	,ScoringModelCode.CodeValue			'ScoringModelCode_CV'
	,ScoringModelCode.Description		'ScoringModelCode'
	,RawScore
	,SA.EducationOrganizationId			'NmStudentAssessment_EducationOrganizationId'
	,SA.CreateDate
	,SA.LastModifiedDate
	,SA.Id								'NmStudentAssessment_Id'
FROM
	nmassessments.NmStudentAssessment SA WITH (NOLOCK)
	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SA.StudentUSI
	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SA.EducationOrganizationId
	LEFT JOIN cte_Descriptors ItemDescriptionCode
		ON ItemDescriptionCode.DescriptorId = SA.ItemDescriptionCodeDescriptorId
	LEFT JOIN cte_Descriptors ScoringModelCode
		ON ScoringModelCode.DescriptorId = SA.ScoringModelCodeDescriptorId
	LEFT JOIN cte_Descriptors StandardAchievedCode
		ON StandardAchievedCode.DescriptorId = SA.StandardAchievedCodeDescriptorId
	LEFT JOIN cte_Descriptors TestDescription
		ON TestDescription.DescriptorId = SA.TestDescriptionDescriptorId
GO


