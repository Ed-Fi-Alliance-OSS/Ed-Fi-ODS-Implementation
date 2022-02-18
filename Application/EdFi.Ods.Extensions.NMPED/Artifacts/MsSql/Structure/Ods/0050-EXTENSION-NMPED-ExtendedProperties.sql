-- Extended Properties [nmped].[AnnualReviewDelayReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The annual review delay reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'AnnualReviewDelayReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'AnnualReviewDelayReasonDescriptor', @level2type=N'COLUMN', @level2name=N'AnnualReviewDelayReasonDescriptorId'
GO

-- Extended Properties [nmped].[DentalExaminationVerificationCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code of the dental examination performed.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DentalExaminationVerificationCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DentalExaminationVerificationCodeDescriptor', @level2type=N'COLUMN', @level2name=N'DentalExaminationVerificationCodeDescriptorId'
GO

-- Extended Properties [nmped].[DigitalEquityInternetAccessTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The digital equity internet access type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityInternetAccessTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityInternetAccessTypeDescriptor', @level2type=N'COLUMN', @level2name=N'DigitalEquityInternetAccessTypeDescriptorId'
GO

-- Extended Properties [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The digital equity internet performance code.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityInternetPerformanceCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityInternetPerformanceCodeDescriptor', @level2type=N'COLUMN', @level2name=N'DigitalEquityInternetPerformanceCodeDescriptorId'
GO

-- Extended Properties [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The digital equity primary leanring device access.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityPrimaryLearningDeviceAccessDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityPrimaryLearningDeviceAccessDescriptor', @level2type=N'COLUMN', @level2name=N'DigitalEquityPrimaryLearningDeviceAccessDescriptorId'
GO

-- Extended Properties [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The digital equity primary leaning device type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityPrimaryLearningDeviceTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DigitalEquityPrimaryLearningDeviceTypeDescriptor', @level2type=N'COLUMN', @level2name=N'DigitalEquityPrimaryLearningDeviceTypeDescriptorId'
GO

-- Extended Properties [nmped].[DirectCertificationStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the type of direct certification statuses.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DirectCertificationStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DirectCertificationStatusDescriptor', @level2type=N'COLUMN', @level2name=N'DirectCertificationStatusDescriptorId'
GO

-- Extended Properties [nmped].[DisciplineIncidentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether or not this discipline incident is drug related or not.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'DrugRelatedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether or not this discipline incident is alcohol related or not.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'AlcoholRelatedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether or not this discipline incident is gang related or not.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'GangRelatedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether or not this discipline incident is hate crime related or not.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'HateCrimeRelatedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether or not this discipline incident is serious bodily injury related or not.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'SeriousBodilyInjuryIndicator'
GO

-- Extended Properties [nmped].[ExpectedDiplomaTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The option determined and indicated in the student''s IEP.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ExpectedDiplomaTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ExpectedDiplomaTypeDescriptor', @level2type=N'COLUMN', @level2name=N'ExpectedDiplomaTypeDescriptorId'
GO

-- Extended Properties [nmped].[GenderIdentityDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The gender the person identifies with.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'GenderIdentityDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'GenderIdentityDescriptor', @level2type=N'COLUMN', @level2name=N'GenderIdentityDescriptorId'
GO

-- Extended Properties [nmped].[IndustryCredentialDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the Industry Credential for the student''s program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'IndustryCredentialDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'IndustryCredentialDescriptor', @level2type=N'COLUMN', @level2name=N'IndustryCredentialDescriptorId'
GO

-- Extended Properties [nmped].[LevelOfEducationInstitutionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the Level of Education Institution', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LevelOfEducationInstitutionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LevelOfEducationInstitutionDescriptor', @level2type=N'COLUMN', @level2name=N'LevelOfEducationInstitutionDescriptorId'
GO

-- Extended Properties [nmped].[LocalEducationAgencyTransportation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local education agency transportation.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The first category of the district transportation.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation', @level2type=N'COLUMN', @level2name=N'CategoryDescriptor01TransportationCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The second category of the district transportation.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation', @level2type=N'COLUMN', @level2name=N'CategoryDescriptor02TransportationCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The primary measure type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation', @level2type=N'COLUMN', @level2name=N'TransportationPrimaryMeasureTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The transportation set code.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation', @level2type=N'COLUMN', @level2name=N'TransportationSetCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The count for the measure.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyTransportation', @level2type=N'COLUMN', @level2name=N'Count'
GO

-- Extended Properties [nmped].[MileageTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The mileage type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'MileageTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'MileageTypeDescriptor', @level2type=N'COLUMN', @level2name=N'MileageTypeDescriptorId'
GO

-- Extended Properties [nmped].[NMPEDClassPeriodDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the Class Period.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDClassPeriodDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDClassPeriodDescriptor', @level2type=N'COLUMN', @level2name=N'NMPEDClassPeriodDescriptorId'
GO

-- Extended Properties [nmped].[NMPEDService] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The student''s program service information.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the Service being provided to the student by the Program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True if service is a primary service.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'PrimaryIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First date the Student was in this option for the current school year.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceBeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last date the Student was in this option for the current school year.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the frequency of the service.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceFrequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the service provider.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceProviderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of the service provider.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceProviderTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The service setting.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceSettingDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the duration of the service.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'NMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceDuration'
GO

-- Extended Properties [nmped].[ParticipationInformationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the Program Participation Information.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ParticipationInformationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ParticipationInformationDescriptor', @level2type=N'COLUMN', @level2name=N'ParticipationInformationDescriptorId'
GO

-- Extended Properties [nmped].[PlannedPostGraduateActivityDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The planned post graduate activity.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'PlannedPostGraduateActivityDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'PlannedPostGraduateActivityDescriptor', @level2type=N'COLUMN', @level2name=N'PlannedPostGraduateActivityDescriptorId'
GO

-- Extended Properties [nmped].[PreKClassTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the method of Pre-K Participation.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'PreKClassTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'PreKClassTypeDescriptor', @level2type=N'COLUMN', @level2name=N'PreKClassTypeDescriptorId'
GO

-- Extended Properties [nmped].[ProgramDeliveryMethodDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the delivery method for the student''s program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ProgramDeliveryMethodDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ProgramDeliveryMethodDescriptor', @level2type=N'COLUMN', @level2name=N'ProgramDeliveryMethodDescriptorId'
GO

-- Extended Properties [nmped].[ProgramIntensityDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the Program Intensity.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ProgramIntensityDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ProgramIntensityDescriptor', @level2type=N'COLUMN', @level2name=N'ProgramIntensityDescriptorId'
GO

-- Extended Properties [nmped].[RoadTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The road type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'RoadTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'RoadTypeDescriptor', @level2type=N'COLUMN', @level2name=N'RoadTypeDescriptorId'
GO

-- Extended Properties [nmped].[SectionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of class period for this section.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'NMPEDClassPeriodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicated the type of Pre-K participation for this section.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'PreKClassTypeDescriptorId'
GO

-- Extended Properties [nmped].[ServiceProviderTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of the service provider.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ServiceProviderTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ServiceProviderTypeDescriptor', @level2type=N'COLUMN', @level2name=N'ServiceProviderTypeDescriptorId'
GO

-- Extended Properties [nmped].[ServiceSettingDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The service setting.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ServiceSettingDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'ServiceSettingDescriptor', @level2type=N'COLUMN', @level2name=N'ServiceSettingDescriptorId'
GO

-- Extended Properties [nmped].[SpecialEducationEventReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special education event reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationEventReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationEventReasonDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationEventReasonDescriptorId'
GO

-- Extended Properties [nmped].[SpecialEducationEventTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special education event type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationEventTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationEventTypeDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationEventTypeDescriptorId'
GO

-- Extended Properties [nmped].[SpecialEducationLevelOfIntegrationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the type of Levels of Integration.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationLevelOfIntegrationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationLevelOfIntegrationDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationLevelOfIntegrationDescriptorId'
GO

-- Extended Properties [nmped].[SpecialEducationNonComplianceReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special education event non compliance reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationNonComplianceReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialEducationNonComplianceReasonDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationNonComplianceReasonDescriptorId'
GO

-- Extended Properties [nmped].[SpecialProgramCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Code for the special program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialProgramCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'SpecialProgramCodeDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialProgramCodeDescriptorId'
GO

-- Extended Properties [nmped].[StaffDevelopment] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The development activities a staff has accomplished.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the staff development started.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the staff development ended.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The staff development activity code.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'StaffDevelopmentActivityCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The staff development purpose code.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'StaffDevelopmentPurposeCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The hours the activity took.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'ActivityHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The credits earned by the staff.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopment', @level2type=N'COLUMN', @level2name=N'StaffCreditsEarned'
GO

-- Extended Properties [nmped].[StaffDevelopmentActivityCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the staff development activity code.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopmentActivityCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopmentActivityCodeDescriptor', @level2type=N'COLUMN', @level2name=N'StaffDevelopmentActivityCodeDescriptorId'
GO

-- Extended Properties [nmped].[StaffDevelopmentPurposeCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the staff development purpose.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopmentPurposeCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffDevelopmentPurposeCodeDescriptor', @level2type=N'COLUMN', @level2name=N'StaffDevelopmentPurposeCodeDescriptorId'
GO

-- Extended Properties [nmped].[StaffEducationOrganizationDigitalEquity] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The staff digital equity.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The school year the digital equity event took place.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the digital equity started.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the digital equity ended.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The primary learning device type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'DigitalEquityPrimaryLearningDeviceTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether the school provides a device or not.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'SchoolProvidedDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the primary learning device access.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'DigitalEquityPrimaryLearningDeviceAccessDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internet access type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'DigitalEquityInternetAccessTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internet performance code.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'DigitalEquityInternetPerformanceCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if there is Internet access in the staff''s residece.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationDigitalEquity', @level2type=N'COLUMN', @level2name=N'InternetAccessInResidence'
GO

-- Extended Properties [nmped].[StaffExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the Insitution or State that conferred Highest Degree', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'HighestCompletedLevelOfEducationInstitutionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the Institution or State that conferred Baccalaureate Degree.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'BaccalaureateLevelOfEducationInstitutionDescriptorId'
GO

-- Extended Properties [nmped].[StudentAwardLanguageDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The award language codes.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentAwardLanguageDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentAwardLanguageDescriptor', @level2type=N'COLUMN', @level2name=N'StudentAwardLanguageDescriptorId'
GO

-- Extended Properties [nmped].[StudentAwardTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The award type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentAwardTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentAwardTypeDescriptor', @level2type=N'COLUMN', @level2name=N'StudentAwardTypeDescriptorId'
GO

-- Extended Properties [nmped].[StudentCTEProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the Delivery Method for a program a student is enrolled in.
                  Valid values:
                  CG = College Granted Certificate
                  IS = Industry Standard Third Party Assessment', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramDeliveryMethodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the Industry Credential for a program a student is enrolled in.
                  Valid values: (too many to list here)', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'IndustryCredentialDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the credential was earned.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'CredentialEarnedDate'
GO

-- Extended Properties [nmped].[StudentEducationOrganizationAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This field holds the date when a student entered the ninth grade.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'Grade09Entry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This code for the dental examination performed.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'DentalExaminationVerificationCodeDescriptorId'
GO

-- Extended Properties [nmped].[StudentEducationOrganizationAward] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The awards a student has earned at a education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the student got awarded.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward', @level2type=N'COLUMN', @level2name=N'AwardDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The school year the student earned the award.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The language for the award.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward', @level2type=N'COLUMN', @level2name=N'StudentAwardLanguageDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of award.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward', @level2type=N'COLUMN', @level2name=N'StudentAwardTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAward', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [nmped].[StudentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the gender the student identifies with.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'GenderIdentityDescriptorId'
GO

-- Extended Properties [nmped].[StudentProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the program participation information.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ParticipationInformationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the program Intensity.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramIntensityDescriptorId'
GO

-- Extended Properties [nmped].[StudentProgramAssociationNMPEDService] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The New Mexico Service extension.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the Service being provided to the student by the Program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'ServiceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentProgramAssociationNMPEDService', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [nmped].[StudentSchoolAggregateSectionAttendance] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The student''s aggregate section attendance.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The begin date.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The school year the student earned the award.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of scheduled periods.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'NumberOfScheduledPeriods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of periods attended.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'NumberOfPeriodsAttended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of periods excused.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSchoolAggregateSectionAttendance', @level2type=N'COLUMN', @level2name=N'NumberOfPeriodsExcused'
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

-- Extended Properties [nmped].[StudentSectionAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special program code the student is in.
                  D = Dual Credit Course
                  C = Concurrent Enrollment Course', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialProgramCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ALTERNATE CREDIT COURSE CODE', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'AlternateCreditCourseCode'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The annual review delay reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'AnnualReviewDelayReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The triennual review delay reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'TriennialReviewDelayReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The planned post graduate activity.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'PlannedPostGraduateActivityDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The option determined and indicated in a student''s IEP', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ExpectedDiplomaTypeDescriptorId'
GO

-- Extended Properties [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the event.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special education event type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'SpecialEducationEventTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special education event reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'SpecialEducationEventReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special education non compliance reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent', @level2type=N'COLUMN', @level2name=N'SpecialEducationNonComplianceReasonDescriptorId'
GO

-- Extended Properties [nmped].[TransportationCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The transportation category type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TransportationCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TransportationCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'TransportationCategoryDescriptorId'
GO

-- Extended Properties [nmped].[TransportationPrimaryMeasureTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The primary measure type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TransportationPrimaryMeasureTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TransportationPrimaryMeasureTypeDescriptor', @level2type=N'COLUMN', @level2name=N'TransportationPrimaryMeasureTypeDescriptorId'
GO

-- Extended Properties [nmped].[TransportationSetCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The transportation set codes.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TransportationSetCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TransportationSetCodeDescriptor', @level2type=N'COLUMN', @level2name=N'TransportationSetCodeDescriptorId'
GO

-- Extended Properties [nmped].[TriennialReviewDelayReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The triennial review reason.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TriennialReviewDelayReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'TriennialReviewDelayReasonDescriptor', @level2type=N'COLUMN', @level2name=N'TriennialReviewDelayReasonDescriptorId'
GO

-- Extended Properties [nmped].[VehicleBodyManufacturerDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The body manufacturer.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleBodyManufacturerDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleBodyManufacturerDescriptor', @level2type=N'COLUMN', @level2name=N'VehicleBodyManufacturerDescriptorId'
GO

-- Extended Properties [nmped].[VehicleChassisManufacturerDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The chassis manufacturer.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleChassisManufacturerDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleChassisManufacturerDescriptor', @level2type=N'COLUMN', @level2name=N'VehicleChassisManufacturerDescriptorId'
GO

-- Extended Properties [nmped].[VehicleFuelTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s fuel type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleFuelTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleFuelTypeDescriptor', @level2type=N'COLUMN', @level2name=N'VehicleFuelTypeDescriptorId'
GO

-- Extended Properties [nmped].[VehicleMileage] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s mileage.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The mileage type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'MileageTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s mileage reporting date.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'ReportingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The road type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'RoadTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique identifier for the vehicle.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'VehicleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s route.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'VehicleRouteDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The daily mileage.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleMileage', @level2type=N'COLUMN', @level2name=N'DailyMileage'
GO

-- Extended Properties [nmped].[VehicleRouteDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The transportation route.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleRouteDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleRouteDescriptor', @level2type=N'COLUMN', @level2name=N'VehicleRouteDescriptorId'
GO

-- Extended Properties [nmped].[VehicleSnapshot] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local education agency transportation vehicle snapshot.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The school year reference.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique identifier for the vehicle.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle VIN number.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleIdentificationNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s license number.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'LicensePlateNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The year the vehicle was manufactured.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'ManufacturerYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s body manufacturer.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleBodyManufacturerDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s hassis manufacturer.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleChassisManufacturerDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s gross weight raiting.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'GrossVehicleWeightRating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s fuel type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleFuelTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether the vehicle has special lift equipment.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'SpecialLiftEquipmentIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s seating capacity.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'SeatingCapacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s registered owner.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'RegisteredOwnerCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s odometer mileage.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'OdometerMileage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s odometer reading date.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'OdometerReadingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s number of days in use.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'NumberOfDaysInUse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the vehicle is in use.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleUseIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleSnapshot', @level2type=N'COLUMN', @level2name=N'VehicleTypeDescriptorId'
GO

-- Extended Properties [nmped].[VehicleTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vehicle''s type.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'nmped', @level1type=N'TABLE', @level1name=N'VehicleTypeDescriptor', @level2type=N'COLUMN', @level2name=N'VehicleTypeDescriptorId'
GO

