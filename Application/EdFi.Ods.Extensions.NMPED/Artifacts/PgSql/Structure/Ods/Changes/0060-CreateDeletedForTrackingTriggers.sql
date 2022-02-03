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

