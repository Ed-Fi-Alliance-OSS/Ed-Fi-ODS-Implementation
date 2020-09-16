CREATE FUNCTION tracked_deletes_identification.StudentIdentifier_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_identification.StudentIdentifier(Identifier, Namespace, Id, ChangeVersion)
    VALUES (OLD.Identifier, OLD.Namespace, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON identification.StudentIdentifier 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_identification.StudentIdentifier_TR_DelTrkg();

