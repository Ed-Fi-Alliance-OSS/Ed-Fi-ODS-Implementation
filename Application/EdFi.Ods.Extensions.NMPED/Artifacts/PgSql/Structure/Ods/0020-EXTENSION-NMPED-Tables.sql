-- Table nmped.AnnualReviewDelayReasonDescriptor --
CREATE TABLE nmped.AnnualReviewDelayReasonDescriptor (
    AnnualReviewDelayReasonDescriptorId INT NOT NULL,
    CONSTRAINT AnnualReviewDelayReasonDescriptor_PK PRIMARY KEY (AnnualReviewDelayReasonDescriptorId)
); 

-- Table nmped.ClassPeriodDescriptor --
CREATE TABLE nmped.ClassPeriodDescriptor (
    ClassPeriodDescriptorId INT NOT NULL,
    CONSTRAINT ClassPeriodDescriptor_PK PRIMARY KEY (ClassPeriodDescriptorId)
); 

-- Table nmped.DentalExaminationVerificationCodeDescriptor --
CREATE TABLE nmped.DentalExaminationVerificationCodeDescriptor (
    DentalExaminationVerificationCodeDescriptorId INT NOT NULL,
    CONSTRAINT DentalExaminationVerificationCodeDescriptor_PK PRIMARY KEY (DentalExaminationVerificationCodeDescriptorId)
); 

-- Table nmped.DigitalEquityInternetAccessTypeDescriptor --
CREATE TABLE nmped.DigitalEquityInternetAccessTypeDescriptor (
    DigitalEquityInternetAccessTypeDescriptorId INT NOT NULL,
    CONSTRAINT DigitalEquityInternetAccessTypeDescriptor_PK PRIMARY KEY (DigitalEquityInternetAccessTypeDescriptorId)
); 

-- Table nmped.DigitalEquityInternetPerformanceCodeDescriptor --
CREATE TABLE nmped.DigitalEquityInternetPerformanceCodeDescriptor (
    DigitalEquityInternetPerformanceCodeDescriptorId INT NOT NULL,
    CONSTRAINT DigitalEquityInternetPerformanceCodeDescriptor_PK PRIMARY KEY (DigitalEquityInternetPerformanceCodeDescriptorId)
); 

-- Table nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor --
CREATE TABLE nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor (
    DigitalEquityPrimaryLearningDeviceAccessDescriptorId INT NOT NULL,
    CONSTRAINT DigitalEquityPrimaryLearningDeviceAccessDescriptor_PK PRIMARY KEY (DigitalEquityPrimaryLearningDeviceAccessDescriptorId)
); 

-- Table nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor --
CREATE TABLE nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor (
    DigitalEquityPrimaryLearningDeviceTypeDescriptorId INT NOT NULL,
    CONSTRAINT DigitalEquityPrimaryLearningDeviceTypeDescriptor_PK PRIMARY KEY (DigitalEquityPrimaryLearningDeviceTypeDescriptorId)
); 

-- Table nmped.DirectCertificationStatusDescriptor --
CREATE TABLE nmped.DirectCertificationStatusDescriptor (
    DirectCertificationStatusDescriptorId INT NOT NULL,
    CONSTRAINT DirectCertificationStatusDescriptor_PK PRIMARY KEY (DirectCertificationStatusDescriptorId)
); 

-- Table nmped.DisciplineIncidentExtension --
CREATE TABLE nmped.DisciplineIncidentExtension (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    DrugRelatedIndicator BOOLEAN NOT NULL,
    AlcoholRelatedIndicator BOOLEAN NOT NULL,
    GangRelatedIndicator BOOLEAN NOT NULL,
    HateCrimeRelatedIndicator BOOLEAN NOT NULL,
    SeriousBodilyInjuryIndicator BOOLEAN NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineIncidentExtension_PK PRIMARY KEY (IncidentIdentifier, SchoolId)
); 
ALTER TABLE nmped.DisciplineIncidentExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.GenderIdentityDescriptor --
CREATE TABLE nmped.GenderIdentityDescriptor (
    GenderIdentityDescriptorId INT NOT NULL,
    CONSTRAINT GenderIdentityDescriptor_PK PRIMARY KEY (GenderIdentityDescriptorId)
); 

-- Table nmped.IndustryCredentialDescriptor --
CREATE TABLE nmped.IndustryCredentialDescriptor (
    IndustryCredentialDescriptorId INT NOT NULL,
    CONSTRAINT IndustryCredentialDescriptor_PK PRIMARY KEY (IndustryCredentialDescriptorId)
); 

-- Table nmped.LevelOfEducationInstitutionDescriptor --
CREATE TABLE nmped.LevelOfEducationInstitutionDescriptor (
    LevelOfEducationInstitutionDescriptorId INT NOT NULL,
    CONSTRAINT LevelOfEducationInstitutionDescriptor_PK PRIMARY KEY (LevelOfEducationInstitutionDescriptorId)
); 

-- Table nmped.NMPEDService --
CREATE TABLE nmped.NMPEDService (
    ServiceDescriptorId INT NOT NULL,
    PrimaryIndicator BOOLEAN NULL,
    ServiceBeginDate DATE NULL,
    ServiceEndDate DATE NULL,
    ServiceFrequency INT NULL,
    ServiceProviderName VARCHAR(255) NULL,
    ServiceProviderTypeDescriptorId INT NULL,
    ServiceSettingDescriptorId INT NULL,
    ServiceDuration INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT NMPEDService_PK PRIMARY KEY (ServiceDescriptorId)
); 
ALTER TABLE nmped.NMPEDService ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.NMPEDService ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.NMPEDService ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.ParticipationInformationDescriptor --
CREATE TABLE nmped.ParticipationInformationDescriptor (
    ParticipationInformationDescriptorId INT NOT NULL,
    CONSTRAINT ParticipationInformationDescriptor_PK PRIMARY KEY (ParticipationInformationDescriptorId)
); 

-- Table nmped.PlannedPostGraduateActivityDescriptor --
CREATE TABLE nmped.PlannedPostGraduateActivityDescriptor (
    PlannedPostGraduateActivityDescriptorId INT NOT NULL,
    CONSTRAINT PlannedPostGraduateActivityDescriptor_PK PRIMARY KEY (PlannedPostGraduateActivityDescriptorId)
); 

-- Table nmped.ProgramDeliveryMethodDescriptor --
CREATE TABLE nmped.ProgramDeliveryMethodDescriptor (
    ProgramDeliveryMethodDescriptorId INT NOT NULL,
    CONSTRAINT ProgramDeliveryMethodDescriptor_PK PRIMARY KEY (ProgramDeliveryMethodDescriptorId)
); 

-- Table nmped.ProgramIntensityDescriptor --
CREATE TABLE nmped.ProgramIntensityDescriptor (
    ProgramIntensityDescriptorId INT NOT NULL,
    CONSTRAINT ProgramIntensityDescriptor_PK PRIMARY KEY (ProgramIntensityDescriptorId)
); 

-- Table nmped.ServiceProviderTypeDescriptor --
CREATE TABLE nmped.ServiceProviderTypeDescriptor (
    ServiceProviderTypeDescriptorId INT NOT NULL,
    CONSTRAINT ServiceProviderTypeDescriptor_PK PRIMARY KEY (ServiceProviderTypeDescriptorId)
); 

-- Table nmped.ServiceSettingDescriptor --
CREATE TABLE nmped.ServiceSettingDescriptor (
    ServiceSettingDescriptorId INT NOT NULL,
    CONSTRAINT ServiceSettingDescriptor_PK PRIMARY KEY (ServiceSettingDescriptorId)
); 

-- Table nmped.SpecialEducationEventReasonDescriptor --
CREATE TABLE nmped.SpecialEducationEventReasonDescriptor (
    SpecialEducationEventReasonDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationEventReasonDescriptor_PK PRIMARY KEY (SpecialEducationEventReasonDescriptorId)
); 

-- Table nmped.SpecialEducationEventTypeDescriptor --
CREATE TABLE nmped.SpecialEducationEventTypeDescriptor (
    SpecialEducationEventTypeDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationEventTypeDescriptor_PK PRIMARY KEY (SpecialEducationEventTypeDescriptorId)
); 

-- Table nmped.SpecialEducationLevelOfIntegrationDescriptor --
CREATE TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor (
    SpecialEducationLevelOfIntegrationDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationLevelOfIntegrationDescriptor_PK PRIMARY KEY (SpecialEducationLevelOfIntegrationDescriptorId)
); 

-- Table nmped.SpecialEducationNonComplianceReasonDescriptor --
CREATE TABLE nmped.SpecialEducationNonComplianceReasonDescriptor (
    SpecialEducationNonComplianceReasonDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationNonComplianceReasonDescriptor_PK PRIMARY KEY (SpecialEducationNonComplianceReasonDescriptorId)
); 

-- Table nmped.SpecialProgramCodeDescriptor --
CREATE TABLE nmped.SpecialProgramCodeDescriptor (
    SpecialProgramCodeDescriptorId INT NOT NULL,
    CONSTRAINT SpecialProgramCodeDescriptor_PK PRIMARY KEY (SpecialProgramCodeDescriptorId)
); 

-- Table nmped.StaffDevelopment --
CREATE TABLE nmped.StaffDevelopment (
    EducationOrganizationId INT NOT NULL,
    StaffUSI INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    StaffDevelopmentActivityCodeDescriptorId INT NOT NULL,
    StaffDevelopmentPurposeCodeDescriptorId INT NULL,
    ActivityHours INT NOT NULL,
    StaffCreditsEarned INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffDevelopment_PK PRIMARY KEY (EducationOrganizationId, StaffUSI, StartDate)
); 
ALTER TABLE nmped.StaffDevelopment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.StaffDevelopment ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.StaffDevelopment ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.StaffDevelopmentActivityCodeDescriptor --
CREATE TABLE nmped.StaffDevelopmentActivityCodeDescriptor (
    StaffDevelopmentActivityCodeDescriptorId INT NOT NULL,
    CONSTRAINT StaffDevelopmentActivityCodeDescriptor_PK PRIMARY KEY (StaffDevelopmentActivityCodeDescriptorId)
); 

-- Table nmped.StaffDevelopmentPurposeCodeDescriptor --
CREATE TABLE nmped.StaffDevelopmentPurposeCodeDescriptor (
    StaffDevelopmentPurposeCodeDescriptorId INT NOT NULL,
    CONSTRAINT StaffDevelopmentPurposeCodeDescriptor_PK PRIMARY KEY (StaffDevelopmentPurposeCodeDescriptorId)
); 

-- Table nmped.StaffEducationOrganizationDigitalEquity --
CREATE TABLE nmped.StaffEducationOrganizationDigitalEquity (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffUSI INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    DigitalEquityPrimaryLearningDeviceTypeDescriptorId INT NOT NULL,
    SchoolProvidedDevice BOOLEAN NOT NULL,
    DigitalEquityPrimaryLearningDeviceAccessDescriptorId INT NOT NULL,
    DigitalEquityInternetAccessTypeDescriptorId INT NOT NULL,
    DigitalEquityInternetPerformanceCodeDescriptorId INT NOT NULL,
    InternetAccessInResidence BOOLEAN NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEducationOrganizationDigitalEquity_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StaffUSI, StartDate)
); 
ALTER TABLE nmped.StaffEducationOrganizationDigitalEquity ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.StaffEducationOrganizationDigitalEquity ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.StaffEducationOrganizationDigitalEquity ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.StaffExtension --
CREATE TABLE nmped.StaffExtension (
    StaffUSI INT NOT NULL,
    HighestCompletedLevelOfEducationInstitutionDescriptorId INT NULL,
    BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffExtension_PK PRIMARY KEY (StaffUSI)
); 
ALTER TABLE nmped.StaffExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StaffSectionAssociationExtension --
CREATE TABLE nmped.StaffSectionAssociationExtension (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StaffUSI INT NOT NULL,
    ClassPeriodDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffSectionAssociationExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI)
); 
ALTER TABLE nmped.StaffSectionAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentAwardLanguageDescriptor --
CREATE TABLE nmped.StudentAwardLanguageDescriptor (
    StudentAwardLanguageDescriptorId INT NOT NULL,
    CONSTRAINT StudentAwardLanguageDescriptor_PK PRIMARY KEY (StudentAwardLanguageDescriptorId)
); 

-- Table nmped.StudentAwardTypeDescriptor --
CREATE TABLE nmped.StudentAwardTypeDescriptor (
    StudentAwardTypeDescriptorId INT NOT NULL,
    CONSTRAINT StudentAwardTypeDescriptor_PK PRIMARY KEY (StudentAwardTypeDescriptorId)
); 

-- Table nmped.StudentCTEProgramAssociationExtension --
CREATE TABLE nmped.StudentCTEProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ProgramDeliveryMethodDescriptorId INT NOT NULL,
    IndustryCredentialDescriptorId INT NOT NULL,
    CredentialEarnedDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentCTEProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentCTEProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentEducationOrganizationAssociationExtension --
CREATE TABLE nmped.StudentEducationOrganizationAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    Grade09Entry DATE NULL,
    DentalExaminationVerificationCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, StudentUSI)
); 
ALTER TABLE nmped.StudentEducationOrganizationAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentEducationOrganizationAward --
CREATE TABLE nmped.StudentEducationOrganizationAward (
    AwardDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentAwardLanguageDescriptorId INT NOT NULL,
    StudentAwardTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentEducationOrganizationAward_PK PRIMARY KEY (AwardDate, EducationOrganizationId, SchoolYear, StudentAwardLanguageDescriptorId, StudentAwardTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentEducationOrganizationAward ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.StudentEducationOrganizationAward ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.StudentEducationOrganizationAward ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.StudentExtension --
CREATE TABLE nmped.StudentExtension (
    StudentUSI INT NOT NULL,
    GenderIdentityDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentExtension_PK PRIMARY KEY (StudentUSI)
); 
ALTER TABLE nmped.StudentExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentProgramAssociationExtension --
CREATE TABLE nmped.StudentProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ParticipationInformationDescriptorId INT NULL,
    ProgramIntensityDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentProgramAssociationNMPEDService --
CREATE TABLE nmped.StudentProgramAssociationNMPEDService (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    ServiceDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentProgramAssociationNMPEDService_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, ServiceDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentProgramAssociationNMPEDService ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentSchoolFoodServiceProgramAssociationExtension --
CREATE TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    DirectCertificationStatusDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolFoodServiceProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentSectionAssociationExtension --
CREATE TABLE nmped.StudentSectionAssociationExtension (
    BeginDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StudentUSI INT NOT NULL,
    SpecialProgramCodeDescriptorId INT NULL,
    AlternateCreditCourseCode VARCHAR(60) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSectionAssociationExtension_PK PRIMARY KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
); 
ALTER TABLE nmped.StudentSectionAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentSpecialEducationProgramAssociationExtension --
CREATE TABLE nmped.StudentSpecialEducationProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    SpecialEducationLevelOfIntegrationDescriptorId INT NOT NULL,
    AnnualReviewDelayReasonDescriptorId INT NULL,
    TriennialReviewDelayReasonDescriptorId INT NULL,
    PlannedPostGraduateActivityDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc --
CREATE TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    EventDate DATE NOT NULL,
    SpecialEducationEventTypeDescriptorId INT NOT NULL,
    SpecialEducationEventReasonDescriptorId INT NULL,
    SpecialEducationNonComplianceReasonDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEd_c2cadc_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.TriennialReviewDelayReasonDescriptor --
CREATE TABLE nmped.TriennialReviewDelayReasonDescriptor (
    TriennialReviewDelayReasonDescriptorId INT NOT NULL,
    CONSTRAINT TriennialReviewDelayReasonDescriptor_PK PRIMARY KEY (TriennialReviewDelayReasonDescriptorId)
); 

