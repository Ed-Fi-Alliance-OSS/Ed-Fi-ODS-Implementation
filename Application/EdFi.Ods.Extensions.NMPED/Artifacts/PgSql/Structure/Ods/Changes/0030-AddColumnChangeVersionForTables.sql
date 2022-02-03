ALTER TABLE nmped.NMPEDService
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

