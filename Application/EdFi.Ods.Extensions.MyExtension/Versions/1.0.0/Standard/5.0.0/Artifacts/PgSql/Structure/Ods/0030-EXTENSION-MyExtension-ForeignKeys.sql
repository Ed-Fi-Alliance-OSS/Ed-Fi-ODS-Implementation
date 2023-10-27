-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE myextension.InstitutionControlDescriptor ADD CONSTRAINT FK_f8fa08_Descriptor FOREIGN KEY (InstitutionControlDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.InstitutionLevelDescriptor ADD CONSTRAINT FK_3d8765_Descriptor FOREIGN KEY (InstitutionLevelDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.PostSecondaryOrganization ADD CONSTRAINT FK_aa7b2a_InstitutionControlDescriptor FOREIGN KEY (InstitutionControlDescriptorId)
REFERENCES myextension.InstitutionControlDescriptor (InstitutionControlDescriptorId)
;

CREATE INDEX FK_aa7b2a_InstitutionControlDescriptor
ON myextension.PostSecondaryOrganization (InstitutionControlDescriptorId ASC);

ALTER TABLE myextension.PostSecondaryOrganization ADD CONSTRAINT FK_aa7b2a_InstitutionLevelDescriptor FOREIGN KEY (InstitutionLevelDescriptorId)
REFERENCES myextension.InstitutionLevelDescriptor (InstitutionLevelDescriptorId)
;

CREATE INDEX FK_aa7b2a_InstitutionLevelDescriptor
ON myextension.PostSecondaryOrganization (InstitutionLevelDescriptorId ASC);

ALTER TABLE myextension.SpecialEducationGraduationStatusDescriptor ADD CONSTRAINT FK_a7b9e2_Descriptor FOREIGN KEY (SpecialEducationGraduationStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.StudentAcademicRecordClassRankingExtension ADD CONSTRAINT FK_072d36_SpecialEducationGraduationStatusDescriptor FOREIGN KEY (SpecialEducationGraduationStatusDescriptorId)
REFERENCES myextension.SpecialEducationGraduationStatusDescriptor (SpecialEducationGraduationStatusDescriptorId)
;

CREATE INDEX FK_072d36_SpecialEducationGraduationStatusDescriptor
ON myextension.StudentAcademicRecordClassRankingExtension (SpecialEducationGraduationStatusDescriptorId ASC);

ALTER TABLE myextension.StudentAcademicRecordClassRankingExtension ADD CONSTRAINT FK_072d36_StudentAcademicRecordClassRanking FOREIGN KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
REFERENCES edfi.StudentAcademicRecordClassRanking (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.StudentAcademicRecordExtension ADD CONSTRAINT FK_ee832f_PostSecondaryOrganization FOREIGN KEY (NameOfInstitution)
REFERENCES myextension.PostSecondaryOrganization (NameOfInstitution)
;

CREATE INDEX FK_ee832f_PostSecondaryOrganization
ON myextension.StudentAcademicRecordExtension (NameOfInstitution ASC);

ALTER TABLE myextension.StudentAcademicRecordExtension ADD CONSTRAINT FK_ee832f_StudentAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
REFERENCES edfi.StudentAcademicRecord (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.StudentAcademicRecordExtension ADD CONSTRAINT FK_ee832f_SubmissionCertificationDescriptor FOREIGN KEY (SubmissionCertificationDescriptorId)
REFERENCES myextension.SubmissionCertificationDescriptor (SubmissionCertificationDescriptorId)
;

CREATE INDEX FK_ee832f_SubmissionCertificationDescriptor
ON myextension.StudentAcademicRecordExtension (SubmissionCertificationDescriptorId ASC);

ALTER TABLE myextension.StudentAcademicRecordStudentCensusBlockGroup ADD CONSTRAINT FK_f8efb4_StudentAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
REFERENCES edfi.StudentAcademicRecord (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod ADD CONSTRAINT FK_0d7693_StudentAcademicRecordStudentCensusBlockGroup FOREIGN KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
REFERENCES myextension.StudentAcademicRecordStudentCensusBlockGroup (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE myextension.SubmissionCertificationDescriptor ADD CONSTRAINT FK_caf4be_Descriptor FOREIGN KEY (SubmissionCertificationDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

