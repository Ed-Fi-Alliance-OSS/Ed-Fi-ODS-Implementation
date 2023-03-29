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
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_EducationOrganizations]
AS
SELECT EO.[EducationOrganizationId]
      ,EO.[NameOfInstitution]
      ,EO.[ShortNameOfInstitution]
      ,EO.[WebSite]
      ,OperationalStatusDescriptor.[Description] AS [OperationalStatusDescription]
      ,EO.[Discriminator]
      ,EO.[CreateDate] AS [EducationOrganization_CreateDate]
      ,EO.[LastModifiedDate] AS [EducationOrganization_LastModifiedDate]
	  ,EOCategoryDescriptor.[Description] AS [EducationOrganizationCategoryDescription]
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
FROM [edfi].[EducationOrganization] EO WITH (NOLOCK)

LEFT JOIN edfi.Descriptor OperationalStatusDescriptor WITH (NOLOCK) 
	ON (OperationalStatusDescriptor.DescriptorId = EO.OperationalStatusDescriptorId)

LEFT JOIN edfi.EducationOrganizationCategory EOC WITH (NOLOCK) 
	ON (EOC.EducationOrganizationId = EO.EducationOrganizationId)

LEFT JOIN edfi.Descriptor EOCategoryDescriptor WITH (NOLOCK) 
	ON (EOCategoryDescriptor.DescriptorId = EOC.EducationOrganizationCategoryDescriptorId)

LEFT JOIN edfi.EducationOrganizationAddress MailingAddress WITH (NOLOCK) 
	ON (MailingAddress.EducationOrganizationId = EO.EducationOrganizationId 
	AND MailingAddress.AddressTypeDescriptorId = 
	(SELECT TOP 1 DescriptorId FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace]='uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue = 'Mailing'))

LEFT JOIN edfi.EducationOrganizationAddress PhysicalAddress WITH (NOLOCK) 
	ON (PhysicalAddress.EducationOrganizationId = EO.EducationOrganizationId 
	AND PhysicalAddress.AddressTypeDescriptorId = 
	(SELECT TOP 1 DescriptorId FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace]='uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue = 'Physical'))

LEFT JOIN edfi.Descriptor MailingAddressStateDescriptor WITH (NOLOCK) 
	ON (MailingAddressStateDescriptor.DescriptorId = MailingAddress.StateAbbreviationDescriptorId)

LEFT JOIN edfi.Descriptor PhysicalAddressStateDescriptor WITH (NOLOCK) 
	ON (PhysicalAddressStateDescriptor.DescriptorId = PhysicalAddress.StateAbbreviationDescriptorId)

LEFT JOIN edfi.Descriptor PhysicalAddressLocaleDescriptor WITH (NOLOCK) 
	ON (PhysicalAddressLocaleDescriptor.DescriptorId = PhysicalAddress.LocaleDescriptorId)

GO
