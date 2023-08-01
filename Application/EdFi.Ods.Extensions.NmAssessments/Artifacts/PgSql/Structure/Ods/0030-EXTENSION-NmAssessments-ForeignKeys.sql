ALTER TABLE nmassessments.ItemDescriptionCodeDescriptor ADD CONSTRAINT FK_dfda42_Descriptor FOREIGN KEY (ItemDescriptionCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmassessments.NmStudentAssessment ADD CONSTRAINT FK_43017d_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_43017d_EducationOrganization
ON nmassessments.NmStudentAssessment (EducationOrganizationId ASC);

ALTER TABLE nmassessments.NmStudentAssessment ADD CONSTRAINT FK_43017d_ItemDescriptionCodeDescriptor FOREIGN KEY (ItemDescriptionCodeDescriptorId)
REFERENCES nmassessments.ItemDescriptionCodeDescriptor (ItemDescriptionCodeDescriptorId)
;

CREATE INDEX FK_43017d_ItemDescriptionCodeDescriptor
ON nmassessments.NmStudentAssessment (ItemDescriptionCodeDescriptorId ASC);

ALTER TABLE nmassessments.NmStudentAssessment ADD CONSTRAINT FK_43017d_ScoringModelCodeDescriptor FOREIGN KEY (ScoringModelCodeDescriptorId)
REFERENCES nmassessments.ScoringModelCodeDescriptor (ScoringModelCodeDescriptorId)
;

CREATE INDEX FK_43017d_ScoringModelCodeDescriptor
ON nmassessments.NmStudentAssessment (ScoringModelCodeDescriptorId ASC);

ALTER TABLE nmassessments.NmStudentAssessment ADD CONSTRAINT FK_43017d_StandardAchievedCodeDescriptor FOREIGN KEY (StandardAchievedCodeDescriptorId)
REFERENCES nmassessments.StandardAchievedCodeDescriptor (StandardAchievedCodeDescriptorId)
;

CREATE INDEX FK_43017d_StandardAchievedCodeDescriptor
ON nmassessments.NmStudentAssessment (StandardAchievedCodeDescriptorId ASC);

ALTER TABLE nmassessments.NmStudentAssessment ADD CONSTRAINT FK_43017d_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_43017d_Student
ON nmassessments.NmStudentAssessment (StudentUSI ASC);

ALTER TABLE nmassessments.NmStudentAssessment ADD CONSTRAINT FK_43017d_TestDescriptionDescriptor FOREIGN KEY (TestDescriptionDescriptorId)
REFERENCES nmassessments.TestDescriptionDescriptor (TestDescriptionDescriptorId)
;

CREATE INDEX FK_43017d_TestDescriptionDescriptor
ON nmassessments.NmStudentAssessment (TestDescriptionDescriptorId ASC);

ALTER TABLE nmassessments.ScoringModelCodeDescriptor ADD CONSTRAINT FK_e0cb2c_Descriptor FOREIGN KEY (ScoringModelCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmassessments.StandardAchievedCodeDescriptor ADD CONSTRAINT FK_c7c785_Descriptor FOREIGN KEY (StandardAchievedCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmassessments.TestDescriptionDescriptor ADD CONSTRAINT FK_a335f0_Descriptor FOREIGN KEY (TestDescriptionDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

