ALTER TABLE [nmped].[ClassPeriodDescriptor] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodDescriptor_Descriptor] FOREIGN KEY ([ClassPeriodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DirectCertificationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_DirectCertificationStatusDescriptor_Descriptor] FOREIGN KEY ([DirectCertificationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DisciplineIncidentExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentExtension_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[IndustryCredentialDescriptor] WITH CHECK ADD CONSTRAINT [FK_IndustryCredentialDescriptor_Descriptor] FOREIGN KEY ([IndustryCredentialDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[LevelOfEducationInstitutionDescriptor] WITH CHECK ADD CONSTRAINT [FK_LevelOfEducationInstitutionDescriptor_Descriptor] FOREIGN KEY ([LevelOfEducationInstitutionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[NMPEDService] WITH CHECK ADD CONSTRAINT [FK_NMPEDService_SerivceSettingDescriptor] FOREIGN KEY ([SerivceSettingDescriptorId])
REFERENCES [nmped].[SerivceSettingDescriptor] ([SerivceSettingDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NMPEDService_SerivceSettingDescriptor]
ON [nmped].[NMPEDService] ([SerivceSettingDescriptorId] ASC)
GO

ALTER TABLE [nmped].[NMPEDService] WITH CHECK ADD CONSTRAINT [FK_NMPEDService_ServiceDescriptor] FOREIGN KEY ([ServiceDescriptorId])
REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId])
GO

ALTER TABLE [nmped].[NMPEDService] WITH CHECK ADD CONSTRAINT [FK_NMPEDService_ServiceProviderTypeDescriptor] FOREIGN KEY ([ServiceProviderTypeDescriptorId])
REFERENCES [nmped].[ServiceProviderTypeDescriptor] ([ServiceProviderTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NMPEDService_ServiceProviderTypeDescriptor]
ON [nmped].[NMPEDService] ([ServiceProviderTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[ProgramDeliveryMethodDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProgramDeliveryMethodDescriptor_Descriptor] FOREIGN KEY ([ProgramDeliveryMethodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SerivceSettingDescriptor] WITH CHECK ADD CONSTRAINT [FK_SerivceSettingDescriptor_Descriptor] FOREIGN KEY ([SerivceSettingDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[ServiceProviderTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ServiceProviderTypeDescriptor_Descriptor] FOREIGN KEY ([ServiceProviderTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialEducationLevelOfIntegrationDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationLevelOfIntegrationDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationLevelOfIntegrationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialProgramCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialProgramCodeDescriptor_Descriptor] FOREIGN KEY ([SpecialProgramCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_LevelOfEducationInstitutionDescriptor] FOREIGN KEY ([HighestCompletedLevelOfEducationInstitutionDescriptorId])
REFERENCES [nmped].[LevelOfEducationInstitutionDescriptor] ([LevelOfEducationInstitutionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_LevelOfEducationInstitutionDescriptor]
ON [nmped].[StaffExtension] ([HighestCompletedLevelOfEducationInstitutionDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_LevelOfEducationInstitutionDescriptor1] FOREIGN KEY ([BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId])
REFERENCES [nmped].[LevelOfEducationInstitutionDescriptor] ([LevelOfEducationInstitutionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_LevelOfEducationInstitutionDescriptor1]
ON [nmped].[StaffExtension] ([BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StaffSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffSectionAssociationExtension_ClassPeriodDescriptor] FOREIGN KEY ([ClassPeriodDescriptorId])
REFERENCES [nmped].[ClassPeriodDescriptor] ([ClassPeriodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffSectionAssociationExtension_ClassPeriodDescriptor]
ON [nmped].[StaffSectionAssociationExtension] ([ClassPeriodDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffSectionAssociationExtension_StaffSectionAssociation] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StaffUSI])
REFERENCES [edfi].[StaffSectionAssociation] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StaffUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [nmped].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_IndustryCredentialDescriptor] FOREIGN KEY ([IndustryCredentialDescriptorId])
REFERENCES [nmped].[IndustryCredentialDescriptor] ([IndustryCredentialDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationExtension_IndustryCredentialDescriptor]
ON [nmped].[StudentCTEProgramAssociationExtension] ([IndustryCredentialDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_ProgramDeliveryMethodDescriptor] FOREIGN KEY ([ProgramDeliveryMethodDescriptorId])
REFERENCES [nmped].[ProgramDeliveryMethodDescriptor] ([ProgramDeliveryMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationExtension_ProgramDeliveryMethodDescriptor]
ON [nmped].[StudentCTEProgramAssociationExtension] ([ProgramDeliveryMethodDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_StudentCTEProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentCTEProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentProgramAssociationNMPEDService] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationNMPEDService_NMPEDService] FOREIGN KEY ([ServiceDescriptorId])
REFERENCES [nmped].[NMPEDService] ([ServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationNMPEDService_NMPEDService]
ON [nmped].[StudentProgramAssociationNMPEDService] ([ServiceDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentProgramAssociationNMPEDService] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationNMPEDService_StudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationNMPEDService_StudentProgramAssociation]
ON [nmped].[StudentProgramAssociationNMPEDService] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
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

ALTER TABLE [nmped].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_SpecialProgramCodeDescriptor] FOREIGN KEY ([SpecialProgramCodeDescriptorId])
REFERENCES [nmped].[SpecialProgramCodeDescriptor] ([SpecialProgramCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_SpecialProgramCodeDescriptor]
ON [nmped].[StudentSectionAssociationExtension] ([SpecialProgramCodeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
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

