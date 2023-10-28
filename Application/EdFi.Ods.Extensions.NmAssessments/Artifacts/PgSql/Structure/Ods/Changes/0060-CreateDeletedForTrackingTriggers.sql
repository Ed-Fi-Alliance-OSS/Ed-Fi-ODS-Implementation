CREATE FUNCTION tracked_deletes_nmassessments.ItemDescriptionCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmassessments.ItemDescriptionCodeDescriptor(ItemDescriptionCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ItemDescriptionCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ItemDescriptionCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.ItemDescriptionCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmassessments.ItemDescriptionCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmassessments.NmStudentAssessment_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmassessments.NmStudentAssessment(EducationOrganizationId, ItemDescriptionCodeDescriptorId, StudentUSI, TestDate, TestDescriptionDescriptorId, Id, ChangeVersion)
    VALUES (OLD.EducationOrganizationId, OLD.ItemDescriptionCodeDescriptorId, OLD.StudentUSI, OLD.TestDate, OLD.TestDescriptionDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.NmStudentAssessment 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmassessments.NmStudentAssessment_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmassessments.ScoringModelCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmassessments.ScoringModelCodeDescriptor(ScoringModelCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.ScoringModelCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ScoringModelCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.ScoringModelCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmassessments.ScoringModelCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmassessments.StandardAchievedCodeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmassessments.StandardAchievedCodeDescriptor(StandardAchievedCodeDescriptorId, Id, ChangeVersion)
    SELECT OLD.StandardAchievedCodeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.StandardAchievedCodeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.StandardAchievedCodeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmassessments.StandardAchievedCodeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_nmassessments.TestDescriptionDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_nmassessments.TestDescriptionDescriptor(TestDescriptionDescriptorId, Id, ChangeVersion)
    SELECT OLD.TestDescriptionDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.TestDescriptionDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.TestDescriptionDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_nmassessments.TestDescriptionDescriptor_TR_DelTrkg();

