-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [grandbend].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_AcademicSubjectDescriptor] FOREIGN KEY ([HighlyQualifiedAcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_AcademicSubjectDescriptor]
ON [grandbend].[Applicant] ([HighlyQualifiedAcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [grandbend].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_CitizenshipStatusDescriptor] FOREIGN KEY ([CitizenshipStatusDescriptorId])
REFERENCES [edfi].[CitizenshipStatusDescriptor] ([CitizenshipStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_CitizenshipStatusDescriptor]
ON [grandbend].[Applicant] ([CitizenshipStatusDescriptorId] ASC)
GO

ALTER TABLE [grandbend].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_EducationOrganization]
ON [grandbend].[Applicant] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [grandbend].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_LevelOfEducationDescriptor] FOREIGN KEY ([HighestCompletedLevelOfEducationDescriptorId])
REFERENCES [edfi].[LevelOfEducationDescriptor] ([LevelOfEducationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_LevelOfEducationDescriptor]
ON [grandbend].[Applicant] ([HighestCompletedLevelOfEducationDescriptorId] ASC)
GO

ALTER TABLE [grandbend].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_SexDescriptor]
ON [grandbend].[Applicant] ([SexDescriptorId] ASC)
GO

ALTER TABLE [grandbend].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_AddressTypeDescriptor]
ON [grandbend].[ApplicantAddress] ([AddressTypeDescriptorId] ASC)
GO

ALTER TABLE [grandbend].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [grandbend].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_Applicant]
ON [grandbend].[ApplicantAddress] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [grandbend].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_StateAbbreviationDescriptor] FOREIGN KEY ([StateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_StateAbbreviationDescriptor]
ON [grandbend].[ApplicantAddress] ([StateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [grandbend].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

