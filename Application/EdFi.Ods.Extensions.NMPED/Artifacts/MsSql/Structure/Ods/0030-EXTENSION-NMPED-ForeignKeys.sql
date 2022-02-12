ALTER TABLE [nmped].[AnnualReviewDelayReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_AnnualReviewDelayReasonDescriptor_Descriptor] FOREIGN KEY ([AnnualReviewDelayReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[ClassPeriodDescriptor] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodDescriptor_Descriptor] FOREIGN KEY ([ClassPeriodDescriptorId])
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

ALTER TABLE [nmped].[NMPEDService] WITH CHECK ADD CONSTRAINT [FK_NMPEDService_ServiceDescriptor] FOREIGN KEY ([ServiceDescriptorId])
REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId])
GO

ALTER TABLE [nmped].[NMPEDService] WITH CHECK ADD CONSTRAINT [FK_NMPEDService_ServiceProviderTypeDescriptor] FOREIGN KEY ([ServiceProviderTypeDescriptorId])
REFERENCES [nmped].[ServiceProviderTypeDescriptor] ([ServiceProviderTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NMPEDService_ServiceProviderTypeDescriptor]
ON [nmped].[NMPEDService] ([ServiceProviderTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[NMPEDService] WITH CHECK ADD CONSTRAINT [FK_NMPEDService_ServiceSettingDescriptor] FOREIGN KEY ([ServiceSettingDescriptorId])
REFERENCES [nmped].[ServiceSettingDescriptor] ([ServiceSettingDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NMPEDService_ServiceSettingDescriptor]
ON [nmped].[NMPEDService] ([ServiceSettingDescriptorId] ASC)
GO

ALTER TABLE [nmped].[ParticipationInformationDescriptor] WITH CHECK ADD CONSTRAINT [FK_ParticipationInformationDescriptor_Descriptor] FOREIGN KEY ([ParticipationInformationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[PlannedPostGraduateActivityDescriptor] WITH CHECK ADD CONSTRAINT [FK_PlannedPostGraduateActivityDescriptor_Descriptor] FOREIGN KEY ([PlannedPostGraduateActivityDescriptorId])
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

ALTER TABLE [nmped].[SpecialEducationLevelOfIntegrationDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationLevelOfIntegrationDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationLevelOfIntegrationDescriptorId])
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

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityInternetAccessTypeDescriptor] FOREIGN KEY ([DigitalEquityInternetAccessTypeDescriptorId])
REFERENCES [nmped].[DigitalEquityInternetAccessTypeDescriptor] ([DigitalEquityInternetAccessTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityInternetAccessTypeDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([DigitalEquityInternetAccessTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityInternetPerformanceCodeDescriptor] FOREIGN KEY ([DigitalEquityInternetPerformanceCodeDescriptorId])
REFERENCES [nmped].[DigitalEquityInternetPerformanceCodeDescriptor] ([DigitalEquityInternetPerformanceCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityInternetPerformanceCodeDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([DigitalEquityInternetPerformanceCodeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityPrimaryLearningDeviceAccessDescriptor] FOREIGN KEY ([DigitalEquityPrimaryLearningDeviceAccessDescriptorId])
REFERENCES [nmped].[DigitalEquityPrimaryLearningDeviceAccessDescriptor] ([DigitalEquityPrimaryLearningDeviceAccessDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityPrimaryLearningDeviceAccessDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([DigitalEquityPrimaryLearningDeviceAccessDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityPrimaryLearningDeviceTypeDescriptor] FOREIGN KEY ([DigitalEquityPrimaryLearningDeviceTypeDescriptorId])
REFERENCES [nmped].[DigitalEquityPrimaryLearningDeviceTypeDescriptor] ([DigitalEquityPrimaryLearningDeviceTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_DigitalEquityPrimaryLearningDeviceTypeDescriptor]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([DigitalEquityPrimaryLearningDeviceTypeDescriptorId] ASC)
GO

ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationDigitalEquity_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationDigitalEquity_EducationOrganization]
ON [nmped].[StaffEducationOrganizationDigitalEquity] ([EducationOrganizationId] ASC)
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

ALTER TABLE [nmped].[StudentAwardLanguageDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentAwardLanguageDescriptor_Descriptor] FOREIGN KEY ([StudentAwardLanguageDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
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

ALTER TABLE [nmped].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_EducationOrganization]
ON [nmped].[StudentEducationOrganizationAward] ([EducationOrganizationId] ASC)
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

ALTER TABLE [nmped].[StudentEducationOrganizationAward] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAward_StudentAwardLanguageDescriptor] FOREIGN KEY ([StudentAwardLanguageDescriptorId])
REFERENCES [nmped].[StudentAwardLanguageDescriptor] ([StudentAwardLanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAward_StudentAwardLanguageDescriptor]
ON [nmped].[StudentEducationOrganizationAward] ([StudentAwardLanguageDescriptorId] ASC)
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

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_PlannedPostGraduateActivityDescriptor] FOREIGN KEY ([PlannedPostGraduateActivityDescriptorId])
REFERENCES [nmped].[PlannedPostGraduateActivityDescriptor] ([PlannedPostGraduateActivityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_PlannedPostGraduateActivityDescriptor]
ON [nmped].[StudentSpecialEducationProgramAssociationExtension] ([PlannedPostGraduateActivityDescriptorId] ASC)
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

ALTER TABLE [nmped].[TriennialReviewDelayReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_TriennialReviewDelayReasonDescriptor_Descriptor] FOREIGN KEY ([TriennialReviewDelayReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

