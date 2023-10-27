DO $$
BEGIN
IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'myextension' AND event_object_table = 'postsecondaryorganization') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON myextension.postsecondaryorganization
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

END
$$;
