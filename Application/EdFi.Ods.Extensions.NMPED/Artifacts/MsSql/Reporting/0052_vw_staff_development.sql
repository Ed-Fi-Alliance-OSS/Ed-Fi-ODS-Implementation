/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	vw_staff_development
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */

CREATE or ALTER VIEW nmped_rpt.vw_staff_development AS select
	Staff.StaffUniqueId
	,NSD.StartDate
	,NSD.EndDate
	,StaffDevelopmentActivityCodeDescriptor.codeValue StaffDevelopmentActivityCode
	,StaffDevelopmentActivityCodeDescriptor.ShortDescription StaffDevelopmentActivityDescription
	,StaffDevelopmentPurposeCodeDescriptor.CodeValue StaffDevelopmentPurposeCode
	,StaffDevelopmentPurposeCodeDescriptor.shortDescription StaffDevelopmentPurposeDescription
	,ActivityHours
	,StaffCreditsEarned
	,MentorTraining
	,MentorIdUniqueId
from nmped.StaffDevelopment nsd WITH (NOLOCK)
JOIN edfi.Staff Staff  WITH (NOLOCK)
	ON Staff.StaffUSI = NSD.StaffUSI
JOIN edfi.Descriptor StaffDevelopmentActivityCodeDescriptor  WITH (NOLOCK)
	ON StaffDevelopmentActivityCodeDescriptor.DescriptorId = NSD.StaffDevelopmentActivityCodeDescriptorId
JOIN edfi.Descriptor StaffDevelopmentPurposeCodeDescriptor  WITH (NOLOCK)
	ON StaffDevelopmentPurposeCodeDescriptor.DescriptorId = NSD.StaffDevelopmentPurposeCodeDescriptorId