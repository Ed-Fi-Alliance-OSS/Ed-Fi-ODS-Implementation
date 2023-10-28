/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/08/2023
* Desc: This view has been created to display School-level information
* The view incorporates data from the following tables:
* - EducationOrganization (twice, once for the school and once for the District)
* - SchoolCategory
* - SchoolGradeLevel
* Dependencies:
* - nmped_rpt.vw_gradeLevels
*
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_Schools]
AS

WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.CharterStatusDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.CharterApprovalAgencyTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.AdministrativeFundingControlDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.InternetAccessDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.MagnetSpecialProgramEmphasisSchoolDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.SchoolTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.SchoolCategoryDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.TitleIPartASchoolDesignationDescriptor WITH (NOLOCK))
)

SELECT S.[SchoolId]
	  ,DL.SchoolName
	  ,S.[LocalEducationAgencyId]
	  ,DL.DistrictName
	  ,SchoolTypeDescriptor.[CodeValue] AS [SchoolTypeCode]
	  ,SchoolTypeDescriptor.[ShortDescription] AS [SchoolTypeShortDescription]
	  ,CharterStatusDescriptor.CodeValue AS [CharterStatusCode]
	  ,CharterStatusDescriptor.[Description] AS [CharterStatusDescription]
	  ,SchoolCategory.CodeValue AS [SchoolCategoryCode]
	  ,SchoolCategory.[Description] AS [SchoolCategoryDescription]
	  ,TitleIDescriptor.[Description] AS [TitleIDescription]
	  ,(SELECT TOP 1 VGL.GradeLevelCode FROM edfi.SchoolGradeLevel SGL WITH (NOLOCK) -- Not sure if we'd prefer the Min and Max columns or the list. Most likely the list would be more accurate.
			LEFT JOIN nmped_rpt.vw_gradeLevels VGL ON (VGL.GradeLevelDescriptorId = SGL.GradeLevelDescriptorId) 
			WHERE SGL.SchoolId = S.SchoolId ORDER BY VGL.GradeLevelOrder ASC) AS [MinGradeLvl]
	  ,(SELECT TOP 1 VGL.GradeLevelCode FROM edfi.SchoolGradeLevel SGL WITH (NOLOCK) 
			LEFT JOIN nmped_rpt.vw_gradeLevels VGL ON (VGL.GradeLevelDescriptorId = SGL.GradeLevelDescriptorId) 
			WHERE SGL.SchoolId = S.SchoolId ORDER BY VGL.GradeLevelOrder DESC) AS [MaxGradeLvl]
	  ,[GradeRange]=STUFF((SELECT ',' + VGL.GradeLevelCode FROM edfi.SchoolGradeLevel SGL WITH (NOLOCK) 
			LEFT JOIN nmped_rpt.vw_gradeLevels VGL ON (VGL.GradeLevelDescriptorId = SGL.GradeLevelDescriptorId) 
			WHERE SGL.SchoolId = S.SchoolId ORDER BY VGL.GradeLevelOrder ASC FOR XML PATH('')),1,1,'') 
	  ,MagnetDescriptor.[Description] AS [MagnetDescription]
      ,AdminFundingDescriptor.[CodeValue] AS [AdminFundingCode]
	  ,AdminFundingDescriptor.[Description] AS [AdminFundingDescription]
	  ,InternetAccessDescriptor.[Description] AS [InternetAccessDescription]
	  ,CharterApprovalDescriptor.[Description] AS [CharterApprovalDescription]
      ,S.[CharterApprovalSchoolYear]
	  ,EO.OperationalStatusDescription
	  ,SUBSTRING(CAST(S.LocalEducationAgencyId AS VARCHAR(10)),3,3) AS [DistrictCode]
	  ,SUBSTRING(CAST(S.SchoolId AS VARCHAR(10)),6,3) AS [StateLocationId]
	  ,'35000' + SUBSTRING(CAST(S.LocalEducationAgencyId AS VARCHAR(10)), 3, 3) AS DISTRICT_KEY
FROM [edfi].[School] S WITH (NOLOCK)

INNER JOIN nmped_rpt.vw_EducationOrganizations_Basic EO
	ON (EO.EducationOrganizationId = S.SchoolId)

LEFT JOIN nmped_rpt.vw_district_location DL WITH (NOLOCK)
	ON (DL.EducationOrganizationId_School =  S.SchoolId)

LEFT JOIN cte_Descriptors SchoolTypeDescriptor WITH (NOLOCK) 
	ON (SchoolTypeDescriptor.DescriptorId = S.[SchoolTypeDescriptorId])

LEFT JOIN cte_Descriptors CharterStatusDescriptor WITH (NOLOCK) 
	ON (CharterStatusDescriptor.DescriptorId = S.CharterStatusDescriptorId)

LEFT JOIN cte_Descriptors TitleIDescriptor WITH (NOLOCK) 
	ON (TitleIDescriptor.DescriptorId = S.TitleIPartASchoolDesignationDescriptorId)

LEFT JOIN cte_Descriptors MagnetDescriptor WITH (NOLOCK) 
	ON (MagnetDescriptor.DescriptorId = S.MagnetSpecialProgramEmphasisSchoolDescriptorId)

LEFT JOIN cte_Descriptors AdminFundingDescriptor WITH (NOLOCK) 
	ON (AdminFundingDescriptor.DescriptorId = S.AdministrativeFundingControlDescriptorId)

LEFT JOIN cte_Descriptors InternetAccessDescriptor WITH (NOLOCK) 
	ON (InternetAccessDescriptor.DescriptorId = S.InternetAccessDescriptorId)

LEFT JOIN cte_Descriptors CharterApprovalDescriptor WITH (NOLOCK) 
	ON (CharterApprovalDescriptor.DescriptorId = S.CharterApprovalAgencyTypeDescriptorId)

LEFT JOIN edfi.SchoolCategory SC WITH (NOLOCK)
	ON (SC.SchoolId = S.SchoolId)

LEFT JOIN cte_Descriptors SchoolCategory WITH (NOLOCK)
	ON (SchoolCategory.DescriptorId = SC.SchoolCategoryDescriptorId)

GO