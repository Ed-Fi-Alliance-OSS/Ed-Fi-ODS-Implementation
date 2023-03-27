/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/14/2023
* Desc: This view has been created to display NMPED Staff Classification (Assignment) Licensure Requirements.
* The view incorporates data from the following tables:
* - nmped_rpt.StaffClassificationCertificateRequirement
* - nmped_rpt.Descriptor
* - edfi.Descriptor
*
* 
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_StaffClassificationCertRequirements]
AS

SELECT SCCR.[SchoolYear]
      ,StaffClass.CodeValue				AS [StaffClassificationCode]
	  ,StaffClass.ShortDescription		AS [StaffClassificationShortDescription]
	  ,StaffClass.[Description]			AS [StaffClassificationDescription]
      ,LicenseType.CodeValue			AS [CertTypeCode]
	  ,LicenseType.ShortDescription		AS [CertTypeCategory]
	  ,LicenseType.[Description]		AS [CertTypeDescription]
	  ,LicenseArea.CodeValue			AS [CertAreaCode]
	  ,LicenseArea.ShortDescription		AS [CertAreaDescription]
	  ,LicenseLevel.CodeValue			AS [CertLevelCode]
	  ,LicenseLevel.ShortDescription	AS [CertLevelCategory]
	  ,LicenseLevel.[Description]		AS [CertLevelDescription]
      ,SCCR.[LicenseRequirementGroup]
      ,SCCR.[CreateDate]
      ,SCCR.[LastModifiedDate]
FROM nmped_rpt.StaffClassificationCertificateRequirement SCCR

LEFT JOIN edfi.Descriptor StaffClass WITH (NOLOCK)
	ON (StaffClass.DescriptorId = SCCR.StaffClassificationDescriptorId)

LEFT JOIN nmped_rpt.Descriptor LicenseType WITH (NOLOCK)
	ON (LicenseType.DescriptorId = SCCR.LicenseTypeDescriptorId)

LEFT JOIN nmped_rpt.Descriptor LicenseArea WITH (NOLOCK)
	ON (LicenseArea.DescriptorId = SCCR.LicenseAreaDescriptorId)

LEFT JOIN nmped_rpt.Descriptor LicenseLevel WITH (NOLOCK)
	ON (LicenseLevel.DescriptorId = SCCR.LicenseLevelDescriptorId)

GO