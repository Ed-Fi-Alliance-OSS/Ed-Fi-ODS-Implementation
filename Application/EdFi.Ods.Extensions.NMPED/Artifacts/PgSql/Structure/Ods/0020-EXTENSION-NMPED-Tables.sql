-- Table nmped.ClassPeriodDescriptor --
CREATE TABLE nmped.ClassPeriodDescriptor (
    ClassPeriodDescriptorId INT NOT NULL,
    CONSTRAINT ClassPeriodDescriptor_PK PRIMARY KEY (ClassPeriodDescriptorId)
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
    SerivceSettingDescriptorId INT NULL,
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

-- Table nmped.ProgramDeliveryMethodDescriptor --
CREATE TABLE nmped.ProgramDeliveryMethodDescriptor (
    ProgramDeliveryMethodDescriptorId INT NOT NULL,
    CONSTRAINT ProgramDeliveryMethodDescriptor_PK PRIMARY KEY (ProgramDeliveryMethodDescriptorId)
); 

-- Table nmped.SerivceSettingDescriptor --
CREATE TABLE nmped.SerivceSettingDescriptor (
    SerivceSettingDescriptorId INT NOT NULL,
    CONSTRAINT SerivceSettingDescriptor_PK PRIMARY KEY (SerivceSettingDescriptorId)
); 

-- Table nmped.ServiceProviderTypeDescriptor --
CREATE TABLE nmped.ServiceProviderTypeDescriptor (
    ServiceProviderTypeDescriptorId INT NOT NULL,
    CONSTRAINT ServiceProviderTypeDescriptor_PK PRIMARY KEY (ServiceProviderTypeDescriptorId)
); 

-- Table nmped.SpecialEducationLevelOfIntegrationDescriptor --
CREATE TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor (
    SpecialEducationLevelOfIntegrationDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationLevelOfIntegrationDescriptor_PK PRIMARY KEY (SpecialEducationLevelOfIntegrationDescriptorId)
); 

-- Table nmped.SpecialProgramCodeDescriptor --
CREATE TABLE nmped.SpecialProgramCodeDescriptor (
    SpecialProgramCodeDescriptorId INT NOT NULL,
    CONSTRAINT SpecialProgramCodeDescriptor_PK PRIMARY KEY (SpecialProgramCodeDescriptorId)
); 

-- Table nmped.StaffEducationOrganizationAssignmentAssociationExtension --
CREATE TABLE nmped.StaffEducationOrganizationAssignmentAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StaffClassificationDescriptorId INT NOT NULL,
    StaffUSI INT NOT NULL,
    FullTimeEquivalency DECIMAL(5, 4) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEducationOrganizationAssignmentAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
); 
ALTER TABLE nmped.StaffEducationOrganizationAssignmentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table nmped.StaffExtension --
CREATE TABLE nmped.StaffExtension (
    StaffUSI INT NOT NULL,
    HighestCompletedLevelOfEducationInstitutionDescriptorId INT NOT NULL,
    BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId INT NOT NULL,
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
    ClassPeriodDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffSectionAssociationExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI)
); 
ALTER TABLE nmped.StaffSectionAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

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
    YearsInUSSchool DATE NULL,
    Grade09Entry DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, StudentUSI)
); 
ALTER TABLE nmped.StudentEducationOrganizationAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

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
    SpecialProgramCodeDescriptorId INT NOT NULL,
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
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

