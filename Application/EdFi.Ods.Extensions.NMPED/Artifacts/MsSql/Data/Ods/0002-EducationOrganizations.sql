DECLARE @LocalEducationAgencyCategoryDescriptorId int;
SELECT @LocalEducationAgencyCategoryDescriptorId=DescriptorId
from edfi.Descriptor where Namespace like '%LocalEducationAgencyCategoryDescriptor%' and CodeValue = 'Independent';

--SELECT * FROM edfi.Descriptor where Namespace like '%LocalEducationAgencyCategoryDescriptor%' 

INSERT INTO edfi.EducationOrganization (EducationOrganizationId, NameOfInstitution) 
								  VALUES (11,'Doug');
INSERT INTO edfi.LocalEducationAgency (LocalEducationAgencyId,LocalEducationAgencyCategoryDescriptorId) 
							   VALUES (11,@LocalEducationAgencyCategoryDescriptorId);