-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Extended Properties [myextension].[InstitutionControlDescriptor] --
COMMENT ON TABLE myextension.InstitutionControlDescriptor IS 'The type of control for an institution (e.g., public or private).';
COMMENT ON COLUMN myextension.InstitutionControlDescriptor.InstitutionControlDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [myextension].[InstitutionLevelDescriptor] --
COMMENT ON TABLE myextension.InstitutionLevelDescriptor IS 'The typical level of postsecondary degree offered by the institute.';
COMMENT ON COLUMN myextension.InstitutionLevelDescriptor.InstitutionLevelDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [myextension].[PostSecondaryOrganization] --
COMMENT ON TABLE myextension.PostSecondaryOrganization IS 'PostSecondaryOrganization';
COMMENT ON COLUMN myextension.PostSecondaryOrganization.NameOfInstitution IS 'The name of the institution.';
COMMENT ON COLUMN myextension.PostSecondaryOrganization.AcceptanceIndicator IS 'An indication of acceptance.';
COMMENT ON COLUMN myextension.PostSecondaryOrganization.InstitutionControlDescriptorId IS 'The type of control of the institution (i.e., public or private).';
COMMENT ON COLUMN myextension.PostSecondaryOrganization.InstitutionLevelDescriptorId IS 'The level of the institution.';

-- Extended Properties [myextension].[SpecialEducationGraduationStatusDescriptor] --
COMMENT ON TABLE myextension.SpecialEducationGraduationStatusDescriptor IS 'The graduation status for special education.';
COMMENT ON COLUMN myextension.SpecialEducationGraduationStatusDescriptor.SpecialEducationGraduationStatusDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [myextension].[StudentAcademicRecordClassRankingExtension] --
COMMENT ON TABLE myextension.StudentAcademicRecordClassRankingExtension IS 'Class Ranking Extension';
COMMENT ON COLUMN myextension.StudentAcademicRecordClassRankingExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN myextension.StudentAcademicRecordClassRankingExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordClassRankingExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN myextension.StudentAcademicRecordClassRankingExtension.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordClassRankingExtension.SpecialEducationGraduationStatusDescriptorId IS 'The graduation status for special education.';

-- Extended Properties [myextension].[StudentAcademicRecordExtension] --
COMMENT ON TABLE myextension.StudentAcademicRecordExtension IS '';
COMMENT ON COLUMN myextension.StudentAcademicRecordExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN myextension.StudentAcademicRecordExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN myextension.StudentAcademicRecordExtension.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordExtension.NameOfInstitution IS 'The name of the institution.';
COMMENT ON COLUMN myextension.StudentAcademicRecordExtension.SubmissionCertificationDescriptorId IS 'The type of submission certification.';

-- Extended Properties [myextension].[StudentAcademicRecordStudentCensusBlockGroup] --
COMMENT ON TABLE myextension.StudentAcademicRecordStudentCensusBlockGroup IS 'Student Census Block Group';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroup.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroup.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroup.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroup.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroup.StudentCensusBlockGroup IS 'StudentCensusBlockGroup indicates the census block in which the student resides. TESTAJH';

-- Extended Properties [myextension].[StudentAcademicRecordStudentCensusBlockGroupPeriod] --
COMMENT ON TABLE myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod IS 'The time periods for which the StudentCensusBlockGroup is valid.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod.BeginDate IS 'The month, day, and year for the start of the period.';
COMMENT ON COLUMN myextension.StudentAcademicRecordStudentCensusBlockGroupPeriod.EndDate IS 'The month, day, and year for the end of the period.';

-- Extended Properties [myextension].[SubmissionCertificationDescriptor] --
COMMENT ON TABLE myextension.SubmissionCertificationDescriptor IS 'The type of submission certification.';
COMMENT ON COLUMN myextension.SubmissionCertificationDescriptor.SubmissionCertificationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

