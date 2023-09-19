

/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	05-05-2023
 * Desc:	This script creates an DigitalResources
 *			view, to build into a StudEdOrgAssoc sub report
 *
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentDigitalResources] AS 
WITH cte_Descriptors AS 
	(	SELECT DescriptorId, CodeValue, Description
		FROM edfi.Descriptor WITH (NOLOCK)
		WHERE DescriptorId IN (	SELECT DescriptorId FROM edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor WITH (NOLOCK)
								UNION
								SELECT DescriptorId FROM edfi.PrimaryLearningDeviceAccessDescriptor WITH (NOLOCK)
								UNION
								SELECT DescriptorId FROM edfi.PrimaryLearningDeviceProviderDescriptor WITH (NOLOCK)
								UNION
								SELECT DescriptorId FROM edfi.BarrierToInternetAccessInResidenceDescriptor WITH (NOLOCK)
								UNION
								SELECT DescriptorId FROM edfi.InternetAccessTypeInResidenceDescriptor WITH (NOLOCK)
								UNION
								SELECT DescriptorId FROM edfi.InternetPerformanceInResidenceDescriptor WITH (NOLOCK)
							  )
	)

SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName 
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName 

	,SEOA.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,PrimaryLearningDeviceAwayFromSchool.CodeValue		'PrimaryLearningDeviceAwayFromSchoolCode'
	,PrimaryLearningDeviceAwayFromSchool.Description	'PrimaryLearningDeviceAwayFromSchoolDescription'
	,PrimaryLearningDeviceAccess.CodeValue				'PrimaryLearningDeviceAccessCode'
	,PrimaryLearningDeviceAccess.Description			'PrimaryLearningDeviceAccessDescription'
	,PrimaryLearningDeviceProvider.CodeValue			'PrimaryLearningDeviceProviderCode'
	,PrimaryLearningDeviceProvider.Description			'PrimaryLearningDeviceProviderDescription'
	,CASE InternetAccessInResidence
		WHEN 1 THEN 'Y'
		WHEN 0 THEN 'N'
		ELSE NULL END									'InternetAccessInResidence'
	,BarrierToInternetAccessInResidence.CodeValue		'BarrierToInternetAccessInResidenceCode'
	,BarrierToInternetAccessInResidence.Description		'BarrierToInternetAccessInResidenceDescription'
	,InternetAccessTypeInResidence.CodeValue			'InternetAccessTypeInResidenceCode'
	,InternetAccessTypeInResidence.Description			'InternetAccessTypeInResidenceDescription'
	,InternetPerformanceInResidence.CodeValue			'InternetPerformanceInResidenceCode'
	,InternetPerformanceInResidence.Description			'InternetPerformanceInResidenceDescription'
	,SEOA.CreateDate
	,SEOA.LastModifiedDate
	,SEOA.Id AS [StudentEducationOrganizationAssociationId]
FROM 
	edfi.StudentEducationOrganizationAssociation SEOA WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOA.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOA.EducationOrganizationId

	LEFT JOIN cte_Descriptors PrimaryLearningDeviceAwayFromSchool 
		ON PrimaryLearningDeviceAwayFromSchool.DescriptorId = SEOA.PrimaryLearningDeviceAwayFromSchoolDescriptorId

	LEFT JOIN cte_Descriptors PrimaryLearningDeviceAccess 
		ON PrimaryLearningDeviceAccess.DescriptorId = SEOA.PrimaryLearningDeviceAccessDescriptorId

	LEFT JOIN cte_Descriptors PrimaryLearningDeviceProvider 
		ON PrimaryLearningDeviceProvider.DescriptorId = SEOA.PrimaryLearningDeviceProviderDescriptorId

	LEFT JOIN cte_Descriptors BarrierToInternetAccessInResidence 
		ON BarrierToInternetAccessInResidence.DescriptorId = SEOA.BarrierToInternetAccessInResidenceDescriptorId

	LEFT JOIN cte_Descriptors InternetAccessTypeInResidence 
		ON InternetAccessTypeInResidence.DescriptorId = SEOA.InternetAccessTypeInResidenceDescriptorId

	LEFT JOIN cte_Descriptors InternetPerformanceInResidence 
		ON InternetPerformanceInResidence.DescriptorId = SEOA.InternetPerformanceInResidenceDescriptorId

GO

