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

-- Table nmped.ProgramDeliveryMethodDescriptor --
CREATE TABLE nmped.ProgramDeliveryMethodDescriptor (
    ProgramDeliveryMethodDescriptorId INT NOT NULL,
    CONSTRAINT ProgramDeliveryMethodDescriptor_PK PRIMARY KEY (ProgramDeliveryMethodDescriptorId)
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

