-- Table nmped.DirectCertificationStatusDescriptor --
CREATE TABLE nmped.DirectCertificationStatusDescriptor (
    DirectCertificationStatusDescriptorId INT NOT NULL,
    CONSTRAINT DirectCertificationStatusDescriptor_PK PRIMARY KEY (DirectCertificationStatusDescriptorId)
); 

-- Table nmped.SpecialEducationLevelOfIntegrationDescriptor --
CREATE TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor (
    SpecialEducationLevelOfIntegrationDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationLevelOfIntegrationDescriptor_PK PRIMARY KEY (SpecialEducationLevelOfIntegrationDescriptorId)
); 

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

