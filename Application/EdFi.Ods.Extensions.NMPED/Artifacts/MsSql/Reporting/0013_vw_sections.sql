/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon hickam
 * Email:	jon.hickam@gmail.com
 * Date:	02-26-2023
 * Desc:	section 
 *
 */


CREATE OR ALTER VIEW nmped_rpt.vw_sections AS 
SELECT
	 Section.LocalCourseCode
	,Section.SchoolId
	,section.SchoolYear
	,section.SectionIdentifier
	,Section.SessionName
	,Section.SequenceOfCourse
	,SEction.AvailableCredits
	,OfficialAttendancePeriod
	,v_sess.BeginDate
	,v_sess.EndDate
	,EducationalEnvironmentDescriptor.CodeValue EducationalenvironmentCode
	,EducationalEnvironmentDescriptor.ShortDescription EducationalEnvironmentDescription
	,v_sess.SchoolName
	,v_sess.DistrictName
	,v_sess.LocalEducationAgencyid
	,v_sess.DISTRICT_CODE
	,NMPEDClassPeriodDescriptor.codeValue NMPEDClassPeriodCode
	,NMPEDClassPeriodDescriptor.ShortDescription NMPEDClassPeriodDescription
	,PreKClassTypeDescriptor.CodeValue PreKClassTypeCode
	,PreKClassTypeDescriptor.ShortDescription PreKClassTypeDescription
	,AvailableCreditTypeDescriptor.CodeValue AvailableCreditTypeCode
	,AvailableCreditTypeDescriptor.ShortDescription AvailableCreditTypeDescription
	,InstructionLanguageDescriptor.CodeValue InstructionLanguageCode
	,InstructionLanguageDescriptor.ShortDescription InstructionLanguageDescription
FROM
	 edfi.Section WITH (NOLOCK)
INNER JOIN nmped_rpt.vw_sessions v_sess WITH (NOLOCK)
	on v_sess.sessionName = Section.SessionName 
	and v_sess.schoolId = Section.SchoolId
	and v_sess.SchoolYear = Section.SchoolYear
LEFT JOIN edfi.descriptor EducationalEnvironmentDescriptor WITH (NOLOCK)
	ON Section.EducationalEnvironmentDescriptorId= EducationalEnvironmentDescriptor.DescriptorId
LEFT JOIN nmped.SectionExtension SE WITH (NOLOCK)
	ON Section.LocalCourseCode = SE.LocalCourseCode
	AND Section.Schoolid = SE.SchoolId
	AND Section.SchoolYear = SE.SchoolYear
	AND Section.SectionIdentifier = SE.SectionIdentifier
	AND Section.SessionName = SE.SessionName
LEFT JOIN edfi.descriptor NMPEDClassPeriodDescriptor WITH (NOLOCK)
	ON NMPEDClassPeriodDescriptor.DescriptorId = SE.NMPEDClassPeriodDescriptorId
LEFT JOIN edfi.Descriptor PreKClassTypeDescriptor WITH (NOLOCK)
	ON PreKClassTypeDescriptor.DescriptorId = SE.PreKClassTypeDescriptorId
LEFT JOIN edfi.descriptor AvailableCreditTypeDescriptor WITH (NOLOCK)
	ON AvailableCreditTypeDescriptor.DescriptorId = Section.AvailableCreditTypeDescriptorId
LEFT JOIN edfi.Descriptor InstructionLanguageDescriptor WITH (NOLOCK)
	ON Section.InstructionLanguageDescriptorId = InstructionLanguageDescriptor.DescriptorId