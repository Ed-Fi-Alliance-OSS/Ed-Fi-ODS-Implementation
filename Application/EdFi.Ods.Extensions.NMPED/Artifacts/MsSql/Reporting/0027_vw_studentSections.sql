/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon hickam
 * Email:	jon.hickam@gmail.com
 * Date:	02-26-2023
 * Desc:	vw_student_sections
 *
 */


CREATE OR ALTER VIEW nmped_rpt.vw_student_sections AS 
SELECT
	 Student.StudentUniqueId
	,Student.StudentUSI
	,Section.LocalCourseCode
	,Section.SchoolId
	,section.SchoolYear
	,section.SectionIdentifier
	,Section.SessionName
	,Section.SequenceOfCourse
	,SEction.AvailableCredits
	,OfficialAttendancePeriod
	,EducationalEnvironmentDescriptor.CodeValue EducationalenvironmentCode
	,EducationalEnvironmentDescriptor.ShortDescription EducationalEnvironmentDescription
	,v_sess.SchoolName
	,v_sess.DistrictName
	,v_sess.LocalEducationAgencyid
	,v_sess.DISTRICT_CODE
	,NMPEDClassPeriodDescriptor.codeValue NMPEDClassPeriodCode
	,NMPEDClassPeriodDescriptor.ShortDescription NMPEDClassPeriodDescription
	,PreKClassTypeDescriptor.CodeValue PreKClassTypeCode
	,PreKClassTypeDescriptor.ShortDescription PreKClassTypeShortDescription
	,AvailableCreditTypeDescriptor.CodeValue AvailableCreditTypeCode
	,AvailableCreditTypeDescriptor.ShortDescription AvailableCreditTypeDescription
	,InstructionLanguageDescriptor.CodeValue InstructionLanguageCode
	,InstructionLanguageDescriptor.ShortDescription InstructionLanguageDescription
	,SpecialProgramCodeDescriptor.CodeValue SpecialProgramCode
	,SpecialProgramCodeDescriptor.Shortdescription SpecialProgramCodeDescription
	,SSAE.AlternateCreditCourseCode
FROM
	 edfi.Section WITH (NOLOCK)
JOIN nmped_rpt.vw_sessions v_sess WITH (NOLOCK)
	on v_sess.sessionName = Section.SessionName 
	and v_sess.schoolId = Section.SchoolId
	and v_sess.SchoolYear = Section.SchoolYear
INNER JOIN edfi.StudentSectionAssociation SSA WITH (NOLOCK)
	ON SSA.LocalCourseCode = Section.LocalCourseCode
	AND SSA.SchoolId = Section.SchoolId
	AND SSA.SchoolYear = section.SchoolYear
	AND SSA.SectionIdentifier = section.SectionIdentifier
	AND SSA.SessionName = section.SessionName
INNER JOIN edfi.Student WITH (NOLOCK)
	ON Student.StudentUSI = SSA.StudentUSI
INNER JOIN nmped.StudentSectionAssociationExtension SSAE
	ON SSA.BeginDate = SSAE.BeginDate
	AND SSA.LocalCourseCode = SSAE.LocalCourseCode
	AND SSA.SchoolId = SSAE.SchoolId
	AND SSA.SchoolYear = SSAE.SchoolYear
	AND SSA.SectionIdentifier = SSAE.SectionIdentifier
	AND SSA.SessionName = SSAE.SessionName
	AND SSA.StudentUSI = SSAE.studentUSI
LEFT JOIN edfi.Descriptor SpecialProgramCodeDescriptor WITH (NOLOCK)
	ON SSAE.SpecialProgramCodeDescriptorId = SpecialProgramCodeDescriptor.DescriptorId
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