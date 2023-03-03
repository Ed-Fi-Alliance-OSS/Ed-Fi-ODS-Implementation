
CREATE OR ALTER VIEW nmped_rpt.t_vw_students AS 
SELECT DISTINCT
	 s.StudentUSI
	 ,s.StudentUniqueId
	 ,s.BirthDate
	 ,s.FirstName
	 ,s.LastSurname
	 ,BirthSexDescriptor.CodeValue BirthSexCode
	 ,school.SchoolId AuthEdOrg
FROM edfi.student S
JOIN edfi.StudentSchoolAssociation SSA
	on S.StudentUSI = SSA.studentUSI
JOIN edfi.School 
	on SSA.SchoolId = School.SchoolId
LEFT JOIN edfi.Descriptor BirthSexDescriptor WITH (NOLOCK)
		ON BirthSexDescriptor.DescriptorId = S.BirthSexDescriptorId
UNION 
SELECT DISTINCT 
	 s.StudentUSI
	 ,s.StudentUniqueId
	 ,s.BirthDate
	 ,s.FirstName
	 ,s.LastSurname
	 ,BirthSexDescriptor.CodeValue BirthSexCode
	 ,school.LocalEducationAgencyId AuthEdOrg
FROM edfi.student S
JOIN edfi.StudentSchoolAssociation SSA
	on S.StudentUSI = SSA.studentUSI
JOIN edfi.School 
	on SSA.SchoolId = School.SchoolId
LEFT JOIN edfi.Descriptor BirthSexDescriptor WITH (NOLOCK)
		ON BirthSexDescriptor.DescriptorId = S.BirthSexDescriptorId;
