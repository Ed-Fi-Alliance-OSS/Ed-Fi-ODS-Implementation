ALTER TABLE nmassessments.NmStudentAssessment ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

