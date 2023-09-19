
/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	05-05-2023
 * Desc:	This script creates an Address
 *			view, to build into a StudEdOrgAssoc sub report
 *
 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentAddress] AS 
WITH cte_Descriptors AS 
(	SELECT
		DescriptorId,
		CodeValue,
		Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE
		Namespace IN (	'uri://ed-fi.org/StateAbbreviationDescriptor',
						'uri://ed-fi.org/AddressTypeDescriptor')
)

SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName 
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName 

	--resource documentation starts
	,SEOAA.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,AddressType.CodeValue			[AddressTypeCode]
	,AddressType.Description		[AddressTypeDescription]
	,SEOAA.City
	,SEOAA.PostalCode
	,StateAbbreviation.CodeValue	[StateCode]
	,SEOAA.StreetNumberName
	,ApartmentRoomSuiteNumber
	,BeginDate
	,EndDate

	,SEOAA.CreateDate

FROM 
	edfi.StudentEducationOrganizationAssociationAddress SEOAA WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOAA.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON SEOAA.EducationOrganizationId = VDL.EducationOrganizationId_School

	LEFT JOIN edfi.StudentEducationOrganizationAssociationAddressPeriod SEOAAP WITH (NOLOCK)
		ON SEOAAP.AddressTypeDescriptorId = SEOAA.AddressTypeDescriptorId
		AND SEOAAP.City = SEOAA.City
		AND SEOAAP.EducationOrganizationId = SEOAA.EducationOrganizationId
		AND SEOAAP.PostalCode = SEOAA.PostalCode
		AND SEOAAP.StateAbbreviationDescriptorId = SEOAA.StateAbbreviationDescriptorId
		AND SEOAAP.StreetNumberName = SEOAA.StreetNumberName
		AND SEOAAP.StudentUSI = SEOAA.StudentUSI

	LEFT JOIN cte_Descriptors StateAbbreviation WITH (NOLOCK)
		ON StateAbbreviation.DescriptorId = SEOAA.StateAbbreviationDescriptorId

	LEFT JOIN cte_Descriptors AddressType WITH (NOLOCK) 
		ON AddressType.DescriptorId = SEOAA.AddressTypeDescriptorId
GO

