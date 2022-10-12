-- Extended Properties [nmped].[AnnualReviewDelayReasonDescriptor] --
COMMENT ON TABLE nmped.AnnualReviewDelayReasonDescriptor IS 'The annual review delay reason.';
COMMENT ON COLUMN nmped.AnnualReviewDelayReasonDescriptor.AnnualReviewDelayReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DentalExaminationVerificationCodeDescriptor] --
COMMENT ON TABLE nmped.DentalExaminationVerificationCodeDescriptor IS 'The code of the dental examination performed.';
COMMENT ON COLUMN nmped.DentalExaminationVerificationCodeDescriptor.DentalExaminationVerificationCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DirectCertificationStatusDescriptor] --
COMMENT ON TABLE nmped.DirectCertificationStatusDescriptor IS 'This descriptor describes the type of direct certification statuses.';
COMMENT ON COLUMN nmped.DirectCertificationStatusDescriptor.DirectCertificationStatusDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DisciplineActionExtension] --
COMMENT ON TABLE nmped.DisciplineActionExtension IS '';
COMMENT ON COLUMN nmped.DisciplineActionExtension.DisciplineActionIdentifier IS 'Identifier assigned by the education organization to the DisciplineAction.';
COMMENT ON COLUMN nmped.DisciplineActionExtension.DisciplineDate IS 'The date of the DisciplineAction.';
COMMENT ON COLUMN nmped.DisciplineActionExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.DisciplineActionExtension.DisciplineActionDetailedResponse IS 'Provide additional information about the response to an incident.';

-- Extended Properties [nmped].[DisciplineIncidentExtension] --
COMMENT ON TABLE nmped.DisciplineIncidentExtension IS '';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.DrugRelatedIndicator IS 'An indication of whether or not this discipline incident is drug related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.AlcoholRelatedIndicator IS 'An indication of whether or not this discipline incident is alcohol related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.GangRelatedIndicator IS 'An indication of whether or not this discipline incident is gang related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.HateCrimeRelatedIndicator IS 'An indication of whether or not this discipline incident is hate crime related or not.';
COMMENT ON COLUMN nmped.DisciplineIncidentExtension.SeriousBodilyInjuryIndicator IS 'An indication of whether or not this discipline incident is serious bodily injury related or not.';

-- Extended Properties [nmped].[ExpectedDiplomaTypeDescriptor] --
COMMENT ON TABLE nmped.ExpectedDiplomaTypeDescriptor IS 'The option determined and indicated in the student''s IEP.';
COMMENT ON COLUMN nmped.ExpectedDiplomaTypeDescriptor.ExpectedDiplomaTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[GenderIdentityDescriptor] --
COMMENT ON TABLE nmped.GenderIdentityDescriptor IS 'The gender the person identifies with.';
COMMENT ON COLUMN nmped.GenderIdentityDescriptor.GenderIdentityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[IndustryCredentialDescriptor] --
COMMENT ON TABLE nmped.IndustryCredentialDescriptor IS 'This descriptor describes the Industry Credential for the student''s program.';
COMMENT ON COLUMN nmped.IndustryCredentialDescriptor.IndustryCredentialDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[LevelOfEducationInstitutionDescriptor] --
COMMENT ON TABLE nmped.LevelOfEducationInstitutionDescriptor IS 'Indicates the Level of Education Institution';
COMMENT ON COLUMN nmped.LevelOfEducationInstitutionDescriptor.LevelOfEducationInstitutionDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[LevelOfIntegrationDescriptor] --
COMMENT ON TABLE nmped.LevelOfIntegrationDescriptor IS 'This descriptor describes the type of Levels of Integration for Gifted and Special Education Students.';
COMMENT ON COLUMN nmped.LevelOfIntegrationDescriptor.LevelOfIntegrationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[LocalEducationAgencyTransportation] --
COMMENT ON TABLE nmped.LocalEducationAgencyTransportation IS 'The local education agency transportation.';
COMMENT ON COLUMN nmped.LocalEducationAgencyTransportation.CategoryDescriptor01TransportationCategoryDescriptorId IS 'The first category of the district transportation.';
COMMENT ON COLUMN nmped.LocalEducationAgencyTransportation.CategoryDescriptor02TransportationCategoryDescriptorId IS 'The second category of the district transportation.';
COMMENT ON COLUMN nmped.LocalEducationAgencyTransportation.LocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN nmped.LocalEducationAgencyTransportation.TransportationSetCodeDescriptorId IS 'The transportation set code.';
COMMENT ON COLUMN nmped.LocalEducationAgencyTransportation.Count IS 'The count for the measure.';

-- Extended Properties [nmped].[MileageTypeDescriptor] --
COMMENT ON TABLE nmped.MileageTypeDescriptor IS 'The mileage type.';
COMMENT ON COLUMN nmped.MileageTypeDescriptor.MileageTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[MilitaryFamilyDescriptor] --
COMMENT ON TABLE nmped.MilitaryFamilyDescriptor IS 'Military Family Status';
COMMENT ON COLUMN nmped.MilitaryFamilyDescriptor.MilitaryFamilyDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[NMPEDClassPeriodDescriptor] --
COMMENT ON TABLE nmped.NMPEDClassPeriodDescriptor IS 'This descriptor describes the Class Period.';
COMMENT ON COLUMN nmped.NMPEDClassPeriodDescriptor.NMPEDClassPeriodDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ParticipationInformationDescriptor] --
COMMENT ON TABLE nmped.ParticipationInformationDescriptor IS 'This descriptor describes the Program Participation Information.';
COMMENT ON COLUMN nmped.ParticipationInformationDescriptor.ParticipationInformationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[PlannedPostGraduateActivityDescriptor] --
COMMENT ON TABLE nmped.PlannedPostGraduateActivityDescriptor IS 'The planned post graduate activity.';
COMMENT ON COLUMN nmped.PlannedPostGraduateActivityDescriptor.PlannedPostGraduateActivityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[PreKClassTypeDescriptor] --
COMMENT ON TABLE nmped.PreKClassTypeDescriptor IS 'This descriptor describes the method of Pre-K Participation.';
COMMENT ON COLUMN nmped.PreKClassTypeDescriptor.PreKClassTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[PrimaryAreaOfExceptionalityDescriptor] --
COMMENT ON TABLE nmped.PrimaryAreaOfExceptionalityDescriptor IS 'Primary Area of exceptionality indicator';
COMMENT ON COLUMN nmped.PrimaryAreaOfExceptionalityDescriptor.PrimaryAreaOfExceptionalityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ProgramDeliveryMethodDescriptor] --
COMMENT ON TABLE nmped.ProgramDeliveryMethodDescriptor IS 'This descriptor describes the delivery method for the student''s program.';
COMMENT ON COLUMN nmped.ProgramDeliveryMethodDescriptor.ProgramDeliveryMethodDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ProgramIntensityDescriptor] --
COMMENT ON TABLE nmped.ProgramIntensityDescriptor IS 'This descriptor describes the Program Intensity.';
COMMENT ON COLUMN nmped.ProgramIntensityDescriptor.ProgramIntensityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[RoadTypeDescriptor] --
COMMENT ON TABLE nmped.RoadTypeDescriptor IS 'The road type.';
COMMENT ON COLUMN nmped.RoadTypeDescriptor.RoadTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SectionExtension] --
COMMENT ON TABLE nmped.SectionExtension IS '';
COMMENT ON COLUMN nmped.SectionExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN nmped.SectionExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN nmped.SectionExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN nmped.SectionExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN nmped.SectionExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN nmped.SectionExtension.NMPEDClassPeriodDescriptorId IS 'Indicates the type of class period for this section.';
COMMENT ON COLUMN nmped.SectionExtension.PreKClassTypeDescriptorId IS 'Indicated the type of Pre-K participation for this section.';

-- Extended Properties [nmped].[SpecialEducationEventReasonDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationEventReasonDescriptor IS 'The special education event reason.';
COMMENT ON COLUMN nmped.SpecialEducationEventReasonDescriptor.SpecialEducationEventReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationEventTypeDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationEventTypeDescriptor IS 'The special education event type.';
COMMENT ON COLUMN nmped.SpecialEducationEventTypeDescriptor.SpecialEducationEventTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationNonComplianceReasonDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationNonComplianceReasonDescriptor IS 'The special education event non compliance reason.';
COMMENT ON COLUMN nmped.SpecialEducationNonComplianceReasonDescriptor.SpecialEducationNonComplianceReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationReferralCodeDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationReferralCodeDescriptor IS 'Required if the child was referred from Part C to B or thru Child Find.';
COMMENT ON COLUMN nmped.SpecialEducationReferralCodeDescriptor.SpecialEducationReferralCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialProgramCodeDescriptor] --
COMMENT ON TABLE nmped.SpecialProgramCodeDescriptor IS 'This Code for the special program.';
COMMENT ON COLUMN nmped.SpecialProgramCodeDescriptor.SpecialProgramCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StaffDevelopment] --
COMMENT ON TABLE nmped.StaffDevelopment IS 'The development activities a staff has accomplished.';
COMMENT ON COLUMN nmped.StaffDevelopment.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StaffDevelopment.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffDevelopment.StartDate IS 'The date the staff development started.';
COMMENT ON COLUMN nmped.StaffDevelopment.EndDate IS 'The date the staff development ended.';
COMMENT ON COLUMN nmped.StaffDevelopment.StaffDevelopmentActivityCodeDescriptorId IS 'The staff development activity code.';
COMMENT ON COLUMN nmped.StaffDevelopment.StaffDevelopmentPurposeCodeDescriptorId IS 'The staff development purpose code.';
COMMENT ON COLUMN nmped.StaffDevelopment.ActivityHours IS 'The hours the activity took.';
COMMENT ON COLUMN nmped.StaffDevelopment.StaffCreditsEarned IS 'The credits earned by the staff.';
COMMENT ON COLUMN nmped.StaffDevelopment.MentorTraining IS 'This data will be used to determine whether the Mentor has completed a Mentor Training.';
COMMENT ON COLUMN nmped.StaffDevelopment.MentorIdUniqueId IS 'The staff ID of the mentor';

-- Extended Properties [nmped].[StaffDevelopmentActivityCodeDescriptor] --
COMMENT ON TABLE nmped.StaffDevelopmentActivityCodeDescriptor IS 'This descriptor describes the staff development activity code.';
COMMENT ON COLUMN nmped.StaffDevelopmentActivityCodeDescriptor.StaffDevelopmentActivityCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StaffDevelopmentPurposeCodeDescriptor] --
COMMENT ON TABLE nmped.StaffDevelopmentPurposeCodeDescriptor IS 'This descriptor describes the staff development purpose.';
COMMENT ON COLUMN nmped.StaffDevelopmentPurposeCodeDescriptor.StaffDevelopmentPurposeCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StaffEducationOrganizationEmploymentAssociationExtension] --
COMMENT ON TABLE nmped.StaffEducationOrganizationEmploymentAssociationExtension IS '';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.EmploymentStatusDescriptorId IS 'Reflects the type of employment or contract; for example:
        Probationary
        Contractual
        Substitute/temporary
        Tenured or permanent
        Volunteer/no contract
        ...';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.HireDate IS 'The month, day, and year on which an individual was hired for a position.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.TeacherOrPrincipalYearsInDistrict IS 'The total number of years that an individual has previously held a Teacher or Principal position in the current district.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.TeacherOrPrincipalYearsOverall IS 'The total number of years that an individual has previously held a Teacher or Principal position overall.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.HighestCompletedLevelOfEducationInstitutionDescriptorId IS 'Indicates the Insitution or State that conferred Highest Degree';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.BaccalaureateLevelOfEducationInstitutionDescriptorId IS 'Indicates the Institution or State that conferred Baccalaureate Degree.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationEmploymentAssociationExtension.NationalCertified IS 'The data is used to determine if a Staff Member is a National Board Certified Teacher.';

-- Extended Properties [nmped].[StudentAwardTypeDescriptor] --
COMMENT ON TABLE nmped.StudentAwardTypeDescriptor IS 'The award type.';
COMMENT ON COLUMN nmped.StudentAwardTypeDescriptor.StudentAwardTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

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
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.Grade09Entry IS 'This field holds the date when a student entered the ninth grade.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.DentalExaminationVerificationCodeDescriptorId IS 'This code for the dental examination performed.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.MilitaryFamilyDescriptorId IS 'Indicator to identify the military stuats of the student''s family';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationExtension.GenderIdentityDescriptorId IS 'Indicates the gender the student identifies with.';

-- Extended Properties [nmped].[StudentEducationOrganizationAward] --
COMMENT ON TABLE nmped.StudentEducationOrganizationAward IS 'The awards a student has earned at a education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.AwardDate IS 'The date the student got awarded.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.SchoolYear IS 'The school year the student earned the award.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.StudentAwardLanguageDescriptorId IS ' The language for which the State Seal of Bilingualism-Biliteracy (SSBB) was awarded.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.StudentAwardTypeDescriptorId IS 'The type of award.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.StudentUSI IS 'A unique alphanumeric code assigned to a student.';

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
COMMENT ON COLUMN nmped.StudentProgramAssociationExtension.BEPProgramLanguageDescriptorId IS 'Language for students participating in BEP';

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

-- Extended Properties [nmped].[StudentSpecialEducationAssociationEvent] --
COMMENT ON TABLE nmped.StudentSpecialEducationAssociationEvent IS 'Program Events for Student Special Education associations.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.EventDate IS 'The date of the event.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.SpecialEducationEventTypeDescriptorId IS 'The special education event type.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.SpecialEducationEventReasonDescriptorId IS 'The special education event reason.';
COMMENT ON COLUMN nmped.StudentSpecialEducationAssociationEvent.SpecialEducationNonComplianceReasonDescriptorId IS 'The special education non compliance reason.';

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
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.AnnualReviewDelayReasonDescriptorId IS 'The annual review delay reason.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.TriennialReviewDelayReasonDescriptorId IS 'The triennual review delay reason.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.PlannedPostGraduateActivityDescriptorId IS 'The planned post graduate activity.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.ExpectedDiplomaTypeDescriptorId IS 'The option determined and indicated in a student''s IEP';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.BrailleInstruction IS 'Indication for student need for braille instruction.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.AlternateInstruction IS 'Indication of whether the special education student is entitled to take alternate assessment.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.PrimaryAreaOfExceptionalityDescriptorId IS 'Identification of a studen''s Primary Exceptionality';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.SpecialEducationReferralCodeDescriptorId IS 'Required if the child was referred from Part C to B or thru Child Find.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.ChildCountEducationOrganizationId IS 'The identifier assigned to an education organization.';

-- Extended Properties [nmped].[TransportationCategoryDescriptor] --
COMMENT ON TABLE nmped.TransportationCategoryDescriptor IS 'The transportation category type.';
COMMENT ON COLUMN nmped.TransportationCategoryDescriptor.TransportationCategoryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[TransportationSetCodeDescriptor] --
COMMENT ON TABLE nmped.TransportationSetCodeDescriptor IS 'The transportation set codes.';
COMMENT ON COLUMN nmped.TransportationSetCodeDescriptor.TransportationSetCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[TriennialReviewDelayReasonDescriptor] --
COMMENT ON TABLE nmped.TriennialReviewDelayReasonDescriptor IS 'The triennial review reason.';
COMMENT ON COLUMN nmped.TriennialReviewDelayReasonDescriptor.TriennialReviewDelayReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[VehicleBodyManufacturerDescriptor] --
COMMENT ON TABLE nmped.VehicleBodyManufacturerDescriptor IS 'The body manufacturer.';
COMMENT ON COLUMN nmped.VehicleBodyManufacturerDescriptor.VehicleBodyManufacturerDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[VehicleChassisManufacturerDescriptor] --
COMMENT ON TABLE nmped.VehicleChassisManufacturerDescriptor IS 'The chassis manufacturer.';
COMMENT ON COLUMN nmped.VehicleChassisManufacturerDescriptor.VehicleChassisManufacturerDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[VehicleFuelTypeDescriptor] --
COMMENT ON TABLE nmped.VehicleFuelTypeDescriptor IS 'The vehicle''s fuel type.';
COMMENT ON COLUMN nmped.VehicleFuelTypeDescriptor.VehicleFuelTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[VehicleMileage] --
COMMENT ON TABLE nmped.VehicleMileage IS 'The vehicle''s mileage.';
COMMENT ON COLUMN nmped.VehicleMileage.LocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN nmped.VehicleMileage.MileageTypeDescriptorId IS 'The mileage type.';
COMMENT ON COLUMN nmped.VehicleMileage.ReportingDate IS 'The vehicle''s mileage reporting date.';
COMMENT ON COLUMN nmped.VehicleMileage.RoadTypeDescriptorId IS 'The road type.';
COMMENT ON COLUMN nmped.VehicleMileage.VehicleId IS 'The unique identifier for the vehicle.';
COMMENT ON COLUMN nmped.VehicleMileage.VehicleRouteDescriptorId IS 'The vehicle''s route.';
COMMENT ON COLUMN nmped.VehicleMileage.DailyMileage IS 'The daily mileage.';

-- Extended Properties [nmped].[VehicleRouteDescriptor] --
COMMENT ON TABLE nmped.VehicleRouteDescriptor IS 'The transportation route.';
COMMENT ON COLUMN nmped.VehicleRouteDescriptor.VehicleRouteDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[VehicleSnapshot] --
COMMENT ON TABLE nmped.VehicleSnapshot IS 'The local education agency transportation vehicle snapshot.';
COMMENT ON COLUMN nmped.VehicleSnapshot.LocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN nmped.VehicleSnapshot.SchoolYear IS 'The school year reference.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleId IS 'The unique identifier for the vehicle.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleIdentificationNumber IS 'The vehicle VIN number.';
COMMENT ON COLUMN nmped.VehicleSnapshot.LicensePlateNumber IS 'The vehicle''s license number.';
COMMENT ON COLUMN nmped.VehicleSnapshot.ManufacturerYear IS 'The year the vehicle was manufactured.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleBodyManufacturerDescriptorId IS 'The vehicle''s body manufacturer.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleChassisManufacturerDescriptorId IS 'The vehicle''s hassis manufacturer.';
COMMENT ON COLUMN nmped.VehicleSnapshot.GrossVehicleWeightRating IS 'The vehicle''s gross weight raiting.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleFuelTypeDescriptorId IS 'The vehicle''s fuel type.';
COMMENT ON COLUMN nmped.VehicleSnapshot.SpecialLiftEquipmentIndicator IS 'Indicates whether the vehicle has special lift equipment.';
COMMENT ON COLUMN nmped.VehicleSnapshot.SeatingCapacity IS 'The vehicle''s seating capacity.';
COMMENT ON COLUMN nmped.VehicleSnapshot.RegisteredOwnerCode IS 'The vehicle''s registered owner.';
COMMENT ON COLUMN nmped.VehicleSnapshot.OdometerMileage IS 'The vehicle''s odometer mileage.';
COMMENT ON COLUMN nmped.VehicleSnapshot.OdometerReadingDate IS 'The vehicle''s odometer reading date.';
COMMENT ON COLUMN nmped.VehicleSnapshot.NumberOfDaysInUse IS 'The vehicle''s number of days in use.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleUseIndicator IS 'Indicates if the vehicle is in use.';
COMMENT ON COLUMN nmped.VehicleSnapshot.VehicleTypeDescriptorId IS 'The vehicle''s type.';

-- Extended Properties [nmped].[VehicleTypeDescriptor] --
COMMENT ON TABLE nmped.VehicleTypeDescriptor IS 'The vehicle''s type.';
COMMENT ON COLUMN nmped.VehicleTypeDescriptor.VehicleTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

