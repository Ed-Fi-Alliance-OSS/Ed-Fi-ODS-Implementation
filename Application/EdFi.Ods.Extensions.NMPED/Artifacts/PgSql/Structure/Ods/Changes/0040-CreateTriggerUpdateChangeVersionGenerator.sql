CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.NMPEDService
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StaffDevelopment
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StaffEducationOrganizationDigitalEquity
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StudentEducationOrganizationAward
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

