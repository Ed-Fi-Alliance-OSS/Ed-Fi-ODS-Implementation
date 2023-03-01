/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	Local Education agency
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */

CREATE or ALTER VIEW nmped_rpt.vw_local_education_agency AS 
SELECT 
	LEA.LocalEducationAgencyId
	,SUBSTRING(CAST(LEA.LocalEducationAgencyId AS VARCHAR(10)), 3, 3)	DistrictCode
	,EO.NameOfInstitution DistrictName
	,CharterStatusDescriptor.codeValue CharterStatusCode
	,CharterStatusDescriptor.ShortDescription CharterStatusShortDescription
FROM edfi.LocalEducationAgency LEA WITH (NOLOCK)
JOIN edfi.EducationOrganization EO WITH (NOLOCK)
	ON EO.EducationOrganizationId = LEA.LocalEducationAgencyId
JOIN edfi.Descriptor CharterStatusDescriptor WITH (NOLOCK)
	ON CharterStatusDescriptor.DescriptorId = LEA.CharterStatusDescriptorId