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

CREATE FUNCTION tracked_deletes_nmped.ClassPeriodDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId, Id, ChangeVersion)
    SELECT OLD.ClassPeriodDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ClassPeriodDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.ClassPeriodDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.ClassPeriodDescriptor_TR_DelTrkg();

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

CREATE FUNCTION tracked_deletes_nmped.NMPEDService_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.NMPEDService(ServiceDescriptorId, Id, ChangeVersion)
    VALUES (OLD.ServiceDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.NMPEDService 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.NMPEDService_TR_DelTrkg();

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

CREATE FUNCTION tracked_deletes_nmped.SpecialEducationLevelOfIntegrationDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.SpecialEducationLevelOfIntegrationDescriptor(SpecialEducationLevelOfIntegrationDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEducationLevelOfIntegrationDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEducationLevelOfIntegrationDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.SpecialEducationLevelOfIntegrationDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.SpecialEducationLevelOfIntegrationDescriptor_TR_DelTrkg();

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

CREATE FUNCTION tracked_deletes_nmped.StudentAwardLanguageDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StudentAwardLanguageDescriptor(StudentAwardLanguageDescriptorId, Id, ChangeVersion)
    SELECT OLD.StudentAwardLanguageDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StudentAwardLanguageDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StudentAwardLanguageDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StudentAwardLanguageDescriptor_TR_DelTrkg();

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

CREATE FUNCTION tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpec_c2cadc_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc(BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.BeginDate, OLD.EducationOrganizationId, OLD.ProgramEducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmped.StudentSpecialEducationProgramAssociationSpec_c2cadc_TR_DelTrkg();

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

