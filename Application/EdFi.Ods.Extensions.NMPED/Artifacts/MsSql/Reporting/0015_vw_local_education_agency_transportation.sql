/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	Local Education agency transportation
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */
 
CREATE or ALTER VIEW nmped_rpt.vw_local_education_agency_transportation AS 
SELECT 
	LEAT.LocalEducationAgencyId
	,SUBSTRING(CAST(LEAT.LocalEducationAgencyId AS VARCHAR(10)), 3, 3)	DistrictCode
	,EO.NameOfInstitution DistrictName
	,LEAT.Count
	,TransportationCategoryDescriptor1.codeValue TransportationCategory1Code
	,TransportationCategoryDescriptor1.ShortDescription TransportationCategory1ShortDescription
	,TransportationCategoryDescriptor2.codeValue TransportationCategory2Code
	,TransportationCategoryDescriptor2.ShortDescription TransportationCategory2ShortDescription

FROM nmped.LocalEducationAgencyTransportation LEAT WITH (NOLOCK)
JOIN edfi.EducationOrganization EO WITH (NOLOCK)
	ON EO.EducationOrganizationId = LEAT.LocalEducationAgencyId
JOIN edfi.Descriptor TransportationCategoryDescriptor1 WITH (NOLOCK)
	ON TransportationCategoryDescriptor1.DescriptorId = LEAT.CategoryDescriptor01TransportationCategoryDescriptorId

JOIN edfi.Descriptor TransportationCategoryDescriptor2 WITH (NOLOCK)
	ON TransportationCategoryDescriptor2.DescriptorId = LEAT.CategoryDescriptor02TransportationCategoryDescriptorId
