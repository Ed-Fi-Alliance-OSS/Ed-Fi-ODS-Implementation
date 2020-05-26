-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table tpdm.AidTypeDescriptor --
CREATE TABLE tpdm.AidTypeDescriptor (
    AidTypeDescriptorId INT NOT NULL,
    CONSTRAINT AidTypeDescriptor_PK PRIMARY KEY (AidTypeDescriptorId)
); 

-- Table tpdm.AnonymizedStudent --
CREATE TABLE tpdm.AnonymizedStudent (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SexDescriptorId INT NULL,
    GenderDescriptorId INT NULL,
    HispanicLatinoEthnicity BOOLEAN NULL,
    GradeLevelDescriptorId INT NULL,
    Section504Enrollment BOOLEAN NULL,
    ELLEnrollment BOOLEAN NULL,
    ESLEnrollment BOOLEAN NULL,
    SPEDEnrollment BOOLEAN NULL,
    TitleIEnrollment BOOLEAN NULL,
    AtriskIndicator BOOLEAN NULL,
    Mobility INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudent_PK PRIMARY KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentAcademicRecord --
CREATE TABLE tpdm.AnonymizedStudentAcademicRecord (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    SessionGradePointAverage DECIMAL(18, 4) NULL,
    CumulativeGradePointAverage DECIMAL(18, 4) NULL,
    GPAMax DECIMAL(18, 4) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentAcademicRecord_PK PRIMARY KEY (AnonymizedStudentIdentifier, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentAssessment --
CREATE TABLE tpdm.AnonymizedStudentAssessment (
    AdministrationDate DATE NOT NULL,
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NULL,
    AssessmentTitle VARCHAR(100) NULL,
    AssessmentCategoryDescriptorId INT NULL,
    AcademicSubjectDescriptorId INT NULL,
    GradeLevelDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentAssessment_PK PRIMARY KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentAssessment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentAssessment ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentAssessment ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentAssessmentCourseAssociation --
CREATE TABLE tpdm.AnonymizedStudentAssessmentCourseAssociation (
    AdministrationDate DATE NOT NULL,
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentAssessmentCourseAssociation_PK PRIMARY KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear, TakenSchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentAssessmentCourseAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentAssessmentCourseAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentAssessmentCourseAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentAssessmentPerformanceLevel --
CREATE TABLE tpdm.AnonymizedStudentAssessmentPerformanceLevel (
    AdministrationDate DATE NOT NULL,
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    PerformanceLevelMet BOOLEAN NOT NULL,
    PerformanceLevelDescriptorId INT NOT NULL,
    AssessmentReportingMethodDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentAssessmentPerformanceLevel_PK PRIMARY KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentAssessmentPerformanceLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentAssessmentScoreResult --
CREATE TABLE tpdm.AnonymizedStudentAssessmentScoreResult (
    AdministrationDate DATE NOT NULL,
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    Result VARCHAR(35) NOT NULL,
    ResultDatatypeTypeDescriptorId INT NOT NULL,
    AssessmentReportingMethodDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentAssessmentScoreResult_PK PRIMARY KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentAssessmentScoreResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentAssessmentSectionAssociation --
CREATE TABLE tpdm.AnonymizedStudentAssessmentSectionAssociation (
    AdministrationDate DATE NOT NULL,
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentAssessmentSectionAssociation_PK PRIMARY KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentAssessmentSectionAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentAssessmentSectionAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentAssessmentSectionAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentCourseAssociation --
CREATE TABLE tpdm.AnonymizedStudentCourseAssociation (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    BeginDate DATE NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentCourseAssociation_PK PRIMARY KEY (AnonymizedStudentIdentifier, BeginDate, CourseCode, EducationOrganizationId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentCourseAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentCourseAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentCourseAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentCourseTranscript --
CREATE TABLE tpdm.AnonymizedStudentCourseTranscript (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    FinalLetterGradeEarned VARCHAR(20) NULL,
    FinalNumericGradeEarned DECIMAL(9, 2) NULL,
    CourseRepeatCodeDescriptorId INT NULL,
    CourseTitle VARCHAR(60) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentCourseTranscript_PK PRIMARY KEY (AnonymizedStudentIdentifier, CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.AnonymizedStudentCourseTranscript ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentCourseTranscript ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentCourseTranscript ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentDisability --
CREATE TABLE tpdm.AnonymizedStudentDisability (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    DisabilityDiagnosis VARCHAR(80) NULL,
    OrderOfDisability INT NULL,
    DisabilityDeterminationSourceTypeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentDisability_PK PRIMARY KEY (AnonymizedStudentIdentifier, DisabilityDescriptorId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentDisabilityDesignation --
CREATE TABLE tpdm.AnonymizedStudentDisabilityDesignation (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    DisabilityDesignationDescriptorId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentDisabilityDesignation_PK PRIMARY KEY (AnonymizedStudentIdentifier, DisabilityDescriptorId, DisabilityDesignationDescriptorId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentDisabilityDesignation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentEducationOrganizationAssociation --
CREATE TABLE tpdm.AnonymizedStudentEducationOrganizationAssociation (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentEducationOrganizationAssociation_PK PRIMARY KEY (AnonymizedStudentIdentifier, BeginDate, EducationOrganizationId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentEducationOrganizationAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentEducationOrganizationAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentEducationOrganizationAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentLanguage --
CREATE TABLE tpdm.AnonymizedStudentLanguage (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentLanguage_PK PRIMARY KEY (AnonymizedStudentIdentifier, FactsAsOfDate, LanguageDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentLanguageUse --
CREATE TABLE tpdm.AnonymizedStudentLanguageUse (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    LanguageUseDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentLanguageUse_PK PRIMARY KEY (AnonymizedStudentIdentifier, FactsAsOfDate, LanguageDescriptorId, LanguageUseDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentLanguageUse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentRace --
CREATE TABLE tpdm.AnonymizedStudentRace (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    RaceDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AnonymizedStudentRace_PK PRIMARY KEY (AnonymizedStudentIdentifier, FactsAsOfDate, RaceDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.AnonymizedStudentRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AnonymizedStudentSectionAssociation --
CREATE TABLE tpdm.AnonymizedStudentSectionAssociation (
    AnonymizedStudentIdentifier VARCHAR(60) NOT NULL,
    BeginDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AnonymizedStudentSectionAssociation_PK PRIMARY KEY (AnonymizedStudentIdentifier, BeginDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.AnonymizedStudentSectionAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.AnonymizedStudentSectionAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.AnonymizedStudentSectionAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.Applicant --
CREATE TABLE tpdm.Applicant (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    PersonalTitlePrefix VARCHAR(30) NULL,
    FirstName VARCHAR(75) NOT NULL,
    MiddleName VARCHAR(75) NULL,
    LastSurname VARCHAR(75) NOT NULL,
    GenerationCodeSuffix VARCHAR(10) NULL,
    MaidenName VARCHAR(75) NULL,
    SexDescriptorId INT NULL,
    BirthDate DATE NULL,
    HispanicLatinoEthnicity BOOLEAN NULL,
    CitizenshipStatusDescriptorId INT NULL,
    HighestCompletedLevelOfEducationDescriptorId INT NULL,
    YearsOfPriorProfessionalExperience DECIMAL(5, 2) NULL,
    YearsOfPriorTeachingExperience DECIMAL(5, 2) NULL,
    LoginId VARCHAR(60) NULL,
    HighlyQualifiedTeacher BOOLEAN NULL,
    HighlyQualifiedAcademicSubjectDescriptorId INT NULL,
    GenderDescriptorId INT NULL,
    EconomicDisadvantaged BOOLEAN NULL,
    FirstGenerationStudent BOOLEAN NULL,
    TeacherCandidateIdentifier VARCHAR(32) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Applicant_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId)
); 
ALTER TABLE tpdm.Applicant ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.Applicant ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.Applicant ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantAddress --
CREATE TABLE tpdm.ApplicantAddress (
    AddressTypeDescriptorId INT NOT NULL,
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    City VARCHAR(30) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    ApartmentRoomSuiteNumber VARCHAR(50) NULL,
    BuildingSiteNumber VARCHAR(20) NULL,
    NameOfCounty VARCHAR(30) NULL,
    CountyFIPSCode VARCHAR(5) NULL,
    Latitude VARCHAR(20) NULL,
    Longitude VARCHAR(20) NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CongressionalDistrict VARCHAR(30) NULL,
    LocaleDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantAddress_PK PRIMARY KEY (AddressTypeDescriptorId, ApplicantIdentifier, City, EducationOrganizationId, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
); 
ALTER TABLE tpdm.ApplicantAddress ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantAddressPeriod --
CREATE TABLE tpdm.ApplicantAddressPeriod (
    AddressTypeDescriptorId INT NOT NULL,
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    BeginDate DATE NOT NULL,
    City VARCHAR(30) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantAddressPeriod_PK PRIMARY KEY (AddressTypeDescriptorId, ApplicantIdentifier, BeginDate, City, EducationOrganizationId, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
); 
ALTER TABLE tpdm.ApplicantAddressPeriod ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantAid --
CREATE TABLE tpdm.ApplicantAid (
    AidTypeDescriptorId INT NOT NULL,
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    EndDate DATE NULL,
    AidConditionDescription VARCHAR(1024) NULL,
    AidAmount MONEY NULL,
    PellGrantRecipient BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantAid_PK PRIMARY KEY (AidTypeDescriptorId, ApplicantIdentifier, BeginDate, EducationOrganizationId)
); 
ALTER TABLE tpdm.ApplicantAid ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantBackgroundCheck --
CREATE TABLE tpdm.ApplicantBackgroundCheck (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    BackgroundCheckTypeDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    BackgroundCheckRequestedDate DATE NOT NULL,
    BackgroundCheckStatusDescriptorId INT NULL,
    BackgroundCheckCompletedDate DATE NULL,
    Fingerprint BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantBackgroundCheck_PK PRIMARY KEY (ApplicantIdentifier, BackgroundCheckTypeDescriptorId, EducationOrganizationId)
); 
ALTER TABLE tpdm.ApplicantBackgroundCheck ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantCharacteristic --
CREATE TABLE tpdm.ApplicantCharacteristic (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StudentCharacteristicDescriptorId INT NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    DesignatedBy VARCHAR(60) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantCharacteristic_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, StudentCharacteristicDescriptorId)
); 
ALTER TABLE tpdm.ApplicantCharacteristic ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantCredential --
CREATE TABLE tpdm.ApplicantCredential (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    CredentialIdentifier VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantCredential_PK PRIMARY KEY (ApplicantIdentifier, CredentialIdentifier, EducationOrganizationId, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.ApplicantCredential ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantDisability --
CREATE TABLE tpdm.ApplicantDisability (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    DisabilityDiagnosis VARCHAR(80) NULL,
    OrderOfDisability INT NULL,
    DisabilityDeterminationSourceTypeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantDisability_PK PRIMARY KEY (ApplicantIdentifier, DisabilityDescriptorId, EducationOrganizationId)
); 
ALTER TABLE tpdm.ApplicantDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantDisabilityDesignation --
CREATE TABLE tpdm.ApplicantDisabilityDesignation (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    DisabilityDesignationDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantDisabilityDesignation_PK PRIMARY KEY (ApplicantIdentifier, DisabilityDescriptorId, DisabilityDesignationDescriptorId, EducationOrganizationId)
); 
ALTER TABLE tpdm.ApplicantDisabilityDesignation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantElectronicMail --
CREATE TABLE tpdm.ApplicantElectronicMail (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ElectronicMailAddress VARCHAR(128) NOT NULL,
    ElectronicMailTypeDescriptorId INT NOT NULL,
    PrimaryEmailAddressIndicator BOOLEAN NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantElectronicMail_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, ElectronicMailAddress, ElectronicMailTypeDescriptorId)
); 
ALTER TABLE tpdm.ApplicantElectronicMail ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantGradePointAverage --
CREATE TABLE tpdm.ApplicantGradePointAverage (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    GradePointAverageTypeDescriptorId INT NOT NULL,
    IsCumulative BOOLEAN NULL,
    GradePointAverageValue DECIMAL(18, 4) NOT NULL,
    MaxGradePointAverageValue DECIMAL(18, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantGradePointAverage_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, GradePointAverageTypeDescriptorId)
); 
ALTER TABLE tpdm.ApplicantGradePointAverage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantIdentificationDocument --
CREATE TABLE tpdm.ApplicantIdentificationDocument (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    IdentificationDocumentUseDescriptorId INT NOT NULL,
    PersonalInformationVerificationDescriptorId INT NOT NULL,
    DocumentTitle VARCHAR(60) NULL,
    DocumentExpirationDate DATE NULL,
    IssuerDocumentIdentificationCode VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerCountryDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantIdentificationDocument_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, IdentificationDocumentUseDescriptorId, PersonalInformationVerificationDescriptorId)
); 
ALTER TABLE tpdm.ApplicantIdentificationDocument ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantInternationalAddress --
CREATE TABLE tpdm.ApplicantInternationalAddress (
    AddressTypeDescriptorId INT NOT NULL,
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    AddressLine1 VARCHAR(150) NOT NULL,
    AddressLine2 VARCHAR(150) NULL,
    AddressLine3 VARCHAR(150) NULL,
    AddressLine4 VARCHAR(150) NULL,
    CountryDescriptorId INT NOT NULL,
    Latitude VARCHAR(20) NULL,
    Longitude VARCHAR(20) NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantInternationalAddress_PK PRIMARY KEY (AddressTypeDescriptorId, ApplicantIdentifier, EducationOrganizationId)
); 
ALTER TABLE tpdm.ApplicantInternationalAddress ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantLanguage --
CREATE TABLE tpdm.ApplicantLanguage (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantLanguage_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, LanguageDescriptorId)
); 
ALTER TABLE tpdm.ApplicantLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantLanguageUse --
CREATE TABLE tpdm.ApplicantLanguageUse (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    LanguageUseDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantLanguageUse_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, LanguageDescriptorId, LanguageUseDescriptorId)
); 
ALTER TABLE tpdm.ApplicantLanguageUse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantPersonalIdentificationDocument --
CREATE TABLE tpdm.ApplicantPersonalIdentificationDocument (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    IdentificationDocumentUseDescriptorId INT NOT NULL,
    PersonalInformationVerificationDescriptorId INT NOT NULL,
    DocumentTitle VARCHAR(60) NULL,
    DocumentExpirationDate DATE NULL,
    IssuerDocumentIdentificationCode VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerCountryDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantPersonalIdentificationDocument_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, IdentificationDocumentUseDescriptorId, PersonalInformationVerificationDescriptorId)
); 
ALTER TABLE tpdm.ApplicantPersonalIdentificationDocument ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantProspectAssociation --
CREATE TABLE tpdm.ApplicantProspectAssociation (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ApplicantProspectAssociation_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ApplicantProspectAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.ApplicantProspectAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.ApplicantProspectAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantRace --
CREATE TABLE tpdm.ApplicantRace (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    RaceDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantRace_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, RaceDescriptorId)
); 
ALTER TABLE tpdm.ApplicantRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantScoreResult --
CREATE TABLE tpdm.ApplicantScoreResult (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    AssessmentReportingMethodDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    Result VARCHAR(35) NOT NULL,
    ResultDatatypeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantScoreResult_PK PRIMARY KEY (ApplicantIdentifier, AssessmentReportingMethodDescriptorId, EducationOrganizationId)
); 
ALTER TABLE tpdm.ApplicantScoreResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantStaffIdentificationCode --
CREATE TABLE tpdm.ApplicantStaffIdentificationCode (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StaffIdentificationSystemDescriptorId INT NOT NULL,
    IdentificationCode VARCHAR(60) NOT NULL,
    AssigningOrganizationIdentificationCode VARCHAR(60) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantStaffIdentificationCode_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, StaffIdentificationSystemDescriptorId)
); 
ALTER TABLE tpdm.ApplicantStaffIdentificationCode ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantTeacherPreparationProgram --
CREATE TABLE tpdm.ApplicantTeacherPreparationProgram (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    TeacherPreparationProgramName VARCHAR(255) NOT NULL,
    TeacherPreparationProgramIdentifier VARCHAR(75) NULL,
    TeacherPreparationProgramTypeDescriptorId INT NOT NULL,
    NameOfInstitution VARCHAR(75) NOT NULL,
    MajorSpecialization VARCHAR(75) NOT NULL,
    GPA DECIMAL(18, 4) NULL,
    LevelOfDegreeAwardedDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantTeacherPreparationProgram_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, TeacherPreparationProgramName)
); 
ALTER TABLE tpdm.ApplicantTeacherPreparationProgram ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantTelephone --
CREATE TABLE tpdm.ApplicantTelephone (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    TelephoneNumber VARCHAR(24) NOT NULL,
    TelephoneNumberTypeDescriptorId INT NOT NULL,
    OrderOfPriority INT NULL,
    TextMessageCapabilityIndicator BOOLEAN NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantTelephone_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, TelephoneNumber, TelephoneNumberTypeDescriptorId)
); 
ALTER TABLE tpdm.ApplicantTelephone ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicantVisa --
CREATE TABLE tpdm.ApplicantVisa (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    VisaDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantVisa_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, VisaDescriptorId)
); 
ALTER TABLE tpdm.ApplicantVisa ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.Application --
CREATE TABLE tpdm.Application (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    ApplicationIdentifier VARCHAR(20) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ApplicationDate DATE NOT NULL,
    ApplicationStatusDescriptorId INT NOT NULL,
    CurrentEmployee BOOLEAN NULL,
    AcademicSubjectDescriptorId INT NULL,
    AcceptedDate DATE NULL,
    ApplicationSourceDescriptorId INT NULL,
    FirstContactDate DATE NULL,
    HighNeedsAcademicSubjectDescriptorId INT NULL,
    HireStatusDescriptorId INT NULL,
    HiringSourceDescriptorId INT NULL,
    WithdrawDate DATE NULL,
    WithdrawReasonDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Application_PK PRIMARY KEY (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
); 
ALTER TABLE tpdm.Application ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.Application ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.Application ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicationEvent --
CREATE TABLE tpdm.ApplicationEvent (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    ApplicationEventTypeDescriptorId INT NOT NULL,
    ApplicationIdentifier VARCHAR(20) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    EventDate DATE NOT NULL,
    SequenceNumber INT NOT NULL,
    EventEndDate DATE NULL,
    ApplicationEvaluationScore DECIMAL(36, 18) NULL,
    ApplicationEventResultDescriptorId INT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ApplicationEvent_PK PRIMARY KEY (ApplicantIdentifier, ApplicationEventTypeDescriptorId, ApplicationIdentifier, EducationOrganizationId, EventDate, SequenceNumber)
); 
ALTER TABLE tpdm.ApplicationEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.ApplicationEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.ApplicationEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicationEventResultDescriptor --
CREATE TABLE tpdm.ApplicationEventResultDescriptor (
    ApplicationEventResultDescriptorId INT NOT NULL,
    CONSTRAINT ApplicationEventResultDescriptor_PK PRIMARY KEY (ApplicationEventResultDescriptorId)
); 

-- Table tpdm.ApplicationEventTypeDescriptor --
CREATE TABLE tpdm.ApplicationEventTypeDescriptor (
    ApplicationEventTypeDescriptorId INT NOT NULL,
    CONSTRAINT ApplicationEventTypeDescriptor_PK PRIMARY KEY (ApplicationEventTypeDescriptorId)
); 

-- Table tpdm.ApplicationOpenStaffPosition --
CREATE TABLE tpdm.ApplicationOpenStaffPosition (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    ApplicationIdentifier VARCHAR(20) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    RequisitionNumber VARCHAR(20) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicationOpenStaffPosition_PK PRIMARY KEY (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId, RequisitionNumber)
); 
ALTER TABLE tpdm.ApplicationOpenStaffPosition ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ApplicationSourceDescriptor --
CREATE TABLE tpdm.ApplicationSourceDescriptor (
    ApplicationSourceDescriptorId INT NOT NULL,
    CONSTRAINT ApplicationSourceDescriptor_PK PRIMARY KEY (ApplicationSourceDescriptorId)
); 

-- Table tpdm.ApplicationStatusDescriptor --
CREATE TABLE tpdm.ApplicationStatusDescriptor (
    ApplicationStatusDescriptorId INT NOT NULL,
    CONSTRAINT ApplicationStatusDescriptor_PK PRIMARY KEY (ApplicationStatusDescriptorId)
); 

-- Table tpdm.ApplicationTerm --
CREATE TABLE tpdm.ApplicationTerm (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    ApplicationIdentifier VARCHAR(20) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicationTerm_PK PRIMARY KEY (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId, TermDescriptorId)
); 
ALTER TABLE tpdm.ApplicationTerm ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.AssessmentExtension --
CREATE TABLE tpdm.AssessmentExtension (
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    Namespace VARCHAR(255) NOT NULL,
    ProgramGatewayDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT AssessmentExtension_PK PRIMARY KEY (AssessmentIdentifier, Namespace)
); 
ALTER TABLE tpdm.AssessmentExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.BackgroundCheckStatusDescriptor --
CREATE TABLE tpdm.BackgroundCheckStatusDescriptor (
    BackgroundCheckStatusDescriptorId INT NOT NULL,
    CONSTRAINT BackgroundCheckStatusDescriptor_PK PRIMARY KEY (BackgroundCheckStatusDescriptorId)
); 

-- Table tpdm.BackgroundCheckTypeDescriptor --
CREATE TABLE tpdm.BackgroundCheckTypeDescriptor (
    BackgroundCheckTypeDescriptorId INT NOT NULL,
    CONSTRAINT BackgroundCheckTypeDescriptor_PK PRIMARY KEY (BackgroundCheckTypeDescriptorId)
); 

-- Table tpdm.BoardCertificationTypeDescriptor --
CREATE TABLE tpdm.BoardCertificationTypeDescriptor (
    BoardCertificationTypeDescriptorId INT NOT NULL,
    CONSTRAINT BoardCertificationTypeDescriptor_PK PRIMARY KEY (BoardCertificationTypeDescriptorId)
); 

-- Table tpdm.CertificationExamStatusDescriptor --
CREATE TABLE tpdm.CertificationExamStatusDescriptor (
    CertificationExamStatusDescriptorId INT NOT NULL,
    CONSTRAINT CertificationExamStatusDescriptor_PK PRIMARY KEY (CertificationExamStatusDescriptorId)
); 

-- Table tpdm.CertificationExamTypeDescriptor --
CREATE TABLE tpdm.CertificationExamTypeDescriptor (
    CertificationExamTypeDescriptorId INT NOT NULL,
    CONSTRAINT CertificationExamTypeDescriptor_PK PRIMARY KEY (CertificationExamTypeDescriptorId)
); 

-- Table tpdm.CommunityOrganizationExtension --
CREATE TABLE tpdm.CommunityOrganizationExtension (
    CommunityOrganizationId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CommunityOrganizationExtension_PK PRIMARY KEY (CommunityOrganizationId)
); 
ALTER TABLE tpdm.CommunityOrganizationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CommunityProviderExtension --
CREATE TABLE tpdm.CommunityProviderExtension (
    CommunityProviderId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CommunityProviderExtension_PK PRIMARY KEY (CommunityProviderId)
); 
ALTER TABLE tpdm.CommunityProviderExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CompleterAsStaffAssociation --
CREATE TABLE tpdm.CompleterAsStaffAssociation (
    StaffUSI INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CompleterAsStaffAssociation_PK PRIMARY KEY (StaffUSI, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.CompleterAsStaffAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.CompleterAsStaffAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.CompleterAsStaffAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.CoteachingStyleObservedDescriptor --
CREATE TABLE tpdm.CoteachingStyleObservedDescriptor (
    CoteachingStyleObservedDescriptorId INT NOT NULL,
    CONSTRAINT CoteachingStyleObservedDescriptor_PK PRIMARY KEY (CoteachingStyleObservedDescriptorId)
); 

-- Table tpdm.CourseCourseTranscriptFacts --
CREATE TABLE tpdm.CourseCourseTranscriptFacts (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CourseTitle VARCHAR(60) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CourseCourseTranscriptFacts_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseCourseTranscriptFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.CourseCourseTranscriptFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.CourseCourseTranscriptFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned --
CREATE TABLE tpdm.CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    FinalLetterGrade VARCHAR(20) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    LetterGradeTypeNumber INT NULL,
    LetterGradeTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, FinalLetterGrade, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseCourseTranscriptFactsAggregatedNumericGradeEarned --
CREATE TABLE tpdm.CourseCourseTranscriptFactsAggregatedNumericGradeEarned (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AverageFinalNumericGradeEarned DECIMAL(9, 2) NOT NULL,
    NumericGradeNCount INT NULL,
    NumericGradeStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseCourseTranscriptFactsAggregatedNumericGradeEarned_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseCourseTranscriptFactsAggregatedNumericGradeEarned ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseCourseTranscriptFactsStudentsEnrolled --
CREATE TABLE tpdm.CourseCourseTranscriptFactsStudentsEnrolled (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseCourseTranscriptFactsStudentsEnrolled_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseCourseTranscriptFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAcademicRecordFacts --
CREATE TABLE tpdm.CourseStudentAcademicRecordFacts (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AggregatedGPAMax DECIMAL(18, 4) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CourseStudentAcademicRecordFacts_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentAcademicRecordFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.CourseStudentAcademicRecordFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.CourseStudentAcademicRecordFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAcademicRecordFactsAggregatedCumulativeGrad_4b17a5 --
CREATE TABLE tpdm.CourseStudentAcademicRecordFactsAggregatedCumulativeGrad_4b17a5 (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    GradePointAverage DECIMAL(18, 4) NOT NULL,
    GradePointNCount INT NULL,
    GradePointStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentAcademicRecordFactsAggregatedCumulati_4b17a5_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentAcademicRecordFactsAggregatedCumulativeGrad_4b17a5 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAcademicRecordFactsAggregatedSessionGradePo_c23df4 --
CREATE TABLE tpdm.CourseStudentAcademicRecordFactsAggregatedSessionGradePo_c23df4 (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    GradePointAverage DECIMAL(18, 4) NOT NULL,
    GradePointNCount INT NULL,
    GradePointStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentAcademicRecordFactsAggregatedSessionG_c23df4_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentAcademicRecordFactsAggregatedSessionGradePo_c23df4 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAcademicRecordFactsStudentsEnrolled --
CREATE TABLE tpdm.CourseStudentAcademicRecordFactsStudentsEnrolled (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentAcademicRecordFactsStudentsEnrolled_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentAcademicRecordFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAssessmentFacts --
CREATE TABLE tpdm.CourseStudentAssessmentFacts (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    AssessmentTitle VARCHAR(100) NULL,
    AssessmentCategoryDescriptorId INT NULL,
    AcademicSubjectDescriptorId INT NULL,
    GradeLevelDescriptorId INT NULL,
    AdministrationDate DATE NULL,
    TermDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CourseStudentAssessmentFacts_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
); 
ALTER TABLE tpdm.CourseStudentAssessmentFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.CourseStudentAssessmentFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.CourseStudentAssessmentFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel --
CREATE TABLE tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    PerformanceLevelDescriptorId INT NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    PerformanceLevelMetNumber INT NULL,
    PerformanceLevelMetPercentage DECIMAL(5, 4) NULL,
    PerformanceLevelTypeNumber INT NULL,
    PerformanceLevelTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentAssessmentFactsAggregatedPerformanceLevel_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, PerformanceLevelDescriptorId, TakenSchoolYear)
); 
ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAssessmentFactsAggregatedScoreResult --
CREATE TABLE tpdm.CourseStudentAssessmentFactsAggregatedScoreResult (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    AssessmentReportingMethodDescriptorId INT NOT NULL,
    AverageScoreResultDatatypeTypeDescriptorId INT NOT NULL,
    AverageScoreResult VARCHAR(35) NOT NULL,
    ScoreNCount INT NULL,
    ScoreStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentAssessmentFactsAggregatedScoreResult_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
); 
ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedScoreResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentAssessmentFactsStudentsEnrolled --
CREATE TABLE tpdm.CourseStudentAssessmentFactsStudentsEnrolled (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentAssessmentFactsStudentsEnrolled_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
); 
ALTER TABLE tpdm.CourseStudentAssessmentFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFacts --
CREATE TABLE tpdm.CourseStudentFacts (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CourseStudentFacts_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.CourseStudentFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.CourseStudentFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedByDisability --
CREATE TABLE tpdm.CourseStudentFactsAggregatedByDisability (
    CourseCode VARCHAR(60) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TypeNumber INT NULL,
    Percentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedByDisability_PK PRIMARY KEY (CourseCode, DisabilityDescriptorId, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedByDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled --
CREATE TABLE tpdm.CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    StudentsDisabledNumber INT NULL,
    StudentsDisabledPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedELLEnrollment --
CREATE TABLE tpdm.CourseStudentFactsAggregatedELLEnrollment (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    ELLEnrollmentNumber INT NULL,
    ELLEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedELLEnrollment_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedELLEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedESLEnrollment --
CREATE TABLE tpdm.CourseStudentFactsAggregatedESLEnrollment (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    ESLEnrollmentNumber INT NULL,
    ESLEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedESLEnrollment_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedESLEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedGender --
CREATE TABLE tpdm.CourseStudentFactsAggregatedGender (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    GenderDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    GenderTypeNumber INT NULL,
    GenderTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedGender_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, GenderDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedGender ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity --
CREATE TABLE tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    HispanicLatinoEthnicity BOOLEAN NOT NULL,
    ValueTypeDescriptorId INT NULL,
    HispanicLatinoEthnicityNumber INT NULL,
    HispanicLatinoEthnicityPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedHispanicLatinoEthnicity_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, HispanicLatinoEthnicity)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedLanguage --
CREATE TABLE tpdm.CourseStudentFactsAggregatedLanguage (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    LanguageTypeNumber INT NULL,
    LanguageTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedLanguage_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, LanguageDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedRace --
CREATE TABLE tpdm.CourseStudentFactsAggregatedRace (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    RaceDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    RaceTypeNumber INT NULL,
    RaceTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedRace_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, RaceDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService --
CREATE TABLE tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolFoodServiceProgramServiceDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TypeNumber INT NULL,
    TypePercentage INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedSchoolFoodServiceProgramService_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolFoodServiceProgramServiceDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedSection504Enrollment --
CREATE TABLE tpdm.CourseStudentFactsAggregatedSection504Enrollment (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    Number504Enrolled INT NULL,
    Percentage504Enrolled DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedSection504Enrollment_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedSection504Enrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedSex --
CREATE TABLE tpdm.CourseStudentFactsAggregatedSex (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SexDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SexTypeNumber INT NULL,
    SexTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedSex_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SexDescriptorId)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedSex ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedSPED --
CREATE TABLE tpdm.CourseStudentFactsAggregatedSPED (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SPEDEnrollmentNumber INT NULL,
    SPEDEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedSPED_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedSPED ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsAggregatedTitleIEnrollment --
CREATE TABLE tpdm.CourseStudentFactsAggregatedTitleIEnrollment (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TitleIEnrollmentNumber INT NULL,
    TitleIEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsAggregatedTitleIEnrollment_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsAggregatedTitleIEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CourseStudentFactsStudentsEnrolled --
CREATE TABLE tpdm.CourseStudentFactsStudentsEnrolled (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseStudentFactsStudentsEnrolled_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.CourseStudentFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CredentialBoardCertification --
CREATE TABLE tpdm.CredentialBoardCertification (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    BoardCertification BOOLEAN NULL,
    BoardCertificationDate DATE NULL,
    BoardCertificationTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialBoardCertification_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.CredentialBoardCertification ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CredentialCertificationExam --
CREATE TABLE tpdm.CredentialCertificationExam (
    CertificationExamTitle VARCHAR(60) NOT NULL,
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    CertificationExamTypeDescriptorId INT NULL,
    CertificationExamStatusDescriptorId INT NULL,
    CertificationExamDate DATE NOT NULL,
    AttemptNumber INT NULL,
    CertificationExamOverallScore INT NULL,
    CertificationExamPassFail BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialCertificationExam_PK PRIMARY KEY (CertificationExamTitle, CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.CredentialCertificationExam ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CredentialExtension --
CREATE TABLE tpdm.CredentialExtension (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    CurrentCredential BOOLEAN NULL,
    RevocationDate DATE NULL,
    RevocationReason VARCHAR(40) NULL,
    SuspensionDate DATE NULL,
    SuspensionReason VARCHAR(40) NULL,
    ValueTypeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialExtension_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.CredentialExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CredentialRecommendation --
CREATE TABLE tpdm.CredentialRecommendation (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    CredentialFieldDescriptorId INT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    TeachingCredentialDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialRecommendation_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.CredentialRecommendation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.CredentialRecommendingInstitution --
CREATE TABLE tpdm.CredentialRecommendingInstitution (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    RecommendingInstutionName VARCHAR(75) NOT NULL,
    RecommendingDate DATE NULL,
    RecommendingInstitutionCountryDescriptorId INT NULL,
    RecommendingInstitutionStateAbbreviationDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialRecommendingInstitution_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.CredentialRecommendingInstitution ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationCourseTranscriptFacts --
CREATE TABLE tpdm.EducationOrganizationCourseTranscriptFacts (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CourseTitle VARCHAR(60) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EducationOrganizationCourseTranscriptFacts_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationCourseTranscriptFactsAggregatedFina_c260fb --
CREATE TABLE tpdm.EducationOrganizationCourseTranscriptFactsAggregatedFina_c260fb (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    FinalLetterGrade VARCHAR(20) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    LetterGradeTypeNumber INT NULL,
    LetterGradeTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationCourseTranscriptFactsAggregat_c260fb_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, FinalLetterGrade, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsAggregatedFina_c260fb ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationCourseTranscriptFactsAggregatedNume_80e712 --
CREATE TABLE tpdm.EducationOrganizationCourseTranscriptFactsAggregatedNume_80e712 (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AverageFinalNumericGradeEarned DECIMAL(9, 2) NOT NULL,
    NumericGradeNCount INT NULL,
    NumericGradeStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationCourseTranscriptFactsAggregat_80e712_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsAggregatedNume_80e712 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationCourseTranscriptFactsStudentsEnrolled --
CREATE TABLE tpdm.EducationOrganizationCourseTranscriptFactsStudentsEnrolled (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationCourseTranscriptFactsStudentsEnrolled_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationFacts --
CREATE TABLE tpdm.EducationOrganizationFacts (
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    NumberAdministratorsEmployed INT NULL,
    NumberStudentsEnrolled INT NULL,
    NumberTeachersEmployed INT NULL,
    PercentStudentsFreeReducedLunch DECIMAL(5, 4) NULL,
    PercentStudentsLimitedEnglishProficiency DECIMAL(5, 4) NULL,
    PercentStudentsSpecialEducation DECIMAL(5, 4) NULL,
    HiringRate DECIMAL(5, 4) NULL,
    RetentionRate DECIMAL(5, 4) NULL,
    RetirementRate DECIMAL(5, 4) NULL,
    AverageYearsInDistrictEmployed DECIMAL(5, 2) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EducationOrganizationFacts_PK PRIMARY KEY (EducationOrganizationId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EducationOrganizationFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EducationOrganizationFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationFactsAggregatedSalary --
CREATE TABLE tpdm.EducationOrganizationFactsAggregatedSalary (
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    AverageSalary MONEY NOT NULL,
    CountOfSalariesAveraged INT NULL,
    StandardDeviation INT NULL,
    SalaryMinRange INT NULL,
    SalaryMaxRange INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationFactsAggregatedSalary_PK PRIMARY KEY (EducationOrganizationId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationFactsAggregatedSalary ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationFactsVacancies --
CREATE TABLE tpdm.EducationOrganizationFactsVacancies (
    AcademicSubjectDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberOfVacancies INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationFactsVacancies_PK PRIMARY KEY (AcademicSubjectDescriptorId, EducationOrganizationId, FactsAsOfDate, SchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationFactsVacancies ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationFactsVacanciesGradeLevel --
CREATE TABLE tpdm.EducationOrganizationFactsVacanciesGradeLevel (
    AcademicSubjectDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationFactsVacanciesGradeLevel_PK PRIMARY KEY (AcademicSubjectDescriptorId, EducationOrganizationId, FactsAsOfDate, GradeLevelDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationFactsVacanciesGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationNetworkExtension --
CREATE TABLE tpdm.EducationOrganizationNetworkExtension (
    EducationOrganizationNetworkId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationNetworkExtension_PK PRIMARY KEY (EducationOrganizationNetworkId)
); 
ALTER TABLE tpdm.EducationOrganizationNetworkExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAcademicRecordFacts --
CREATE TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AggregatedGPAMax DECIMAL(18, 4) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EducationOrganizationStudentAcademicRecordFacts_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_8992b4 --
CREATE TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_8992b4 (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    GradePointAverage DECIMAL(18, 4) NOT NULL,
    GradePointNCount INT NULL,
    GradePointStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentAcademicRecordFactsAgg_8992b4_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_8992b4 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_cb9987 --
CREATE TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_cb9987 (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    GradePointAverage DECIMAL(18, 4) NOT NULL,
    GradePointNCount INT NULL,
    GradePointStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentAcademicRecordFactsAgg_cb9987_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_cb9987 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled --
CREATE TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentAcademicRecordFactsStu_22edfd_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAssessmentFacts --
CREATE TABLE tpdm.EducationOrganizationStudentAssessmentFacts (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    AssessmentTitle VARCHAR(100) NULL,
    AssessmentCategoryDescriptorId INT NULL,
    AcademicSubjectDescriptorId INT NULL,
    GradeLevelDescriptorId INT NULL,
    AdministrationDate DATE NULL,
    TermDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EducationOrganizationStudentAssessmentFacts_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce --
CREATE TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    PerformanceLevelDescriptorId INT NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    PerformanceLevelMetNumber INT NULL,
    PerformanceLevelMetPercentage DECIMAL(5, 4) NULL,
    PerformanceLevelTypeNumber INT NULL,
    PerformanceLevelTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentAssessmentFactsAggrega_18e7ce_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, PerformanceLevelDescriptorId, TakenSchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 --
CREATE TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    AssessmentReportingMethodDescriptorId INT NOT NULL,
    AverageScoreResultDatatypeTypeDescriptorId INT NOT NULL,
    AverageScoreResult VARCHAR(35) NOT NULL,
    ScoreNCount INT NULL,
    ScoreStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentAssessmentFactsAggrega_37bcc2_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentAssessmentFactsStudentsEnrolled --
CREATE TABLE tpdm.EducationOrganizationStudentAssessmentFactsStudentsEnrolled (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentAssessmentFactsStudentsEnrolled_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
); 
ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFacts --
CREATE TABLE tpdm.EducationOrganizationStudentFacts (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EducationOrganizationStudentFacts_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EducationOrganizationStudentFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EducationOrganizationStudentFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedByDisability --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedByDisability (
    DisabilityDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TypeNumber INT NULL,
    Percentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedByDisability_PK PRIMARY KEY (DisabilityDescriptorId, EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedByDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedDisabilityTot_2e2e1e --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedDisabilityTot_2e2e1e (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    StudentsDisabledNumber INT NULL,
    StudentsDisabledPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedDisabil_2e2e1e_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedDisabilityTot_2e2e1e ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedELLEnrollment --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedELLEnrollment (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    ELLEnrollmentNumber INT NULL,
    ELLEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedELLEnrollment_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedELLEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedESLEnrollment --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedESLEnrollment (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    ESLEnrollmentNumber INT NULL,
    ESLEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedESLEnrollment_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedESLEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedGender --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedGender (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    GenderDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    GenderTypeNumber INT NULL,
    GenderTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedGender_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, GenderDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedGender ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    HispanicLatinoEthnicity BOOLEAN NOT NULL,
    ValueTypeDescriptorId INT NULL,
    HispanicLatinoEthnicityNumber INT NULL,
    HispanicLatinoEthnicityPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedHispani_4ee82a_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, HispanicLatinoEthnicity)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedLanguage --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedLanguage (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    LanguageTypeNumber INT NULL,
    LanguageTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedLanguage_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, LanguageDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedRace --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedRace (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    RaceDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    RaceTypeNumber INT NULL,
    RaceTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedRace_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, RaceDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolFoodServiceProgramServiceDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TypeNumber INT NULL,
    TypePercentage INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedSchoolF_b449c2_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolFoodServiceProgramServiceDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedSection504Enrollment --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedSection504Enrollment (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    Number504Enrolled INT NULL,
    Percentage504Enrolled DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedSection_23244f_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSection504Enrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedSex --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedSex (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SexDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SexTypeNumber INT NULL,
    SexTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedSex_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SexDescriptorId)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSex ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedSPED --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedSPED (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SPEDEnrollmentNumber INT NULL,
    SPEDEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedSPED_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSPED ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsAggregatedTitleIEnrollment --
CREATE TABLE tpdm.EducationOrganizationStudentFactsAggregatedTitleIEnrollment (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TitleIEnrollmentNumber INT NULL,
    TitleIEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsAggregatedTitleIEnrollment_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedTitleIEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationOrganizationStudentFactsStudentsEnrolled --
CREATE TABLE tpdm.EducationOrganizationStudentFactsStudentsEnrolled (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationOrganizationStudentFactsStudentsEnrolled_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate)
); 
ALTER TABLE tpdm.EducationOrganizationStudentFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EducationServiceCenterExtension --
CREATE TABLE tpdm.EducationServiceCenterExtension (
    EducationServiceCenterId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducationServiceCenterExtension_PK PRIMARY KEY (EducationServiceCenterId)
); 
ALTER TABLE tpdm.EducationServiceCenterExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.EmploymentEvent --
CREATE TABLE tpdm.EmploymentEvent (
    EducationOrganizationId INT NOT NULL,
    EmploymentEventTypeDescriptorId INT NOT NULL,
    RequisitionNumber VARCHAR(20) NOT NULL,
    HireDate DATE NULL,
    EarlyHire BOOLEAN NULL,
    InternalExternalHireDescriptorId INT NULL,
    MutualConsent BOOLEAN NULL,
    RestrictedChoice BOOLEAN NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EmploymentEvent_PK PRIMARY KEY (EducationOrganizationId, EmploymentEventTypeDescriptorId, RequisitionNumber)
); 
ALTER TABLE tpdm.EmploymentEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EmploymentEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EmploymentEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EmploymentEventTypeDescriptor --
CREATE TABLE tpdm.EmploymentEventTypeDescriptor (
    EmploymentEventTypeDescriptorId INT NOT NULL,
    CONSTRAINT EmploymentEventTypeDescriptor_PK PRIMARY KEY (EmploymentEventTypeDescriptorId)
); 

-- Table tpdm.EmploymentSeparationEvent --
CREATE TABLE tpdm.EmploymentSeparationEvent (
    EducationOrganizationId INT NOT NULL,
    EmploymentSeparationDate DATE NOT NULL,
    RequisitionNumber VARCHAR(20) NOT NULL,
    EmploymentSeparationTypeDescriptorId INT NOT NULL,
    EmploymentSeparationEnteredDate DATE NULL,
    EmploymentSeparationReasonDescriptorId INT NULL,
    RemainingInDistrict BOOLEAN NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EmploymentSeparationEvent_PK PRIMARY KEY (EducationOrganizationId, EmploymentSeparationDate, RequisitionNumber)
); 
ALTER TABLE tpdm.EmploymentSeparationEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.EmploymentSeparationEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EmploymentSeparationEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.EmploymentSeparationReasonDescriptor --
CREATE TABLE tpdm.EmploymentSeparationReasonDescriptor (
    EmploymentSeparationReasonDescriptorId INT NOT NULL,
    CONSTRAINT EmploymentSeparationReasonDescriptor_PK PRIMARY KEY (EmploymentSeparationReasonDescriptorId)
); 

-- Table tpdm.EmploymentSeparationTypeDescriptor --
CREATE TABLE tpdm.EmploymentSeparationTypeDescriptor (
    EmploymentSeparationTypeDescriptorId INT NOT NULL,
    CONSTRAINT EmploymentSeparationTypeDescriptor_PK PRIMARY KEY (EmploymentSeparationTypeDescriptorId)
); 

-- Table tpdm.EnglishLanguageExamDescriptor --
CREATE TABLE tpdm.EnglishLanguageExamDescriptor (
    EnglishLanguageExamDescriptorId INT NOT NULL,
    CONSTRAINT EnglishLanguageExamDescriptor_PK PRIMARY KEY (EnglishLanguageExamDescriptorId)
); 

-- Table tpdm.FederalLocaleCodeDescriptor --
CREATE TABLE tpdm.FederalLocaleCodeDescriptor (
    FederalLocaleCodeDescriptorId INT NOT NULL,
    CONSTRAINT FederalLocaleCodeDescriptor_PK PRIMARY KEY (FederalLocaleCodeDescriptorId)
); 

-- Table tpdm.FieldworkTypeDescriptor --
CREATE TABLE tpdm.FieldworkTypeDescriptor (
    FieldworkTypeDescriptorId INT NOT NULL,
    CONSTRAINT FieldworkTypeDescriptor_PK PRIMARY KEY (FieldworkTypeDescriptorId)
); 

-- Table tpdm.FundingSourceDescriptor --
CREATE TABLE tpdm.FundingSourceDescriptor (
    FundingSourceDescriptorId INT NOT NULL,
    CONSTRAINT FundingSourceDescriptor_PK PRIMARY KEY (FundingSourceDescriptorId)
); 

-- Table tpdm.GenderDescriptor --
CREATE TABLE tpdm.GenderDescriptor (
    GenderDescriptorId INT NOT NULL,
    CONSTRAINT GenderDescriptor_PK PRIMARY KEY (GenderDescriptorId)
); 

-- Table tpdm.GradebookEntryExtension --
CREATE TABLE tpdm.GradebookEntryExtension (
    DateAssigned DATE NOT NULL,
    GradebookEntryTitle VARCHAR(60) NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ProgramGatewayDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT GradebookEntryExtension_PK PRIMARY KEY (DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.GradebookEntryExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.HireStatusDescriptor --
CREATE TABLE tpdm.HireStatusDescriptor (
    HireStatusDescriptorId INT NOT NULL,
    CONSTRAINT HireStatusDescriptor_PK PRIMARY KEY (HireStatusDescriptorId)
); 

-- Table tpdm.HiringSourceDescriptor --
CREATE TABLE tpdm.HiringSourceDescriptor (
    HiringSourceDescriptorId INT NOT NULL,
    CONSTRAINT HiringSourceDescriptor_PK PRIMARY KEY (HiringSourceDescriptorId)
); 

-- Table tpdm.InternalExternalHireDescriptor --
CREATE TABLE tpdm.InternalExternalHireDescriptor (
    InternalExternalHireDescriptorId INT NOT NULL,
    CONSTRAINT InternalExternalHireDescriptor_PK PRIMARY KEY (InternalExternalHireDescriptorId)
); 

-- Table tpdm.LevelOfDegreeAwardedDescriptor --
CREATE TABLE tpdm.LevelOfDegreeAwardedDescriptor (
    LevelOfDegreeAwardedDescriptorId INT NOT NULL,
    CONSTRAINT LevelOfDegreeAwardedDescriptor_PK PRIMARY KEY (LevelOfDegreeAwardedDescriptorId)
); 

-- Table tpdm.LevelTypeDescriptor --
CREATE TABLE tpdm.LevelTypeDescriptor (
    LevelTypeDescriptorId INT NOT NULL,
    CONSTRAINT LevelTypeDescriptor_PK PRIMARY KEY (LevelTypeDescriptorId)
); 

-- Table tpdm.LocalEducationAgencyExtension --
CREATE TABLE tpdm.LocalEducationAgencyExtension (
    LocalEducationAgencyId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT LocalEducationAgencyExtension_PK PRIMARY KEY (LocalEducationAgencyId)
); 
ALTER TABLE tpdm.LocalEducationAgencyExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.OpenStaffPositionEvent --
CREATE TABLE tpdm.OpenStaffPositionEvent (
    EducationOrganizationId INT NOT NULL,
    EventDate DATE NOT NULL,
    OpenStaffPositionEventTypeDescriptorId INT NOT NULL,
    RequisitionNumber VARCHAR(20) NOT NULL,
    OpenStaffPositionEventStatusDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT OpenStaffPositionEvent_PK PRIMARY KEY (EducationOrganizationId, EventDate, OpenStaffPositionEventTypeDescriptorId, RequisitionNumber)
); 
ALTER TABLE tpdm.OpenStaffPositionEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.OpenStaffPositionEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.OpenStaffPositionEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.OpenStaffPositionEventStatusDescriptor --
CREATE TABLE tpdm.OpenStaffPositionEventStatusDescriptor (
    OpenStaffPositionEventStatusDescriptorId INT NOT NULL,
    CONSTRAINT OpenStaffPositionEventStatusDescriptor_PK PRIMARY KEY (OpenStaffPositionEventStatusDescriptorId)
); 

-- Table tpdm.OpenStaffPositionEventTypeDescriptor --
CREATE TABLE tpdm.OpenStaffPositionEventTypeDescriptor (
    OpenStaffPositionEventTypeDescriptorId INT NOT NULL,
    CONSTRAINT OpenStaffPositionEventTypeDescriptor_PK PRIMARY KEY (OpenStaffPositionEventTypeDescriptorId)
); 

-- Table tpdm.OpenStaffPositionExtension --
CREATE TABLE tpdm.OpenStaffPositionExtension (
    EducationOrganizationId INT NOT NULL,
    RequisitionNumber VARCHAR(20) NOT NULL,
    SchoolYear SMALLINT NULL,
    FullTimeEquivalency DECIMAL(3, 2) NULL,
    OpenStaffPositionReasonDescriptorId INT NULL,
    IsActive BOOLEAN NULL,
    MaxSalary DECIMAL(9, 2) NULL,
    MinSalary DECIMAL(9, 2) NULL,
    FundingSourceDescriptorId INT NULL,
    HighNeedAcademicSubject BOOLEAN NULL,
    PositionControlNumber VARCHAR(20) NULL,
    TermDescriptorId INT NULL,
    TotalBudgeted DECIMAL(9, 2) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT OpenStaffPositionExtension_PK PRIMARY KEY (EducationOrganizationId, RequisitionNumber)
); 
ALTER TABLE tpdm.OpenStaffPositionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.OpenStaffPositionReasonDescriptor --
CREATE TABLE tpdm.OpenStaffPositionReasonDescriptor (
    OpenStaffPositionReasonDescriptorId INT NOT NULL,
    CONSTRAINT OpenStaffPositionReasonDescriptor_PK PRIMARY KEY (OpenStaffPositionReasonDescriptorId)
); 

-- Table tpdm.PerformanceMeasure --
CREATE TABLE tpdm.PerformanceMeasure (
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    PerformanceMeasureTypeDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AcademicSubjectDescriptorId INT NULL,
    ScheduleDateOfPerformanceMeasure DATE NULL,
    ActualDateOfPerformanceMeasure DATE NOT NULL,
    TimeOfPerformanceMeasure TIME NULL,
    DurationOfPerformanceMeasure INT NULL,
    Announced BOOLEAN NULL,
    CoteachingStyleObservedDescriptorId INT NULL,
    Comments VARCHAR(1024) NULL,
    PerformanceMeasureInstanceDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PerformanceMeasure_PK PRIMARY KEY (PerformanceMeasureIdentifier)
); 
ALTER TABLE tpdm.PerformanceMeasure ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.PerformanceMeasure ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.PerformanceMeasure ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureCourseAssociation --
CREATE TABLE tpdm.PerformanceMeasureCourseAssociation (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PerformanceMeasureCourseAssociation_PK PRIMARY KEY (CourseCode, EducationOrganizationId, PerformanceMeasureIdentifier)
); 
ALTER TABLE tpdm.PerformanceMeasureCourseAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.PerformanceMeasureCourseAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.PerformanceMeasureCourseAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureFacts --
CREATE TABLE tpdm.PerformanceMeasureFacts (
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    PerformanceMeasureTypeDescriptorId INT NOT NULL,
    AcademicSubjectDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PerformanceMeasureFacts_PK PRIMARY KEY (EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.PerformanceMeasureFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.PerformanceMeasureFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.PerformanceMeasureFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureFactsGradeLevel --
CREATE TABLE tpdm.PerformanceMeasureFactsGradeLevel (
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasureFactsGradeLevel_PK PRIMARY KEY (EducationOrganizationId, FactsAsOfDate, GradeLevelDescriptorId, RubricTitle, RubricTypeDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.PerformanceMeasureFactsGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureGradeLevel --
CREATE TABLE tpdm.PerformanceMeasureGradeLevel (
    GradeLevelDescriptorId INT NOT NULL,
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasureGradeLevel_PK PRIMARY KEY (GradeLevelDescriptorId, PerformanceMeasureIdentifier)
); 
ALTER TABLE tpdm.PerformanceMeasureGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureInstanceDescriptor --
CREATE TABLE tpdm.PerformanceMeasureInstanceDescriptor (
    PerformanceMeasureInstanceDescriptorId INT NOT NULL,
    CONSTRAINT PerformanceMeasureInstanceDescriptor_PK PRIMARY KEY (PerformanceMeasureInstanceDescriptorId)
); 

-- Table tpdm.PerformanceMeasurePersonBeingReviewed --
CREATE TABLE tpdm.PerformanceMeasurePersonBeingReviewed (
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    ProspectIdentifier VARCHAR(32) NULL,
    EducationOrganizationId INT NULL,
    StaffUSI INT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasurePersonBeingReviewed_PK PRIMARY KEY (PerformanceMeasureIdentifier)
); 
ALTER TABLE tpdm.PerformanceMeasurePersonBeingReviewed ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureProgramGateway --
CREATE TABLE tpdm.PerformanceMeasureProgramGateway (
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    ProgramGatewayDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasureProgramGateway_PK PRIMARY KEY (PerformanceMeasureIdentifier, ProgramGatewayDescriptorId)
); 
ALTER TABLE tpdm.PerformanceMeasureProgramGateway ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureReviewer --
CREATE TABLE tpdm.PerformanceMeasureReviewer (
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasureReviewer_PK PRIMARY KEY (FirstName, LastSurname, PerformanceMeasureIdentifier)
); 
ALTER TABLE tpdm.PerformanceMeasureReviewer ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureReviewerReceivedTraining --
CREATE TABLE tpdm.PerformanceMeasureReviewerReceivedTraining (
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    ReceivedTrainingDate DATE NULL,
    InterRaterReliabilityScore INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasureReviewerReceivedTraining_PK PRIMARY KEY (FirstName, LastSurname, PerformanceMeasureIdentifier)
); 
ALTER TABLE tpdm.PerformanceMeasureReviewerReceivedTraining ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureRubric --
CREATE TABLE tpdm.PerformanceMeasureRubric (
    EducationOrganizationId INT NOT NULL,
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceMeasureRubric_PK PRIMARY KEY (EducationOrganizationId, PerformanceMeasureIdentifier, RubricTitle, RubricTypeDescriptorId)
); 
ALTER TABLE tpdm.PerformanceMeasureRubric ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PerformanceMeasureTypeDescriptor --
CREATE TABLE tpdm.PerformanceMeasureTypeDescriptor (
    PerformanceMeasureTypeDescriptorId INT NOT NULL,
    CONSTRAINT PerformanceMeasureTypeDescriptor_PK PRIMARY KEY (PerformanceMeasureTypeDescriptorId)
); 

-- Table tpdm.PostSecondaryInstitutionExtension --
CREATE TABLE tpdm.PostSecondaryInstitutionExtension (
    PostSecondaryInstitutionId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PostSecondaryInstitutionExtension_PK PRIMARY KEY (PostSecondaryInstitutionId)
); 
ALTER TABLE tpdm.PostSecondaryInstitutionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.PreviousCareerDescriptor --
CREATE TABLE tpdm.PreviousCareerDescriptor (
    PreviousCareerDescriptorId INT NOT NULL,
    CONSTRAINT PreviousCareerDescriptor_PK PRIMARY KEY (PreviousCareerDescriptorId)
); 

-- Table tpdm.ProfessionalDevelopmentEvent --
CREATE TABLE tpdm.ProfessionalDevelopmentEvent (
    ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
    ProfessionalDevelopmentOfferedByDescriptorId INT NOT NULL,
    TotalHours INT NULL,
    Required BOOLEAN NULL,
    MultipleSession BOOLEAN NULL,
    ProfessionalDevelopmentReason VARCHAR(60) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ProfessionalDevelopmentEvent_PK PRIMARY KEY (ProfessionalDevelopmentTitle)
); 
ALTER TABLE tpdm.ProfessionalDevelopmentEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.ProfessionalDevelopmentEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.ProfessionalDevelopmentEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ProfessionalDevelopmentOfferedByDescriptor --
CREATE TABLE tpdm.ProfessionalDevelopmentOfferedByDescriptor (
    ProfessionalDevelopmentOfferedByDescriptorId INT NOT NULL,
    CONSTRAINT ProfessionalDevelopmentOfferedByDescriptor_PK PRIMARY KEY (ProfessionalDevelopmentOfferedByDescriptorId)
); 

-- Table tpdm.ProgramGatewayDescriptor --
CREATE TABLE tpdm.ProgramGatewayDescriptor (
    ProgramGatewayDescriptorId INT NOT NULL,
    CONSTRAINT ProgramGatewayDescriptor_PK PRIMARY KEY (ProgramGatewayDescriptorId)
); 

-- Table tpdm.Prospect --
CREATE TABLE tpdm.Prospect (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    PersonalTitlePrefix VARCHAR(30) NULL,
    FirstName VARCHAR(75) NOT NULL,
    MiddleName VARCHAR(75) NULL,
    LastSurname VARCHAR(75) NOT NULL,
    GenerationCodeSuffix VARCHAR(10) NULL,
    MaidenName VARCHAR(75) NULL,
    ElectronicMailAddress VARCHAR(128) NOT NULL,
    Applied BOOLEAN NULL,
    HispanicLatinoEthnicity BOOLEAN NULL,
    Met BOOLEAN NULL,
    Notes VARCHAR(255) NULL,
    PreScreeningRating INT NULL,
    Referral BOOLEAN NULL,
    ReferredBy VARCHAR(50) NULL,
    SexDescriptorId INT NULL,
    SocialMediaUserName VARCHAR(50) NULL,
    SocialMediaNetworkName VARCHAR(50) NULL,
    GenderDescriptorId INT NULL,
    EconomicDisadvantaged BOOLEAN NULL,
    FirstGenerationStudent BOOLEAN NULL,
    ProspectTypeDescriptorId INT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Prospect_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.Prospect ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.Prospect ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.Prospect ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectAid --
CREATE TABLE tpdm.ProspectAid (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NULL,
    AidConditionDescription VARCHAR(1024) NULL,
    AidTypeDescriptorId INT NOT NULL,
    AidAmount MONEY NULL,
    PellGrantRecipient BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectAid_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectAid ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectCredential --
CREATE TABLE tpdm.ProspectCredential (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectCredential_PK PRIMARY KEY (CredentialIdentifier, EducationOrganizationId, ProspectIdentifier, StateOfIssueStateAbbreviationDescriptorId)
); 
ALTER TABLE tpdm.ProspectCredential ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectCurrentPosition --
CREATE TABLE tpdm.ProspectCurrentPosition (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    NameOfInstitution VARCHAR(75) NOT NULL,
    Location VARCHAR(75) NOT NULL,
    PositionTitle VARCHAR(100) NOT NULL,
    AcademicSubjectDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectCurrentPosition_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectCurrentPosition ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectCurrentPositionGradeLevel --
CREATE TABLE tpdm.ProspectCurrentPositionGradeLevel (
    EducationOrganizationId INT NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectCurrentPositionGradeLevel_PK PRIMARY KEY (EducationOrganizationId, GradeLevelDescriptorId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectCurrentPositionGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectDisability --
CREATE TABLE tpdm.ProspectDisability (
    DisabilityDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    DisabilityDiagnosis VARCHAR(80) NULL,
    OrderOfDisability INT NULL,
    DisabilityDeterminationSourceTypeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectDisability_PK PRIMARY KEY (DisabilityDescriptorId, EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectDisabilityDesignation --
CREATE TABLE tpdm.ProspectDisabilityDesignation (
    DisabilityDescriptorId INT NOT NULL,
    DisabilityDesignationDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectDisabilityDesignation_PK PRIMARY KEY (DisabilityDescriptorId, DisabilityDesignationDescriptorId, EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectDisabilityDesignation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectPersonalIdentificationDocument --
CREATE TABLE tpdm.ProspectPersonalIdentificationDocument (
    EducationOrganizationId INT NOT NULL,
    IdentificationDocumentUseDescriptorId INT NOT NULL,
    PersonalInformationVerificationDescriptorId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    DocumentTitle VARCHAR(60) NULL,
    DocumentExpirationDate DATE NULL,
    IssuerDocumentIdentificationCode VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerCountryDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectPersonalIdentificationDocument_PK PRIMARY KEY (EducationOrganizationId, IdentificationDocumentUseDescriptorId, PersonalInformationVerificationDescriptorId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectPersonalIdentificationDocument ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectProfessionalDevelopmentEventAttendance --
CREATE TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance (
    AttendanceDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    AttendanceEventCategoryDescriptorId INT NOT NULL,
    AttendanceEventReason VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ProspectProfessionalDevelopmentEventAttendance_PK PRIMARY KEY (AttendanceDate, EducationOrganizationId, ProfessionalDevelopmentTitle, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectQualifications --
CREATE TABLE tpdm.ProspectQualifications (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    Eligible BOOLEAN NOT NULL,
    CapacityToServe BOOLEAN NULL,
    YearsOfServiceCurrentPlacement DECIMAL(5, 2) NULL,
    YearsOfServiceTotal DECIMAL(5, 2) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectQualifications_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectQualifications ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectRace --
CREATE TABLE tpdm.ProspectRace (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    RaceDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectRace_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier, RaceDescriptorId)
); 
ALTER TABLE tpdm.ProspectRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectRecruitmentEvent --
CREATE TABLE tpdm.ProspectRecruitmentEvent (
    EducationOrganizationId INT NOT NULL,
    EventDate DATE NOT NULL,
    EventTitle VARCHAR(50) NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectRecruitmentEvent_PK PRIMARY KEY (EducationOrganizationId, EventDate, EventTitle, ProspectIdentifier)
); 
ALTER TABLE tpdm.ProspectRecruitmentEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectTelephone --
CREATE TABLE tpdm.ProspectTelephone (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    TelephoneNumber VARCHAR(24) NOT NULL,
    TelephoneNumberTypeDescriptorId INT NOT NULL,
    OrderOfPriority INT NULL,
    TextMessageCapabilityIndicator BOOLEAN NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectTelephone_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier, TelephoneNumber, TelephoneNumberTypeDescriptorId)
); 
ALTER TABLE tpdm.ProspectTelephone ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectTouchpoint --
CREATE TABLE tpdm.ProspectTouchpoint (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    TouchpointContent VARCHAR(255) NOT NULL,
    TouchpointDate DATE NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProspectTouchpoint_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier, TouchpointContent, TouchpointDate)
); 
ALTER TABLE tpdm.ProspectTouchpoint ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ProspectTypeDescriptor --
CREATE TABLE tpdm.ProspectTypeDescriptor (
    ProspectTypeDescriptorId INT NOT NULL,
    CONSTRAINT ProspectTypeDescriptor_PK PRIMARY KEY (ProspectTypeDescriptorId)
); 

-- Table tpdm.RecruitmentEvent --
CREATE TABLE tpdm.RecruitmentEvent (
    EventDate DATE NOT NULL,
    EventTitle VARCHAR(50) NOT NULL,
    EventDescription VARCHAR(255) NULL,
    RecruitmentEventTypeDescriptorId INT NOT NULL,
    EventLocation VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT RecruitmentEvent_PK PRIMARY KEY (EventDate, EventTitle)
); 
ALTER TABLE tpdm.RecruitmentEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.RecruitmentEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.RecruitmentEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.RecruitmentEventTypeDescriptor --
CREATE TABLE tpdm.RecruitmentEventTypeDescriptor (
    RecruitmentEventTypeDescriptorId INT NOT NULL,
    CONSTRAINT RecruitmentEventTypeDescriptor_PK PRIMARY KEY (RecruitmentEventTypeDescriptorId)
); 

-- Table tpdm.Rubric --
CREATE TABLE tpdm.Rubric (
    EducationOrganizationId INT NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    RubricDescription VARCHAR(255) NULL,
    InterRaterReliabilityScore INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Rubric_PK PRIMARY KEY (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
); 
ALTER TABLE tpdm.Rubric ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.Rubric ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.Rubric ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricLevel --
CREATE TABLE tpdm.RubricLevel (
    EducationOrganizationId INT NOT NULL,
    RubricLevelCode VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT RubricLevel_PK PRIMARY KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
); 
ALTER TABLE tpdm.RubricLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.RubricLevel ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.RubricLevel ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricLevelInformation --
CREATE TABLE tpdm.RubricLevelInformation (
    EducationOrganizationId INT NOT NULL,
    RubricLevelCode VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    LevelTypeDescriptorId INT NOT NULL,
    LevelTitle VARCHAR(255) NOT NULL,
    LevelDescription VARCHAR(255) NULL,
    MinimumScore VARCHAR(35) NULL,
    MaximumScore VARCHAR(35) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT RubricLevelInformation_PK PRIMARY KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
); 
ALTER TABLE tpdm.RubricLevelInformation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricLevelResponse --
CREATE TABLE tpdm.RubricLevelResponse (
    EducationOrganizationId INT NOT NULL,
    PerformanceMeasureIdentifier VARCHAR(64) NOT NULL,
    RubricLevelCode VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    NumericResponse INT NOT NULL,
    TextResponse VARCHAR(2048) NULL,
    AreaOfRefinement BOOLEAN NULL,
    AreaOfReinforcement BOOLEAN NULL,
    Comments VARCHAR(1024) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT RubricLevelResponse_PK PRIMARY KEY (EducationOrganizationId, PerformanceMeasureIdentifier, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
); 
ALTER TABLE tpdm.RubricLevelResponse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.RubricLevelResponse ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.RubricLevelResponse ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricLevelResponseFacts --
CREATE TABLE tpdm.RubricLevelResponseFacts (
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    RubricLevelCode VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT RubricLevelResponseFacts_PK PRIMARY KEY (EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.RubricLevelResponseFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.RubricLevelResponseFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.RubricLevelResponseFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricLevelResponseFactsAggregatedNumericResponse --
CREATE TABLE tpdm.RubricLevelResponseFactsAggregatedNumericResponse (
    EducationOrganizationId INT NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    RubricLevelCode VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    AverageNumericResponse DECIMAL(18, 4) NOT NULL,
    NumericResponseNCount INT NULL,
    NumericResponseStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT RubricLevelResponseFactsAggregatedNumericResponse_PK PRIMARY KEY (EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear)
); 
ALTER TABLE tpdm.RubricLevelResponseFactsAggregatedNumericResponse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricLevelTheme --
CREATE TABLE tpdm.RubricLevelTheme (
    EducationOrganizationId INT NOT NULL,
    RubricLevelCode VARCHAR(64) NOT NULL,
    RubricTitle VARCHAR(255) NOT NULL,
    RubricTypeDescriptorId INT NOT NULL,
    ThemeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT RubricLevelTheme_PK PRIMARY KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, ThemeDescriptorId)
); 
ALTER TABLE tpdm.RubricLevelTheme ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.RubricTypeDescriptor --
CREATE TABLE tpdm.RubricTypeDescriptor (
    RubricTypeDescriptorId INT NOT NULL,
    CONSTRAINT RubricTypeDescriptor_PK PRIMARY KEY (RubricTypeDescriptorId)
); 

-- Table tpdm.SalaryTypeDescriptor --
CREATE TABLE tpdm.SalaryTypeDescriptor (
    SalaryTypeDescriptorId INT NOT NULL,
    CONSTRAINT SalaryTypeDescriptor_PK PRIMARY KEY (SalaryTypeDescriptorId)
); 

-- Table tpdm.SchoolExtension --
CREATE TABLE tpdm.SchoolExtension (
    SchoolId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    SchoolStatusDescriptorId INT NULL,
    ImprovingSchool BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SchoolExtension_PK PRIMARY KEY (SchoolId)
); 
ALTER TABLE tpdm.SchoolExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SchoolStatusDescriptor --
CREATE TABLE tpdm.SchoolStatusDescriptor (
    SchoolStatusDescriptorId INT NOT NULL,
    CONSTRAINT SchoolStatusDescriptor_PK PRIMARY KEY (SchoolStatusDescriptorId)
); 

-- Table tpdm.SectionCourseTranscriptFacts --
CREATE TABLE tpdm.SectionCourseTranscriptFacts (
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    CourseTitle VARCHAR(60) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SectionCourseTranscriptFacts_PK PRIMARY KEY (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionCourseTranscriptFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.SectionCourseTranscriptFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.SectionCourseTranscriptFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned --
CREATE TABLE tpdm.SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned (
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    FinalLetterGrade VARCHAR(20) NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    LetterGradeTypeNumber INT NULL,
    LetterGradeTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned_PK PRIMARY KEY (FactAsOfDate, FactsAsOfDate, FinalLetterGrade, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionCourseTranscriptFactsAggregatedNumericGradeEarned --
CREATE TABLE tpdm.SectionCourseTranscriptFactsAggregatedNumericGradeEarned (
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    AverageFinalNumericGradeEarned DECIMAL(9, 2) NOT NULL,
    NumericGradeNCount INT NULL,
    NumericGradeStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionCourseTranscriptFactsAggregatedNumericGradeEarned_PK PRIMARY KEY (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionCourseTranscriptFactsAggregatedNumericGradeEarned ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionCourseTranscriptFactsStudentsEnrolled --
CREATE TABLE tpdm.SectionCourseTranscriptFactsStudentsEnrolled (
    FactAsOfDate DATE NOT NULL,
    FactsAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionCourseTranscriptFactsStudentsEnrolled_PK PRIMARY KEY (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionCourseTranscriptFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAcademicRecordFacts --
CREATE TABLE tpdm.SectionStudentAcademicRecordFacts (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    AggregatedGPAMax DECIMAL(18, 4) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SectionStudentAcademicRecordFacts_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentAcademicRecordFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.SectionStudentAcademicRecordFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.SectionStudentAcademicRecordFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAcademicRecordFactsAggregatedCumulativeGra_f08d2d --
CREATE TABLE tpdm.SectionStudentAcademicRecordFactsAggregatedCumulativeGra_f08d2d (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    GradePointAverage DECIMAL(18, 4) NOT NULL,
    GradePointNCount INT NULL,
    GradePointStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentAcademicRecordFactsAggregatedCumulat_f08d2d_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentAcademicRecordFactsAggregatedCumulativeGra_f08d2d ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAcademicRecordFactsAggregatedSessionGradeP_fca301 --
CREATE TABLE tpdm.SectionStudentAcademicRecordFactsAggregatedSessionGradeP_fca301 (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    GradePointAverage DECIMAL(18, 4) NOT NULL,
    GradePointNCount INT NULL,
    GradePointStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentAcademicRecordFactsAggregatedSession_fca301_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentAcademicRecordFactsAggregatedSessionGradeP_fca301 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAcademicRecordFactsStudentsEnrolled --
CREATE TABLE tpdm.SectionStudentAcademicRecordFactsStudentsEnrolled (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentAcademicRecordFactsStudentsEnrolled_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentAcademicRecordFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAssessmentFacts --
CREATE TABLE tpdm.SectionStudentAssessmentFacts (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    AssessmentTitle VARCHAR(100) NULL,
    AssessmentCategoryDescriptorId INT NULL,
    AcademicSubjectDescriptorId INT NULL,
    GradeLevelDescriptorId INT NULL,
    AdministrationDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SectionStudentAssessmentFacts_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
); 
ALTER TABLE tpdm.SectionStudentAssessmentFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.SectionStudentAssessmentFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.SectionStudentAssessmentFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel --
CREATE TABLE tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    PerformanceLevelDescriptorId INT NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    PerformanceLevelMetNumber INT NULL,
    PerformanceLevelMetPercentage DECIMAL(5, 4) NULL,
    PerformanceLevelTypeNumber INT NULL,
    PerformanceLevelTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentAssessmentFactsAggregatedPerformanceLevel_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, PerformanceLevelDescriptorId, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
); 
ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAssessmentFactsAggregatedScoreResult --
CREATE TABLE tpdm.SectionStudentAssessmentFactsAggregatedScoreResult (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    AssessmentReportingMethodDescriptorId INT NOT NULL,
    AverageScoreResultDatatypeTypeDescriptorId INT NOT NULL,
    AverageScoreResult VARCHAR(35) NOT NULL,
    ScoreNCount INT NULL,
    ScoreStandardDeviation INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentAssessmentFactsAggregatedScoreResult_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
); 
ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedScoreResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentAssessmentFactsStudentsEnrolled --
CREATE TABLE tpdm.SectionStudentAssessmentFactsStudentsEnrolled (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TakenSchoolYear SMALLINT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentAssessmentFactsStudentsEnrolled_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
); 
ALTER TABLE tpdm.SectionStudentAssessmentFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFacts --
CREATE TABLE tpdm.SectionStudentFacts (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SectionStudentFacts_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFacts ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.SectionStudentFacts ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.SectionStudentFacts ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedByDisability --
CREATE TABLE tpdm.SectionStudentFactsAggregatedByDisability (
    DisabilityDescriptorId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TypeNumber INT NULL,
    Percentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedByDisability_PK PRIMARY KEY (DisabilityDescriptorId, FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedByDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled --
CREATE TABLE tpdm.SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    StudentsDisabledNumber INT NULL,
    StudentsDisabledPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedELLEnrollment --
CREATE TABLE tpdm.SectionStudentFactsAggregatedELLEnrollment (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    ELLEnrollmentNumber INT NULL,
    ELLEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedELLEnrollment_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedELLEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedESLEnrollment --
CREATE TABLE tpdm.SectionStudentFactsAggregatedESLEnrollment (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    ESLEnrollmentNumber INT NULL,
    ESLEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedESLEnrollment_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedESLEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedGender --
CREATE TABLE tpdm.SectionStudentFactsAggregatedGender (
    FactAsOfDate DATE NOT NULL,
    GenderDescriptorId INT NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    GenderTypeNumber INT NULL,
    GenderTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedGender_PK PRIMARY KEY (FactAsOfDate, GenderDescriptorId, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedGender ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity --
CREATE TABLE tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity (
    FactAsOfDate DATE NOT NULL,
    HispanicLatinoEthnicity BOOLEAN NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    HispanicLatinoEthnicityNumber INT NULL,
    HispanicLatinoEthnicityPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedHispanicLatinoEthnicity_PK PRIMARY KEY (FactAsOfDate, HispanicLatinoEthnicity, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedLanguage --
CREATE TABLE tpdm.SectionStudentFactsAggregatedLanguage (
    FactAsOfDate DATE NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    LanguageTypeNumber INT NULL,
    LanguageTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedLanguage_PK PRIMARY KEY (FactAsOfDate, LanguageDescriptorId, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedRace --
CREATE TABLE tpdm.SectionStudentFactsAggregatedRace (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    RaceDescriptorId INT NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    RaceTypeNumber INT NULL,
    RaceTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedRace_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, RaceDescriptorId, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService --
CREATE TABLE tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolFoodServiceProgramServiceDescriptorId INT NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TypeNumber INT NULL,
    TypePercentage INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedSchoolFoodServiceProgramService_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolFoodServiceProgramServiceDescriptorId, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedSection504Enrollment --
CREATE TABLE tpdm.SectionStudentFactsAggregatedSection504Enrollment (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    Number504Enrolled INT NULL,
    Percentage504Enrolled DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedSection504Enrollment_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedSection504Enrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedSex --
CREATE TABLE tpdm.SectionStudentFactsAggregatedSex (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    SexDescriptorId INT NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SexTypeNumber INT NULL,
    SexTypePercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedSex_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, SexDescriptorId)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedSex ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedSPED --
CREATE TABLE tpdm.SectionStudentFactsAggregatedSPED (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    SPEDEnrollmentNumber INT NULL,
    SPEDEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedSPED_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedSPED ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsAggregatedTitleIEnrollment --
CREATE TABLE tpdm.SectionStudentFactsAggregatedTitleIEnrollment (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    TitleIEnrollmentNumber INT NULL,
    TitleIEnrollmentPercentage DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsAggregatedTitleIEnrollment_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsAggregatedTitleIEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.SectionStudentFactsStudentsEnrolled --
CREATE TABLE tpdm.SectionStudentFactsStudentsEnrolled (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ValueTypeDescriptorId INT NULL,
    NumberStudentsEnrolled INT NULL,
    PercentAtRisk DECIMAL(5, 4) NULL,
    PercentMobility DECIMAL(5, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionStudentFactsStudentsEnrolled_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE tpdm.SectionStudentFactsStudentsEnrolled ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffApplicantAssociation --
CREATE TABLE tpdm.StaffApplicantAssociation (
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StaffUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffApplicantAssociation_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId, StaffUSI)
); 
ALTER TABLE tpdm.StaffApplicantAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffApplicantAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffApplicantAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffBackgroundCheck --
CREATE TABLE tpdm.StaffBackgroundCheck (
    BackgroundCheckTypeDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    BackgroundCheckRequestedDate DATE NOT NULL,
    BackgroundCheckStatusDescriptorId INT NULL,
    BackgroundCheckCompletedDate DATE NULL,
    Fingerprint BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffBackgroundCheck_PK PRIMARY KEY (BackgroundCheckTypeDescriptorId, StaffUSI)
); 
ALTER TABLE tpdm.StaffBackgroundCheck ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEducationOrganizationAssignmentAssociationExtension --
CREATE TABLE tpdm.StaffEducationOrganizationAssignmentAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StaffClassificationDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    YearsOfExperienceAtCurrentEducationOrganization DECIMAL(5, 2) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEducationOrganizationAssignmentAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
); 
ALTER TABLE tpdm.StaffEducationOrganizationAssignmentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluation --
CREATE TABLE tpdm.StaffEvaluation (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    MaxRating DECIMAL(6, 3) NOT NULL,
    MinRating DECIMAL(6, 3) NULL,
    StaffEvaluationPeriodDescriptorId INT NULL,
    StaffEvaluationTypeDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEvaluation_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
); 
ALTER TABLE tpdm.StaffEvaluation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffEvaluation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffEvaluation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationComponent --
CREATE TABLE tpdm.StaffEvaluationComponent (
    EducationOrganizationId INT NOT NULL,
    EvaluationComponent VARCHAR(50) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    MaxRating DECIMAL(6, 3) NOT NULL,
    MinRating DECIMAL(6, 3) NULL,
    RubricReference VARCHAR(255) NULL,
    StaffEvaluationTypeDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEvaluationComponent_PK PRIMARY KEY (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
); 
ALTER TABLE tpdm.StaffEvaluationComponent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffEvaluationComponent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffEvaluationComponent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationComponentRating --
CREATE TABLE tpdm.StaffEvaluationComponentRating (
    ComponentRating DECIMAL(6, 3) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    EvaluationComponent VARCHAR(50) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationDate DATE NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    StaffUSI INT NOT NULL,
    StaffEvaluationRatingLevelDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEvaluationComponentRating_PK PRIMARY KEY (ComponentRating, EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
); 
ALTER TABLE tpdm.StaffEvaluationComponentRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffEvaluationComponentRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffEvaluationComponentRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationComponentStaffRatingLevel --
CREATE TABLE tpdm.StaffEvaluationComponentStaffRatingLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationComponent VARCHAR(50) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationLevel VARCHAR(50) NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    MaxLevel DECIMAL(6, 3) NOT NULL,
    MinLevel DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEvaluationComponentStaffRatingLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationLevel, StaffEvaluationTitle)
); 
ALTER TABLE tpdm.StaffEvaluationComponentStaffRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationElement --
CREATE TABLE tpdm.StaffEvaluationElement (
    EducationOrganizationId INT NOT NULL,
    EvaluationComponent VARCHAR(50) NOT NULL,
    EvaluationElement VARCHAR(255) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    MaxRating DECIMAL(6, 3) NOT NULL,
    MinRating DECIMAL(6, 3) NULL,
    RubricReference VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEvaluationElement_PK PRIMARY KEY (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle)
); 
ALTER TABLE tpdm.StaffEvaluationElement ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffEvaluationElement ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffEvaluationElement ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationElementRating --
CREATE TABLE tpdm.StaffEvaluationElementRating (
    EducationOrganizationId INT NOT NULL,
    EvaluationComponent VARCHAR(50) NOT NULL,
    EvaluationElement VARCHAR(255) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationDate DATE NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    StaffUSI INT NOT NULL,
    ElementRating DECIMAL(6, 3) NOT NULL,
    StaffEvaluationRatingLevelDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEvaluationElementRating_PK PRIMARY KEY (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
); 
ALTER TABLE tpdm.StaffEvaluationElementRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffEvaluationElementRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffEvaluationElementRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationElementStaffRatingLevel --
CREATE TABLE tpdm.StaffEvaluationElementStaffRatingLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationComponent VARCHAR(50) NOT NULL,
    EvaluationElement VARCHAR(255) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationLevel VARCHAR(50) NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    MaxLevel DECIMAL(6, 3) NOT NULL,
    MinLevel DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEvaluationElementStaffRatingLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationLevel, StaffEvaluationTitle)
); 
ALTER TABLE tpdm.StaffEvaluationElementStaffRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationPeriodDescriptor --
CREATE TABLE tpdm.StaffEvaluationPeriodDescriptor (
    StaffEvaluationPeriodDescriptorId INT NOT NULL,
    CONSTRAINT StaffEvaluationPeriodDescriptor_PK PRIMARY KEY (StaffEvaluationPeriodDescriptorId)
); 

-- Table tpdm.StaffEvaluationRating --
CREATE TABLE tpdm.StaffEvaluationRating (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationDate DATE NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    StaffUSI INT NOT NULL,
    Rating DECIMAL(6, 3) NOT NULL,
    StaffEvaluationRatingLevelDescriptorId INT NULL,
    EvaluatedByStaffUSI INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffEvaluationRating_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
); 
ALTER TABLE tpdm.StaffEvaluationRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffEvaluationRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffEvaluationRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationRatingLevelDescriptor --
CREATE TABLE tpdm.StaffEvaluationRatingLevelDescriptor (
    StaffEvaluationRatingLevelDescriptorId INT NOT NULL,
    CONSTRAINT StaffEvaluationRatingLevelDescriptor_PK PRIMARY KEY (StaffEvaluationRatingLevelDescriptorId)
); 

-- Table tpdm.StaffEvaluationStaffRatingLevel --
CREATE TABLE tpdm.StaffEvaluationStaffRatingLevel (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffEvaluationLevel VARCHAR(50) NOT NULL,
    StaffEvaluationTitle VARCHAR(50) NOT NULL,
    MaxLevel DECIMAL(6, 3) NOT NULL,
    MinLevel DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEvaluationStaffRatingLevel_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StaffEvaluationLevel, StaffEvaluationTitle)
); 
ALTER TABLE tpdm.StaffEvaluationStaffRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffEvaluationTypeDescriptor --
CREATE TABLE tpdm.StaffEvaluationTypeDescriptor (
    StaffEvaluationTypeDescriptorId INT NOT NULL,
    CONSTRAINT StaffEvaluationTypeDescriptor_PK PRIMARY KEY (StaffEvaluationTypeDescriptorId)
); 

-- Table tpdm.StaffExtension --
CREATE TABLE tpdm.StaffExtension (
    StaffUSI INT NOT NULL,
    ProbationCompleteDate DATE NULL,
    Tenured BOOLEAN NULL,
    GenderDescriptorId INT NULL,
    TenureTrack BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffExtension_PK PRIMARY KEY (StaffUSI)
); 
ALTER TABLE tpdm.StaffExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffFieldworkAbsenceEvent --
CREATE TABLE tpdm.StaffFieldworkAbsenceEvent (
    AbsenceEventCategoryDescriptorId INT NOT NULL,
    EventDate DATE NOT NULL,
    StaffUSI INT NOT NULL,
    AbsenceEventReason VARCHAR(255) NULL,
    HoursAbsent DECIMAL(3, 2) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffFieldworkAbsenceEvent_PK PRIMARY KEY (AbsenceEventCategoryDescriptorId, EventDate, StaffUSI)
); 
ALTER TABLE tpdm.StaffFieldworkAbsenceEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffFieldworkAbsenceEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffFieldworkAbsenceEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffFieldworkExperience --
CREATE TABLE tpdm.StaffFieldworkExperience (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    FieldworkTypeDescriptorId INT NOT NULL,
    HoursCompleted DECIMAL(5, 2) NULL,
    EndDate DATE NULL,
    ProgramGatewayDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffFieldworkExperience_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffFieldworkExperience ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffFieldworkExperience ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffFieldworkExperience ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffFieldworkExperienceCoteaching --
CREATE TABLE tpdm.StaffFieldworkExperienceCoteaching (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    CoteachingBeginDate DATE NOT NULL,
    CoteachingEndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffFieldworkExperienceCoteaching_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffFieldworkExperienceCoteaching ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffFieldworkExperienceSchool --
CREATE TABLE tpdm.StaffFieldworkExperienceSchool (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    SchoolId INT NOT NULL,
    StaffUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffFieldworkExperienceSchool_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, SchoolId, StaffUSI)
); 
ALTER TABLE tpdm.StaffFieldworkExperienceSchool ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffFieldworkExperienceSectionAssociation --
CREATE TABLE tpdm.StaffFieldworkExperienceSectionAssociation (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StaffUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffFieldworkExperienceSectionAssociation_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI)
); 
ALTER TABLE tpdm.StaffFieldworkExperienceSectionAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffFieldworkExperienceSectionAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffFieldworkExperienceSectionAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffHighlyQualifiedAcademicSubject --
CREATE TABLE tpdm.StaffHighlyQualifiedAcademicSubject (
    AcademicSubjectDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffHighlyQualifiedAcademicSubject_PK PRIMARY KEY (AcademicSubjectDescriptorId, StaffUSI)
); 
ALTER TABLE tpdm.StaffHighlyQualifiedAcademicSubject ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffProfessionalDevelopmentEventAttendance --
CREATE TABLE tpdm.StaffProfessionalDevelopmentEventAttendance (
    AttendanceDate DATE NOT NULL,
    ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
    StaffUSI INT NOT NULL,
    AttendanceEventCategoryDescriptorId INT NOT NULL,
    AttendanceEventReason VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffProfessionalDevelopmentEventAttendance_PK PRIMARY KEY (AttendanceDate, ProfessionalDevelopmentTitle, StaffUSI)
); 
ALTER TABLE tpdm.StaffProfessionalDevelopmentEventAttendance ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffProfessionalDevelopmentEventAttendance ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffProfessionalDevelopmentEventAttendance ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffProspectAssociation --
CREATE TABLE tpdm.StaffProspectAssociation (
    EducationOrganizationId INT NOT NULL,
    ProspectIdentifier VARCHAR(32) NOT NULL,
    StaffUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffProspectAssociation_PK PRIMARY KEY (EducationOrganizationId, ProspectIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffProspectAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffProspectAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffProspectAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffSalary --
CREATE TABLE tpdm.StaffSalary (
    StaffUSI INT NOT NULL,
    SalaryMinRange INT NULL,
    SalaryMaxRange INT NULL,
    SalaryTypeDescriptorId INT NULL,
    SalaryAmount MONEY NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffSalary_PK PRIMARY KEY (StaffUSI)
); 
ALTER TABLE tpdm.StaffSalary ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffSeniority --
CREATE TABLE tpdm.StaffSeniority (
    CredentialFieldDescriptorId INT NOT NULL,
    NameOfInstitution VARCHAR(75) NOT NULL,
    StaffUSI INT NOT NULL,
    YearsExperience DECIMAL(5, 2) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffSeniority_PK PRIMARY KEY (CredentialFieldDescriptorId, NameOfInstitution, StaffUSI)
); 
ALTER TABLE tpdm.StaffSeniority ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffStudentGrowthMeasure --
CREATE TABLE tpdm.StaffStudentGrowthMeasure (
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    StudentGrowthMeasureDate DATE NULL,
    ResultDatatypeTypeDescriptorId INT NULL,
    StudentGrowthTypeDescriptorId INT NULL,
    StudentGrowthTargetScore INT NULL,
    StudentGrowthActualScore INT NOT NULL,
    StudentGrowthMet BOOLEAN NOT NULL,
    StudentGrowthNCount INT NULL,
    StandardError DECIMAL(5, 4) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffStudentGrowthMeasure_PK PRIMARY KEY (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffStudentGrowthMeasure ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffStudentGrowthMeasure ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffStudentGrowthMeasure ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffStudentGrowthMeasureAcademicSubject --
CREATE TABLE tpdm.StaffStudentGrowthMeasureAcademicSubject (
    AcademicSubjectDescriptorId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffStudentGrowthMeasureAcademicSubject_PK PRIMARY KEY (AcademicSubjectDescriptorId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffStudentGrowthMeasureAcademicSubject ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffStudentGrowthMeasureCourseAssociation --
CREATE TABLE tpdm.StaffStudentGrowthMeasureCourseAssociation (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffStudentGrowthMeasureCourseAssociation_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffStudentGrowthMeasureCourseAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffStudentGrowthMeasureCourseAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffStudentGrowthMeasureCourseAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation --
CREATE TABLE tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffStudentGrowthMeasureEducationOrganizationAssociation_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffStudentGrowthMeasureGradeLevel --
CREATE TABLE tpdm.StaffStudentGrowthMeasureGradeLevel (
    FactAsOfDate DATE NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffStudentGrowthMeasureGradeLevel_PK PRIMARY KEY (FactAsOfDate, GradeLevelDescriptorId, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffStudentGrowthMeasureGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffStudentGrowthMeasureSectionAssociation --
CREATE TABLE tpdm.StaffStudentGrowthMeasureSectionAssociation (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StaffStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StaffUSI INT NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffStudentGrowthMeasureSectionAssociation_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffStudentGrowthMeasureIdentifier, StaffUSI)
); 
ALTER TABLE tpdm.StaffStudentGrowthMeasureSectionAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffStudentGrowthMeasureSectionAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffStudentGrowthMeasureSectionAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffTeacherEducatorResearch --
CREATE TABLE tpdm.StaffTeacherEducatorResearch (
    StaffUSI INT NOT NULL,
    ResearchExperienceDate DATE NOT NULL,
    ResearchExperienceTitle VARCHAR(60) NULL,
    ResearchExperienceDescription VARCHAR(1024) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffTeacherEducatorResearch_PK PRIMARY KEY (StaffUSI)
); 
ALTER TABLE tpdm.StaffTeacherEducatorResearch ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffTeacherPreparationProgram --
CREATE TABLE tpdm.StaffTeacherPreparationProgram (
    StaffUSI INT NOT NULL,
    TeacherPreparationProgramName VARCHAR(255) NOT NULL,
    TeacherPreparationProgramIdentifier VARCHAR(75) NULL,
    TeacherPreparationProgramTypeDescriptorId INT NOT NULL,
    NameOfInstitution VARCHAR(75) NOT NULL,
    MajorSpecialization VARCHAR(75) NOT NULL,
    GPA DECIMAL(18, 4) NULL,
    LevelOfDegreeAwardedDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffTeacherPreparationProgram_PK PRIMARY KEY (StaffUSI, TeacherPreparationProgramName)
); 
ALTER TABLE tpdm.StaffTeacherPreparationProgram ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffTeacherPreparationProviderAssociation --
CREATE TABLE tpdm.StaffTeacherPreparationProviderAssociation (
    StaffUSI INT NOT NULL,
    TeacherPreparationProviderId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    ProgramAssignmentDescriptorId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffTeacherPreparationProviderAssociation_PK PRIMARY KEY (StaffUSI, TeacherPreparationProviderId)
); 
ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject --
CREATE TABLE tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject (
    AcademicSubjectDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    TeacherPreparationProviderId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffTeacherPreparationProviderAssociationAcademicSubject_PK PRIMARY KEY (AcademicSubjectDescriptorId, StaffUSI, TeacherPreparationProviderId)
); 
ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffTeacherPreparationProviderAssociationGradeLevel --
CREATE TABLE tpdm.StaffTeacherPreparationProviderAssociationGradeLevel (
    GradeLevelDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    TeacherPreparationProviderId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffTeacherPreparationProviderAssociationGradeLevel_PK PRIMARY KEY (GradeLevelDescriptorId, StaffUSI, TeacherPreparationProviderId)
); 
ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociationGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StaffTeacherPreparationProviderProgramAssociation --
CREATE TABLE tpdm.StaffTeacherPreparationProviderProgramAssociation (
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NULL,
    StudentRecordAccess BOOLEAN NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StaffTeacherPreparationProviderProgramAssociation_PK PRIMARY KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StaffUSI)
); 
ALTER TABLE tpdm.StaffTeacherPreparationProviderProgramAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.StaffTeacherPreparationProviderProgramAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.StaffTeacherPreparationProviderProgramAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.StateEducationAgencyExtension --
CREATE TABLE tpdm.StateEducationAgencyExtension (
    StateEducationAgencyId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StateEducationAgencyExtension_PK PRIMARY KEY (StateEducationAgencyId)
); 
ALTER TABLE tpdm.StateEducationAgencyExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StudentGradebookEntryExtension --
CREATE TABLE tpdm.StudentGradebookEntryExtension (
    BeginDate DATE NOT NULL,
    DateAssigned DATE NOT NULL,
    GradebookEntryTitle VARCHAR(60) NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StudentUSI INT NOT NULL,
    DateCompleted DATE NULL,
    AssignmentPassed BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentGradebookEntryExtension_PK PRIMARY KEY (BeginDate, DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
); 
ALTER TABLE tpdm.StudentGradebookEntryExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.StudentGrowthTypeDescriptor --
CREATE TABLE tpdm.StudentGrowthTypeDescriptor (
    StudentGrowthTypeDescriptorId INT NOT NULL,
    CONSTRAINT StudentGrowthTypeDescriptor_PK PRIMARY KEY (StudentGrowthTypeDescriptorId)
); 

-- Table tpdm.SurveyLevelDescriptor --
CREATE TABLE tpdm.SurveyLevelDescriptor (
    SurveyLevelDescriptorId INT NOT NULL,
    CONSTRAINT SurveyLevelDescriptor_PK PRIMARY KEY (SurveyLevelDescriptorId)
); 

-- Table tpdm.TalentManagementGoal --
CREATE TABLE tpdm.TalentManagementGoal (
    GoalTitle VARCHAR(255) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    GoalValue DECIMAL(12, 3) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TalentManagementGoal_PK PRIMARY KEY (GoalTitle, SchoolYear)
); 
ALTER TABLE tpdm.TalentManagementGoal ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TalentManagementGoal ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TalentManagementGoal ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TalentManagementGoalEducationOrganization --
CREATE TABLE tpdm.TalentManagementGoalEducationOrganization (
    EducationOrganizationId INT NOT NULL,
    GoalTitle VARCHAR(255) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TalentManagementGoalEducationOrganization_PK PRIMARY KEY (EducationOrganizationId, GoalTitle, SchoolYear)
); 
ALTER TABLE tpdm.TalentManagementGoalEducationOrganization ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidate --
CREATE TABLE tpdm.TeacherCandidate (
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    PersonalTitlePrefix VARCHAR(30) NULL,
    FirstName VARCHAR(75) NOT NULL,
    MiddleName VARCHAR(75) NULL,
    LastSurname VARCHAR(75) NOT NULL,
    GenerationCodeSuffix VARCHAR(10) NULL,
    MaidenName VARCHAR(75) NULL,
    SexDescriptorId INT NOT NULL,
    BirthDate DATE NOT NULL,
    BirthCity VARCHAR(30) NULL,
    BirthStateAbbreviationDescriptorId INT NULL,
    BirthInternationalProvince VARCHAR(150) NULL,
    BirthCountryDescriptorId INT NULL,
    DateEnteredUS DATE NULL,
    MultipleBirthStatus BOOLEAN NULL,
    BirthSexDescriptorId INT NULL,
    ProfileThumbnail VARCHAR(255) NULL,
    HispanicLatinoEthnicity BOOLEAN NULL,
    OldEthnicityDescriptorId INT NULL,
    CitizenshipStatusDescriptorId INT NULL,
    EconomicDisadvantaged BOOLEAN NULL,
    LimitedEnglishProficiencyDescriptorId INT NULL,
    DisplacementStatus VARCHAR(30) NULL,
    LoginId VARCHAR(60) NULL,
    GenderDescriptorId INT NULL,
    TuitionCost MONEY NULL,
    EnglishLanguageExamDescriptorId INT NULL,
    PreviousCareerDescriptorId INT NULL,
    ProgramComplete BOOLEAN NULL,
    FirstGenerationStudent BOOLEAN NULL,
    StudentUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidate_PK PRIMARY KEY (TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidate ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidate ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidate ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAcademicRecord --
CREATE TABLE tpdm.TeacherCandidateAcademicRecord (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    CumulativeEarnedCredits DECIMAL(9, 3) NULL,
    CumulativeEarnedCreditTypeDescriptorId INT NULL,
    CumulativeEarnedCreditConversion DECIMAL(9, 2) NULL,
    CumulativeAttemptedCredits DECIMAL(9, 3) NULL,
    CumulativeAttemptedCreditTypeDescriptorId INT NULL,
    CumulativeAttemptedCreditConversion DECIMAL(9, 2) NULL,
    CumulativeGradePointsEarned DECIMAL(18, 4) NULL,
    CumulativeGradePointAverage DECIMAL(18, 4) NULL,
    GradeValueQualifier VARCHAR(80) NULL,
    ProjectedGraduationDate DATE NULL,
    SessionEarnedCredits DECIMAL(9, 3) NULL,
    SessionEarnedCreditTypeDescriptorId INT NULL,
    SessionEarnedCreditConversion DECIMAL(9, 2) NULL,
    SessionAttemptedCredits DECIMAL(9, 3) NULL,
    SessionAttemptedCreditTypeDescriptorId INT NULL,
    SessionAttemptedCreditConversion DECIMAL(9, 2) NULL,
    SessionGradePointsEarned DECIMAL(18, 4) NULL,
    SessionGradePointAverage DECIMAL(18, 4) NULL,
    ContentGradePointAverage DECIMAL(18, 4) NULL,
    ContentGradePointEarned DECIMAL(18, 4) NULL,
    ProgramGatewayDescriptorId INT NOT NULL,
    TPPDegreeTypeDescriptorId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateAcademicRecord_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateAcademicRecord ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateAcademicRecord ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateAcademicRecord ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAcademicRecordAcademicHonor --
CREATE TABLE tpdm.TeacherCandidateAcademicRecordAcademicHonor (
    AcademicHonorCategoryDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    HonorDescription VARCHAR(80) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    AchievementTitle VARCHAR(60) NULL,
    AchievementCategoryDescriptorId INT NULL,
    AchievementCategorySystem VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerOriginURL VARCHAR(255) NULL,
    Criteria VARCHAR(150) NULL,
    CriteriaURL VARCHAR(255) NULL,
    EvidenceStatement VARCHAR(150) NULL,
    ImageURL VARCHAR(255) NULL,
    HonorAwardDate DATE NULL,
    HonorAwardExpiresDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAcademicRecordAcademicHonor_PK PRIMARY KEY (AcademicHonorCategoryDescriptorId, EducationOrganizationId, HonorDescription, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateAcademicRecordAcademicHonor ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAcademicRecordClassRanking --
CREATE TABLE tpdm.TeacherCandidateAcademicRecordClassRanking (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    ClassRank INT NOT NULL,
    TotalNumberInClass INT NOT NULL,
    PercentageRanking INT NULL,
    ClassRankingDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAcademicRecordClassRanking_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateAcademicRecordClassRanking ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAcademicRecordDiploma --
CREATE TABLE tpdm.TeacherCandidateAcademicRecordDiploma (
    DiplomaAwardDate DATE NOT NULL,
    DiplomaTypeDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    AchievementTitle VARCHAR(60) NULL,
    AchievementCategoryDescriptorId INT NULL,
    AchievementCategorySystem VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerOriginURL VARCHAR(255) NULL,
    Criteria VARCHAR(150) NULL,
    CriteriaURL VARCHAR(255) NULL,
    EvidenceStatement VARCHAR(150) NULL,
    ImageURL VARCHAR(255) NULL,
    DiplomaLevelDescriptorId INT NULL,
    CTECompleter BOOLEAN NULL,
    DiplomaDescription VARCHAR(80) NULL,
    DiplomaAwardExpiresDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAcademicRecordDiploma_PK PRIMARY KEY (DiplomaAwardDate, DiplomaTypeDescriptorId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateAcademicRecordDiploma ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAcademicRecordGradePointAverage --
CREATE TABLE tpdm.TeacherCandidateAcademicRecordGradePointAverage (
    EducationOrganizationId INT NOT NULL,
    GradePointAverageTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    IsCumulative BOOLEAN NULL,
    GradePointAverageValue DECIMAL(18, 4) NOT NULL,
    MaxGradePointAverageValue DECIMAL(18, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAcademicRecordGradePointAverage_PK PRIMARY KEY (EducationOrganizationId, GradePointAverageTypeDescriptorId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateAcademicRecordGradePointAverage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAcademicRecordRecognition --
CREATE TABLE tpdm.TeacherCandidateAcademicRecordRecognition (
    EducationOrganizationId INT NOT NULL,
    RecognitionTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    AchievementTitle VARCHAR(60) NULL,
    AchievementCategoryDescriptorId INT NULL,
    AchievementCategorySystem VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerOriginURL VARCHAR(255) NULL,
    Criteria VARCHAR(150) NULL,
    CriteriaURL VARCHAR(255) NULL,
    EvidenceStatement VARCHAR(150) NULL,
    ImageURL VARCHAR(255) NULL,
    RecognitionDescription VARCHAR(80) NULL,
    RecognitionAwardDate DATE NULL,
    RecognitionAwardExpiresDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAcademicRecordRecognition_PK PRIMARY KEY (EducationOrganizationId, RecognitionTypeDescriptorId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateAcademicRecordRecognition ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAddress --
CREATE TABLE tpdm.TeacherCandidateAddress (
    AddressTypeDescriptorId INT NOT NULL,
    City VARCHAR(30) NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    ApartmentRoomSuiteNumber VARCHAR(50) NULL,
    BuildingSiteNumber VARCHAR(20) NULL,
    NameOfCounty VARCHAR(30) NULL,
    CountyFIPSCode VARCHAR(5) NULL,
    Latitude VARCHAR(20) NULL,
    Longitude VARCHAR(20) NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CongressionalDistrict VARCHAR(30) NULL,
    LocaleDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAddress_PK PRIMARY KEY (AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateAddress ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAddressPeriod --
CREATE TABLE tpdm.TeacherCandidateAddressPeriod (
    AddressTypeDescriptorId INT NOT NULL,
    BeginDate DATE NOT NULL,
    City VARCHAR(30) NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAddressPeriod_PK PRIMARY KEY (AddressTypeDescriptorId, BeginDate, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateAddressPeriod ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateAid --
CREATE TABLE tpdm.TeacherCandidateAid (
    AidTypeDescriptorId INT NOT NULL,
    BeginDate DATE NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    EndDate DATE NULL,
    AidConditionDescription VARCHAR(1024) NULL,
    AidAmount MONEY NULL,
    PellGrantRecipient BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateAid_PK PRIMARY KEY (AidTypeDescriptorId, BeginDate, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateAid ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateBackgroundCheck --
CREATE TABLE tpdm.TeacherCandidateBackgroundCheck (
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    BackgroundCheckTypeDescriptorId INT NOT NULL,
    BackgroundCheckRequestedDate DATE NOT NULL,
    BackgroundCheckStatusDescriptorId INT NULL,
    BackgroundCheckCompletedDate DATE NULL,
    Fingerprint BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateBackgroundCheck_PK PRIMARY KEY (TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateBackgroundCheck ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateCharacteristic --
CREATE TABLE tpdm.TeacherCandidateCharacteristic (
    StudentCharacteristicDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    DesignatedBy VARCHAR(60) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateCharacteristic_PK PRIMARY KEY (StudentCharacteristicDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateCharacteristic ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateCharacteristicDescriptor --
CREATE TABLE tpdm.TeacherCandidateCharacteristicDescriptor (
    TeacherCandidateCharacteristicDescriptorId INT NOT NULL,
    CONSTRAINT TeacherCandidateCharacteristicDescriptor_PK PRIMARY KEY (TeacherCandidateCharacteristicDescriptorId)
); 

-- Table tpdm.TeacherCandidateCohortYear --
CREATE TABLE tpdm.TeacherCandidateCohortYear (
    CohortYearTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateCohortYear_PK PRIMARY KEY (CohortYearTypeDescriptorId, SchoolYear, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateCohortYear ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateCourseTranscript --
CREATE TABLE tpdm.TeacherCandidateCourseTranscript (
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    CourseEducationOrganizationId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    AttemptedCredits DECIMAL(9, 3) NULL,
    AttemptedCreditTypeDescriptorId INT NULL,
    AttemptedCreditConversion DECIMAL(9, 2) NULL,
    EarnedCredits DECIMAL(9, 3) NOT NULL,
    EarnedCreditTypeDescriptorId INT NULL,
    EarnedCreditConversion DECIMAL(9, 2) NULL,
    WhenTakenGradeLevelDescriptorId INT NULL,
    MethodCreditEarnedDescriptorId INT NULL,
    FinalLetterGradeEarned VARCHAR(20) NULL,
    FinalNumericGradeEarned DECIMAL(9, 2) NULL,
    CourseRepeatCodeDescriptorId INT NULL,
    SchoolId INT NULL,
    CourseTitle VARCHAR(60) NULL,
    AlternativeCourseTitle VARCHAR(60) NULL,
    AlternativeCourseCode VARCHAR(60) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateCourseTranscript_PK PRIMARY KEY (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateCourseTranscript ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateCourseTranscript ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateCourseTranscript ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits --
CREATE TABLE tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits (
    AdditionalCreditTypeDescriptorId INT NOT NULL,
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    CourseEducationOrganizationId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TermDescriptorId INT NOT NULL,
    Credits DECIMAL(9, 3) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateCourseTranscriptEarnedAdditionalCredits_PK PRIMARY KEY (AdditionalCreditTypeDescriptorId, CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateCredential --
CREATE TABLE tpdm.TeacherCandidateCredential (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateCredential_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateCredential ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateDegreeSpecialization --
CREATE TABLE tpdm.TeacherCandidateDegreeSpecialization (
    BeginDate DATE NOT NULL,
    MajorSpecialization VARCHAR(75) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    MinorSpecialization VARCHAR(75) NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateDegreeSpecialization_PK PRIMARY KEY (BeginDate, MajorSpecialization, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateDegreeSpecialization ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateDisability --
CREATE TABLE tpdm.TeacherCandidateDisability (
    DisabilityDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    DisabilityDiagnosis VARCHAR(80) NULL,
    OrderOfDisability INT NULL,
    DisabilityDeterminationSourceTypeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateDisability_PK PRIMARY KEY (DisabilityDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateDisabilityDesignation --
CREATE TABLE tpdm.TeacherCandidateDisabilityDesignation (
    DisabilityDescriptorId INT NOT NULL,
    DisabilityDesignationDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateDisabilityDesignation_PK PRIMARY KEY (DisabilityDescriptorId, DisabilityDesignationDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateDisabilityDesignation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateElectronicMail --
CREATE TABLE tpdm.TeacherCandidateElectronicMail (
    ElectronicMailAddress VARCHAR(128) NOT NULL,
    ElectronicMailTypeDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    PrimaryEmailAddressIndicator BOOLEAN NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateElectronicMail_PK PRIMARY KEY (ElectronicMailAddress, ElectronicMailTypeDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateElectronicMail ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateFieldworkAbsenceEvent --
CREATE TABLE tpdm.TeacherCandidateFieldworkAbsenceEvent (
    AbsenceEventCategoryDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    EventDate DATE NOT NULL,
    AbsenceEventReason VARCHAR(255) NULL,
    HoursAbsent DECIMAL(3, 2) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateFieldworkAbsenceEvent_PK PRIMARY KEY (AbsenceEventCategoryDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateFieldworkAbsenceEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateFieldworkAbsenceEvent ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateFieldworkAbsenceEvent ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateFieldworkExperience --
CREATE TABLE tpdm.TeacherCandidateFieldworkExperience (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    FieldworkTypeDescriptorId INT NOT NULL,
    HoursCompleted DECIMAL(5, 2) NULL,
    EndDate DATE NULL,
    ProgramGatewayDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateFieldworkExperience_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateFieldworkExperience ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateFieldworkExperience ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateFieldworkExperience ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateFieldworkExperienceCoteaching --
CREATE TABLE tpdm.TeacherCandidateFieldworkExperienceCoteaching (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CoteachingBeginDate DATE NOT NULL,
    CoteachingEndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateFieldworkExperienceCoteaching_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceCoteaching ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateFieldworkExperienceSchool --
CREATE TABLE tpdm.TeacherCandidateFieldworkExperienceSchool (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    SchoolId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateFieldworkExperienceSchool_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, SchoolId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSchool ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateFieldworkExperienceSectionAssociation --
CREATE TABLE tpdm.TeacherCandidateFieldworkExperienceSectionAssociation (
    BeginDate DATE NOT NULL,
    FieldworkIdentifier VARCHAR(64) NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateFieldworkExperienceSectionAssociation_PK PRIMARY KEY (BeginDate, FieldworkIdentifier, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSectionAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSectionAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSectionAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateIdentificationCode --
CREATE TABLE tpdm.TeacherCandidateIdentificationCode (
    AssigningOrganizationIdentificationCode VARCHAR(60) NOT NULL,
    StudentIdentificationSystemDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    IdentificationCode VARCHAR(60) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateIdentificationCode_PK PRIMARY KEY (AssigningOrganizationIdentificationCode, StudentIdentificationSystemDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateIdentificationCode ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateIdentificationDocument --
CREATE TABLE tpdm.TeacherCandidateIdentificationDocument (
    IdentificationDocumentUseDescriptorId INT NOT NULL,
    PersonalInformationVerificationDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    DocumentTitle VARCHAR(60) NULL,
    DocumentExpirationDate DATE NULL,
    IssuerDocumentIdentificationCode VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerCountryDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateIdentificationDocument_PK PRIMARY KEY (IdentificationDocumentUseDescriptorId, PersonalInformationVerificationDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateIdentificationDocument ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateIndicator --
CREATE TABLE tpdm.TeacherCandidateIndicator (
    IndicatorName VARCHAR(200) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    IndicatorGroup VARCHAR(200) NULL,
    Indicator VARCHAR(35) NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    DesignatedBy VARCHAR(60) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateIndicator_PK PRIMARY KEY (IndicatorName, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateIndicator ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateInternationalAddress --
CREATE TABLE tpdm.TeacherCandidateInternationalAddress (
    AddressTypeDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    AddressLine1 VARCHAR(150) NOT NULL,
    AddressLine2 VARCHAR(150) NULL,
    AddressLine3 VARCHAR(150) NULL,
    AddressLine4 VARCHAR(150) NULL,
    CountryDescriptorId INT NOT NULL,
    Latitude VARCHAR(20) NULL,
    Longitude VARCHAR(20) NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateInternationalAddress_PK PRIMARY KEY (AddressTypeDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateInternationalAddress ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateLanguage --
CREATE TABLE tpdm.TeacherCandidateLanguage (
    LanguageDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateLanguage_PK PRIMARY KEY (LanguageDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateLanguageUse --
CREATE TABLE tpdm.TeacherCandidateLanguageUse (
    LanguageDescriptorId INT NOT NULL,
    LanguageUseDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateLanguageUse_PK PRIMARY KEY (LanguageDescriptorId, LanguageUseDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateLanguageUse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateOtherName --
CREATE TABLE tpdm.TeacherCandidateOtherName (
    OtherNameTypeDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    PersonalTitlePrefix VARCHAR(30) NULL,
    FirstName VARCHAR(75) NOT NULL,
    MiddleName VARCHAR(75) NULL,
    LastSurname VARCHAR(75) NOT NULL,
    GenerationCodeSuffix VARCHAR(10) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateOtherName_PK PRIMARY KEY (OtherNameTypeDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateOtherName ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidatePersonalIdentificationDocument --
CREATE TABLE tpdm.TeacherCandidatePersonalIdentificationDocument (
    IdentificationDocumentUseDescriptorId INT NOT NULL,
    PersonalInformationVerificationDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    DocumentTitle VARCHAR(60) NULL,
    DocumentExpirationDate DATE NULL,
    IssuerDocumentIdentificationCode VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerCountryDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidatePersonalIdentificationDocument_PK PRIMARY KEY (IdentificationDocumentUseDescriptorId, PersonalInformationVerificationDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidatePersonalIdentificationDocument ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance --
CREATE TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance (
    AttendanceDate DATE NOT NULL,
    ProfessionalDevelopmentTitle VARCHAR(60) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    AttendanceEventCategoryDescriptorId INT NOT NULL,
    AttendanceEventReason VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateProfessionalDevelopmentEventAttendance_PK PRIMARY KEY (AttendanceDate, ProfessionalDevelopmentTitle, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateRace --
CREATE TABLE tpdm.TeacherCandidateRace (
    RaceDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateRace_PK PRIMARY KEY (RaceDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStaffAssociation --
CREATE TABLE tpdm.TeacherCandidateStaffAssociation (
    StaffUSI INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateStaffAssociation_PK PRIMARY KEY (StaffUSI, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStaffAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateStaffAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateStaffAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStudentGrowthMeasure --
CREATE TABLE tpdm.TeacherCandidateStudentGrowthMeasure (
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    StudentGrowthMeasureDate DATE NULL,
    ResultDatatypeTypeDescriptorId INT NULL,
    StudentGrowthTypeDescriptorId INT NULL,
    StudentGrowthTargetScore INT NULL,
    StudentGrowthActualScore INT NOT NULL,
    StudentGrowthMet BOOLEAN NOT NULL,
    StudentGrowthNCount INT NULL,
    StandardError DECIMAL(5, 4) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateStudentGrowthMeasure_PK PRIMARY KEY (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject --
CREATE TABLE tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject (
    AcademicSubjectDescriptorId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateStudentGrowthMeasureAcademicSubject_PK PRIMARY KEY (AcademicSubjectDescriptorId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation --
CREATE TABLE tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation (
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateStudentGrowthMeasureCourseAssociation_PK PRIMARY KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 --
CREATE TABLE tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 (
    EducationOrganizationId INT NOT NULL,
    FactAsOfDate DATE NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateStudentGrowthMeasureEducationOrgan_22b9a4_PK PRIMARY KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel --
CREATE TABLE tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel (
    FactAsOfDate DATE NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateStudentGrowthMeasureGradeLevel_PK PRIMARY KEY (FactAsOfDate, GradeLevelDescriptorId, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation --
CREATE TABLE tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation (
    FactAsOfDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherCandidateStudentGrowthMeasureIdentifier VARCHAR(64) NOT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateStudentGrowthMeasureSectionAssociation_PK PRIMARY KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateTeacherPreparationProviderAssociation --
CREATE TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation (
    EntryDate DATE NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TeacherPreparationProviderId INT NOT NULL,
    SchoolYear SMALLINT NULL,
    EntryTypeDescriptorId INT NULL,
    ExitWithdrawDate DATE NULL,
    ExitWithdrawTypeDescriptorId INT NULL,
    ClassOfSchoolYear SMALLINT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateTeacherPreparationProviderAssociation_PK PRIMARY KEY (EntryDate, TeacherCandidateIdentifier, TeacherPreparationProviderId)
); 
ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation --
CREATE TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    EndDate DATE NULL,
    ReasonExitedDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherCandidateTeacherPreparationProviderProgramAssociation_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, TeacherCandidateIdentifier)
); 
ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateTelephone --
CREATE TABLE tpdm.TeacherCandidateTelephone (
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TelephoneNumber VARCHAR(24) NOT NULL,
    TelephoneNumberTypeDescriptorId INT NOT NULL,
    OrderOfPriority INT NULL,
    TextMessageCapabilityIndicator BOOLEAN NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateTelephone_PK PRIMARY KEY (TeacherCandidateIdentifier, TelephoneNumber, TelephoneNumberTypeDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateTelephone ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateTPPProgramDegree --
CREATE TABLE tpdm.TeacherCandidateTPPProgramDegree (
    AcademicSubjectDescriptorId INT NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    TPPDegreeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateTPPProgramDegree_PK PRIMARY KEY (AcademicSubjectDescriptorId, GradeLevelDescriptorId, TeacherCandidateIdentifier, TPPDegreeTypeDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateTPPProgramDegree ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherCandidateVisa --
CREATE TABLE tpdm.TeacherCandidateVisa (
    TeacherCandidateIdentifier VARCHAR(32) NOT NULL,
    VisaDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherCandidateVisa_PK PRIMARY KEY (TeacherCandidateIdentifier, VisaDescriptorId)
); 
ALTER TABLE tpdm.TeacherCandidateVisa ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherPreparationProgramTypeDescriptor --
CREATE TABLE tpdm.TeacherPreparationProgramTypeDescriptor (
    TeacherPreparationProgramTypeDescriptorId INT NOT NULL,
    CONSTRAINT TeacherPreparationProgramTypeDescriptor_PK PRIMARY KEY (TeacherPreparationProgramTypeDescriptorId)
); 

-- Table tpdm.TeacherPreparationProvider --
CREATE TABLE tpdm.TeacherPreparationProvider (
    TeacherPreparationProviderId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    UniversityId INT NULL,
    SchoolId INT NULL,
    CONSTRAINT TeacherPreparationProvider_PK PRIMARY KEY (TeacherPreparationProviderId)
); 

-- Table tpdm.TeacherPreparationProviderProgram --
CREATE TABLE tpdm.TeacherPreparationProviderProgram (
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    ProgramId VARCHAR(20) NULL,
    MajorSpecialization VARCHAR(75) NULL,
    MinorSpecialization VARCHAR(75) NULL,
    TeacherPreparationProgramTypeDescriptorId INT NULL,
    TPPProgramPathwayDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT TeacherPreparationProviderProgram_PK PRIMARY KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
); 
ALTER TABLE tpdm.TeacherPreparationProviderProgram ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE tpdm.TeacherPreparationProviderProgram ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.TeacherPreparationProviderProgram ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table tpdm.TeacherPreparationProviderProgramGradeLevel --
CREATE TABLE tpdm.TeacherPreparationProviderProgramGradeLevel (
    EducationOrganizationId INT NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT TeacherPreparationProviderProgramGradeLevel_PK PRIMARY KEY (EducationOrganizationId, GradeLevelDescriptorId, ProgramName, ProgramTypeDescriptorId)
); 
ALTER TABLE tpdm.TeacherPreparationProviderProgramGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table tpdm.ThemeDescriptor --
CREATE TABLE tpdm.ThemeDescriptor (
    ThemeDescriptorId INT NOT NULL,
    CONSTRAINT ThemeDescriptor_PK PRIMARY KEY (ThemeDescriptorId)
); 

-- Table tpdm.TPPDegreeTypeDescriptor --
CREATE TABLE tpdm.TPPDegreeTypeDescriptor (
    TPPDegreeTypeDescriptorId INT NOT NULL,
    CONSTRAINT TPPDegreeTypeDescriptor_PK PRIMARY KEY (TPPDegreeTypeDescriptorId)
); 

-- Table tpdm.TPPProgramPathwayDescriptor --
CREATE TABLE tpdm.TPPProgramPathwayDescriptor (
    TPPProgramPathwayDescriptorId INT NOT NULL,
    CONSTRAINT TPPProgramPathwayDescriptor_PK PRIMARY KEY (TPPProgramPathwayDescriptorId)
); 

-- Table tpdm.University --
CREATE TABLE tpdm.University (
    UniversityId INT NOT NULL,
    FederalLocaleCodeDescriptorId INT NULL,
    SchoolId INT NULL,
    CONSTRAINT University_PK PRIMARY KEY (UniversityId)
); 

-- Table tpdm.ValueTypeDescriptor --
CREATE TABLE tpdm.ValueTypeDescriptor (
    ValueTypeDescriptorId INT NOT NULL,
    CONSTRAINT ValueTypeDescriptor_PK PRIMARY KEY (ValueTypeDescriptorId)
); 

-- Table tpdm.WithdrawReasonDescriptor --
CREATE TABLE tpdm.WithdrawReasonDescriptor (
    WithdrawReasonDescriptorId INT NOT NULL,
    CONSTRAINT WithdrawReasonDescriptor_PK PRIMARY KEY (WithdrawReasonDescriptorId)
); 

