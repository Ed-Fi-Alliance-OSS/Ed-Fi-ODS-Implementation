-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_myextension.institutioncontroldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.InstitutionControlDescriptorId, b.codevalue, b.namespace, b.id, 'myextension.InstitutionControlDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.InstitutionControlDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'myextension' AND event_object_table = 'institutioncontroldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON myextension.institutioncontroldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_myextension.institutioncontroldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_myextension.institutionleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.InstitutionLevelDescriptorId, b.codevalue, b.namespace, b.id, 'myextension.InstitutionLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.InstitutionLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'myextension' AND event_object_table = 'institutionleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON myextension.institutionleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_myextension.institutionleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_myextension.postsecondaryorganization_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_myextension.postsecondaryorganization(
        oldnameofinstitution,
        id, discriminator, changeversion)
    VALUES (
        OLD.nameofinstitution, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'myextension' AND event_object_table = 'postsecondaryorganization') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON myextension.postsecondaryorganization 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_myextension.postsecondaryorganization_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_myextension.specialeducationgraduationstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialEducationGraduationStatusDescriptorId, b.codevalue, b.namespace, b.id, 'myextension.SpecialEducationGraduationStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialEducationGraduationStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'myextension' AND event_object_table = 'specialeducationgraduationstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON myextension.specialeducationgraduationstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_myextension.specialeducationgraduationstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_myextension.submissioncertificationdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SubmissionCertificationDescriptorId, b.codevalue, b.namespace, b.id, 'myextension.SubmissionCertificationDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SubmissionCertificationDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'myextension' AND event_object_table = 'submissioncertificationdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON myextension.submissioncertificationdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_myextension.submissioncertificationdescriptor_deleted();
END IF;

END
$$;
