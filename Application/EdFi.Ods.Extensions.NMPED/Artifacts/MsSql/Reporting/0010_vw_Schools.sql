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

SELECT S.[SchoolId]
	  ,School_EO.NameOfInstitution AS [SchoolName]
	  ,S.[LocalEducationAgencyId]
	  ,District_EO.NameOfInstitution AS [DistrictName]
	  ,SchoolTypeDescriptor.[Description] AS [SchoolTypeDescription]
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
      ,S.[AdministrativeFundingControlDescriptorId]
	  ,AdminFundingDescriptor.[Description] AS [AdminFundingDescription]
	  ,InternetAccessDescriptor.[Description] AS [InternetAccessDescription]
	  ,CharterApprovalDescriptor.[Description] AS [CharterApprovalDescription]
      ,S.[CharterApprovalSchoolYear]
	  ,SUBSTRING(CAST(S.LocalEducationAgencyId AS VARCHAR(10)),3,3) AS [DistrictCode]
	  ,SUBSTRING(CAST(S.SchoolId AS VARCHAR(10)),6,3) AS [StateLocationID]
	  ,'35000' + SUBSTRING(CAST(S.LocalEducationAgencyId AS VARCHAR(10)), 3, 3) AS DISTRICT_KEY
FROM [edfi].[School] S WITH (NOLOCK)

LEFT JOIN edfi.EducationOrganization District_EO WITH (NOLOCK)
	ON (District_EO.EducationOrganizationId = S.LocalEducationAgencyId)

LEFT JOIN edfi.EducationOrganization School_EO WITH (NOLOCK)
	ON (School_EO.EducationOrganizationId = S.SchoolId)

LEFT JOIN edfi.Descriptor SchoolTypeDescriptor WITH (NOLOCK) 
	ON (SchoolTypeDescriptor.DescriptorId = S.[SchoolTypeDescriptorId])

LEFT JOIN edfi.Descriptor CharterStatusDescriptor WITH (NOLOCK) 
	ON (CharterStatusDescriptor.DescriptorId = S.CharterStatusDescriptorId)

LEFT JOIN edfi.Descriptor TitleIDescriptor WITH (NOLOCK) 
	ON (TitleIDescriptor.DescriptorId = S.TitleIPartASchoolDesignationDescriptorId)

LEFT JOIN edfi.Descriptor MagnetDescriptor WITH (NOLOCK) 
	ON (MagnetDescriptor.DescriptorId = S.MagnetSpecialProgramEmphasisSchoolDescriptorId)

LEFT JOIN edfi.Descriptor AdminFundingDescriptor WITH (NOLOCK) 
	ON (AdminFundingDescriptor.DescriptorId = S.AdministrativeFundingControlDescriptorId)

LEFT JOIN edfi.Descriptor InternetAccessDescriptor WITH (NOLOCK) 
	ON (InternetAccessDescriptor.DescriptorId = S.InternetAccessDescriptorId)

LEFT JOIN edfi.Descriptor CharterApprovalDescriptor WITH (NOLOCK) 
	ON (CharterApprovalDescriptor.DescriptorId = S.CharterApprovalAgencyTypeDescriptorId)

LEFT JOIN edfi.SchoolCategory SC WITH (NOLOCK)
	ON (SC.SchoolId = S.SchoolId)

LEFT JOIN edfi.Descriptor SchoolCategory WITH (NOLOCK)
	ON (SchoolCategory.DescriptorId = SC.SchoolCategoryDescriptorId)

GO