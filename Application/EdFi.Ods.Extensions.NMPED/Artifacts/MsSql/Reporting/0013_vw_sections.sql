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
* 
* Alt Id: 001 
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/29/2023
* Alt Desc: Updated to use new column names from vw_sessions, use Description instead of ShortDescription, and clarity
*     This view shows Section and SectionExtension information joined to vw_sessions with values from edfi.Descriptor
*/
CREATE OR ALTER VIEW nmped_rpt.vw_sections AS 
SELECT
	 S.SchoolYear
	,S.SchoolId
	,v_sess.SchoolName
	,v_sess.DistrictId
	,v_sess.DistrictName
	,v_sess.DistrictCode
	,S.LocalCourseCode
	,S.SectionIdentifier
	,S.SessionName
	,S.SequenceOfCourse
	,S.AvailableCredits
	,S.OfficialAttendancePeriod
	,v_sess.BeginDate
	,v_sess.EndDate
	,EducationalEnvironmentDescriptor.CodeValue  AS [EducationalEnvironmentCode]
	,EducationalEnvironmentDescriptor.[Description] AS [EducationalEnvironmentDescription]
	,NMPEDClassPeriodDescriptor.CodeValue AS [NMPEDClassPeriodCode]
	,NMPEDClassPeriodDescriptor.[Description] AS [NMPEDClassPeriodDescription]
	,PreKClassTypeDescriptor.CodeValue AS [PreKClassTypeCode]
	,PreKClassTypeDescriptor.[Description] AS [PreKClassTypeDescription]
	,AvailableCreditTypeDescriptor.CodeValue AS [AvailableCreditTypeCode]
	,AvailableCreditTypeDescriptor.[Description] AS [AvailableCreditTypeDescription]
	,InstructionLanguageDescriptor.CodeValue AS [InstructionLanguageCode]
	,InstructionLanguageDescriptor.[Description] AS [InstructionLanguageDescription]
FROM
	 edfi.Section S WITH (NOLOCK)

INNER JOIN nmped_rpt.vw_sessions v_sess WITH (NOLOCK)
	ON (v_sess.SessionName = S.SessionName 
		and v_sess.SchoolId = S.SchoolId
		and v_sess.SchoolYear = S.SchoolYear)

LEFT JOIN edfi.Descriptor EducationalEnvironmentDescriptor WITH (NOLOCK)
	ON (EducationalEnvironmentDescriptor.DescriptorId = S.EducationalEnvironmentDescriptorId) 

LEFT JOIN nmped.SectionExtension SE WITH (NOLOCK)
	ON (SE.LocalCourseCode = S.LocalCourseCode
		AND SE.SchoolId = S.SchoolId
		AND SE.SchoolYear = S.SchoolYear
		AND SE.SectionIdentifier = S.SectionIdentifier
		AND SE.SessionName = S.SessionName)

LEFT JOIN edfi.Descriptor NMPEDClassPeriodDescriptor WITH (NOLOCK)
	ON (NMPEDClassPeriodDescriptor.DescriptorId = SE.NMPEDClassPeriodDescriptorId)

LEFT JOIN edfi.Descriptor PreKClassTypeDescriptor WITH (NOLOCK)
	ON (PreKClassTypeDescriptor.DescriptorId = SE.PreKClassTypeDescriptorId)

LEFT JOIN edfi.Descriptor AvailableCreditTypeDescriptor WITH (NOLOCK)
	ON (AvailableCreditTypeDescriptor.DescriptorId = S.AvailableCreditTypeDescriptorId)

LEFT JOIN edfi.Descriptor InstructionLanguageDescriptor WITH (NOLOCK)
	ON (InstructionLanguageDescriptor.DescriptorId = S.InstructionLanguageDescriptorId) 
	
GO