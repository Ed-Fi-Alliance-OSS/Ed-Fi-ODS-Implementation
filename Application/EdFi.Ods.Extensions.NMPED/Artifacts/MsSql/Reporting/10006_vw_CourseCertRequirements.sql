/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/14/2023
* Desc: This view has been created to display NMPED Course Licensure Requirements (aka Course Cert Requirements).
* The view incorporates data from the following tables:
* - nmped_rpt.CourseCertificateRequirement
* - nmped_rpt.Descriptor
*
* 
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_CourseCertRequirements]
AS

SELECT CCR.[SchoolYear]
      ,CCR.[CourseCode]
	  ,C.[CourseTitle]
      ,LicenseType.CodeValue			AS [CertTypeCode]
	  ,LicenseType.ShortDescription		AS [CertTypeCategory]
	  ,LicenseType.[Description]		AS [CertTypeDescription]
	  ,LicenseArea.CodeValue			AS [CertAreaCode]
	  ,LicenseArea.ShortDescription		AS [CertAreaDescription]
	  ,LicenseLevel.CodeValue			AS [CertLevelCode]
	  ,LicenseLevel.ShortDescription	AS [CertLevelCategory]
	  ,LicenseLevel.[Description]		AS [CertLevelDescription]
      ,CCR.[LicenseRequirementGroup]
      ,CCR.[CreateDate]
      ,CCR.[LastModifiedDate]
FROM [nmped_rpt].[CourseCertificateRequirement] CCR

LEFT JOIN edfi.Course C WITH (NOLOCK)
	ON (C.CourseCode = CCR.CourseCode)

LEFT JOIN nmped_rpt.Descriptor LicenseType WITH (NOLOCK)
	ON (LicenseType.DescriptorId = CCR.LicenseTypeDescriptorId)

LEFT JOIN nmped_rpt.Descriptor LicenseArea WITH (NOLOCK)
	ON (LicenseArea.DescriptorId = CCR.LicenseAreaDescriptorId)

LEFT JOIN nmped_rpt.Descriptor LicenseLevel WITH (NOLOCK)
	ON (LicenseLevel.DescriptorId = CCR.LicenseLevelDescriptorId)

GO