-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table myextension.InstitutionControlDescriptor --
CREATE TABLE myextension.InstitutionControlDescriptor (
    InstitutionControlDescriptorId INT NOT NULL,
    CONSTRAINT InstitutionControlDescriptor_PK PRIMARY KEY (InstitutionControlDescriptorId)
);

-- Table myextension.InstitutionLevelDescriptor --
CREATE TABLE myextension.InstitutionLevelDescriptor (
    InstitutionLevelDescriptorId INT NOT NULL,
    CONSTRAINT InstitutionLevelDescriptor_PK PRIMARY KEY (InstitutionLevelDescriptorId)
);

-- Table myextension.PostSecondaryOrganization --
CREATE TABLE myextension.PostSecondaryOrganization (
    NameOfInstitution VARCHAR(75) NOT NULL,
    AcceptanceIndicator BOOLEAN NOT NULL,
    InstitutionControlDescriptorId INT NOT NULL,
    InstitutionLevelDescriptorId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PostSecondaryOrganization_PK PRIMARY KEY (NameOfInstitution)
);
ALTER TABLE myextension.PostSecondaryOrganization ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE myextension.PostSecondaryOrganization ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE myextension.PostSecondaryOrganization ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table myextension.SpecialEducationGraduationStatusDescriptor --
CREATE TABLE myextension.SpecialEducationGraduationStatusDescriptor (
    SpecialEducationGraduationStatusDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationGraduationStatusDescriptor_PK PRIMARY KEY (SpecialEducationGraduationStatusDescriptorId)
);

-- Table myextension.StudentAcademicRecordClassRankingExtension --
CREATE TABLE myextension.StudentAcademicRecordClassRankingExtension (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    SpecialEducationGraduationStatusDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordClassRankingExtension_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
);
ALTER TABLE myextension.StudentAcademicRecordClassRankingExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table myextension.StudentAcademicRecordExtension --
CREATE TABLE myextension.StudentAcademicRecordExtension (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    NameOfInstitution VARCHAR(75) NULL,
    SubmissionCertificationDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordExtension_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
);
ALTER TABLE myextension.StudentAcademicRecordExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table myextension.StudentAcademicRecordStudentCensusBlockGroup --
CREATE TABLE myextension.StudentAcademicRecordStudentCensusBlockGroup (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    StudentCensusBlockGroup VARCHAR(12) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordStudentCensusBlockGroup_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
);
ALTER TABLE myextension.StudentAcademicRecordStudentCensusBlockGroup ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod --
CREATE TABLE myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordStudentCensusBlockGroupPeriod_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId, BeginDate)
);
ALTER TABLE myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table myextension.SubmissionCertificationDescriptor --
CREATE TABLE myextension.SubmissionCertificationDescriptor (
    SubmissionCertificationDescriptorId INT NOT NULL,
    CONSTRAINT SubmissionCertificationDescriptor_PK PRIMARY KEY (SubmissionCertificationDescriptorId)
);

