-- Extended Properties [nmped].[ClassPeriodDescriptor] --
COMMENT ON TABLE nmped.ClassPeriodDescriptor IS 'This descriptor describes the Class Period.';
COMMENT ON COLUMN nmped.ClassPeriodDescriptor.ClassPeriodDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DirectCertificationStatusDescriptor] --
COMMENT ON TABLE nmped.DirectCertificationStatusDescriptor IS 'This descriptor describes the type of direct certification statuses.';
COMMENT ON COLUMN nmped.DirectCertificationStatusDescriptor.DirectCertificationStatusDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DisciplineIncidentExtension] --
COMMENT ON TABLE nmped.DisciplineIncidentExtension IS '';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.DrugRelatedIndicator IS 'An indication of whether or not this discipline incident is drug related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.AlcoholRelatedIndicator IS 'An indication of whether or not this discipline incident is alcohol related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.GangRelatedIndicator IS 'An indication of whether or not this discipline incident is gang related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.HateCrimeRelatedIndicator IS 'An indication of whether or not this discipline incident is hate crime related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.SeriousBodilyInjuryIndicator IS 'An indication of whether or not this discipline incident is serious bodily injury related or not.';

-- Extended Properties [nmped].[IndustryCredentialDescriptor] --
COMMENT ON TABLE nmped.IndustryCredentialDescriptor IS 'This descriptor describes the Industry Credential for the student''s program.';
COMMENT ON COLUMN nmped.IndustryCredentialDescriptor.IndustryCredentialDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[LevelOfEducationInstitutionDescriptor] --
COMMENT ON TABLE nmped.LevelOfEducationInstitutionDescriptor IS 'Indicates the Level of Education Institution';
COMMENT ON COLUMN nmped.LevelOfEducationInstitutionDescriptor.LevelOfEducationInstitutionDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[NMPEDService] --
COMMENT ON TABLE nmped.NMPEDService IS 'The student''s program service information.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceDescriptorId IS 'Indicates the Service being provided to the student by the Program.';
COMMENT ON COLUMN nmped.NMPEDService.PrimaryIndicator IS 'True if service is a primary service.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceBeginDate IS 'First date the Student was in this option for the current school year.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceEndDate IS 'Last date the Student was in this option for the current school year.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceFrequency IS 'Indicates the frequency of the service.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceProviderName IS 'The name of the service provider.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceProviderTypeDescriptorId IS 'The type of the service provider.';
COMMENT ON COLUMN nmped.NMPEDService.SerivceSettingDescriptorId IS 'The service setting.';
COMMENT ON COLUMN nmped.NMPEDService.ServiceDuration IS 'Indicates the duration of the service.';

-- Extended Properties [nmped].[ParticipationInformationDescriptor] --
COMMENT ON TABLE nmped.ParticipationInformationDescriptor IS 'This descriptor describes the Program Participation Information.';
COMMENT ON COLUMN nmped.ParticipationInformationDescriptor.ParticipationInformationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ProgramDeliveryMethodDescriptor] --
COMMENT ON TABLE nmped.ProgramDeliveryMethodDescriptor IS 'This descriptor describes the delivery method for the student''s program.';
COMMENT ON COLUMN nmped.ProgramDeliveryMethodDescriptor.ProgramDeliveryMethodDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ProgramIntensityDescriptor] --
COMMENT ON TABLE nmped.ProgramIntensityDescriptor IS 'This descriptor describes the Program Intensity.';
COMMENT ON COLUMN nmped.ProgramIntensityDescriptor.ProgramIntensityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SerivceSettingDescriptor] --
COMMENT ON TABLE nmped.SerivceSettingDescriptor IS 'The service setting.';
COMMENT ON COLUMN nmped.SerivceSettingDescriptor.SerivceSettingDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ServiceProviderTypeDescriptor] --
COMMENT ON TABLE nmped.ServiceProviderTypeDescriptor IS 'The type of the service provider.';
COMMENT ON COLUMN nmped.ServiceProviderTypeDescriptor.ServiceProviderTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationLevelOfIntegrationDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor IS 'This descriptor describes the type of Levels of Integration.';
COMMENT ON COLUMN nmped.SpecialEducationLevelOfIntegrationDescriptor.SpecialEducationLevelOfIntegrationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialProgramCodeDescriptor] --
COMMENT ON TABLE nmped.SpecialProgramCodeDescriptor IS 'This Code for the special program.';
COMMENT ON COLUMN nmped.SpecialProgramCodeDescriptor.SpecialProgramCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StaffEducationOrganizationAssignmentAssociationExtension] --
COMMENT ON TABLE nmped.StaffEducationOrganizationAssignmentAssociationExtension IS '';
COMMENT ON COLUMN nmped.StaffEducationOrganizationAssignmentAssociationExtension.BeginDate IS 'Month, day, and year of the start or effective date of a staff member''s employment, contract, or relationship with the LEA.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationAssignmentAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationAssignmentAssociationExtension.StaffClassificationDescriptorId IS 'The titles of employment, official status, or rank of education staff.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationAssignmentAssociationExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationAssignmentAssociationExtension.FullTimeEquivalency IS 'The full time equivalency.';

-- Extended Properties [nmped].[StaffExtension] --
COMMENT ON TABLE nmped.StaffExtension IS '';
COMMENT ON COLUMN nmped.StaffExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffExtension.HighestCompletedLevelOfEducationInstitutionDescriptorId IS 'Indicates the Highest Completed Level Of Education Institution.';
COMMENT ON COLUMN nmped.StaffExtension.BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId IS 'Indicates the Baccalaureate Level Of Education Institution.';

-- Extended Properties [nmped].[StaffSectionAssociationExtension] --
COMMENT ON TABLE nmped.StaffSectionAssociationExtension IS '';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffSectionAssociationExtension.ClassPeriodDescriptorId IS 'Indicates the Class Period of this section.';

-- Extended Properties [nmped].[StudentCTEProgramAssociationExtension] --
COMMENT ON TABLE nmped.StudentCTEProgramAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.ProgramDeliveryMethodDescriptorId IS 'Identifies the Delivery Method for a program a student is enrolled in.
                  Valid values:
                  CG = College Granted Certificate
                  IS = Industry Standard Third Party Assessment';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.IndustryCredentialDescriptorId IS 'Identifies the Industry Credential for a program a student is enrolled in.
                  Valid values: (too many to list here)';
COMMENT ON COLUMN nmped.StudentCTEProgramAssociationExtension.CredentialEarnedDate IS 'The date the credential was earned.';

-- Extended Properties [nmped].[StudentEducationOrganizationAssociationExtension] --
COMMENT ON TABLE nmped.StudentEducationOrganizationAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.YearsInUSSchool IS 'This field holds the date when a student entered a US school.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.Grade09Entry IS 'This field holds the date when a student entered the ninth grade.';

-- Extended Properties [nmped].[StudentProgramAssociationExtension] --
COMMENT ON TABLE nmped.StudentProgramAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.ParticipationInformationDescriptorId IS 'Indicates the program participation information.';
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.ProgramIntensityDescriptorId IS 'Indicates the program Intensity.';

-- Extended Properties [nmped].[StudentProgramAssociationNMPEDService] --
COMMENT ON TABLE nmped.StudentProgramAssociationNMPEDService IS 'The New Mexico Service extension.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.ServiceDescriptorId IS 'Indicates the Service being provided to the student by the Program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationNMPEDService.StudentUSI IS 'A unique alphanumeric code assigned to a student.';

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

-- Extended Properties [nmped].[StudentSectionAssociationExtension] --
COMMENT ON TABLE nmped.StudentSectionAssociationExtension IS '';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.BeginDate IS 'Month, day, and year of the Student''s entry or assignment to the Section.';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.SpecialProgramCodeDescriptorId IS 'The special program code the student is in.
                  D = Dual Credit Course
                  C = Concurrent Enrollment Course';
COMMENT ON COLUMN nmped.StudentSectionAssociationExtension.AlternateCreditCourseCode IS 'ALTERNATE CREDIT COURSE CODE';

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

