-- Table nmped.AnnualReviewDelayReasonDescriptor --
CREATE TABLE nmped.AnnualReviewDelayReasonDescriptor (
    AnnualReviewDelayReasonDescriptorId INT NOT NULL,
    CONSTRAINT AnnualReviewDelayReasonDescriptor_PK PRIMARY KEY (AnnualReviewDelayReasonDescriptorId)
);

-- Table nmped.DentalExaminationVerificationCodeDescriptor --
CREATE TABLE nmped.DentalExaminationVerificationCodeDescriptor (
    DentalExaminationVerificationCodeDescriptorId INT NOT NULL,
    CONSTRAINT DentalExaminationVerificationCodeDescriptor_PK PRIMARY KEY (DentalExaminationVerificationCodeDescriptorId)
);

-- Table nmped.DirectCertificationStatusDescriptor --
CREATE TABLE nmped.DirectCertificationStatusDescriptor (
    DirectCertificationStatusDescriptorId INT NOT NULL,
    CONSTRAINT DirectCertificationStatusDescriptor_PK PRIMARY KEY (DirectCertificationStatusDescriptorId)
);

-- Table nmped.DisciplineActionExtension --
CREATE TABLE nmped.DisciplineActionExtension (
    DisciplineActionIdentifier VARCHAR(20) NOT NULL,
    DisciplineDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    DisciplineActionDetailedResponse VARCHAR(1024) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineActionExtension_PK PRIMARY KEY (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
);
ALTER TABLE nmped.DisciplineActionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

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

-- Table nmped.ExpectedDiplomaTypeDescriptor --
CREATE TABLE nmped.ExpectedDiplomaTypeDescriptor (
    ExpectedDiplomaTypeDescriptorId INT NOT NULL,
    CONSTRAINT ExpectedDiplomaTypeDescriptor_PK PRIMARY KEY (ExpectedDiplomaTypeDescriptorId)
);

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

-- Table nmped.LevelOfIntegrationDescriptor --
CREATE TABLE nmped.LevelOfIntegrationDescriptor (
    LevelOfIntegrationDescriptorId INT NOT NULL,
    CONSTRAINT LevelOfIntegrationDescriptor_PK PRIMARY KEY (LevelOfIntegrationDescriptorId)
);

-- Table nmped.LocalEducationAgencyTransportation --
CREATE TABLE nmped.LocalEducationAgencyTransportation (
    CategoryDescriptor01TransportationCategoryDescriptorId INT NOT NULL,
    CategoryDescriptor02TransportationCategoryDescriptorId INT NOT NULL,
    LocalEducationAgencyId INT NOT NULL,
    TransportationSetCodeDescriptorId INT NOT NULL,
    Count INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT LocalEducationAgencyTransportation_PK PRIMARY KEY (CategoryDescriptor01TransportationCategoryDescriptorId, CategoryDescriptor02TransportationCategoryDescriptorId, LocalEducationAgencyId, TransportationSetCodeDescriptorId)
);
ALTER TABLE nmped.LocalEducationAgencyTransportation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.LocalEducationAgencyTransportation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.LocalEducationAgencyTransportation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.MileageTypeDescriptor --
CREATE TABLE nmped.MileageTypeDescriptor (
    MileageTypeDescriptorId INT NOT NULL,
    CONSTRAINT MileageTypeDescriptor_PK PRIMARY KEY (MileageTypeDescriptorId)
);

-- Table nmped.MilitaryFamilyDescriptor --
CREATE TABLE nmped.MilitaryFamilyDescriptor (
    MilitaryFamilyDescriptorId INT NOT NULL,
    CONSTRAINT MilitaryFamilyDescriptor_PK PRIMARY KEY (MilitaryFamilyDescriptorId)
);

-- Table nmped.NMPEDClassPeriodDescriptor --
CREATE TABLE nmped.NMPEDClassPeriodDescriptor (
    NMPEDClassPeriodDescriptorId INT NOT NULL,
    CONSTRAINT NMPEDClassPeriodDescriptor_PK PRIMARY KEY (NMPEDClassPeriodDescriptorId)
);

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

-- Table nmped.PreKClassTypeDescriptor --
CREATE TABLE nmped.PreKClassTypeDescriptor (
    PreKClassTypeDescriptorId INT NOT NULL,
    CONSTRAINT PreKClassTypeDescriptor_PK PRIMARY KEY (PreKClassTypeDescriptorId)
);

-- Table nmped.PrimaryAreaOfExceptionalityDescriptor --
CREATE TABLE nmped.PrimaryAreaOfExceptionalityDescriptor (
    PrimaryAreaOfExceptionalityDescriptorId INT NOT NULL,
    CONSTRAINT PrimaryAreaOfExceptionalityDescriptor_PK PRIMARY KEY (PrimaryAreaOfExceptionalityDescriptorId)
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

-- Table nmped.RoadTypeDescriptor --
CREATE TABLE nmped.RoadTypeDescriptor (
    RoadTypeDescriptorId INT NOT NULL,
    CONSTRAINT RoadTypeDescriptor_PK PRIMARY KEY (RoadTypeDescriptorId)
);

-- Table nmped.SectionExtension --
CREATE TABLE nmped.SectionExtension (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    NMPEDClassPeriodDescriptorId INT NULL,
    PreKClassTypeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
);
ALTER TABLE nmped.SectionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

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

-- Table nmped.SpecialEducationNonComplianceReasonDescriptor --
CREATE TABLE nmped.SpecialEducationNonComplianceReasonDescriptor (
    SpecialEducationNonComplianceReasonDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationNonComplianceReasonDescriptor_PK PRIMARY KEY (SpecialEducationNonComplianceReasonDescriptorId)
);

-- Table nmped.SpecialEducationReferralCodeDescriptor --
CREATE TABLE nmped.SpecialEducationReferralCodeDescriptor (
    SpecialEducationReferralCodeDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationReferralCodeDescriptor_PK PRIMARY KEY (SpecialEducationReferralCodeDescriptorId)
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
    MentorTraining BOOLEAN NULL,
    MentorIdUniqueId VARCHAR(32) NULL,
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

-- Table nmped.StaffEducationOrganizationEmploymentAssociationExtension --
CREATE TABLE nmped.StaffEducationOrganizationEmploymentAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    EmploymentStatusDescriptorId INT NOT NULL,
    HireDate DATE NOT NULL,
    StaffUSI INT NOT NULL,
    TeacherOrPrincipalYearsInDistrict INT NULL,
    TeacherOrPrincipalYearsOverall INT NULL,
    HighestCompletedLevelOfEducationInstitutionDescriptorId INT NULL,
    BaccalaureateLevelOfEducationInstitutionDescriptorId INT NULL,
    NationalCertified BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEducationOrganizationEmploymentAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI)
);
ALTER TABLE nmped.StaffEducationOrganizationEmploymentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentAwardTypeDescriptor --
CREATE TABLE nmped.StudentAwardTypeDescriptor (
    StudentAwardTypeDescriptorId INT NOT NULL,
    CONSTRAINT StudentAwardTypeDescriptor_PK PRIMARY KEY (StudentAwardTypeDescriptorId)
);

-- Table nmped.StudentCTEProgramAssociationCredential --
CREATE TABLE nmped.StudentCTEProgramAssociationCredential (
    BeginDate DATE NOT NULL,
    CredentialEarnedDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    IndustryCredentialDescriptorId INT NOT NULL,
    ProgramDeliveryMethodDescriptorId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentCTEProgramAssociationCredential_PK PRIMARY KEY (BeginDate, CredentialEarnedDate, EducationOrganizationId, IndustryCredentialDescriptorId, ProgramDeliveryMethodDescriptorId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentCTEProgramAssociationCredential ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.StudentCTEProgramAssociationCredential ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.StudentCTEProgramAssociationCredential ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.StudentEducationOrganizationAssociationExtension --
CREATE TABLE nmped.StudentEducationOrganizationAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    Grade09Entry DATE NULL,
    DentalExaminationVerificationCodeDescriptorId INT NULL,
    MilitaryFamilyDescriptorId INT NULL,
    GenderIdentityDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, StudentUSI)
);
ALTER TABLE nmped.StudentEducationOrganizationAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44 --
CREATE TABLE nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44 (
    EducationOrganizationId INT NOT NULL,
    StudentCharacteristicDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    GiftedLevelOfIntegrationDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationStudentChar_fc9b44_PK PRIMARY KEY (EducationOrganizationId, StudentCharacteristicDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentEducationOrganizationAssociationStudentCharacteri_fc9b44 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

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
    BEPProgramLanguageDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentProgramAssociationServiceExtension --
CREATE TABLE nmped.StudentProgramAssociationServiceExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    ServiceDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ServiceFrequency INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentProgramAssociationServiceExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, ServiceDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentProgramAssociationServiceExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentSchoolFoodServiceProgramAssociationExtension --
CREATE TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    DirectCertificationStatusDescriptorId INT NULL,
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

-- Table nmped.StudentSpecialEducationAssociationEvent --
CREATE TABLE nmped.StudentSpecialEducationAssociationEvent (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    EventDate DATE NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    SpecialEducationEventTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    SpecialEducationEventReasonDescriptorId INT NULL,
    SpecialEducationNonComplianceReasonDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentSpecialEducationAssociationEvent_PK PRIMARY KEY (BeginDate, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, SpecialEducationEventTypeDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentSpecialEducationAssociationEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.StudentSpecialEducationAssociationEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.StudentSpecialEducationAssociationEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

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
    ExpectedDiplomaTypeDescriptorId INT NULL,
    BrailleInstruction BOOLEAN NULL,
    AlternateInstruction BOOLEAN NOT NULL,
    PrimaryAreaOfExceptionalityDescriptorId INT NOT NULL,
    SpecialEducationReferralCodeDescriptorId INT NULL,
    ChildCountEducationOrganizationId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8 --
CREATE TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8 (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    SpecialEducationProgramServiceDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    IntegratedServicesStatus BOOLEAN NULL,
    ServiceDuration INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEd_e4dfb8_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, SpecialEducationProgramServiceDescriptorId, StudentUSI)
);
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_e4dfb8 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.TransportationCategoryDescriptor --
CREATE TABLE nmped.TransportationCategoryDescriptor (
    TransportationCategoryDescriptorId INT NOT NULL,
    CONSTRAINT TransportationCategoryDescriptor_PK PRIMARY KEY (TransportationCategoryDescriptorId)
);

-- Table nmped.TransportationSetCodeDescriptor --
CREATE TABLE nmped.TransportationSetCodeDescriptor (
    TransportationSetCodeDescriptorId INT NOT NULL,
    CONSTRAINT TransportationSetCodeDescriptor_PK PRIMARY KEY (TransportationSetCodeDescriptorId)
);

-- Table nmped.TriennialReviewDelayReasonDescriptor --
CREATE TABLE nmped.TriennialReviewDelayReasonDescriptor (
    TriennialReviewDelayReasonDescriptorId INT NOT NULL,
    CONSTRAINT TriennialReviewDelayReasonDescriptor_PK PRIMARY KEY (TriennialReviewDelayReasonDescriptorId)
);

-- Table nmped.VehicleBodyManufacturerDescriptor --
CREATE TABLE nmped.VehicleBodyManufacturerDescriptor (
    VehicleBodyManufacturerDescriptorId INT NOT NULL,
    CONSTRAINT VehicleBodyManufacturerDescriptor_PK PRIMARY KEY (VehicleBodyManufacturerDescriptorId)
);

-- Table nmped.VehicleChassisManufacturerDescriptor --
CREATE TABLE nmped.VehicleChassisManufacturerDescriptor (
    VehicleChassisManufacturerDescriptorId INT NOT NULL,
    CONSTRAINT VehicleChassisManufacturerDescriptor_PK PRIMARY KEY (VehicleChassisManufacturerDescriptorId)
);

-- Table nmped.VehicleFuelTypeDescriptor --
CREATE TABLE nmped.VehicleFuelTypeDescriptor (
    VehicleFuelTypeDescriptorId INT NOT NULL,
    CONSTRAINT VehicleFuelTypeDescriptor_PK PRIMARY KEY (VehicleFuelTypeDescriptorId)
);

-- Table nmped.VehicleMileage --
CREATE TABLE nmped.VehicleMileage (
    LocalEducationAgencyId INT NOT NULL,
    MileageTypeDescriptorId INT NOT NULL,
    ReportingDate DATE NOT NULL,
    RoadTypeDescriptorId INT NOT NULL,
    VehicleId VARCHAR(255) NOT NULL,
    VehicleRouteDescriptorId INT NOT NULL,
    DailyMileage INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT VehicleMileage_PK PRIMARY KEY (LocalEducationAgencyId, MileageTypeDescriptorId, ReportingDate, RoadTypeDescriptorId, VehicleId, VehicleRouteDescriptorId)
);
ALTER TABLE nmped.VehicleMileage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.VehicleMileage ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.VehicleMileage ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.VehicleRouteDescriptor --
CREATE TABLE nmped.VehicleRouteDescriptor (
    VehicleRouteDescriptorId INT NOT NULL,
    CONSTRAINT VehicleRouteDescriptor_PK PRIMARY KEY (VehicleRouteDescriptorId)
);

-- Table nmped.VehicleSnapshot --
CREATE TABLE nmped.VehicleSnapshot (
    LocalEducationAgencyId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    VehicleId VARCHAR(255) NOT NULL,
    VehicleIdentificationNumber VARCHAR(21) NOT NULL,
    LicensePlateNumber VARCHAR(10) NOT NULL,
    ManufacturerYear INT NOT NULL,
    VehicleBodyManufacturerDescriptorId INT NOT NULL,
    VehicleChassisManufacturerDescriptorId INT NOT NULL,
    GrossVehicleWeightRating INT NOT NULL,
    VehicleFuelTypeDescriptorId INT NOT NULL,
    SpecialLiftEquipmentIndicator BOOLEAN NOT NULL,
    SeatingCapacity INT NOT NULL,
    RegisteredOwnerCode VARCHAR(20) NOT NULL,
    OdometerMileage INT NOT NULL,
    OdometerReadingDate DATE NOT NULL,
    NumberOfDaysInUse INT NOT NULL,
    VehicleUseIndicator BOOLEAN NOT NULL,
    VehicleTypeDescriptorId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT VehicleSnapshot_PK PRIMARY KEY (LocalEducationAgencyId, SchoolYear, VehicleId, VehicleIdentificationNumber)
);
ALTER TABLE nmped.VehicleSnapshot ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmped.VehicleSnapshot ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmped.VehicleSnapshot ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmped.VehicleTypeDescriptor --
CREATE TABLE nmped.VehicleTypeDescriptor (
    VehicleTypeDescriptorId INT NOT NULL,
    CONSTRAINT VehicleTypeDescriptor_PK PRIMARY KEY (VehicleTypeDescriptorId)
);

