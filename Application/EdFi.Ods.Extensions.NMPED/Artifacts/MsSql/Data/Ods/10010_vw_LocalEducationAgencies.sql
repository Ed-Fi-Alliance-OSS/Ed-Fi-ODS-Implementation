SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 04/11/2023
* Desc: This view has been created to display LocalEducationAgency (mostly to simplify Descriptor joins)
* Dependencies:
*
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER   VIEW [nmped_rpt].[vw_LocalEducationAgencies]
AS

WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.LocalEducationAgencyCategoryDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.CharterStatusDescriptor WITH (NOLOCK))
)

SELECT LEA.[LocalEducationAgencyId]
	   ,LEACategory.CodeValue AS [LEACategoryCode]
	   ,LEACategory.[Description] AS [LEACategoryDescription]
	   ,LEACharterStatus.CodeValue AS [LEACharterStatusCode]
	   ,LEACharterStatus.[Description] AS [LEACharterStatusDescription]
	   ,EO.OperationalStatusDescription
	   ,CASE WHEN 
		(SELECT TOP 1 SchoolId FROM nmped_rpt.vw_Schools 
			WHERE LocalEducationAgencyId = LEA.LocalEducationAgencyId 
			AND CharterStatusCode = 'District Charter') IS NULL THEN 'N' ELSE 'Y' END AS [DistrictHasLocalCharters]
FROM edfi.LocalEducationAgency LEA WITH (NOLOCK)
INNER JOIN nmped_rpt.vw_EducationOrganizations_Basic EO
	ON (EO.EducationOrganizationId = LEA.LocalEducationAgencyId)
LEFT JOIN cte_Descriptors LEACategory WITH (NOLOCK)
	ON (LEACategory.DescriptorId = LEA.LocalEducationAgencyCategoryDescriptorId)
LEFT JOIN cte_Descriptors LEACharterStatus WITH (NOLOCK)
	ON (LEACharterStatus.DescriptorId = LEA.CharterStatusDescriptorId)

GO


