IF exists(
	SELECT 1 FROM sys.views
	INNER JOIN sys.schemas
		ON views.schema_id = schemas.schema_id
	WHERE views.name = 'vw_student'
	and schemas.name = 'nmped_rpt')
drop view nmped_rpt.vw_student;
go


CREATE VIEW nmped_rpt.vw_student
AS SELECT
	s.StudentUniqueId
	,SUBSTRING(cast(SEOA.EducationOrganizationId AS VARCHAR(10)),3,3) DistrictCode
	,s.FirstName
	,s.LastSurname
	,s.BirthDate
	,SexDescriptor.CodeValue
	,SEOA.EducationOrganizationId LocalEducationAgencyId
FROM edfi.Student S WITH (NOLOCK)
INNER JOIN edfi.StudentEducationOrganizationAssociation SEOA 
	ON S.StudentUSI = SEOA.StudentUSI
INNER JOIN edfi.descriptor SexDescriptor 
	ON SEOA.SexDescriptorId = SexDescriptor.DescriptorId
