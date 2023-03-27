/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	03-7-2023
 * Desc:	This script builds a view that shows the various staff addresses
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */


CREATE OR ALTER VIEW nmped_rpt.vw_student_address
AS SELECT
	s.StaffUSI
	,s.StaffUniqueId
	,s.FirstName
	,s.LastSurname
	,s.BirthDate
	
	,StaffAddress.ApartmentRoomSuiteNumber
	,StaffAddress.BuildingSiteNumber
	,StaffAddress.City
	,StaffAddress.PostalCode
	,StateDescriptor.CodeValue StateCode
	,AddressTypeDescriptor.CodeValue AddressTypeCode
	,AddressTypeDescriptor.ShortDescription AddressTypeDescription


FROM edfi.Staff S WITH (NOLOCK)
INNER JOIN  edfi.StaffAddress
 ON StaffAddress.StaffUSI = S.StaffUSI
LEFT JOIN edfi.Descriptor StateDescriptor WITH (NOLOCK)
		ON StaffAddress.StateAbbreviationDescriptorId = StateDescriptor.DescriptorId
INNER JOIN edfi.Descriptor AddressTypeDescriptor WITH (NOLOCK)
		ON StaffAddress.AddressTypeDescriptorId = AddressTypeDescriptor.DescriptorId
	