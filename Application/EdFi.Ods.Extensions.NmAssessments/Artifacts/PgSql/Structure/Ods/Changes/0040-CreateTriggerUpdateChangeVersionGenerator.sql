CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmassessments.NmStudentAssessment
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

