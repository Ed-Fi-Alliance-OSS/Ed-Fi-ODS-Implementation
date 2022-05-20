CREATE TABLE tracked_deletes_nmped.AnnualReviewDelayReasonDescriptor
(
       AnnualReviewDelayReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AnnualReviewDelayReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.DentalExaminationVerificationCodeDescriptor
(
       DentalExaminationVerificationCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DentalExaminationVerificationCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.DigitalEquityInternetAccessTypeDescriptor
(
       DigitalEquityInternetAccessTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DigitalEquityInternetAccessTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.DigitalEquityInternetPerformanceCodeDescriptor
(
       DigitalEquityInternetPerformanceCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DigitalEquityInternetPerformanceCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor
(
       DigitalEquityPrimaryLearningDeviceAccessDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DigitalEquityPrimaryLearningDeviceAccessDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor
(
       DigitalEquityPrimaryLearningDeviceTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DigitalEquityPrimaryLearningDeviceTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.DirectCertificationStatusDescriptor
(
       DirectCertificationStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DirectCertificationStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.ExpectedDiplomaTypeDescriptor
(
       ExpectedDiplomaTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ExpectedDiplomaTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.GenderIdentityDescriptor
(
       GenderIdentityDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT GenderIdentityDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.IndustryCredentialDescriptor
(
       IndustryCredentialDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT IndustryCredentialDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.LevelOfEducationInstitutionDescriptor
(
       LevelOfEducationInstitutionDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LevelOfEducationInstitutionDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.LevelOfIntegrationDescriptor
(
       LevelOfIntegrationDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LevelOfIntegrationDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.LocalEducationAgencyTransportation
(
       CategoryDescriptor01TransportationCategoryDescriptorId INT NOT NULL,
       CategoryDescriptor02TransportationCategoryDescriptorId INT NOT NULL,
       LocalEducationAgencyId INT NOT NULL,
       TransportationSetCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LocalEducationAgencyTransportation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.MileageTypeDescriptor
(
       MileageTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT MileageTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.MilitaryFamilyDescriptor
(
       MilitaryFamilyDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT MilitaryFamilyDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.NMPEDClassPeriodDescriptor
(
       NMPEDClassPeriodDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT NMPEDClassPeriodDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.ParticipationInformationDescriptor
(
       ParticipationInformationDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ParticipationInformationDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.PlannedPostGraduateActivityDescriptor
(
       PlannedPostGraduateActivityDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PlannedPostGraduateActivityDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.PreKClassTypeDescriptor
(
       PreKClassTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PreKClassTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.PrimaryAreaOfExceptionalityDescriptor
(
       PrimaryAreaOfExceptionalityDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PrimaryAreaOfExceptionalityDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.ProgramDeliveryMethodDescriptor
(
       ProgramDeliveryMethodDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProgramDeliveryMethodDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.ProgramIntensityDescriptor
(
       ProgramIntensityDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProgramIntensityDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.RoadTypeDescriptor
(
       RoadTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RoadTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.ServiceProviderTypeDescriptor
(
       ServiceProviderTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ServiceProviderTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.ServiceSettingDescriptor
(
       ServiceSettingDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ServiceSettingDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.SpecialEducationEventReasonDescriptor
(
       SpecialEducationEventReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialEducationEventReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.SpecialEducationEventTypeDescriptor
(
       SpecialEducationEventTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialEducationEventTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.SpecialEducationNonComplianceReasonDescriptor
(
       SpecialEducationNonComplianceReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialEducationNonComplianceReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.SpecialProgramCodeDescriptor
(
       SpecialProgramCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialProgramCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StaffDevelopment
(
       EducationOrganizationId INT NOT NULL,
       StaffUSI INT NOT NULL,
       StartDate DATE NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffDevelopment_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StaffDevelopmentActivityCodeDescriptor
(
       StaffDevelopmentActivityCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffDevelopmentActivityCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StaffDevelopmentPurposeCodeDescriptor
(
       StaffDevelopmentPurposeCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffDevelopmentPurposeCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StaffEducationOrganizationDigitalEquity
(
       EducationOrganizationId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StaffUSI INT NOT NULL,
       StartDate DATE NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StaffEducationOrganizationDigitalEquity_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StudentAwardTypeDescriptor
(
       StudentAwardTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentAwardTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StudentEducationOrganizationAward
(
       AwardDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StudentAwardLanguageDescriptorId INT NOT NULL,
       StudentAwardTypeDescriptorId INT NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentEducationOrganizationAward_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StudentSchoolAggregateSectionAttendance
(
       BeginDate DATE NOT NULL,
       SchoolId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentSchoolAggregateSectionAttendance_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc
(
       BeginDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       EventDate DATE NOT NULL,
       ProgramEducationOrganizationId INT NOT NULL,
       ProgramName VARCHAR(60) NOT NULL,
       ProgramTypeDescriptorId INT NOT NULL,
       SpecialEducationEventTypeDescriptorId INT NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEd_c2cadc_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.TransportationCategoryDescriptor
(
       TransportationCategoryDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TransportationCategoryDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.TransportationSetCodeDescriptor
(
       TransportationSetCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TransportationSetCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.TriennialReviewDelayReasonDescriptor
(
       TriennialReviewDelayReasonDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT TriennialReviewDelayReasonDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleBodyManufacturerDescriptor
(
       VehicleBodyManufacturerDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleBodyManufacturerDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleChassisManufacturerDescriptor
(
       VehicleChassisManufacturerDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleChassisManufacturerDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleFuelTypeDescriptor
(
       VehicleFuelTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleFuelTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleMileage
(
       LocalEducationAgencyId INT NOT NULL,
       MileageTypeDescriptorId INT NOT NULL,
       ReportingDate DATE NOT NULL,
       RoadTypeDescriptorId INT NOT NULL,
       VehicleId VARCHAR(255) NOT NULL,
       VehicleRouteDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleMileage_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleRouteDescriptor
(
       VehicleRouteDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleRouteDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleSnapshot
(
       LocalEducationAgencyId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       VehicleId VARCHAR(255) NOT NULL,
       VehicleIdentificationNumber VARCHAR(21) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleSnapshot_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.VehicleTypeDescriptor
(
       VehicleTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT VehicleTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

