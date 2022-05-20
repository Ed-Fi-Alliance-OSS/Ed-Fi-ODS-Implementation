CREATE FUNCTION tracked_deletes_nmped.AnnualReviewDelayReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.AnnualReviewDelayReasonDescriptor(AnnualReviewDelayReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.AnnualReviewDelayReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.AnnualReviewDelayReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.AnnualReviewDelayReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.AnnualReviewDelayReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.DentalExaminationVerificationCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.DentalExaminationVerificationCodeDescriptor(DentalExaminationVerificationCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.DentalExaminationVerificationCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DentalExaminationVerificationCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.DentalExaminationVerificationCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.DentalExaminationVerificationCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.DigitalEquityInternetAccessTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.DigitalEquityInternetAccessTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DigitalEquityInternetAccessTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.DigitalEquityInternetAccessTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.DigitalEquityInternetAccessTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.DigitalEquityInternetPerformanceCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.DigitalEquityInternetPerformanceCodeDescriptor(DigitalEquityInternetPerformanceCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.DigitalEquityInternetPerformanceCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DigitalEquityInternetPerformanceCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.DigitalEquityInternetPerformanceCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.DigitalEquityInternetPerformanceCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor(DigitalEquityPrimaryLearningDeviceAccessDescriptorId, Id, ChangeVersion)
    SELECT OLD.DigitalEquityPrimaryLearningDeviceAccessDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DigitalEquityPrimaryLearningDeviceAccessDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor(DigitalEquityPrimaryLearningDeviceTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.DigitalEquityPrimaryLearningDeviceTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DigitalEquityPrimaryLearningDeviceTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.DirectCertificationStatusDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId, Id, ChangeVersion)
    SELECT OLD.DirectCertificationStatusDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DirectCertificationStatusDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.DirectCertificationStatusDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.DirectCertificationStatusDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.ExpectedDiplomaTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ExpectedDiplomaTypeDescriptor(ExpectedDiplomaTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ExpectedDiplomaTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ExpectedDiplomaTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ExpectedDiplomaTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ExpectedDiplomaTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.GenderIdentityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.GenderIdentityDescriptor(GenderIdentityDescriptorId, Id, ChangeVersion)
    SELECT OLD.GenderIdentityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.GenderIdentityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.GenderIdentityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.GenderIdentityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.IndustryCredentialDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId, Id, ChangeVersion)
    SELECT OLD.IndustryCredentialDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.IndustryCredentialDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.IndustryCredentialDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.IndustryCredentialDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.LevelOfEducationInstitutionDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId, Id, ChangeVersion)
    SELECT OLD.LevelOfEducationInstitutionDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.LevelOfEducationInstitutionDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.LevelOfEducationInstitutionDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.LevelOfEducationInstitutionDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.LevelOfIntegrationDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.LevelOfIntegrationDescriptor(LevelOfIntegrationDescriptorId, Id, ChangeVersion)
    SELECT OLD.LevelOfIntegrationDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.LevelOfIntegrationDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.LevelOfIntegrationDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.LevelOfIntegrationDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.LocalEducationAgencyTransportation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.LocalEducationAgencyTransportation(CategoryDescriptor01TransportationCategoryDescriptorId, CategoryDescriptor02TransportationCategoryDescriptorId, LocalEducationAgencyId, TransportationSetCodeDescriptorId, Id, ChangeVersion)
    VALUES (OLD.CategoryDescriptor01TransportationCategoryDescriptorId, OLD.CategoryDescriptor02TransportationCategoryDescriptorId, OLD.LocalEducationAgencyId, OLD.TransportationSetCodeDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.LocalEducationAgencyTransportation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.LocalEducationAgencyTransportation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.MileageTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.MileageTypeDescriptor(MileageTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.MileageTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MileageTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.MileageTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.MileageTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.MilitaryFamilyDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.MilitaryFamilyDescriptor(MilitaryFamilyDescriptorId, Id, ChangeVersion)
    SELECT OLD.MilitaryFamilyDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.MilitaryFamilyDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.MilitaryFamilyDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.MilitaryFamilyDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.NMPEDClassPeriodDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId, Id, ChangeVersion)
    SELECT OLD.NMPEDClassPeriodDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.NMPEDClassPeriodDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.NMPEDClassPeriodDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.NMPEDClassPeriodDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.ParticipationInformationDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId, Id, ChangeVersion)
    SELECT OLD.ParticipationInformationDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ParticipationInformationDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ParticipationInformationDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ParticipationInformationDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.PlannedPostGraduateActivityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.PlannedPostGraduateActivityDescriptor(PlannedPostGraduateActivityDescriptorId, Id, ChangeVersion)
    SELECT OLD.PlannedPostGraduateActivityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PlannedPostGraduateActivityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.PlannedPostGraduateActivityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.PlannedPostGraduateActivityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.PreKClassTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.PreKClassTypeDescriptor(PreKClassTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.PreKClassTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PreKClassTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.PreKClassTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.PreKClassTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.PrimaryAreaOfExceptionalityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.PrimaryAreaOfExceptionalityDescriptor(PrimaryAreaOfExceptionalityDescriptorId, Id, ChangeVersion)
    SELECT OLD.PrimaryAreaOfExceptionalityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PrimaryAreaOfExceptionalityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.PrimaryAreaOfExceptionalityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.PrimaryAreaOfExceptionalityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.ProgramDeliveryMethodDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ProgramDeliveryMethodDescriptor(ProgramDeliveryMethodDescriptorId, Id, ChangeVersion)
    SELECT OLD.ProgramDeliveryMethodDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ProgramDeliveryMethodDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ProgramDeliveryMethodDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ProgramDeliveryMethodDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.ProgramIntensityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId, Id, ChangeVersion)
    SELECT OLD.ProgramIntensityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ProgramIntensityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ProgramIntensityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ProgramIntensityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.RoadTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.RoadTypeDescriptor(RoadTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.RoadTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.RoadTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.RoadTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.RoadTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.ServiceProviderTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ServiceProviderTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ServiceProviderTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ServiceProviderTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ServiceProviderTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.ServiceSettingDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ServiceSettingDescriptor(ServiceSettingDescriptorId, Id, ChangeVersion)
    SELECT OLD.ServiceSettingDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ServiceSettingDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ServiceSettingDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ServiceSettingDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.SpecialEducationEventReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.SpecialEducationEventReasonDescriptor(SpecialEducationEventReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEducationEventReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEducationEventReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.SpecialEducationEventReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.SpecialEducationEventReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.SpecialEducationEventTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.SpecialEducationEventTypeDescriptor(SpecialEducationEventTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEducationEventTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEducationEventTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.SpecialEducationEventTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.SpecialEducationEventTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.SpecialEducationNonComplianceReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.SpecialEducationNonComplianceReasonDescriptor(SpecialEducationNonComplianceReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEducationNonComplianceReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEducationNonComplianceReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.SpecialEducationNonComplianceReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.SpecialEducationNonComplianceReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.SpecialProgramCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.SpecialProgramCodeDescriptor(SpecialProgramCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialProgramCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialProgramCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.SpecialProgramCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.SpecialProgramCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StaffDevelopmentActivityCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StaffDevelopmentActivityCodeDescriptor(StaffDevelopmentActivityCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.StaffDevelopmentActivityCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StaffDevelopmentActivityCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StaffDevelopmentActivityCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StaffDevelopmentActivityCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StaffDevelopmentPurposeCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.StaffDevelopmentPurposeCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StaffDevelopmentPurposeCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StaffDevelopmentPurposeCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StaffDevelopmentPurposeCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StaffDevelopment_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StaffDevelopment(EducationOrganizationId, StaffUSI, StartDate, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.StaffUSI, OLD.StartDate, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StaffDevelopment 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StaffDevelopment_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StaffEducationOrganizationDigitalEquity_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StaffEducationOrganizationDigitalEquity(EducationOrganizationId, SchoolYear, StaffUSI, StartDate, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.SchoolYear, OLD.StaffUSI, OLD.StartDate, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StaffEducationOrganizationDigitalEquity 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StaffEducationOrganizationDigitalEquity_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StudentAwardTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StudentAwardTypeDescriptor(StudentAwardTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.StudentAwardTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StudentAwardTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StudentAwardTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StudentAwardTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StudentEducationOrganizationAward_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StudentEducationOrganizationAward(AwardDate, EducationOrganizationId, SchoolYear, StudentAwardLanguageDescriptorId, StudentAwardTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.AwardDate, OLD.EducationOrganizationId, OLD.SchoolYear, OLD.StudentAwardLanguageDescriptorId, OLD.StudentAwardTypeDescriptorId, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StudentEducationOrganizationAward 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StudentEducationOrganizationAward_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StudentSchoolAggregateSectionAttendance_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StudentSchoolAggregateSectionAttendance(BeginDate, SchoolId, SchoolYear, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.SchoolId, OLD.SchoolYear, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StudentSchoolAggregateSectionAttendance 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StudentSchoolAggregateSectionAttendance_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpec_c2cadc_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc(BeginDate, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, SpecialEducationEventTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.EducationOrganizationId, OLD.EventDate, OLD.ProgramEducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.SpecialEducationEventTypeDescriptorId, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpec_c2cadc_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.TransportationCategoryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId, Id, ChangeVersion)
    SELECT OLD.TransportationCategoryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TransportationCategoryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.TransportationCategoryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.TransportationCategoryDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.TransportationSetCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.TransportationSetCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TransportationSetCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.TransportationSetCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.TransportationSetCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.TriennialReviewDelayReasonDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.TriennialReviewDelayReasonDescriptor(TriennialReviewDelayReasonDescriptorId, Id, ChangeVersion)
    SELECT OLD.TriennialReviewDelayReasonDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TriennialReviewDelayReasonDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.TriennialReviewDelayReasonDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.TriennialReviewDelayReasonDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleBodyManufacturerDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleBodyManufacturerDescriptor(VehicleBodyManufacturerDescriptorId, Id, ChangeVersion)
    SELECT OLD.VehicleBodyManufacturerDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.VehicleBodyManufacturerDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleBodyManufacturerDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleBodyManufacturerDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleChassisManufacturerDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId, Id, ChangeVersion)
    SELECT OLD.VehicleChassisManufacturerDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.VehicleChassisManufacturerDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleChassisManufacturerDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleChassisManufacturerDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleFuelTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleFuelTypeDescriptor(VehicleFuelTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.VehicleFuelTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.VehicleFuelTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleFuelTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleFuelTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleMileage_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleMileage(LocalEducationAgencyId, MileageTypeDescriptorId, ReportingDate, RoadTypeDescriptorId, VehicleId, VehicleRouteDescriptorId, Id, ChangeVersion)
    VALUES (OLD.LocalEducationAgencyId, OLD.MileageTypeDescriptorId, OLD.ReportingDate, OLD.RoadTypeDescriptorId, OLD.VehicleId, OLD.VehicleRouteDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleMileage 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleMileage_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleRouteDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId, Id, ChangeVersion)
    SELECT OLD.VehicleRouteDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.VehicleRouteDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleRouteDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleRouteDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleSnapshot_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleSnapshot(LocalEducationAgencyId, SchoolYear, VehicleId, VehicleIdentificationNumber, Id, ChangeVersion)
    VALUES (OLD.LocalEducationAgencyId, OLD.SchoolYear, OLD.VehicleId, OLD.VehicleIdentificationNumber, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleSnapshot 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleSnapshot_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmped.VehicleTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.VehicleTypeDescriptor(VehicleTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.VehicleTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.VehicleTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.VehicleTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.VehicleTypeDescriptor_TR_DelTrkg();

