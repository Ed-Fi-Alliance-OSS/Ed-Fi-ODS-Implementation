/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/20/2023 (Happy Equinox!)
* Desc: This view displays Staff Assignments (Classifications) including two forms of Identification
* The view incorporates data from the following tables:
* - edfi.Staff
* - edfi.StaffEducationOrganizationAssignmentAssociation
* - edfi.StaffIdentificationCode (twice)
* - edfi.Descriptor (twice)
* - edfi.EducationOrganization (twice)
*
* The view is partially based on a view created by Jon Hickam * Email:	jon@redglobeinc.com
* 
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: Cody Misplay | App III
* Email: cody.misplay@ped.nm.gov
* Date: 06/27/2023
* Alt Desc: Updated view to query the StaffEducationOrganizationEmploymentAssociation table when the EmploymentStatusDescriptorId is null.
*			Due to multiple StaffEdOrgEmpAssociation records only the record with the most recent HireDate is used for which EmploymentStatusDescriptorId is not null.
*/
CREATE OR ALTER     VIEW [nmped_rpt].[vw_StaffClassifications]
AS


WITH cte_StaffIdentification AS (
SELECT  SIC.StaffUSI
		,SIC.AssigningOrganizationIdentificationCode
		,StaffIdSystem.CodeValue AS [StaffIdSystem]
		,SIC.IdentificationCode
FROM edfi.StaffIdentificationCode SIC WITH (NOLOCK)
LEFT JOIN edfi.Descriptor StaffIdSystem WITH (NOLOCK) ON (StaffIdSystem.DescriptorId = SIC.StaffIdentificationSystemDescriptorId)
WHERE StaffIdSystem.CodeValue IN ('SSN', 'Professional Certificate')
)

SELECT 
	  S.StaffUniqueId
	 ,S.StaffUSI
	 ,School.EducationOrganizationId_School AS [SchoolId]
	 ,School.SchoolName
	 ,School.LocationCode
	 ,School.DistrictCode
	 ,School.DistrictName 
	 ,School.EducationOrganizationId_District AS [DistrictId]
	 ,School.DistrictOrgType
	 ,School.LocationOrgType
	 ,School.SchoolCategory
	 ,S.FirstName
	 ,S.MiddleName 
	 ,S.LastSurname AS [LastName]
	 ,S.LastSurname + ', ' + S.FirstName AS [FullName]
	 ,S.BirthDate
	 -- Begin Alt 001
	 ,CASE WHEN SEOAA.EmploymentStatusDescriptorId IS NULL 
		THEN (SELECT TOP 1 AssociationEmploymentStatusDescriptor.CodeValue 
				FROM edfi.StaffEducationOrganizationEmploymentAssociation SEOEA WITH (NOLOCK)
				LEFT JOIN edfi.Descriptor AssociationEmploymentStatusDescriptor WITH (NOLOCK)
					ON (AssociationEmploymentStatusDescriptor.DescriptorId = SEOEA.EmploymentStatusDescriptorId)
				WHERE SEOEA.StaffUSI = SEOAA.StaffUSI
				AND SEOEA.EmploymentStatusDescriptorId IS NOT NULL
				AND (SEOEA.EducationOrganizationId = School.EducationOrganizationId_School 
					OR SEOEA.EducationOrganizationId = School.EducationOrganizationId_District)
				ORDER BY SEOEA.HireDate DESC)
		ELSE AssignmentEmploymentStatusDescriptor.CodeValue END AS [EmploymentStatusCode]
	 ,CASE WHEN SEOAA.EmploymentStatusDescriptorId IS NULL 
		THEN (SELECT TOP 1 AssociationEmploymentStatusDescriptor.ShortDescription 
				FROM edfi.StaffEducationOrganizationEmploymentAssociation SEOEA WITH (NOLOCK)
				LEFT JOIN edfi.Descriptor AssociationEmploymentStatusDescriptor WITH (NOLOCK)
					ON (AssociationEmploymentStatusDescriptor.DescriptorId = SEOEA.EmploymentStatusDescriptorId)
				WHERE SEOEA.StaffUSI = SEOAA.StaffUSI
				AND SEOEA.EmploymentStatusDescriptorId IS NOT NULL
				AND (SEOEA.EducationOrganizationId = School.EducationOrganizationId_School 
					OR SEOEA.EducationOrganizationId = School.EducationOrganizationId_District)
				ORDER BY SEOEA.HireDate DESC) 
		ELSE AssignmentEmploymentStatusDescriptor.ShortDescription END AS [EmploymentStatusDescription]
	 -- End Alt 001
	 ,SEOAA.FullTimeEquivalency AS [FTE]
	 ,StaffClassificationDescriptor.CodeValue AS [StaffClassificationCode]
	 ,StaffClassificationDescriptor.ShortDescription AS [StaffClassificationDescription]
	 ,StaffClassificationDescriptor.Description AS [StaffClassificationCategory]
	 ,SEOAA.BeginDate
	 ,SEOAA.EmploymentHireDate AS [HireDate]
	 ,SEOAA.EndDate
	 ,ID_SSN.IdentificationCode AS [StaffId]
	 ,ID_Cert.IdentificationCode AS [CertNum]
	 ,SEOAA.CreateDate AS [AssignmentAssociation_CreateDate]		
	 ,SEOAA.LastModifiedDate AS [AssignmentAssociation_LastModifiedDate]
	 ,SEOAA.Id AS [AssignmentAssociation_Id]
FROM edfi.Staff S WITH (NOLOCK)

	RIGHT JOIN edfi.StaffEducationOrganizationAssignmentAssociation SEOAA WITH (NOLOCK)
		ON (S.StaffUSI = SEOAA.StaffUSI)

    LEFT JOIN nmped_rpt.vw_district_location School WITH (NOLOCK)
		ON (School.EducationOrganizationId_School = SEOAA.EducationOrganizationId)

	LEFT JOIN edfi.Descriptor AssignmentEmploymentStatusDescriptor WITH (NOLOCK)
		ON (AssignmentEmploymentStatusDescriptor.DescriptorId = SEOAA.EmploymentStatusDescriptorId)

	LEFT JOIN edfi.Descriptor staffClassificationDescriptor  WITH (NOLOCK)
		ON (StaffClassificationDescriptor.DescriptorId = SEOAA.StaffClassificationDescriptorId)

	LEFT JOIN cte_StaffIdentification ID_SSN
		ON (ID_SSN.StaffUSI = SEOAA.StaffUSI AND ID_SSN.StaffIdSystem = 'SSN')

	LEFT JOIN cte_StaffIdentification ID_Cert
		ON (ID_Cert.StaffUSI = SEOAA.StaffUSI AND ID_Cert.StaffIdSystem = 'Professional Certificate')

GO