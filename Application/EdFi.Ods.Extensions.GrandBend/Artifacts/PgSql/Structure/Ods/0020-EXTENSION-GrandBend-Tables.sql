-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table grandbend.Applicant --
CREATE TABLE grandbend.Applicant (
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
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Applicant_PK PRIMARY KEY (ApplicantIdentifier, EducationOrganizationId)
); 
ALTER TABLE grandbend.Applicant ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE grandbend.Applicant ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE grandbend.Applicant ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table grandbend.ApplicantAddress --
CREATE TABLE grandbend.ApplicantAddress (
    AddressTypeDescriptorId INT NOT NULL,
    ApplicantIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    ApartmentRoomSuiteNumber VARCHAR(50) NULL,
    BuildingSiteNumber VARCHAR(20) NULL,
    City VARCHAR(30) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    NameOfCounty VARCHAR(30) NULL,
    CountyFIPSCode VARCHAR(5) NULL,
    Latitude VARCHAR(20) NULL,
    Longitude VARCHAR(20) NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ApplicantAddress_PK PRIMARY KEY (AddressTypeDescriptorId, ApplicantIdentifier, EducationOrganizationId)
); 
ALTER TABLE grandbend.ApplicantAddress ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table grandbend.StaffExtension --
CREATE TABLE grandbend.StaffExtension (
    StaffUSI INT NOT NULL,
    ProbationCompleteDate DATE NULL,
    Tenured BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffExtension_PK PRIMARY KEY (StaffUSI)
); 
ALTER TABLE grandbend.StaffExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

