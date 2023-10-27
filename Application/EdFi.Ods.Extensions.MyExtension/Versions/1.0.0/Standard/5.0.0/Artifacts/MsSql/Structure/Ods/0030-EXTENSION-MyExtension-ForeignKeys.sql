-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [myextension].[InstitutionControlDescriptor] WITH CHECK ADD CONSTRAINT [FK_InstitutionControlDescriptor_Descriptor] FOREIGN KEY ([InstitutionControlDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[InstitutionLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_InstitutionLevelDescriptor_Descriptor] FOREIGN KEY ([InstitutionLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[PostSecondaryOrganization] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryOrganization_InstitutionControlDescriptor] FOREIGN KEY ([InstitutionControlDescriptorId])
REFERENCES [myextension].[InstitutionControlDescriptor] ([InstitutionControlDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryOrganization_InstitutionControlDescriptor]
ON [myextension].[PostSecondaryOrganization] ([InstitutionControlDescriptorId] ASC)
GO

ALTER TABLE [myextension].[PostSecondaryOrganization] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryOrganization_InstitutionLevelDescriptor] FOREIGN KEY ([InstitutionLevelDescriptorId])
REFERENCES [myextension].[InstitutionLevelDescriptor] ([InstitutionLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryOrganization_InstitutionLevelDescriptor]
ON [myextension].[PostSecondaryOrganization] ([InstitutionLevelDescriptorId] ASC)
GO

ALTER TABLE [myextension].[SpecialEducationGraduationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationGraduationStatusDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationGraduationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[StudentAcademicRecordClassRankingExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordClassRankingExtension_SpecialEducationGraduationStatusDescriptor] FOREIGN KEY ([SpecialEducationGraduationStatusDescriptorId])
REFERENCES [myextension].[SpecialEducationGraduationStatusDescriptor] ([SpecialEducationGraduationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordClassRankingExtension_SpecialEducationGraduationStatusDescriptor]
ON [myextension].[StudentAcademicRecordClassRankingExtension] ([SpecialEducationGraduationStatusDescriptorId] ASC)
GO

ALTER TABLE [myextension].[StudentAcademicRecordClassRankingExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordClassRankingExtension_StudentAcademicRecordClassRanking] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfi].[StudentAcademicRecordClassRanking] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[StudentAcademicRecordExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordExtension_PostSecondaryOrganization] FOREIGN KEY ([NameOfInstitution])
REFERENCES [myextension].[PostSecondaryOrganization] ([NameOfInstitution])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordExtension_PostSecondaryOrganization]
ON [myextension].[StudentAcademicRecordExtension] ([NameOfInstitution] ASC)
GO

ALTER TABLE [myextension].[StudentAcademicRecordExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordExtension_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfi].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[StudentAcademicRecordExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordExtension_SubmissionCertificationDescriptor] FOREIGN KEY ([SubmissionCertificationDescriptorId])
REFERENCES [myextension].[SubmissionCertificationDescriptor] ([SubmissionCertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordExtension_SubmissionCertificationDescriptor]
ON [myextension].[StudentAcademicRecordExtension] ([SubmissionCertificationDescriptorId] ASC)
GO

ALTER TABLE [myextension].[StudentAcademicRecordStudentCensusBlockGroup] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordStudentCensusBlockGroup_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfi].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[StudentAcademicRecordStudentCensusBlockGroupPeriod] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordStudentCensusBlockGroupPeriod_StudentAcademicRecordStudentCensusBlockGroup] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [myextension].[StudentAcademicRecordStudentCensusBlockGroup] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [myextension].[SubmissionCertificationDescriptor] WITH CHECK ADD CONSTRAINT [FK_SubmissionCertificationDescriptor_Descriptor] FOREIGN KEY ([SubmissionCertificationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

