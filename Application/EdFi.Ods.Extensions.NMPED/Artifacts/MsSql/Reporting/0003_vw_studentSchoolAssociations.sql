
/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	This script creates a studentSchoolAssociations view from Ed-Fi Resources with registration details
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */


CREATE OR ALTER  VIEW [nmped_rpt].[vw_studentSchoolAssociations]
AS SELECT
	s.StudentUniqueId
	,ssa.SchoolId,school.LocalEducationAgencyId
	,SUBSTRING(cast(School.LocalEducationAgencyId AS VARCHAR(10)),3,3) DistrictCode
	,s.FirstName
	,s.LastSurname
	,s.BirthDate
	,EC.NameOfInstitution SchoolName
	,EC2.NameOfInstitution DistrictName
	,SSA.Entrydate
	,SSA.ExitWithdrawDate
	,SSA.RepeatGradeIndicator
	,EntryTypeDescriptor.CodeValue EntryTypeCodeValue
	,EntryTypeDescriptor.ShortDescription EntryTypeShortDescription
	,ExitWithdrawTypeDescriptor.CodeValue ExitWithdrawTypeCodeValue
	,ExitWithdrawTypeDescriptor.ShortDescription ExitWithdrawTypeShortDescription
	,EntryGradeLevelDescriptor.CodeValue grade
FROM edfi.student s
JOIN edfi.StudentSchoolAssociation SSA
	ON S.StudentUSI = SSA.StudentUSI
JOIN edfi.School
	ON SSA.SchoolId = School.SchoolId
JOIN edfi.Educationorganization EC
	ON EC.EducationOrganizationId = SSA.SchoolId
JOIN edfi.Educationorganization EC2
	ON School.LocalEducationAgencyId = EC2.EducationOrganizationid
LEFT JOIN  edfi.descriptor  EntryGradeLevelDescriptor
	ON SSA.EntryGradeLevelDescriptorId = EntryGradeLevelDescriptor.DescriptorId
LEFT JOIN edfi.Descriptor EntryTypeDescriptor
	ON SSA.EntryTypeDescriptorId = EntryTypeDescriptor.descriptorId
LEFT JOIN edfi.Descriptor ExitWithdrawTypeDescriptor
	ON SSA.ExitWithdrawTypeDescriptorId = ExitWithdrawTypeDescriptor.DescriptorId
GO

