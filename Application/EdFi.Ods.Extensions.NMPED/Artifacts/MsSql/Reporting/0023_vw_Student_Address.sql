/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	03-7-2023
 * Desc:	This script builds a view that shows the various student addresses
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */


CREATE OR ALTER VIEW nmped_rpt.vw_student_address
AS SELECT
    s.StudentUSI
	,s.StudentUniqueId
	,s.FirstName
	,s.LastSurname
	,s.BirthDate
	,SEOA.EducationOrganizationId StudentEdOrgAssocEdOrgId
	,SEOA_ADDRESS.ApartmentRoomSuiteNumber
	,SEOA_ADDRESS.BuildingSiteNumber
	,SEOA_ADDRESS.City
	,SEOA_ADDRESS.PostalCode
	,StateDescriptor.CodeValue StateCode
	,AddressTypeDescriptor.CodeValue AddressTypeCode
	,AddressTypeDescriptor.ShortDescription AddressTypeDescription


FROM edfi.Student S WITH (NOLOCK)
INNER JOIN edfi.StudentEducationOrganizationAssociation SEOA
	ON S.StudentUSI = SEOA.StudentUSI
INNER JOIN  edfi.StudentEducationOrganizationAssociationAddress SEOA_ADDRESS
 ON SEOA_ADDRESS.StudentUSI = S.StudentUSI
 AND SEOA_ADDRESS.EducationOrganizationId = SEOA.EducationOrganizationId
LEFT JOIN edfi.Descriptor StateDescriptor WITH (NOLOCK)
		ON SEOA_ADDRESS.StateAbbreviationDescriptorId = StateDescriptor.DescriptorId
INNER JOIN edfi.Descriptor AddressTypeDescriptor WITH (NOLOCK)
		ON SEOA_ADDRESS.AddressTypeDescriptorId = AddressTypeDescriptor.DescriptorId
	