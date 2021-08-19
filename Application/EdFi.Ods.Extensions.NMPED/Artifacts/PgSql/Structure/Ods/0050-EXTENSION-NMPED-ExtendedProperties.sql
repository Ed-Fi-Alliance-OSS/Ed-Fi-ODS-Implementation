-- Extended Properties [nmped].[DirectCertificationStatusDescriptor] --
COMMENT ON TABLE nmped.DirectCertificationStatusDescriptor IS 'This descriptor describes the type of direct certification statuses.';
COMMENT ON COLUMN nmped.DirectCertificationStatusDescriptor.DirectCertificationStatusDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationLevelOfIntegrationDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor IS 'This descriptor describes the type of Levels of Integration.';
COMMENT ON COLUMN nmped.SpecialEducationLevelOfIntegrationDescriptor.SpecialEducationLevelOfIntegrationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StudentEducationOrganizationAssociationExtension] --
COMMENT ON TABLE nmped.StudentEducationOrganizationAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.YearsInUSSchool IS 'This field holds the date when a student entered a US school.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.Grade09Entry IS 'This field holds the date when a student entered the ninth grade.';

-- Extended Properties [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] --
COMMENT ON TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSchoolFoodServiceProgramAssociationExtension.DirectCertificationStatusDescriptorId IS 'Identifies the Direct Certification Status of a student. This does not apply to all students in the district.
                      Valid values:
                      1 = SNAP Direct Cert as identified in the direct certification report and certified by the district.
                      2 = Other Direct Cert Eligible (Homeless, FDPIR, Foster, Migrant, and Head Start)
                      3 = Family Members of SNAP identified students that were not found in the Direct Certification report.';

-- Extended Properties [nmped].[StudentSpecialEducationProgramAssociationExtension] --
COMMENT ON TABLE nmped.StudentSpecialEducationProgramAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.SpecialEducationLevelOfIntegrationDescriptorId IS 'This field holds the level of integration that represents the amount of special education service.
                        Valid values are:
                        1 = Less than 10% of the day (minimum or ''A'')
                        2 = 11% to 49% of the day (moderate or ''B'')
                        3 = 50% of the day or more, but not a full day (extensive or ''C'')
                        4 = Up to a full day or program 3Y/4Y (maximum or ''D'')';

