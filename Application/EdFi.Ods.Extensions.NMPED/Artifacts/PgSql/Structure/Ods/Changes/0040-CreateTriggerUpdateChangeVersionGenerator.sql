CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.NMPEDService
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

