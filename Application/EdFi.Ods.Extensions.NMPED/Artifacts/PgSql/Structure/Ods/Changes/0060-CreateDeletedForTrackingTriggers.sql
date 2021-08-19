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

