/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	This script creates a staff section association and brings in data from the staff and section views.
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */

CREATE or ALTER VIEW nmped_rpt.vw_staff_Sections AS 
SELECT 
	 staff.StaffUniqueId
	 ,staff.StaffUSI
	 ,staff.MiddleName 
	 ,staff.LastSurname 
	 ,staff.BirthDate 
	 ,vw_sections.LocalEducationAgencyId
	 ,vw_sections.SchoolId
	 ,vw_sections.DistrictName
	 ,vw_sections.SchoolName
	 ,vw_sections.District_Code
	 ,vw_sections.LocalCourseCode
	 ,vw_sections.SchoolYear
	 ,vw_sections.SectionIdentifier
	 ,vw_sections.SessionName
	 ,ClassroomPositionDescriptor.ShortDescription ClassroomPositionDescription
FROM edfi.StaffSectionAssociation ssA WITH (NOLOCK)
INNER JOIN nmped_rpt.vw_sections WITH (NOLOCK)
	ON ssa.LocalcourseCode = vw_sections.LocalCourseCode
	AND ssa.SchoolId = vw_sections.SchoolId
	AND ssa.SchoolYear = vw_sections.SchoolYear
	AND ssa.SectionIdentifier = vw_sections.Sectionidentifier
	AND ssa.SessionName = vw_sections.sessionName
INNER JOIN edfi.Staff Staff WITH (NOLOCK)
	ON SSA.StaffUSI = staff.StaffUSI
LEFT JOIN edfi.Descriptor ClassroomPositionDescriptor
  ON ssa.ClassroomPositionDescriptorId = ClassroomPositionDescriptor.DescriptorId