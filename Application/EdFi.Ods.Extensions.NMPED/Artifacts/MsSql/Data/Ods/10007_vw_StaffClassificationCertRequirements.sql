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
* By: Collin Neville | Nunya Bidness
* Email: collin.neville@ped.nm.gov
* Date: 04/19/2023
* Alt Desc: Added CTE to the view to grab all Descriptors.
*			Reason is to improve performance.
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_StaffClassificationCertRequirements]
AS
--Alt Id: 001 - New CTE using control tables for descriptors
WITH cte_Descriptors AS (
	SELECT
		 DescriptorId
		,NameSpace
		,CodeValue
		,ShortDescription
		,Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE 
		DescriptorId IN (SELECT 
							*
						 FROM
							edfi.StaffClassificationDescriptor WITH (NOLOCK)
						 )
	UNION
	SELECT 
		 DescriptorId
		,NameSpace
		,CodeValue
		,ShortDescription
		,Description
	FROM
		nmped_rpt.Descriptor WITH (NOLOCK)

)

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
-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
LEFT JOIN cte_Descriptors StaffClass WITH (NOLOCK)
	ON (StaffClass.DescriptorId = SCCR.StaffClassificationDescriptorId)

LEFT JOIN cte_Descriptors LicenseType WITH (NOLOCK)
	ON (LicenseType.DescriptorId = SCCR.LicenseTypeDescriptorId)

LEFT JOIN cte_Descriptors LicenseArea WITH (NOLOCK)
	ON (LicenseArea.DescriptorId = SCCR.LicenseAreaDescriptorId)

LEFT JOIN cte_Descriptors LicenseLevel WITH (NOLOCK)
	ON (LicenseLevel.DescriptorId = SCCR.LicenseLevelDescriptorId)
--Alt Id: 001 - End
GO
