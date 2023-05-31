/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/06/2023
* Desc: This view has been created to display NMPED Courses and their associated Characteristics and Grade Levels.
* The view incorporates data from the following tables:
* - CourseLevelCharacteristic (several times for each characteristic previously denoted by an Indicator field in STARS)
* - CourseOfferedGradeLevel (this was previously represented by Min Grade Level and Max Grade Level)
* Dependencies:
* - nmped_rpt.vw_gradeLevels
*
* 
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_Courses]
AS

WITH cte_CourseLevelCharacteristics AS (

	SELECT CLC.CourseCode
		  ,D.CodeValue AS [CharacteristicCode]
	FROM edfi.CourseLevelCharacteristic CLC WITH (NOLOCK)
	
	LEFT JOIN edfi.Descriptor D WITH (NOLOCK) 
		ON (D.DescriptorId = CLC.CourseLevelCharacteristicDescriptorId)

	WHERE CLC.EducationOrganizationId = 35000000

)

SELECT C.[CourseCode]
      ,C.[CourseTitle]
	  ,AcademicSubject.CodeValue AS [AcademicSubjectCode]
	  ,AcademicSubject.[Description] AS [AcademicSubjectDescription]
      ,C.[CourseDescription]
	  ,CASE WHEN DualCredit.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [DualCredit]
	  ,CASE WHEN AdvancedPlacement.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [AdvancedPlacement]
	  ,CASE WHEN CTE.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [CTE]
	  ,CASE WHEN Capstone.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [Capstone]
	  ,CASE WHEN SPED.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [SpecialEducation]
	  ,CASE WHEN IB.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [InternationalBaccalaureate]
	  ,CASE WHEN Core.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [CoreSubject]
	  ,CASE WHEN AdvancedIndicator.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [Advanced]
	  ,CASE WHEN WorkBased.CharacteristicCode IS NULL THEN 'No' ELSE 'Yes' END AS [WorkBasedLearning]
	  ,CASE WHEN NonTradGender.CharacteristicCode IS NULL THEN NULL ELSE NonTradGender.CharacteristicCode END AS [NonTraditionalGenderCode]
	  ,(SELECT TOP 1 VGL.GradeLevelCode FROM edfi.CourseOfferedGradeLevel COGL WITH (NOLOCK) LEFT JOIN nmped_rpt.vw_gradeLevels VGL ON (VGL.GradeLevelDescriptorId = COGL.GradeLevelDescriptorId) WHERE COGL.CourseCode = C.CourseCode ORDER BY VGL.GradeLevelOrder ASC) AS [MinGradeLvl]
	  ,(SELECT TOP 1 VGL.GradeLevelCode FROM edfi.CourseOfferedGradeLevel COGL WITH (NOLOCK) LEFT JOIN nmped_rpt.vw_gradeLevels VGL ON (VGL.GradeLevelDescriptorId = COGL.GradeLevelDescriptorId) WHERE COGL.CourseCode = C.CourseCode ORDER BY VGL.GradeLevelOrder DESC) AS [MaxGradeLvl]
	  ,[GradeRange]=STUFF((SELECT ',' + VGL.GradeLevelCode FROM edfi.CourseOfferedGradeLevel COGL WITH (NOLOCK) LEFT JOIN nmped_rpt.vw_gradeLevels VGL ON (VGL.GradeLevelDescriptorId = COGL.GradeLevelDescriptorId) WHERE COGL.CourseCode = C.CourseCode ORDER BY VGL.GradeLevelOrder ASC FOR XML PATH('')),1,1,'') 
      ,C.[CreateDate]
      ,C.[LastModifiedDate]
FROM [edfi].[Course] C WITH (NOLOCK)

LEFT JOIN edfi.Descriptor AcademicSubject WITH (NOLOCK) 
	ON (AcademicSubject.DescriptorId = C.AcademicSubjectDescriptorId)

LEFT JOIN cte_CourseLevelCharacteristics DualCredit 
	ON (DualCredit.CourseCode = C.CourseCode AND DualCredit.CharacteristicCode = 'Dual Credit')

LEFT JOIN cte_CourseLevelCharacteristics AdvancedPlacement 
	ON (AdvancedPlacement.CourseCode = C.CourseCode AND AdvancedPlacement.CharacteristicCode = 'Advanced Placement')

LEFT JOIN cte_CourseLevelCharacteristics CTE 
	ON (CTE.CourseCode = C.CourseCode AND CTE.CharacteristicCode = 'Career and Technical Education')

LEFT JOIN cte_CourseLevelCharacteristics Capstone 
	ON (Capstone.CourseCode = C.CourseCode AND Capstone.CharacteristicCode = 'Capstone')

LEFT JOIN cte_CourseLevelCharacteristics SPED 
	ON (SPED.CourseCode = C.CourseCode AND SPED.CharacteristicCode = 'Special Education')

LEFT JOIN cte_CourseLevelCharacteristics IB 
	ON (IB.CourseCode = C.CourseCode AND IB.CharacteristicCode = 'International Baccalaureate')

LEFT JOIN cte_CourseLevelCharacteristics Core 
	ON (Core.CourseCode = C.CourseCode AND Core.CharacteristicCode = 'Core Subject')

LEFT JOIN cte_CourseLevelCharacteristics AdvancedIndicator 
	ON (AdvancedIndicator.CourseCode = C.CourseCode AND AdvancedIndicator.CharacteristicCode = 'Advanced')

LEFT JOIN cte_CourseLevelCharacteristics WorkBased 
	ON (WorkBased.CourseCode = C.CourseCode AND WorkBased.CharacteristicCode = 'Work Based Learning')

LEFT JOIN cte_CourseLevelCharacteristics NonTradGender 
	ON (NonTradGender.CourseCode = C.CourseCode AND NonTradGender.CharacteristicCode IN ('M','F'))

GO