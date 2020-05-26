-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE grandbend.Applicant ADD CONSTRAINT FK_0a1ce1_AcademicSubjectDescriptor FOREIGN KEY (HighlyQualifiedAcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_0a1ce1_AcademicSubjectDescriptor
ON grandbend.Applicant (HighlyQualifiedAcademicSubjectDescriptorId ASC);

ALTER TABLE grandbend.Applicant ADD CONSTRAINT FK_0a1ce1_CitizenshipStatusDescriptor FOREIGN KEY (CitizenshipStatusDescriptorId)
REFERENCES edfi.CitizenshipStatusDescriptor (CitizenshipStatusDescriptorId)
;

CREATE INDEX FK_0a1ce1_CitizenshipStatusDescriptor
ON grandbend.Applicant (CitizenshipStatusDescriptorId ASC);

ALTER TABLE grandbend.Applicant ADD CONSTRAINT FK_0a1ce1_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_0a1ce1_EducationOrganization
ON grandbend.Applicant (EducationOrganizationId ASC);

ALTER TABLE grandbend.Applicant ADD CONSTRAINT FK_0a1ce1_LevelOfEducationDescriptor FOREIGN KEY (HighestCompletedLevelOfEducationDescriptorId)
REFERENCES edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorId)
;

CREATE INDEX FK_0a1ce1_LevelOfEducationDescriptor
ON grandbend.Applicant (HighestCompletedLevelOfEducationDescriptorId ASC);

ALTER TABLE grandbend.Applicant ADD CONSTRAINT FK_0a1ce1_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_0a1ce1_SexDescriptor
ON grandbend.Applicant (SexDescriptorId ASC);

ALTER TABLE grandbend.ApplicantAddress ADD CONSTRAINT FK_1a0157_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorId)
REFERENCES edfi.AddressTypeDescriptor (AddressTypeDescriptorId)
;

CREATE INDEX FK_1a0157_AddressTypeDescriptor
ON grandbend.ApplicantAddress (AddressTypeDescriptorId ASC);

ALTER TABLE grandbend.ApplicantAddress ADD CONSTRAINT FK_1a0157_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES grandbend.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_1a0157_Applicant
ON grandbend.ApplicantAddress (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE grandbend.ApplicantAddress ADD CONSTRAINT FK_1a0157_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorId)
REFERENCES edfi.StateAbbreviationDescriptor (StateAbbreviationDescriptorId)
;

CREATE INDEX FK_1a0157_StateAbbreviationDescriptor
ON grandbend.ApplicantAddress (StateAbbreviationDescriptorId ASC);

ALTER TABLE grandbend.StaffExtension ADD CONSTRAINT FK_d7b81a_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

