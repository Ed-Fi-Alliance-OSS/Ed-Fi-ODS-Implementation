/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		JOn hickam
 * Email:	jon.hickam@gmail.com
 * Date:	02-26-2023
 * Desc:	sessions 
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_sessions AS 
SELECT
	 Schoolyear
	,sess.SchoolId
	,SessionName
	,BeginDate
	,EndDate
	,TotalInstructionalDays
	,TermDescriptor.CodeValue TermCodeValue
	,TermDescriptor.ShortDescription TermDescription
	,School.LocalEducationAgencyId
	,EO_School.NameOfInstitution SchoolName
	,EO_LEA.NameOfInstitution DistrictName
	,substring(CAST(EO_LEA.EducationOrganizationId AS VARCHAR(10)),3,3) DISTRICT_CODE
FROM
	 edfi.session sess
INNER JOIN edfi.EducationOrganization EO_School
	ON sess.SchoolId  = EO_School.EducationorganizationId
INNER JOIN edfi.School
	ON school.SchoolId = sess.SchoolId
INNER JOIN edfi.EducationOrganization EO_LEA
	ON school.LocalEducationAgencyId = EO_LEA.EducationOrganizationId
LEFT JOIN edfi.descriptor TermDescriptor
	ON sess.TermDescriptorId = TermDescriptor.DescriptorId