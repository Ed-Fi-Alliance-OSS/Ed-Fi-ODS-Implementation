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

