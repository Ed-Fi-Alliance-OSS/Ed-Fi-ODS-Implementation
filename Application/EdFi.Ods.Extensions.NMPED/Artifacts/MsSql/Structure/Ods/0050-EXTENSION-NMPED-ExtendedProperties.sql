-- Extended Properties [nmped].[DirectCertificationStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the type of direct certification statuses.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DirectCertificationStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DirectCertificationStatusDescriptor', @level2type=N'COLUMN', @level2name=N'DirectCertificationStatusDescriptorId'
GO

-- Extended Properties [nmped].[SpecialEducationLevelOfIntegrationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the type of Levels of Integration.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationLevelOfIntegrationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationLevelOfIntegrationDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationLevelOfIntegrationDescriptorId'
GO

-- Extended Properties [nmped].[StudentEducationOrganizationAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field holds the date when a student entered a US school.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'YearsInUSSchool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field holds the date when a student entered the ninth grade.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'Grade09Entry'
GO

-- Extended Properties [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the Direct Certification Status of a student. This does not apply to all students in the district.
                      Valid values:
                      1 = SNAP Direct Cert as identified in the direct certification report and certified by the district.
                      2 = Other Direct Cert Eligible (Homeless, FDPIR, Foster, Migrant, and Head Start)
                      3 = Family Members of SNAP identified students that were not found in the Direct Certification report.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolFoodServiceProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'DirectCertificationStatusDescriptorId'
GO

-- Extended Properties [nmped].[StudentSpecialEducationProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field holds the level of integration that represents the amount of special education service.
                        Valid values are:
                        1 = Less than 10% of the day (minimum or ''A'')
                        2 = 11% to 49% of the day (moderate or ''B'')
                        3 = 50% of the day or more, but not a full day (extensive or ''C'')
                        4 = Up to a full day or program 3Y/4Y (maximum or ''D'')', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationLevelOfIntegrationDescriptorId'
GO

