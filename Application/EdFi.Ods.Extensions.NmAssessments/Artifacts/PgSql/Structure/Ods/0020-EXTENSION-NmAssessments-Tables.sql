-- Table nmassessments.ItemDescriptionCodeDescriptor --
CREATE TABLE nmassessments.ItemDescriptionCodeDescriptor (
    ItemDescriptionCodeDescriptorId INT NOT NULL,
    CONSTRAINT ItemDescriptionCodeDescriptor_PK PRIMARY KEY (ItemDescriptionCodeDescriptorId)
); 

-- Table nmassessments.NmStudentAssessment --
CREATE TABLE nmassessments.NmStudentAssessment (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    TestDate DATE NOT NULL,
    TestDescriptionDescriptorId INT NOT NULL,
    StandardAchievedCodeDescriptorId INT NULL,
    ItemDescriptionCodeDescriptorId INT NULL,
    RawScore INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT NmStudentAssessment_PK PRIMARY KEY (EducationOrganizationId, StudentUSI, TestDate, TestDescriptionDescriptorId)
); 
ALTER TABLE nmassessments.NmStudentAssessment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE nmassessments.NmStudentAssessment ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE nmassessments.NmStudentAssessment ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table nmassessments.StandardAchievedCodeDescriptor --
CREATE TABLE nmassessments.StandardAchievedCodeDescriptor (
    StandardAchievedCodeDescriptorId INT NOT NULL,
    CONSTRAINT StandardAchievedCodeDescriptor_PK PRIMARY KEY (StandardAchievedCodeDescriptorId)
); 

-- Table nmassessments.TestDescriptionDescriptor --
CREATE TABLE nmassessments.TestDescriptionDescriptor (
    TestDescriptionDescriptorId INT NOT NULL,
    CONSTRAINT TestDescriptionDescriptor_PK PRIMARY KEY (TestDescriptionDescriptorId)
); 

