ALTER TABLE [nmped].[AnnualReviewDelayReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_AnnualReviewDelayReasonDescriptor_Descriptor] FOREIGN KEY ([AnnualReviewDelayReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DentalExaminationVerificationCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DentalExaminationVerificationCodeDescriptor_Descriptor] FOREIGN KEY ([DentalExaminationVerificationCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DigitalEquityInternetAccessTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DigitalEquityInternetAccessTypeDescriptor_Descriptor] FOREIGN KEY ([DigitalEquityInternetAccessTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DigitalEquityInternetPerformanceCodeDescriptor_Descriptor] FOREIGN KEY ([DigitalEquityInternetPerformanceCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] WITH CHECK ADD CONSTRAINT [FK_DigitalEquityPrimaryLearningDeviceAccessDescriptor_Descriptor] FOREIGN KEY ([DigitalEquityPrimaryLearningDeviceAccessDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DigitalEquityPrimaryLearningDeviceTypeDescriptor_Descriptor] FOREIGN KEY ([DigitalEquityPrimaryLearningDeviceTypeDescriptorId])
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

ALTER TABLE [nmped].[ExpectedDiplomaTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ExpectedDiplomaTypeDescriptor_Descriptor] FOREIGN KEY ([ExpectedDiplomaTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[GenderIdentityDescriptor] WITH CHECK ADD CONSTRAINT [FK_GenderIdentityDescriptor_Descriptor] FOREIGN KEY ([GenderIdentityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
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

ALTER TABLE [nmped].[LevelOfIntegrationDescriptor] WITH CHECK ADD CONSTRAINT [FK_LevelOfIntegrationDescriptor_Descriptor] FOREIGN KEY ([LevelOfIntegrationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[LocalEducationAgencyTransportation] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyTransportation_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyTransportation_LocalEducationAgency]
ON [nmped].[LocalEducationAgencyTransportation] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [nmped].[LocalEducationAgencyTransportation] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyTransportation_TransportationCategoryDescriptor] FOREIGN KEY ([CategoryDescriptor01TransportationCategoryDescriptorId])
REFERENCES [nmped].[TransportationCategoryDescriptor] ([TransportationCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyTransportation_TransportationCategoryDescriptor]
ON [nmped].[LocalEducationAgencyTransportation] ([CategoryDescriptor01TransportationCategoryDescriptorId] ASC)
GO

ALTER TABLE [nmped].[LocalEducationAgencyTransportation] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyTransportation_TransportationCategoryDescriptor1] FOREIGN KEY ([CategoryDescriptor02TransportationCategoryDescriptorId])
REFERENCES [nmped].[TransportationCategoryDescriptor] ([TransportationCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyTransportation_TransportationCategoryDescriptor1]
ON [nmped].[LocalEducationAgencyTransportation] ([CategoryDescriptor02TransportationCategoryDescriptorId] ASC)
GO

ALTER TABLE [nmped].[LocalEducationAgencyTransportation] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyTransportation_TransportationSetCodeDescriptor] FOREIGN KEY ([TransportationSetCodeDescriptorId])
REFERENCES [nmped].[TransportationSetCodeDescriptor] ([TransportationSetCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyTransportation_TransportationSetCodeDescriptor]
ON [nmped].[LocalEducationAgencyTransportation] ([TransportationSetCodeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[MileageTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MileageTypeDescriptor_Descriptor] FOREIGN KEY ([MileageTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[MilitaryFamilyDescriptor] WITH CHECK ADD CONSTRAINT [FK_MilitaryFamilyDescriptor_Descriptor] FOREIGN KEY ([MilitaryFamilyDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[NMPEDClassPeriodDescriptor] WITH CHECK ADD CONSTRAINT [FK_NMPEDClassPeriodDescriptor_Descriptor] FOREIGN KEY ([NMPEDClassPeriodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[ParticipationInformationDescriptor] WITH CHECK ADD CONSTRAINT [FK_ParticipationInformationDescriptor_Descriptor] FOREIGN KEY ([ParticipationInformationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[PlannedPostGraduateActivityDescriptor] WITH CHECK ADD CONSTRAINT [FK_PlannedPostGraduateActivityDescriptor_Descriptor] FOREIGN KEY ([PlannedPostGraduateActivityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[PreKClassTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_PreKClassTypeDescriptor_Descriptor] FOREIGN KEY ([PreKClassTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[PrimaryAreaOfExceptionalityDescriptor] WITH CHECK ADD CONSTRAINT [FK_PrimaryAreaOfExceptionalityDescriptor_Descriptor] FOREIGN KEY ([PrimaryAreaOfExceptionalityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[ProgramDeliveryMethodDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProgramDeliveryMethodDescriptor_Descriptor] FOREIGN KEY ([ProgramDeliveryMethodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[ProgramIntensityDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProgramIntensityDescriptor_Descriptor] FOREIGN KEY ([ProgramIntensityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[RoadTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_RoadTypeDescriptor_Descriptor] FOREIGN KEY ([RoadTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_NMPEDClassPeriodDescriptor] FOREIGN KEY ([NMPEDClassPeriodDescriptorId])
REFERENCES [nmped].[NMPEDClassPeriodDescriptor] ([NMPEDClassPeriodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionExtension_NMPEDClassPeriodDescriptor]
ON [nmped].[SectionExtension] ([NMPEDClassPeriodDescriptorId] ASC)
GO

ALTER TABLE [nmped].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_PreKClassTypeDescriptor] FOREIGN KEY ([PreKClassTypeDescriptorId])
REFERENCES [nmped].[PreKClassTypeDescriptor] ([PreKClassTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionExtension_PreKClassTypeDescriptor]
ON [nmped].[SectionExtension] ([PreKClassTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [nmped].[ServiceProviderTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ServiceProviderTypeDescriptor_Descriptor] FOREIGN KEY ([ServiceProviderTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[ServiceSettingDescriptor] WITH CHECK ADD CONSTRAINT [FK_ServiceSettingDescriptor_Descriptor] FOREIGN KEY ([ServiceSettingDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialEducationEventReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationEventReasonDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationEventReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialEducationEventTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationEventTypeDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationEventTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialEducationNonComplianceReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationNonComplianceReasonDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationNonComplianceReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[SpecialProgramCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialProgramCodeDescriptor_Descriptor] FOREIGN KEY ([SpecialProgramCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StaffDevelopment] WITH CHECK ADD CONSTRAINT [FK_StaffDevelopment_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffDevelopment_EducationOrganization]
ON [nmped].[StaffDevelopment] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [nmped].[StaffDevelopment] WITH CHECK ADD CONSTRAINT [FK_StaffDevelopment_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffDevelopment_Staff]
ON [nmped].[StaffDevelopment] ([StaffUSI] ASC)
GO

ALTER TABLE [nmped].[StaffDevelopment] WITH CHECK ADD CONSTRAINT [FK_StaffDevelopment_StaffDevelopmentActivityCodeDescriptor] FOREIGN KEY ([StaffDevelopmentActivityCodeDescriptorId])
REFERENCES [nmped].[StaffDevelopmentActivityCodeDescriptor] ([StaffDevelopmentActivityCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffDevelopment_StaffDevelopmentActivityCodeDescriptor]
ON [nmped].[StaffDevelopment] ([StaffDevelopmentActivityCodeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffDevelopment] WITH CHECK ADD CONSTRAINT [FK_StaffDevelopment_StaffDevelopmentPurposeCodeDescriptor] FOREIGN KEY ([StaffDevelopmentPurposeCodeDescriptorId])
REFERENCES [nmped].[StaffDevelopmentPurposeCodeDescriptor] ([StaffDevelopmentPurposeCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffDevelopment_StaffDevelopmentPurposeCodeDescriptor]
ON [nmped].[StaffDevelopment] ([StaffDevelopmentPurposeCodeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffDevelopmentActivityCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffDevelopmentActivityCodeDescriptor_Descriptor] FOREIGN KEY ([StaffDevelopmentActivityCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StaffDevelopmentPurposeCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffDevelopmentPurposeCodeDescriptor_Descriptor] FOREIGN KEY ([StaffDevelopmentPurposeCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_EducationOrganization]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_InternetAccessTypeInResidenceDescriptor] FOREIGN KEY ([InternetAccessTypeInResidenceDescriptorId])
REFERENCES [edfi].[InternetAccessTypeInResidenceDescriptor] ([InternetAccessTypeInResidenceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_InternetAccessTypeInResidenceDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([InternetAccessTypeInResidenceDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_InternetPerformanceInResidenceDescriptor] FOREIGN KEY ([InternetPerformanceInResidenceDescriptorId])
REFERENCES [edfi].[InternetPerformanceInResidenceDescriptor] ([InternetPerformanceInResidenceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_InternetPerformanceInResidenceDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([InternetPerformanceInResidenceDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_PrimaryLearningDeviceAccessDescriptor] FOREIGN KEY ([PrimaryLearningDeviceAccessDescriptorId])
REFERENCES [edfi].[PrimaryLearningDeviceAccessDescriptor] ([PrimaryLearningDeviceAccessDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_PrimaryLearningDeviceAccessDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([PrimaryLearningDeviceAccessDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_PrimaryLearningDeviceAwayFromSchoolDescriptor] FOREIGN KEY ([PrimaryLearningDeviceAwayFromSchoolDescriptorId])
REFERENCES [edfi].[PrimaryLearningDeviceAwayFromSchoolDescriptor] ([PrimaryLearningDeviceAwayFromSchoolDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_PrimaryLearningDeviceAwayFromSchoolDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([PrimaryLearningDeviceAwayFromSchoolDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_PrimaryLearningDeviceProviderDescriptor] FOREIGN KEY ([PrimaryLearningDeviceProviderDescriptorId])
REFERENCES [edfi].[PrimaryLearningDeviceProviderDescriptor] ([PrimaryLearningDeviceProviderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_PrimaryLearningDeviceProviderDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([PrimaryLearningDeviceProviderDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_SchoolYearType]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([SchoolYear] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_Staff]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([StaffUSI] ASC)
GO

ALTER TABLE [nmped].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_LevelOfEducationInstitutionDescriptor] FOREIGN KEY ([HighestCompletedLevelOfEducationInstitutionDescriptorId])
REFERENCES [nmped].[LevelOfEducationInstitutionDescriptor] ([LevelOfEducationInstitutionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_LevelOfEducationInstitutionDescriptor]
ON [nmped].[StaffExtension] ([HighestCompletedLevelOfEducationInstitutionDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_LevelOfEducationInstitutionDescriptor1] FOREIGN KEY ([BaccalaureateLevelOfEducationInstitutionDescriptorId])
REFERENCES [nmped].[LevelOfEducationInstitutionDescriptor] ([LevelOfEducationInstitutionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_LevelOfEducationInstitutionDescriptor1]
ON [nmped].[StaffExtension] ([BaccalaureateLevelOfEducationInstitutionDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentAwardTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentAwardTypeDescriptor_Descriptor] FOREIGN KEY ([StudentAwardTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
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

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_DentalExaminationVerificationCodeDescriptor] FOREIGN KEY ([DentalExaminationVerificationCodeDescriptorId])
REFERENCES [nmped].[DentalExaminationVerificationCodeDescriptor] ([DentalExaminationVerificationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_DentalExaminationVerificationCodeDescriptor]
ON [nmped].[StudentEducationOrganizationAssociationExtension] ([DentalExaminationVerificationCodeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_MilitaryFamilyDescriptor] FOREIGN KEY ([MilitaryFamilyDescriptorId])
REFERENCES [nmped].[MilitaryFamilyDescriptor] ([MilitaryFamilyDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_MilitaryFamilyDescriptor]
ON [nmped].[StudentEducationOrganizationAssociationExtension] ([MilitaryFamilyDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationStudentCharacteristicExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCharacteristicExtension_LevelOfIntegrationDescriptor] FOREIGN KEY ([GiftedLevelOfIntegrationDescriptorId])
REFERENCES [nmped].[LevelOfIntegrationDescriptor] ([LevelOfIntegrationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCharacteristicExtension_LevelOfIntegrationDescriptor]
ON [nmped].[StudentEducationOrganizationAssociationStudentCharacteristicExtension] ([GiftedLevelOfIntegrationDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationStudentCharacteristicExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCharacteristicExtension_StudentEducationOrganizationAssociationStudentCharacter] FOREIGN KEY ([EducationOrganizationId], [StudentCharacteristicDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] ([EducationOrganizationId], [StudentCharacteristicDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_EducationOrganization]
ON [nmped].[StudentEducationOrganizationAward] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_LanguageDescriptor] FOREIGN KEY ([StudentAwardLanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_LanguageDescriptor]
ON [nmped].[StudentEducationOrganizationAward] ([StudentAwardLanguageDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_SchoolYearType]
ON [nmped].[StudentEducationOrganizationAward] ([SchoolYear] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_Student]
ON [nmped].[StudentEducationOrganizationAward] ([StudentUSI] ASC)
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_StudentAwardTypeDescriptor] FOREIGN KEY ([StudentAwardTypeDescriptorId])
REFERENCES [nmped].[StudentAwardTypeDescriptor] ([StudentAwardTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_StudentAwardTypeDescriptor]
ON [nmped].[StudentEducationOrganizationAward] ([StudentAwardTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_GenderIdentityDescriptor] FOREIGN KEY ([GenderIdentityDescriptorId])
REFERENCES [nmped].[GenderIdentityDescriptor] ([GenderIdentityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentExtension_GenderIdentityDescriptor]
ON [nmped].[StudentExtension] ([GenderIdentityDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationExtension_LanguageDescriptor] FOREIGN KEY ([BEPProgramLanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationExtension_LanguageDescriptor]
ON [nmped].[StudentProgramAssociationExtension] ([BEPProgramLanguageDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationExtension_ParticipationInformationDescriptor] FOREIGN KEY ([ParticipationInformationDescriptorId])
REFERENCES [nmped].[ParticipationInformationDescriptor] ([ParticipationInformationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationExtension_ParticipationInformationDescriptor]
ON [nmped].[StudentProgramAssociationExtension] ([ParticipationInformationDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationExtension_ProgramIntensityDescriptor] FOREIGN KEY ([ProgramIntensityDescriptorId])
REFERENCES [nmped].[ProgramIntensityDescriptor] ([ProgramIntensityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationExtension_ProgramIntensityDescriptor]
ON [nmped].[StudentProgramAssociationExtension] ([ProgramIntensityDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationExtension_StudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentProgramAssociationServiceExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationServiceExtension_ServiceProviderTypeDescriptor] FOREIGN KEY ([ServiceProviderTypeDescriptorId])
REFERENCES [nmped].[ServiceProviderTypeDescriptor] ([ServiceProviderTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationServiceExtension_ServiceProviderTypeDescriptor]
ON [nmped].[StudentProgramAssociationServiceExtension] ([ServiceProviderTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentProgramAssociationServiceExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationServiceExtension_ServiceSettingDescriptor] FOREIGN KEY ([ServiceSettingDescriptorId])
REFERENCES [nmped].[ServiceSettingDescriptor] ([ServiceSettingDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAssociationServiceExtension_ServiceSettingDescriptor]
ON [nmped].[StudentProgramAssociationServiceExtension] ([ServiceSettingDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentProgramAssociationServiceExtension] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAssociationServiceExtension_StudentProgramAssociationService] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [ServiceDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentProgramAssociationService] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [ServiceDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAggregateSectionAttendance_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAggregateSectionAttendance_School]
ON [nmped].[StudentSchoolAggregateSectionAttendance] ([SchoolId] ASC)
GO

ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAggregateSectionAttendance_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAggregateSectionAttendance_SchoolYearType]
ON [nmped].[StudentSchoolAggregateSectionAttendance] ([SchoolYear] ASC)
GO

ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAggregateSectionAttendance_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAggregateSectionAttendance_Student]
ON [nmped].[StudentSchoolAggregateSectionAttendance] ([StudentUSI] ASC)
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

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_AnnualReviewDelayReasonDescriptor] FOREIGN KEY ([AnnualReviewDelayReasonDescriptorId])
REFERENCES [nmped].[AnnualReviewDelayReasonDescriptor] ([AnnualReviewDelayReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_AnnualReviewDelayReasonDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([AnnualReviewDelayReasonDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_ExpectedDiplomaTypeDescriptor] FOREIGN KEY ([ExpectedDiplomaTypeDescriptorId])
REFERENCES [nmped].[ExpectedDiplomaTypeDescriptor] ([ExpectedDiplomaTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_ExpectedDiplomaTypeDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([ExpectedDiplomaTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_LevelOfIntegrationDescriptor] FOREIGN KEY ([SpecialEducationLevelOfIntegrationDescriptorId])
REFERENCES [nmped].[LevelOfIntegrationDescriptor] ([LevelOfIntegrationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_LevelOfIntegrationDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([SpecialEducationLevelOfIntegrationDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_PlannedPostGraduateActivityDescriptor] FOREIGN KEY ([PlannedPostGraduateActivityDescriptorId])
REFERENCES [nmped].[PlannedPostGraduateActivityDescriptor] ([PlannedPostGraduateActivityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_PlannedPostGraduateActivityDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([PlannedPostGraduateActivityDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_PrimaryAreaOfExceptionalityDescriptor] FOREIGN KEY ([PrimaryAreaOfExceptionalityDescriptorId])
REFERENCES [nmped].[PrimaryAreaOfExceptionalityDescriptor] ([PrimaryAreaOfExceptionalityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_PrimaryAreaOfExceptionalityDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([PrimaryAreaOfExceptionalityDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_TriennialReviewDelayReasonDescriptor] FOREIGN KEY ([TriennialReviewDelayReasonDescriptorId])
REFERENCES [nmped].[TriennialReviewDelayReasonDescriptor] ([TriennialReviewDelayReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_TriennialReviewDelayReasonDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([TriennialReviewDelayReasonDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_SpecialEducationEventReasonDescriptor] FOREIGN KEY ([SpecialEducationEventReasonDescriptorId])
REFERENCES [nmped].[SpecialEducationEventReasonDescriptor] ([SpecialEducationEventReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_SpecialEducationEventReasonDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ([SpecialEducationEventReasonDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_SpecialEducationEventTypeDescriptor] FOREIGN KEY ([SpecialEducationEventTypeDescriptorId])
REFERENCES [nmped].[SpecialEducationEventTypeDescriptor] ([SpecialEducationEventTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_SpecialEducationEventTypeDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ([SpecialEducationEventTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_SpecialEducationNonComplianceReasonDescriptor] FOREIGN KEY ([SpecialEducationNonComplianceReasonDescriptorId])
REFERENCES [nmped].[SpecialEducationNonComplianceReasonDescriptor] ([SpecialEducationNonComplianceReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_SpecialEducationNonComplianceReasonDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ([SpecialEducationNonComplianceReasonDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_StudentSpecialEducationProgramAssociation]
ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceExtension_StudentSpecialEducationProgramAssociationSpe] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [SpecialEducationProgramServiceDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociationSpecialEducationProgramService] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [SpecialEducationProgramServiceDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[TransportationCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_TransportationCategoryDescriptor_Descriptor] FOREIGN KEY ([TransportationCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[TransportationSetCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_TransportationSetCodeDescriptor_Descriptor] FOREIGN KEY ([TransportationSetCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[TriennialReviewDelayReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_TriennialReviewDelayReasonDescriptor_Descriptor] FOREIGN KEY ([TriennialReviewDelayReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[VehicleBodyManufacturerDescriptor] WITH CHECK ADD CONSTRAINT [FK_VehicleBodyManufacturerDescriptor_Descriptor] FOREIGN KEY ([VehicleBodyManufacturerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[VehicleChassisManufacturerDescriptor] WITH CHECK ADD CONSTRAINT [FK_VehicleChassisManufacturerDescriptor_Descriptor] FOREIGN KEY ([VehicleChassisManufacturerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[VehicleFuelTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_VehicleFuelTypeDescriptor_Descriptor] FOREIGN KEY ([VehicleFuelTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[VehicleMileage] WITH CHECK ADD CONSTRAINT [FK_VehicleMileage_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleMileage_LocalEducationAgency]
ON [nmped].[VehicleMileage] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [nmped].[VehicleMileage] WITH CHECK ADD CONSTRAINT [FK_VehicleMileage_MileageTypeDescriptor] FOREIGN KEY ([MileageTypeDescriptorId])
REFERENCES [nmped].[MileageTypeDescriptor] ([MileageTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleMileage_MileageTypeDescriptor]
ON [nmped].[VehicleMileage] ([MileageTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleMileage] WITH CHECK ADD CONSTRAINT [FK_VehicleMileage_RoadTypeDescriptor] FOREIGN KEY ([RoadTypeDescriptorId])
REFERENCES [nmped].[RoadTypeDescriptor] ([RoadTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleMileage_RoadTypeDescriptor]
ON [nmped].[VehicleMileage] ([RoadTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleMileage] WITH CHECK ADD CONSTRAINT [FK_VehicleMileage_VehicleRouteDescriptor] FOREIGN KEY ([VehicleRouteDescriptorId])
REFERENCES [nmped].[VehicleRouteDescriptor] ([VehicleRouteDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleMileage_VehicleRouteDescriptor]
ON [nmped].[VehicleMileage] ([VehicleRouteDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleRouteDescriptor] WITH CHECK ADD CONSTRAINT [FK_VehicleRouteDescriptor_Descriptor] FOREIGN KEY ([VehicleRouteDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[VehicleSnapshot] WITH CHECK ADD CONSTRAINT [FK_VehicleSnapshot_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleSnapshot_LocalEducationAgency]
ON [nmped].[VehicleSnapshot] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [nmped].[VehicleSnapshot] WITH CHECK ADD CONSTRAINT [FK_VehicleSnapshot_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleSnapshot_SchoolYearType]
ON [nmped].[VehicleSnapshot] ([SchoolYear] ASC)
GO

ALTER TABLE [nmped].[VehicleSnapshot] WITH CHECK ADD CONSTRAINT [FK_VehicleSnapshot_VehicleBodyManufacturerDescriptor] FOREIGN KEY ([VehicleBodyManufacturerDescriptorId])
REFERENCES [nmped].[VehicleBodyManufacturerDescriptor] ([VehicleBodyManufacturerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleSnapshot_VehicleBodyManufacturerDescriptor]
ON [nmped].[VehicleSnapshot] ([VehicleBodyManufacturerDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleSnapshot] WITH CHECK ADD CONSTRAINT [FK_VehicleSnapshot_VehicleChassisManufacturerDescriptor] FOREIGN KEY ([VehicleChassisManufacturerDescriptorId])
REFERENCES [nmped].[VehicleChassisManufacturerDescriptor] ([VehicleChassisManufacturerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleSnapshot_VehicleChassisManufacturerDescriptor]
ON [nmped].[VehicleSnapshot] ([VehicleChassisManufacturerDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleSnapshot] WITH CHECK ADD CONSTRAINT [FK_VehicleSnapshot_VehicleFuelTypeDescriptor] FOREIGN KEY ([VehicleFuelTypeDescriptorId])
REFERENCES [nmped].[VehicleFuelTypeDescriptor] ([VehicleFuelTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleSnapshot_VehicleFuelTypeDescriptor]
ON [nmped].[VehicleSnapshot] ([VehicleFuelTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleSnapshot] WITH CHECK ADD CONSTRAINT [FK_VehicleSnapshot_VehicleTypeDescriptor] FOREIGN KEY ([VehicleTypeDescriptorId])
REFERENCES [nmped].[VehicleTypeDescriptor] ([VehicleTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_VehicleSnapshot_VehicleTypeDescriptor]
ON [nmped].[VehicleSnapshot] ([VehicleTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[VehicleTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_VehicleTypeDescriptor_Descriptor] FOREIGN KEY ([VehicleTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

