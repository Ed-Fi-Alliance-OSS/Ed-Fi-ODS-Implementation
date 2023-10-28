/*
This view creates a list of active students. Students are identifiable through StudentUSI

If you want school name, join to nmped_rpt.vw_district_location
If you want student id or student name, join to edfi.student

Active students are defined as:
	- Students with a record in edfi.StudentSchoolAssociation
	- ExitWithdrawDate is NULL OR ExitWithdrawDate is after current date
	- ExitCode CANNOT BE I, D1, D2, D3
	- EntryDate is before current date
	- EntryCode CANNOT BE I
*/

CREATE OR ALTER VIEW nmped_rpt.vw_ActiveStudents AS 
WITH CTE_Descriptors AS 
	(
		SELECT DescriptorId, CodeValue, Description, Namespace
		FROM edfi.Descriptor
		WHERE Namespace = 'uri://nmped.org/EntryTypeDescriptor'

	UNION

		SELECT DescriptorId, CodeValue, Description, Namespace
		FROM edfi.Descriptor
		WHERE Namespace = 'uri://nmped.org/ExitWithdrawTypeDescriptor'

	UNION

		SELECT DescriptorId, CodeValue, Description, Namespace
		FROM edfi.Descriptor
		WHERE Namespace = 'uri://nmped.org/GradeLevelDescriptor'
	)
SELECT
	 SSA.StudentUSI
	,SSA.SchoolId 
	,Grade.CodeValue		'Grade'
	,SSA.EntryDate
	,EntryCode.CodeValue	'EntryCode'
	,SSA.ExitWithdrawDate	
	,ExitCode.CodeValue		'ExitCode'
FROM 
	edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
	LEFT JOIN CTE_Descriptors EntryCode WITH (NOLOCK) 
		ON EntryCode.DescriptorId = SSA.EntryTypeDescriptorId
	LEFT JOIN CTE_Descriptors ExitCode WITH (NOLOCK) 
		ON ExitCode.DescriptorId = SSA.ExitWithdrawTypeDescriptorId
	LEFT JOIN CTE_Descriptors Grade WITH (NOLOCK) 
		ON Grade.DescriptorId = SSA.EntryGradeLevelDescriptorId
WHERE
	SSA.EntryDate <= GETDATE()
	AND (SSA.ExitWithdrawDate IS NULL OR SSA.ExitWithdrawDate > GETDATE())
	AND COALESCE(ExitCode.CodeValue, '') NOT IN ('D1', 'D2', 'D3', 'I')
	AND COALESCE(EntryCode.CodeValue, '') <> 'I'