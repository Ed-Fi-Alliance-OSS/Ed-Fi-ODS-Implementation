ALTER TABLE [nmped].[DirectCertificationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_DirectCertificationStatusDescriptor_Descriptor] FOREIGN KEY ([DirectCertificationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialEducationLevelOfIntegrationDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationLevelOfIntegrationDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationLevelOfIntegrationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolFoodServiceProgramAssociationExtension_DirectCertificationStatusDescriptor] FOREIGN KEY ([DirectCertificationStatusDescriptorId])
REFERENCES [nmped].[DirectCertificationStatusDescriptor] ([DirectCertificationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolFoodServiceProgramAssociationExtension_DirectCertificationStatusDescriptor]
ON [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] ([DirectCertificationStatusDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSchoolFoodServiceProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolFoodServiceProgramAssociationExtension_StudentSchoolFoodServiceProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolFoodServiceProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_SpecialEducationLevelOfIntegrationDescriptor] FOREIGN KEY ([SpecialEducationLevelOfIntegrationDescriptorId])
REFERENCES [nmped].[SpecialEducationLevelOfIntegrationDescriptor] ([SpecialEducationLevelOfIntegrationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_SpecialEducationLevelOfIntegrationDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([SpecialEducationLevelOfIntegrationDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

