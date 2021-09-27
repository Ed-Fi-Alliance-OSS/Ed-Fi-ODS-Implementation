ALTER TABLE nmped.ClassPeriodDescriptor ADD CONSTRAINT FK_650c70_Descriptor FOREIGN KEY (ClassPeriodDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.DirectCertificationStatusDescriptor ADD CONSTRAINT FK_e919b1_Descriptor FOREIGN KEY (DirectCertificationStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.DisciplineIncidentExtension ADD CONSTRAINT FK_cde8b8_DisciplineIncident FOREIGN KEY (IncidentIdentifier, SchoolId)
REFERENCES edfi.DisciplineIncident (IncidentIdentifier, SchoolId)
ON DELETE CASCADE
;

ALTER TABLE nmped.IndustryCredentialDescriptor ADD CONSTRAINT FK_e93cda_Descriptor FOREIGN KEY (IndustryCredentialDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.LevelOfEducationInstitutionDescriptor ADD CONSTRAINT FK_2d13b6_Descriptor FOREIGN KEY (LevelOfEducationInstitutionDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.NMPEDService ADD CONSTRAINT FK_aff4a0_SerivceSettingDescriptor FOREIGN KEY (SerivceSettingDescriptorId)
REFERENCES nmped.SerivceSettingDescriptor (SerivceSettingDescriptorId)
;

CREATE INDEX FK_aff4a0_SerivceSettingDescriptor
ON nmped.NMPEDService (SerivceSettingDescriptorId ASC);

ALTER TABLE nmped.NMPEDService ADD CONSTRAINT FK_aff4a0_ServiceDescriptor FOREIGN KEY (ServiceDescriptorId)
REFERENCES edfi.ServiceDescriptor (ServiceDescriptorId)
;

ALTER TABLE nmped.NMPEDService ADD CONSTRAINT FK_aff4a0_ServiceProviderTypeDescriptor FOREIGN KEY (ServiceProviderTypeDescriptorId)
REFERENCES nmped.ServiceProviderTypeDescriptor (ServiceProviderTypeDescriptorId)
;

CREATE INDEX FK_aff4a0_ServiceProviderTypeDescriptor
ON nmped.NMPEDService (ServiceProviderTypeDescriptorId ASC);

ALTER TABLE nmped.ParticipationInformationDescriptor ADD CONSTRAINT FK_2ffea1_Descriptor FOREIGN KEY (ParticipationInformationDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.ProgramDeliveryMethodDescriptor ADD CONSTRAINT FK_80f78a_Descriptor FOREIGN KEY (ProgramDeliveryMethodDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.ProgramIntensityDescriptor ADD CONSTRAINT FK_eb1e64_Descriptor FOREIGN KEY (ProgramIntensityDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.SerivceSettingDescriptor ADD CONSTRAINT FK_918c7e_Descriptor FOREIGN KEY (SerivceSettingDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.ServiceProviderTypeDescriptor ADD CONSTRAINT FK_29f0da_Descriptor FOREIGN KEY (ServiceProviderTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor ADD CONSTRAINT FK_74d1c3_Descriptor FOREIGN KEY (SpecialEducationLevelOfIntegrationDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.SpecialProgramCodeDescriptor ADD CONSTRAINT FK_410073_Descriptor FOREIGN KEY (SpecialProgramCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.StaffEducationOrganizationAssignmentAssociationExtension ADD CONSTRAINT FK_6ea356_StaffEducationOrganizationAssignmentAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
REFERENCES edfi.StaffEducationOrganizationAssignmentAssociation (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StaffExtension ADD CONSTRAINT FK_d7b81a_LevelOfEducationInstitutionDescriptor FOREIGN KEY (HighestCompletedLevelOfEducationInstitutionDescriptorId)
REFERENCES nmped.LevelOfEducationInstitutionDescriptor (LevelOfEducationInstitutionDescriptorId)
;

CREATE INDEX FK_d7b81a_LevelOfEducationInstitutionDescriptor
ON nmped.StaffExtension (HighestCompletedLevelOfEducationInstitutionDescriptorId ASC);

ALTER TABLE nmped.StaffExtension ADD CONSTRAINT FK_d7b81a_LevelOfEducationInstitutionDescriptor1 FOREIGN KEY (BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId)
REFERENCES nmped.LevelOfEducationInstitutionDescriptor (LevelOfEducationInstitutionDescriptorId)
;

CREATE INDEX FK_d7b81a_LevelOfEducationInstitutionDescriptor1
ON nmped.StaffExtension (BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId ASC);

ALTER TABLE nmped.StaffExtension ADD CONSTRAINT FK_d7b81a_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StaffSectionAssociationExtension ADD CONSTRAINT FK_2dc783_ClassPeriodDescriptor FOREIGN KEY (ClassPeriodDescriptorId)
REFERENCES nmped.ClassPeriodDescriptor (ClassPeriodDescriptorId)
;

CREATE INDEX FK_2dc783_ClassPeriodDescriptor
ON nmped.StaffSectionAssociationExtension (ClassPeriodDescriptorId ASC);

ALTER TABLE nmped.StaffSectionAssociationExtension ADD CONSTRAINT FK_2dc783_StaffSectionAssociation FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI)
REFERENCES edfi.StaffSectionAssociation (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StaffUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE nmped.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_IndustryCredentialDescriptor FOREIGN KEY (IndustryCredentialDescriptorId)
REFERENCES nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorId)
;

CREATE INDEX FK_1020a1_IndustryCredentialDescriptor
ON nmped.StudentCTEProgramAssociationExtension (IndustryCredentialDescriptorId ASC);

ALTER TABLE nmped.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_ProgramDeliveryMethodDescriptor FOREIGN KEY (ProgramDeliveryMethodDescriptorId)
REFERENCES nmped.ProgramDeliveryMethodDescriptor (ProgramDeliveryMethodDescriptorId)
;

CREATE INDEX FK_1020a1_ProgramDeliveryMethodDescriptor
ON nmped.StudentCTEProgramAssociationExtension (ProgramDeliveryMethodDescriptorId ASC);

ALTER TABLE nmped.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_StudentCTEProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentCTEProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentEducationOrganizationAssociationExtension ADD CONSTRAINT FK_2c2930_StudentEducationOrganizationAssociation FOREIGN KEY (EducationOrganizationId, StudentUSI)
REFERENCES edfi.StudentEducationOrganizationAssociation (EducationOrganizationId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentProgramAssociationExtension ADD CONSTRAINT FK_0c120d_ParticipationInformationDescriptor FOREIGN KEY (ParticipationInformationDescriptorId)
REFERENCES nmped.ParticipationInformationDescriptor (ParticipationInformationDescriptorId)
;

CREATE INDEX FK_0c120d_ParticipationInformationDescriptor
ON nmped.StudentProgramAssociationExtension (ParticipationInformationDescriptorId ASC);

ALTER TABLE nmped.StudentProgramAssociationExtension ADD CONSTRAINT FK_0c120d_ProgramIntensityDescriptor FOREIGN KEY (ProgramIntensityDescriptorId)
REFERENCES nmped.ProgramIntensityDescriptor (ProgramIntensityDescriptorId)
;

CREATE INDEX FK_0c120d_ProgramIntensityDescriptor
ON nmped.StudentProgramAssociationExtension (ProgramIntensityDescriptorId ASC);

ALTER TABLE nmped.StudentProgramAssociationExtension ADD CONSTRAINT FK_0c120d_StudentProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentProgramAssociationNMPEDService ADD CONSTRAINT FK_548f61_NMPEDService FOREIGN KEY (ServiceDescriptorId)
REFERENCES nmped.NMPEDService (ServiceDescriptorId)
;

CREATE INDEX FK_548f61_NMPEDService
ON nmped.StudentProgramAssociationNMPEDService (ServiceDescriptorId ASC);

ALTER TABLE nmped.StudentProgramAssociationNMPEDService ADD CONSTRAINT FK_548f61_StudentProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_548f61_StudentProgramAssociation
ON nmped.StudentProgramAssociationNMPEDService (BeginDate ASC, EducationOrganizationId ASC, ProgramEducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC, StudentUSI ASC);

ALTER TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension ADD CONSTRAINT FK_0566bb_DirectCertificationStatusDescriptor FOREIGN KEY (DirectCertificationStatusDescriptorId)
REFERENCES nmped.DirectCertificationStatusDescriptor (DirectCertificationStatusDescriptorId)
;

CREATE INDEX FK_0566bb_DirectCertificationStatusDescriptor
ON nmped.StudentSchoolFoodServiceProgramAssociationExtension (DirectCertificationStatusDescriptorId ASC);

ALTER TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension ADD CONSTRAINT FK_0566bb_StudentSchoolFoodServiceProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSchoolFoodServiceProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_SpecialProgramCodeDescriptor FOREIGN KEY (SpecialProgramCodeDescriptorId)
REFERENCES nmped.SpecialProgramCodeDescriptor (SpecialProgramCodeDescriptorId)
;

CREATE INDEX FK_a77484_SpecialProgramCodeDescriptor
ON nmped.StudentSectionAssociationExtension (SpecialProgramCodeDescriptorId ASC);

ALTER TABLE nmped.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_StudentSectionAssociation FOREIGN KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.StudentSectionAssociation (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_SpecialEducationLevelOfIntegrationDescriptor FOREIGN KEY (SpecialEducationLevelOfIntegrationDescriptorId)
REFERENCES nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId)
;

CREATE INDEX FK_3da84f_SpecialEducationLevelOfIntegrationDescriptor
ON nmped.StudentSpecialEducationProgramAssociationExtension (SpecialEducationLevelOfIntegrationDescriptorId ASC);

ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

