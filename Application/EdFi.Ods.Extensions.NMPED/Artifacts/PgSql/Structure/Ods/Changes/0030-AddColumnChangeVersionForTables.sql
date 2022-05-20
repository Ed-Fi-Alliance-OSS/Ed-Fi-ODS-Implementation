ALTER TABLE nmped.LocalEducationAgencyTransportation
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.StaffDevelopment
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.StaffEducationOrganizationDigitalEquity
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.StudentEducationOrganizationAward
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.StudentSchoolAggregateSectionAttendance
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.StudentSpecialEducationProgramAssociationSpecialEducatio_c2cadc
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.VehicleMileage
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE nmped.VehicleSnapshot
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

