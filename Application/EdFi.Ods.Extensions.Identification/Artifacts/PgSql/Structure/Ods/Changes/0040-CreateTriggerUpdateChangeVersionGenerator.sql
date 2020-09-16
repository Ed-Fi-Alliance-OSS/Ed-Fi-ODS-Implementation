CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON identification.StudentIdentifier
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

