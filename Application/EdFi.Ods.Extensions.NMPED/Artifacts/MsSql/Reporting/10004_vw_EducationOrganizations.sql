/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 02/20/2023
* Desc: This view has been created to display data from the EducationOrganization table and its associated tables
* - EducationOrganizationCategory
* - EducationOrganizationAddress (twice, one for Mailing Address and once for Physical Address)
* - When extensions are added for more EducationOrganization information they should be added to this view
*
* 
* Alt Id: 001 (Increment value each change)
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 05/10/2023
* Alt Desc: Updated to add references to the nmped.EducationOrganizationExtension.
* DO NOT RUN THIS VIEW IF THE EXTENSION TABLE HASN'T BEEN CREATED
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_EducationOrganizations]
AS

WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.OperationalStatusDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.EducationOrganizationCategoryDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.StateAbbreviationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.LocaleDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.AddressTypeDescriptor WITH (NOLOCK)
UNION -- Alt Id: 001 -- New Descriptors added here via Namespace as there is no control table
SELECT DescriptorId FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] IN
	('uri://nmped.org/VirtualLocationStatusDescriptor','uri://nmped.org/LunchProgramTypeDescriptor'))
)

SELECT 
	  -- Basic EdOrg Data
	   EO.[EducationOrganizationId]
      ,EO.[NameOfInstitution]
      ,EO.[ShortNameOfInstitution]
      ,EO.[WebSite]
      ,OperationalStatusDescriptor.[Description] AS [OperationalStatusDescription]
      ,EO.[Discriminator]
      ,EO.[CreateDate] AS [EducationOrganization_CreateDate]
      ,EO.[LastModifiedDate] AS [EducationOrganization_LastModifiedDate]

	  -- EdOrgCategory (formerly ORG_TYPE_CODE in STARS)
	  ,EOCategoryDescriptor.[Description] AS [EducationOrganizationCategoryDescription]

	  -- Alt Id: 001 -- New fields from extension table
	  -- Extension data from nmped.EducationOrganizationExtension
	  ,EOE.NCESNumber
	  ,EOE.AlternativeLocation
	  ,EOE.BoardingSchoolIndicator
	  ,EOE.PersistentlyDangerousStatus
	  ,EOE.OpenDate
	  ,EOE.CloseDate
	  ,EOE.LastStatusDate
	  ,EOE.PhoneNumber
	  ,EOE.PreviousDistrictId
	  ,EOE.PreviousSchoolId
	  ,LunchProgramType.CodeValue AS [LunchProgramTypeCode]
	  ,LunchProgramType.[Description] AS [LunchProgramTypeDescription]
	  ,VirtualLocationStatus.CodeValue AS [VirtualLocationStatusCode]
	  ,VirtualLocationStatus.[Description] AS [VirtualLocationStatusDescription]
	  ,EOE.MagnetLocationIndicator

	  -- EdOrgAddress Stuff, flattened
	  ,MailingAddress.StreetNumberName AS [MailingAddress_StreetNumberName]
	  ,MailingAddress.BuildingSiteNumber AS [MailingAddress_BuildingSiteNumber]
	  ,MailingAddress.ApartmentRoomSuiteNumber AS [MailingAddress_ApartmentRoomSuiteNumber]
	  ,MailingAddress.City AS [MailingAddress_City]
	  ,MailingAddressStateDescriptor.CodeValue AS [MailingAddress_StateAbbreviationCode]
	  ,MailingAddress.PostalCode AS [MailingAddress_PostalCode]
	  ,MailingAddress.NameOfCounty AS [MailingAddress_NameOfCounty]
	  ,PhysicalAddress.StreetNumberName AS [PhysicalAddress_StreetNumberName]
	  ,PhysicalAddress.BuildingSiteNumber AS [PhysicalAddress_BuildingSiteNumber]
	  ,PhysicalAddress.ApartmentRoomSuiteNumber AS [PhysicalAddress_ApartmentRoomSuiteNumber]
	  ,PhysicalAddress.City AS [PhysicalAddress_City]
	  ,PhysicalAddressStateDescriptor.CodeValue AS [PhysicalAddress_StateAbbreviationCode]
	  ,PhysicalAddress.PostalCode AS [PhysicalAddress_PostalCode]
	  ,PhysicalAddress.NameOfCounty AS [PhysicalAddress_NameOfCounty]
	  ,PhysicalAddress.Latitude AS [PhysicalAddress_Latitude]
	  ,PhysicalAddress.Longitude AS [PhysicalAddress_Longitude]
	  ,PhysicalAddressLocaleDescriptor.[Description] AS [PhysicalAddress_LocaleDescription]

	  -- Parsed codes for District and Location, then District Key in case we have to join to STARS
	  ,SUBSTRING(CAST(EO.[EducationOrganizationId] AS VARCHAR(10)),3,3) AS [DistrictCode]
	  ,SUBSTRING(CAST(EO.[EducationOrganizationId] AS VARCHAR(10)),6,3) AS [StateLocationID]
	  ,'35000' + SUBSTRING(CAST(EO.[EducationOrganizationId] AS VARCHAR(10)), 3, 3) AS DISTRICT_KEY
FROM [edfi].[EducationOrganization] EO WITH (NOLOCK)
-- Alt Id: 001 -- Added join to extension table
LEFT JOIN nmped.EducationOrganizationExtension EOE WITH (NOLOCK)
	ON (EO.EducationOrganizationId = EOE.EducationOrganizationId)
-- Alt Id: 001 -- Descriptor join for extension table
LEFT JOIN cte_Descriptors LunchProgramType WITH (NOLOCK) 
	ON (LunchProgramType.DescriptorId = EOE.LunchProgramTypeDescriptorId)
-- Alt Id: 001 -- Descriptor join for extension table
LEFT JOIN cte_Descriptors VirtualLocationStatus WITH (NOLOCK) 
	ON (VirtualLocationStatus.DescriptorId = EOE.VirtualLocationStatusDescriptorId)

LEFT JOIN cte_Descriptors OperationalStatusDescriptor WITH (NOLOCK) 
	ON (OperationalStatusDescriptor.DescriptorId = EO.OperationalStatusDescriptorId)

LEFT JOIN edfi.EducationOrganizationCategory EOC WITH (NOLOCK) 
	ON (EOC.EducationOrganizationId = EO.EducationOrganizationId)

LEFT JOIN cte_Descriptors EOCategoryDescriptor WITH (NOLOCK) 
	ON (EOCategoryDescriptor.DescriptorId = EOC.EducationOrganizationCategoryDescriptorId)

LEFT JOIN edfi.EducationOrganizationAddress MailingAddress WITH (NOLOCK) 
	ON (MailingAddress.EducationOrganizationId = EO.EducationOrganizationId 
	AND MailingAddress.AddressTypeDescriptorId = 
	(SELECT TOP 1 DescriptorId FROM cte_Descriptors WHERE [Namespace]='uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue = 'Mailing'))

LEFT JOIN edfi.EducationOrganizationAddress PhysicalAddress WITH (NOLOCK) 
	ON (PhysicalAddress.EducationOrganizationId = EO.EducationOrganizationId 
	AND PhysicalAddress.AddressTypeDescriptorId = 
	(SELECT TOP 1 DescriptorId FROM cte_Descriptors WHERE [Namespace]='uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue = 'Physical'))

LEFT JOIN cte_Descriptors MailingAddressStateDescriptor WITH (NOLOCK) 
	ON (MailingAddressStateDescriptor.DescriptorId = MailingAddress.StateAbbreviationDescriptorId)

LEFT JOIN cte_Descriptors PhysicalAddressStateDescriptor WITH (NOLOCK) 
	ON (PhysicalAddressStateDescriptor.DescriptorId = PhysicalAddress.StateAbbreviationDescriptorId)

LEFT JOIN cte_Descriptors PhysicalAddressLocaleDescriptor WITH (NOLOCK) 
	ON (PhysicalAddressLocaleDescriptor.DescriptorId = PhysicalAddress.LocaleDescriptorId)

GO

/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 02/20/2023
* Desc: This view has been created to display basic data from the EducationOrganization table and its associated tables
* - EducationOrganizationCategory
*
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER   VIEW [nmped_rpt].[vw_EducationOrganizations_Basic]
AS

WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.OperationalStatusDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.EducationOrganizationCategoryDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.StateAbbreviationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.LocaleDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.AddressTypeDescriptor WITH (NOLOCK))
)

SELECT EO.[EducationOrganizationId]
      ,EO.[NameOfInstitution]
      ,EO.[ShortNameOfInstitution]
      ,OperationalStatusDescriptor.[Description] AS [OperationalStatusDescription]
      ,EO.[Discriminator]
	  ,EOCategoryDescriptor.[Description] AS [EducationOrganizationCategoryDescription]
	  ,SUBSTRING(CAST(EO.[EducationOrganizationId] AS VARCHAR(10)),3,3) AS [DistrictCode]
	  ,SUBSTRING(CAST(EO.[EducationOrganizationId] AS VARCHAR(10)),6,3) AS [StateLocationID]
	  ,'35000' + SUBSTRING(CAST(EO.[EducationOrganizationId] AS VARCHAR(10)), 3, 3) AS DISTRICT_KEY
FROM [edfi].[EducationOrganization] EO WITH (NOLOCK)

LEFT JOIN cte_Descriptors OperationalStatusDescriptor WITH (NOLOCK) 
	ON (OperationalStatusDescriptor.DescriptorId = EO.OperationalStatusDescriptorId)

LEFT JOIN edfi.EducationOrganizationCategory EOC WITH (NOLOCK) 
	ON (EOC.EducationOrganizationId = EO.EducationOrganizationId)

LEFT JOIN cte_Descriptors EOCategoryDescriptor WITH (NOLOCK) 
	ON (EOCategoryDescriptor.DescriptorId = EOC.EducationOrganizationCategoryDescriptorId)

GO
