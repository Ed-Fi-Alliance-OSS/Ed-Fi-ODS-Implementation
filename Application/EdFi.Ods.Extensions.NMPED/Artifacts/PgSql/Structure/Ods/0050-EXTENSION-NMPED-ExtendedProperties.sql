-- Extended Properties [nmped].[AnnualReviewDelayReasonDescriptor] --
COMMENT ON TABLE nmped.AnnualReviewDelayReasonDescriptor IS 'The annual review delay reason.';
COMMENT ON COLUMN nmped.AnnualReviewDelayReasonDescriptor.AnnualReviewDelayReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DentalExaminationVerificationCodeDescriptor] --
COMMENT ON TABLE nmped.DentalExaminationVerificationCodeDescriptor IS 'The code of the dental examination performed.';
COMMENT ON COLUMN nmped.DentalExaminationVerificationCodeDescriptor.DentalExaminationVerificationCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DigitalEquityInternetAccessTypeDescriptor] --
COMMENT ON TABLE nmped.DigitalEquityInternetAccessTypeDescriptor IS 'The digital equity internet access type.';
COMMENT ON COLUMN nmped.DigitalEquityInternetAccessTypeDescriptor.DigitalEquityInternetAccessTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] --
COMMENT ON TABLE nmped.DigitalEquityInternetPerformanceCodeDescriptor IS 'The digital equity internet performance code.';
COMMENT ON COLUMN nmped.DigitalEquityInternetPerformanceCodeDescriptor.DigitalEquityInternetPerformanceCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] --
COMMENT ON TABLE nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor IS 'The digital equity primary leanring device access.';
COMMENT ON COLUMN nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor.DigitalEquityPrimaryLearningDeviceAccessDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] --
COMMENT ON TABLE nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor IS 'The digital equity primary leaning device type.';
COMMENT ON COLUMN nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor.DigitalEquityPrimaryLearningDeviceTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

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

-- Extended Properties [nmped].[ServiceProviderTypeDescriptor] --
COMMENT ON TABLE nmped.ServiceProviderTypeDescriptor IS 'The type of the service provider.';
COMMENT ON COLUMN nmped.ServiceProviderTypeDescriptor.ServiceProviderTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[ServiceSettingDescriptor] --
COMMENT ON TABLE nmped.ServiceSettingDescriptor IS 'The service setting.';
COMMENT ON COLUMN nmped.ServiceSettingDescriptor.ServiceSettingDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationEventReasonDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationEventReasonDescriptor IS 'The special education event reason.';
COMMENT ON COLUMN nmped.SpecialEducationEventReasonDescriptor.SpecialEducationEventReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationEventTypeDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationEventTypeDescriptor IS 'The special education event type.';
COMMENT ON COLUMN nmped.SpecialEducationEventTypeDescriptor.SpecialEducationEventTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[SpecialEducationNonComplianceReasonDescriptor] --
COMMENT ON TABLE nmped.SpecialEducationNonComplianceReasonDescriptor IS 'The special education event non compliance reason.';
COMMENT ON COLUMN nmped.SpecialEducationNonComplianceReasonDescriptor.SpecialEducationNonComplianceReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

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

-- Extended Properties [nmped].[StaffDevelopmentActivityCodeDescriptor] --
COMMENT ON TABLE nmped.StaffDevelopmentActivityCodeDescriptor IS 'This descriptor describes the staff development activity code.';
COMMENT ON COLUMN nmped.StaffDevelopmentActivityCodeDescriptor.StaffDevelopmentActivityCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StaffDevelopmentPurposeCodeDescriptor] --
COMMENT ON TABLE nmped.StaffDevelopmentPurposeCodeDescriptor IS 'This descriptor describes the staff development purpose.';
COMMENT ON COLUMN nmped.StaffDevelopmentPurposeCodeDescriptor.StaffDevelopmentPurposeCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [nmped].[StaffEducationOrganizationDigitalEquity] --
COMMENT ON TABLE nmped.StaffEducationOrganizationDigitalEquity IS 'Digital Equity measures for staff.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.SchoolYear IS 'The school year the digital equity information is being recorded for.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.StartDate IS 'The date the digital equity record started.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.EndDate IS 'The date the digital equity record ended.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.PrimaryLearningDeviceAwayFromSchoolDescriptorId IS 'The primary learning device type used most often by staff to complete schoolwork at home.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.PrimaryLearningDeviceProviderDescriptorId IS 'Indicates whether the school provides a device or not.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.PrimaryLearningDeviceAccessDescriptorId IS 'Defines the primary learning device access.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.InternetAccessTypeInResidenceDescriptorId IS 'Internet access type.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.InternetPerformanceInResidenceDescriptorId IS 'Internet performance code.';
COMMENT ON COLUMN nmped.StaffEducationOrganizationDigitalEquity.InternetAccessInResidence IS 'Indicates if there is Internet access in the staff''s residece.';

-- Extended Properties [nmped].[StaffExtension] --
COMMENT ON TABLE nmped.StaffExtension IS '';
COMMENT ON COLUMN nmped.StaffExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN nmped.StaffExtension.HighestCompletedLevelOfEducationInstitutionDescriptorId IS 'Indicates the Insitution or State that conferred Highest Degree';
COMMENT ON COLUMN nmped.StaffExtension.BaccalaureateLevelOfEducationInstitutionDescriptorId IS 'Indicates the Institution or State that conferred Baccalaureate Degree.';

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

-- Extended Properties [nmped].[StudentEducationOrganizationAssociationStudentCharacteri_fc9b44] --
COMMENT ON TABLE nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44 IS 'This collection provides extended fields to record LevelOfIntegration for Gifted Students';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44.StudentCharacteristicDescriptorId IS 'The characteristic designated for the Student.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44.GiftedLevelOfIntegrationDescriptorId IS 'This field holds the level of integration that represents the amount of service for GIFTED characteristic students only
                    Valid values are:
                    1 = Less than 10% of the day (minimum or ''A'')
                    2 = 11% to 49% of the day (moderate or ''B'')
                    3 = 50% of the day or more, but not a full day (extensive or ''C'')
                    4 = Up to a full day or program 3Y/4Y (maximum or ''D'')';

-- Extended Properties [nmped].[StudentEducationOrganizationAward] --
COMMENT ON TABLE nmped.StudentEducationOrganizationAward IS 'The awards a student has earned at a education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.AwardDate IS 'The date the student got awarded.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.SchoolYear IS 'The school year the student earned the award.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.StudentAwardLanguageDescriptorId IS ' The language for which the State Seal of Bilingualism-Biliteracy (SSBB) was awarded.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.StudentAwardTypeDescriptorId IS 'The type of award.';
COMMENT ON COLUMN nmped.StudentEducationOrganizationAward.StudentUSI IS 'A unique alphanumeric code assigned to a student.';

-- Extended Properties [nmped].[StudentExtension] --
COMMENT ON TABLE nmped.StudentExtension IS '';
COMMENT ON COLUMN nmped.StudentExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentExtension.GenderIdentityDescriptorId IS 'Indicates the gender the student identifies with.';

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

-- Extended Properties [nmped].[StudentProgramAssociationServiceExtension] --
COMMENT ON TABLE nmped.StudentProgramAssociationServiceExtension IS 'This collection provides extended fields to record Program Services Fact Template data';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ServiceDescriptorId IS 'Indicates the Service being provided to the student by the Program.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ServiceFrequency IS 'Number of days the student received the Community School Program (CSP) and/or Expanded and Enriched Learning Time and Opportunities (EELTO) within the reporting period. A one to two digit number.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ServiceDuration IS 'Number of days the Community School Program (CSP) and/or Expanded and Enriched Learning Time and Opportunities (EELTO) service was offered during the reporting period. A one to two digit number not to exceed the number of days within the reporting period. A one to two digit number.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ServiceProviderName IS 'Name of Community Service Provider Entity.';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ServiceProviderTypeDescriptorId IS 'Provide the role of the individual who is providing the service for Expanded and Enriched Learning Time and Opportunities (EELTO).';
COMMENT ON COLUMN nmped.StudentProgramAssociationServiceExtension.ServiceSettingDescriptorId IS 'A description of when the service occurs. Required for Community School Programs (CSP) if the service occurred outside of the instructional day.  Otherwise value should not be populated.';

-- Extended Properties [nmped].[StudentSchoolAggregateSectionAttendance] --
COMMENT ON TABLE nmped.StudentSchoolAggregateSectionAttendance IS 'The student''s aggregate section attendance.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.BeginDate IS 'The begin date.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.SchoolYear IS 'The school year the student earned the award.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.EndDate IS 'The end date.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.NumberOfScheduledPeriods IS 'The number of scheduled periods.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.NumberOfPeriodsAttended IS 'The number of periods attended.';
COMMENT ON COLUMN nmped.StudentSchoolAggregateSectionAttendance.NumberOfPeriodsExcused IS 'The number of periods excused.';

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
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.AnnualReviewDelayReasonDescriptorId IS 'The annual review delay reason.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.TriennialReviewDelayReasonDescriptorId IS 'The triennual review delay reason.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.PlannedPostGraduateActivityDescriptorId IS 'The planned post graduate activity.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.ExpectedDiplomaTypeDescriptorId IS 'The option determined and indicated in a student''s IEP';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.BrailleInstruction IS 'Indication for student need for braille instruction.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.AlernateInstruction IS 'Indication of whether the special education student is entitled to take alternate assessment.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationExtension.PrimaryAreaOfExceptionalityDescriptorId IS 'Identification of a studen''s Primary Exceptionality';

-- Extended Properties [nmped].[StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc] --
COMMENT ON TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc IS 'This is documentation.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.EventDate IS 'The date of the event.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.SpecialEducationEventTypeDescriptorId IS 'The special education event type.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.SpecialEducationEventReasonDescriptorId IS 'The special education event reason.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc.SpecialEducationNonComplianceReasonDescriptorId IS 'The special education non compliance reason.';

-- Extended Properties [nmped].[StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8] --
COMMENT ON TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8 IS 'This collection provides extended fields to record Special Education Services Fact Template Data.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.SpecialEducationProgramServiceDescriptorId IS 'Indicates the service being provided to the student by the Special Education Program.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.IntegratedServicesStatus IS 'A ‘Y’ or ‘N’ indication of whether the student receives services within the regular education environment.';
COMMENT ON COLUMN nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8.ServiceDuration IS 'Service Duration will be required for all other service codes. A value from 1 – 9999 to indicate the number of minutes the service occurs per week. Must calculate service minutes that occur in a service cycle that is not weekly.';

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

