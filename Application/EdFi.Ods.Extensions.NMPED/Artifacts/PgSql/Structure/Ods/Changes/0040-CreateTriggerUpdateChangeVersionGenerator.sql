CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.LocalEducationAgencyTransportation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StaffDevelopment
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StaffEducationOrganizationDigitalEquity
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StudentEducationOrganizationAward
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StudentSchoolAggregateSectionAttendance
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.VehicleMileage
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.VehicleSnapshot
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

