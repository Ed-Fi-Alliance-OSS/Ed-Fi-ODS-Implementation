-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='myextension' AND table_name='postsecondaryorganization' AND column_name='changeversion') THEN
ALTER TABLE myextension.PostSecondaryOrganization ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE myextension.PostSecondaryOrganization ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

END
$$;
