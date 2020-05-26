-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE tpdm.AidTypeDescriptor ADD CONSTRAINT FK_d6106a_Descriptor FOREIGN KEY (AidTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.AnonymizedStudent ADD CONSTRAINT FK_91a31b_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_91a31b_GenderDescriptor
ON tpdm.AnonymizedStudent (GenderDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudent ADD CONSTRAINT FK_91a31b_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_91a31b_GradeLevelDescriptor
ON tpdm.AnonymizedStudent (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudent ADD CONSTRAINT FK_91a31b_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_91a31b_SchoolYearType
ON tpdm.AnonymizedStudent (SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudent ADD CONSTRAINT FK_91a31b_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_91a31b_SexDescriptor
ON tpdm.AnonymizedStudent (SexDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudent ADD CONSTRAINT FK_91a31b_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_91a31b_ValueTypeDescriptor
ON tpdm.AnonymizedStudent (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ADD CONSTRAINT FK_a5aeb2_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
;

CREATE INDEX FK_a5aeb2_AnonymizedStudent
ON tpdm.AnonymizedStudentAcademicRecord (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ADD CONSTRAINT FK_a5aeb2_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_a5aeb2_EducationOrganization
ON tpdm.AnonymizedStudentAcademicRecord (EducationOrganizationId ASC);

ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ADD CONSTRAINT FK_a5aeb2_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_a5aeb2_SchoolYearType
ON tpdm.AnonymizedStudentAcademicRecord (SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentAcademicRecord ADD CONSTRAINT FK_a5aeb2_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_a5aeb2_TermDescriptor
ON tpdm.AnonymizedStudentAcademicRecord (TermDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessment ADD CONSTRAINT FK_e4eb73_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_e4eb73_AcademicSubjectDescriptor
ON tpdm.AnonymizedStudentAssessment (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessment ADD CONSTRAINT FK_e4eb73_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
;

CREATE INDEX FK_e4eb73_AnonymizedStudent
ON tpdm.AnonymizedStudentAssessment (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessment ADD CONSTRAINT FK_e4eb73_AssessmentCategoryDescriptor FOREIGN KEY (AssessmentCategoryDescriptorId)
REFERENCES edfi.AssessmentCategoryDescriptor (AssessmentCategoryDescriptorId)
;

CREATE INDEX FK_e4eb73_AssessmentCategoryDescriptor
ON tpdm.AnonymizedStudentAssessment (AssessmentCategoryDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessment ADD CONSTRAINT FK_e4eb73_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_e4eb73_GradeLevelDescriptor
ON tpdm.AnonymizedStudentAssessment (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessment ADD CONSTRAINT FK_e4eb73_SchoolYearType FOREIGN KEY (TakenSchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_e4eb73_SchoolYearType
ON tpdm.AnonymizedStudentAssessment (TakenSchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessment ADD CONSTRAINT FK_e4eb73_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_e4eb73_TermDescriptor
ON tpdm.AnonymizedStudentAssessment (TermDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentCourseAssociation ADD CONSTRAINT FK_e6ba6c_AnonymizedStudentAssessment FOREIGN KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
REFERENCES tpdm.AnonymizedStudentAssessment (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
;

CREATE INDEX FK_e6ba6c_AnonymizedStudentAssessment
ON tpdm.AnonymizedStudentAssessmentCourseAssociation (AdministrationDate ASC, AnonymizedStudentIdentifier ASC, AssessmentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC, TakenSchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentCourseAssociation ADD CONSTRAINT FK_e6ba6c_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_e6ba6c_Course
ON tpdm.AnonymizedStudentAssessmentCourseAssociation (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentPerformanceLevel ADD CONSTRAINT FK_38094a_AnonymizedStudentAssessment FOREIGN KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
REFERENCES tpdm.AnonymizedStudentAssessment (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.AnonymizedStudentAssessmentPerformanceLevel ADD CONSTRAINT FK_38094a_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorId)
REFERENCES edfi.AssessmentReportingMethodDescriptor (AssessmentReportingMethodDescriptorId)
;

CREATE INDEX FK_38094a_AssessmentReportingMethodDescriptor
ON tpdm.AnonymizedStudentAssessmentPerformanceLevel (AssessmentReportingMethodDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentPerformanceLevel ADD CONSTRAINT FK_38094a_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorId)
REFERENCES edfi.PerformanceLevelDescriptor (PerformanceLevelDescriptorId)
;

CREATE INDEX FK_38094a_PerformanceLevelDescriptor
ON tpdm.AnonymizedStudentAssessmentPerformanceLevel (PerformanceLevelDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentScoreResult ADD CONSTRAINT FK_2361cb_AnonymizedStudentAssessment FOREIGN KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
REFERENCES tpdm.AnonymizedStudentAssessment (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.AnonymizedStudentAssessmentScoreResult ADD CONSTRAINT FK_2361cb_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorId)
REFERENCES edfi.AssessmentReportingMethodDescriptor (AssessmentReportingMethodDescriptorId)
;

CREATE INDEX FK_2361cb_AssessmentReportingMethodDescriptor
ON tpdm.AnonymizedStudentAssessmentScoreResult (AssessmentReportingMethodDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentScoreResult ADD CONSTRAINT FK_2361cb_ResultDatatypeTypeDescriptor FOREIGN KEY (ResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_2361cb_ResultDatatypeTypeDescriptor
ON tpdm.AnonymizedStudentAssessmentScoreResult (ResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentSectionAssociation ADD CONSTRAINT FK_64d5d3_AnonymizedStudentAssessment FOREIGN KEY (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
REFERENCES tpdm.AnonymizedStudentAssessment (AdministrationDate, AnonymizedStudentIdentifier, AssessmentIdentifier, FactsAsOfDate, SchoolYear, TakenSchoolYear)
;

CREATE INDEX FK_64d5d3_AnonymizedStudentAssessment
ON tpdm.AnonymizedStudentAssessmentSectionAssociation (AdministrationDate ASC, AnonymizedStudentIdentifier ASC, AssessmentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC, TakenSchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentAssessmentSectionAssociation ADD CONSTRAINT FK_64d5d3_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_64d5d3_Section
ON tpdm.AnonymizedStudentAssessmentSectionAssociation (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.AnonymizedStudentCourseAssociation ADD CONSTRAINT FK_2abb16_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
;

CREATE INDEX FK_2abb16_AnonymizedStudent
ON tpdm.AnonymizedStudentCourseAssociation (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentCourseAssociation ADD CONSTRAINT FK_2abb16_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_2abb16_Course
ON tpdm.AnonymizedStudentCourseAssociation (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.AnonymizedStudentCourseTranscript ADD CONSTRAINT FK_d194a8_AnonymizedStudentAcademicRecord FOREIGN KEY (AnonymizedStudentIdentifier, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.AnonymizedStudentAcademicRecord (AnonymizedStudentIdentifier, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
;

CREATE INDEX FK_d194a8_AnonymizedStudentAcademicRecord
ON tpdm.AnonymizedStudentCourseTranscript (AnonymizedStudentIdentifier ASC, EducationOrganizationId ASC, FactAsOfDate ASC, FactsAsOfDate ASC, SchoolYear ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentCourseTranscript ADD CONSTRAINT FK_d194a8_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_d194a8_Course
ON tpdm.AnonymizedStudentCourseTranscript (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.AnonymizedStudentCourseTranscript ADD CONSTRAINT FK_d194a8_CourseRepeatCodeDescriptor FOREIGN KEY (CourseRepeatCodeDescriptorId)
REFERENCES edfi.CourseRepeatCodeDescriptor (CourseRepeatCodeDescriptorId)
;

CREATE INDEX FK_d194a8_CourseRepeatCodeDescriptor
ON tpdm.AnonymizedStudentCourseTranscript (CourseRepeatCodeDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentDisability ADD CONSTRAINT FK_9a85dd_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_9a85dd_AnonymizedStudent
ON tpdm.AnonymizedStudentDisability (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentDisability ADD CONSTRAINT FK_9a85dd_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_9a85dd_DisabilityDescriptor
ON tpdm.AnonymizedStudentDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentDisability ADD CONSTRAINT FK_9a85dd_DisabilityDeterminationSourceTypeDescriptor FOREIGN KEY (DisabilityDeterminationSourceTypeDescriptorId)
REFERENCES edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorId)
;

CREATE INDEX FK_9a85dd_DisabilityDeterminationSourceTypeDescriptor
ON tpdm.AnonymizedStudentDisability (DisabilityDeterminationSourceTypeDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentDisabilityDesignation ADD CONSTRAINT FK_3e62fb_AnonymizedStudentDisability FOREIGN KEY (AnonymizedStudentIdentifier, DisabilityDescriptorId, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudentDisability (AnonymizedStudentIdentifier, DisabilityDescriptorId, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_3e62fb_AnonymizedStudentDisability
ON tpdm.AnonymizedStudentDisabilityDesignation (AnonymizedStudentIdentifier ASC, DisabilityDescriptorId ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentDisabilityDesignation ADD CONSTRAINT FK_3e62fb_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorId)
REFERENCES edfi.DisabilityDesignationDescriptor (DisabilityDesignationDescriptorId)
;

CREATE INDEX FK_3e62fb_DisabilityDesignationDescriptor
ON tpdm.AnonymizedStudentDisabilityDesignation (DisabilityDesignationDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentEducationOrganizationAssociation ADD CONSTRAINT FK_7f59f4_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
;

CREATE INDEX FK_7f59f4_AnonymizedStudent
ON tpdm.AnonymizedStudentEducationOrganizationAssociation (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentEducationOrganizationAssociation ADD CONSTRAINT FK_7f59f4_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_7f59f4_EducationOrganization
ON tpdm.AnonymizedStudentEducationOrganizationAssociation (EducationOrganizationId ASC);

ALTER TABLE tpdm.AnonymizedStudentLanguage ADD CONSTRAINT FK_22e3fe_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_22e3fe_AnonymizedStudent
ON tpdm.AnonymizedStudentLanguage (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentLanguage ADD CONSTRAINT FK_22e3fe_LanguageDescriptor FOREIGN KEY (LanguageDescriptorId)
REFERENCES edfi.LanguageDescriptor (LanguageDescriptorId)
;

CREATE INDEX FK_22e3fe_LanguageDescriptor
ON tpdm.AnonymizedStudentLanguage (LanguageDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentLanguageUse ADD CONSTRAINT FK_4a60dd_AnonymizedStudentLanguage FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, LanguageDescriptorId, SchoolYear)
REFERENCES tpdm.AnonymizedStudentLanguage (AnonymizedStudentIdentifier, FactsAsOfDate, LanguageDescriptorId, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_4a60dd_AnonymizedStudentLanguage
ON tpdm.AnonymizedStudentLanguageUse (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, LanguageDescriptorId ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentLanguageUse ADD CONSTRAINT FK_4a60dd_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorId)
REFERENCES edfi.LanguageUseDescriptor (LanguageUseDescriptorId)
;

CREATE INDEX FK_4a60dd_LanguageUseDescriptor
ON tpdm.AnonymizedStudentLanguageUse (LanguageUseDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentRace ADD CONSTRAINT FK_5da6a4_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_5da6a4_AnonymizedStudent
ON tpdm.AnonymizedStudentRace (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentRace ADD CONSTRAINT FK_5da6a4_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_5da6a4_RaceDescriptor
ON tpdm.AnonymizedStudentRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.AnonymizedStudentSectionAssociation ADD CONSTRAINT FK_562e9d_AnonymizedStudent FOREIGN KEY (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.AnonymizedStudent (AnonymizedStudentIdentifier, FactsAsOfDate, SchoolYear)
;

CREATE INDEX FK_562e9d_AnonymizedStudent
ON tpdm.AnonymizedStudentSectionAssociation (AnonymizedStudentIdentifier ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.AnonymizedStudentSectionAssociation ADD CONSTRAINT FK_562e9d_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_562e9d_Section
ON tpdm.AnonymizedStudentSectionAssociation (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_AcademicSubjectDescriptor FOREIGN KEY (HighlyQualifiedAcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_0a1ce1_AcademicSubjectDescriptor
ON tpdm.Applicant (HighlyQualifiedAcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_CitizenshipStatusDescriptor FOREIGN KEY (CitizenshipStatusDescriptorId)
REFERENCES edfi.CitizenshipStatusDescriptor (CitizenshipStatusDescriptorId)
;

CREATE INDEX FK_0a1ce1_CitizenshipStatusDescriptor
ON tpdm.Applicant (CitizenshipStatusDescriptorId ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_0a1ce1_EducationOrganization
ON tpdm.Applicant (EducationOrganizationId ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_0a1ce1_GenderDescriptor
ON tpdm.Applicant (GenderDescriptorId ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_LevelOfEducationDescriptor FOREIGN KEY (HighestCompletedLevelOfEducationDescriptorId)
REFERENCES edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorId)
;

CREATE INDEX FK_0a1ce1_LevelOfEducationDescriptor
ON tpdm.Applicant (HighestCompletedLevelOfEducationDescriptorId ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_0a1ce1_SexDescriptor
ON tpdm.Applicant (SexDescriptorId ASC);

ALTER TABLE tpdm.Applicant ADD CONSTRAINT FK_0a1ce1_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_0a1ce1_TeacherCandidate
ON tpdm.Applicant (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.ApplicantAddress ADD CONSTRAINT FK_dc1bbc_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorId)
REFERENCES edfi.AddressTypeDescriptor (AddressTypeDescriptorId)
;

CREATE INDEX FK_dc1bbc_AddressTypeDescriptor
ON tpdm.ApplicantAddress (AddressTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantAddress ADD CONSTRAINT FK_dc1bbc_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_dc1bbc_Applicant
ON tpdm.ApplicantAddress (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantAddress ADD CONSTRAINT FK_dc1bbc_LocaleDescriptor FOREIGN KEY (LocaleDescriptorId)
REFERENCES edfi.LocaleDescriptor (LocaleDescriptorId)
;

CREATE INDEX FK_dc1bbc_LocaleDescriptor
ON tpdm.ApplicantAddress (LocaleDescriptorId ASC);

ALTER TABLE tpdm.ApplicantAddress ADD CONSTRAINT FK_dc1bbc_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorId)
REFERENCES edfi.StateAbbreviationDescriptor (StateAbbreviationDescriptorId)
;

CREATE INDEX FK_dc1bbc_StateAbbreviationDescriptor
ON tpdm.ApplicantAddress (StateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.ApplicantAddressPeriod ADD CONSTRAINT FK_3a403c_ApplicantAddress FOREIGN KEY (AddressTypeDescriptorId, ApplicantIdentifier, City, EducationOrganizationId, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES tpdm.ApplicantAddress (AddressTypeDescriptorId, ApplicantIdentifier, City, EducationOrganizationId, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

CREATE INDEX FK_3a403c_ApplicantAddress
ON tpdm.ApplicantAddressPeriod (AddressTypeDescriptorId ASC, ApplicantIdentifier ASC, City ASC, EducationOrganizationId ASC, PostalCode ASC, StateAbbreviationDescriptorId ASC, StreetNumberName ASC);

ALTER TABLE tpdm.ApplicantAid ADD CONSTRAINT FK_664f50_AidTypeDescriptor FOREIGN KEY (AidTypeDescriptorId)
REFERENCES tpdm.AidTypeDescriptor (AidTypeDescriptorId)
;

CREATE INDEX FK_664f50_AidTypeDescriptor
ON tpdm.ApplicantAid (AidTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantAid ADD CONSTRAINT FK_664f50_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_664f50_Applicant
ON tpdm.ApplicantAid (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantBackgroundCheck ADD CONSTRAINT FK_ca0f8c_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_ca0f8c_Applicant
ON tpdm.ApplicantBackgroundCheck (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantBackgroundCheck ADD CONSTRAINT FK_ca0f8c_BackgroundCheckStatusDescriptor FOREIGN KEY (BackgroundCheckStatusDescriptorId)
REFERENCES tpdm.BackgroundCheckStatusDescriptor (BackgroundCheckStatusDescriptorId)
;

CREATE INDEX FK_ca0f8c_BackgroundCheckStatusDescriptor
ON tpdm.ApplicantBackgroundCheck (BackgroundCheckStatusDescriptorId ASC);

ALTER TABLE tpdm.ApplicantBackgroundCheck ADD CONSTRAINT FK_ca0f8c_BackgroundCheckTypeDescriptor FOREIGN KEY (BackgroundCheckTypeDescriptorId)
REFERENCES tpdm.BackgroundCheckTypeDescriptor (BackgroundCheckTypeDescriptorId)
;

CREATE INDEX FK_ca0f8c_BackgroundCheckTypeDescriptor
ON tpdm.ApplicantBackgroundCheck (BackgroundCheckTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantCharacteristic ADD CONSTRAINT FK_12b3e2_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_12b3e2_Applicant
ON tpdm.ApplicantCharacteristic (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantCharacteristic ADD CONSTRAINT FK_12b3e2_StudentCharacteristicDescriptor FOREIGN KEY (StudentCharacteristicDescriptorId)
REFERENCES edfi.StudentCharacteristicDescriptor (StudentCharacteristicDescriptorId)
;

CREATE INDEX FK_12b3e2_StudentCharacteristicDescriptor
ON tpdm.ApplicantCharacteristic (StudentCharacteristicDescriptorId ASC);

ALTER TABLE tpdm.ApplicantCredential ADD CONSTRAINT FK_66a543_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_66a543_Applicant
ON tpdm.ApplicantCredential (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantCredential ADD CONSTRAINT FK_66a543_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
;

CREATE INDEX FK_66a543_Credential
ON tpdm.ApplicantCredential (CredentialIdentifier ASC, StateOfIssueStateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.ApplicantDisability ADD CONSTRAINT FK_3ccfc3_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_3ccfc3_Applicant
ON tpdm.ApplicantDisability (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantDisability ADD CONSTRAINT FK_3ccfc3_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_3ccfc3_DisabilityDescriptor
ON tpdm.ApplicantDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.ApplicantDisability ADD CONSTRAINT FK_3ccfc3_DisabilityDeterminationSourceTypeDescriptor FOREIGN KEY (DisabilityDeterminationSourceTypeDescriptorId)
REFERENCES edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorId)
;

CREATE INDEX FK_3ccfc3_DisabilityDeterminationSourceTypeDescriptor
ON tpdm.ApplicantDisability (DisabilityDeterminationSourceTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantDisabilityDesignation ADD CONSTRAINT FK_76fa33_ApplicantDisability FOREIGN KEY (ApplicantIdentifier, DisabilityDescriptorId, EducationOrganizationId)
REFERENCES tpdm.ApplicantDisability (ApplicantIdentifier, DisabilityDescriptorId, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_76fa33_ApplicantDisability
ON tpdm.ApplicantDisabilityDesignation (ApplicantIdentifier ASC, DisabilityDescriptorId ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantDisabilityDesignation ADD CONSTRAINT FK_76fa33_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorId)
REFERENCES edfi.DisabilityDesignationDescriptor (DisabilityDesignationDescriptorId)
;

CREATE INDEX FK_76fa33_DisabilityDesignationDescriptor
ON tpdm.ApplicantDisabilityDesignation (DisabilityDesignationDescriptorId ASC);

ALTER TABLE tpdm.ApplicantElectronicMail ADD CONSTRAINT FK_2e402a_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_2e402a_Applicant
ON tpdm.ApplicantElectronicMail (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantElectronicMail ADD CONSTRAINT FK_2e402a_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorId)
REFERENCES edfi.ElectronicMailTypeDescriptor (ElectronicMailTypeDescriptorId)
;

CREATE INDEX FK_2e402a_ElectronicMailTypeDescriptor
ON tpdm.ApplicantElectronicMail (ElectronicMailTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantGradePointAverage ADD CONSTRAINT FK_a9774a_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_a9774a_Applicant
ON tpdm.ApplicantGradePointAverage (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantGradePointAverage ADD CONSTRAINT FK_a9774a_GradePointAverageTypeDescriptor FOREIGN KEY (GradePointAverageTypeDescriptorId)
REFERENCES edfi.GradePointAverageTypeDescriptor (GradePointAverageTypeDescriptorId)
;

CREATE INDEX FK_a9774a_GradePointAverageTypeDescriptor
ON tpdm.ApplicantGradePointAverage (GradePointAverageTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantIdentificationDocument ADD CONSTRAINT FK_e89a68_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_e89a68_Applicant
ON tpdm.ApplicantIdentificationDocument (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantIdentificationDocument ADD CONSTRAINT FK_e89a68_CountryDescriptor FOREIGN KEY (IssuerCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_e89a68_CountryDescriptor
ON tpdm.ApplicantIdentificationDocument (IssuerCountryDescriptorId ASC);

ALTER TABLE tpdm.ApplicantIdentificationDocument ADD CONSTRAINT FK_e89a68_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorId)
REFERENCES edfi.IdentificationDocumentUseDescriptor (IdentificationDocumentUseDescriptorId)
;

CREATE INDEX FK_e89a68_IdentificationDocumentUseDescriptor
ON tpdm.ApplicantIdentificationDocument (IdentificationDocumentUseDescriptorId ASC);

ALTER TABLE tpdm.ApplicantIdentificationDocument ADD CONSTRAINT FK_e89a68_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorId)
REFERENCES edfi.PersonalInformationVerificationDescriptor (PersonalInformationVerificationDescriptorId)
;

CREATE INDEX FK_e89a68_PersonalInformationVerificationDescriptor
ON tpdm.ApplicantIdentificationDocument (PersonalInformationVerificationDescriptorId ASC);

ALTER TABLE tpdm.ApplicantInternationalAddress ADD CONSTRAINT FK_764520_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorId)
REFERENCES edfi.AddressTypeDescriptor (AddressTypeDescriptorId)
;

CREATE INDEX FK_764520_AddressTypeDescriptor
ON tpdm.ApplicantInternationalAddress (AddressTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantInternationalAddress ADD CONSTRAINT FK_764520_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_764520_Applicant
ON tpdm.ApplicantInternationalAddress (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantInternationalAddress ADD CONSTRAINT FK_764520_CountryDescriptor FOREIGN KEY (CountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_764520_CountryDescriptor
ON tpdm.ApplicantInternationalAddress (CountryDescriptorId ASC);

ALTER TABLE tpdm.ApplicantLanguage ADD CONSTRAINT FK_23ffbd_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_23ffbd_Applicant
ON tpdm.ApplicantLanguage (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantLanguage ADD CONSTRAINT FK_23ffbd_LanguageDescriptor FOREIGN KEY (LanguageDescriptorId)
REFERENCES edfi.LanguageDescriptor (LanguageDescriptorId)
;

CREATE INDEX FK_23ffbd_LanguageDescriptor
ON tpdm.ApplicantLanguage (LanguageDescriptorId ASC);

ALTER TABLE tpdm.ApplicantLanguageUse ADD CONSTRAINT FK_527711_ApplicantLanguage FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId, LanguageDescriptorId)
REFERENCES tpdm.ApplicantLanguage (ApplicantIdentifier, EducationOrganizationId, LanguageDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_527711_ApplicantLanguage
ON tpdm.ApplicantLanguageUse (ApplicantIdentifier ASC, EducationOrganizationId ASC, LanguageDescriptorId ASC);

ALTER TABLE tpdm.ApplicantLanguageUse ADD CONSTRAINT FK_527711_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorId)
REFERENCES edfi.LanguageUseDescriptor (LanguageUseDescriptorId)
;

CREATE INDEX FK_527711_LanguageUseDescriptor
ON tpdm.ApplicantLanguageUse (LanguageUseDescriptorId ASC);

ALTER TABLE tpdm.ApplicantPersonalIdentificationDocument ADD CONSTRAINT FK_4c9a54_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_4c9a54_Applicant
ON tpdm.ApplicantPersonalIdentificationDocument (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantPersonalIdentificationDocument ADD CONSTRAINT FK_4c9a54_CountryDescriptor FOREIGN KEY (IssuerCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_4c9a54_CountryDescriptor
ON tpdm.ApplicantPersonalIdentificationDocument (IssuerCountryDescriptorId ASC);

ALTER TABLE tpdm.ApplicantPersonalIdentificationDocument ADD CONSTRAINT FK_4c9a54_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorId)
REFERENCES edfi.IdentificationDocumentUseDescriptor (IdentificationDocumentUseDescriptorId)
;

CREATE INDEX FK_4c9a54_IdentificationDocumentUseDescriptor
ON tpdm.ApplicantPersonalIdentificationDocument (IdentificationDocumentUseDescriptorId ASC);

ALTER TABLE tpdm.ApplicantPersonalIdentificationDocument ADD CONSTRAINT FK_4c9a54_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorId)
REFERENCES edfi.PersonalInformationVerificationDescriptor (PersonalInformationVerificationDescriptorId)
;

CREATE INDEX FK_4c9a54_PersonalInformationVerificationDescriptor
ON tpdm.ApplicantPersonalIdentificationDocument (PersonalInformationVerificationDescriptorId ASC);

ALTER TABLE tpdm.ApplicantProspectAssociation ADD CONSTRAINT FK_57cdba_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
;

CREATE INDEX FK_57cdba_Applicant
ON tpdm.ApplicantProspectAssociation (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantProspectAssociation ADD CONSTRAINT FK_57cdba_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
;

CREATE INDEX FK_57cdba_Prospect
ON tpdm.ApplicantProspectAssociation (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ApplicantRace ADD CONSTRAINT FK_991ae6_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_991ae6_Applicant
ON tpdm.ApplicantRace (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantRace ADD CONSTRAINT FK_991ae6_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_991ae6_RaceDescriptor
ON tpdm.ApplicantRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.ApplicantScoreResult ADD CONSTRAINT FK_402e43_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_402e43_Applicant
ON tpdm.ApplicantScoreResult (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantScoreResult ADD CONSTRAINT FK_402e43_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorId)
REFERENCES edfi.AssessmentReportingMethodDescriptor (AssessmentReportingMethodDescriptorId)
;

CREATE INDEX FK_402e43_AssessmentReportingMethodDescriptor
ON tpdm.ApplicantScoreResult (AssessmentReportingMethodDescriptorId ASC);

ALTER TABLE tpdm.ApplicantScoreResult ADD CONSTRAINT FK_402e43_ResultDatatypeTypeDescriptor FOREIGN KEY (ResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_402e43_ResultDatatypeTypeDescriptor
ON tpdm.ApplicantScoreResult (ResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantStaffIdentificationCode ADD CONSTRAINT FK_e02fd4_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_e02fd4_Applicant
ON tpdm.ApplicantStaffIdentificationCode (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantStaffIdentificationCode ADD CONSTRAINT FK_e02fd4_StaffIdentificationSystemDescriptor FOREIGN KEY (StaffIdentificationSystemDescriptorId)
REFERENCES edfi.StaffIdentificationSystemDescriptor (StaffIdentificationSystemDescriptorId)
;

CREATE INDEX FK_e02fd4_StaffIdentificationSystemDescriptor
ON tpdm.ApplicantStaffIdentificationCode (StaffIdentificationSystemDescriptorId ASC);

ALTER TABLE tpdm.ApplicantTeacherPreparationProgram ADD CONSTRAINT FK_468674_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_468674_Applicant
ON tpdm.ApplicantTeacherPreparationProgram (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantTeacherPreparationProgram ADD CONSTRAINT FK_468674_LevelOfDegreeAwardedDescriptor FOREIGN KEY (LevelOfDegreeAwardedDescriptorId)
REFERENCES tpdm.LevelOfDegreeAwardedDescriptor (LevelOfDegreeAwardedDescriptorId)
;

CREATE INDEX FK_468674_LevelOfDegreeAwardedDescriptor
ON tpdm.ApplicantTeacherPreparationProgram (LevelOfDegreeAwardedDescriptorId ASC);

ALTER TABLE tpdm.ApplicantTeacherPreparationProgram ADD CONSTRAINT FK_468674_TeacherPreparationProgramTypeDescriptor FOREIGN KEY (TeacherPreparationProgramTypeDescriptorId)
REFERENCES tpdm.TeacherPreparationProgramTypeDescriptor (TeacherPreparationProgramTypeDescriptorId)
;

CREATE INDEX FK_468674_TeacherPreparationProgramTypeDescriptor
ON tpdm.ApplicantTeacherPreparationProgram (TeacherPreparationProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantTelephone ADD CONSTRAINT FK_06c96d_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_06c96d_Applicant
ON tpdm.ApplicantTelephone (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantTelephone ADD CONSTRAINT FK_06c96d_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorId)
REFERENCES edfi.TelephoneNumberTypeDescriptor (TelephoneNumberTypeDescriptorId)
;

CREATE INDEX FK_06c96d_TelephoneNumberTypeDescriptor
ON tpdm.ApplicantTelephone (TelephoneNumberTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicantVisa ADD CONSTRAINT FK_6b737c_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_6b737c_Applicant
ON tpdm.ApplicantVisa (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicantVisa ADD CONSTRAINT FK_6b737c_VisaDescriptor FOREIGN KEY (VisaDescriptorId)
REFERENCES edfi.VisaDescriptor (VisaDescriptorId)
;

CREATE INDEX FK_6b737c_VisaDescriptor
ON tpdm.ApplicantVisa (VisaDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_e7ad52_AcademicSubjectDescriptor
ON tpdm.Application (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_AcademicSubjectDescriptor1 FOREIGN KEY (HighNeedsAcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_e7ad52_AcademicSubjectDescriptor1
ON tpdm.Application (HighNeedsAcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
;

CREATE INDEX FK_e7ad52_Applicant
ON tpdm.Application (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_ApplicationSourceDescriptor FOREIGN KEY (ApplicationSourceDescriptorId)
REFERENCES tpdm.ApplicationSourceDescriptor (ApplicationSourceDescriptorId)
;

CREATE INDEX FK_e7ad52_ApplicationSourceDescriptor
ON tpdm.Application (ApplicationSourceDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_ApplicationStatusDescriptor FOREIGN KEY (ApplicationStatusDescriptorId)
REFERENCES tpdm.ApplicationStatusDescriptor (ApplicationStatusDescriptorId)
;

CREATE INDEX FK_e7ad52_ApplicationStatusDescriptor
ON tpdm.Application (ApplicationStatusDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_e7ad52_EducationOrganization
ON tpdm.Application (EducationOrganizationId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_HireStatusDescriptor FOREIGN KEY (HireStatusDescriptorId)
REFERENCES tpdm.HireStatusDescriptor (HireStatusDescriptorId)
;

CREATE INDEX FK_e7ad52_HireStatusDescriptor
ON tpdm.Application (HireStatusDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_HiringSourceDescriptor FOREIGN KEY (HiringSourceDescriptorId)
REFERENCES tpdm.HiringSourceDescriptor (HiringSourceDescriptorId)
;

CREATE INDEX FK_e7ad52_HiringSourceDescriptor
ON tpdm.Application (HiringSourceDescriptorId ASC);

ALTER TABLE tpdm.Application ADD CONSTRAINT FK_e7ad52_WithdrawReasonDescriptor FOREIGN KEY (WithdrawReasonDescriptorId)
REFERENCES tpdm.WithdrawReasonDescriptor (WithdrawReasonDescriptorId)
;

CREATE INDEX FK_e7ad52_WithdrawReasonDescriptor
ON tpdm.Application (WithdrawReasonDescriptorId ASC);

ALTER TABLE tpdm.ApplicationEvent ADD CONSTRAINT FK_143de6_Application FOREIGN KEY (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
REFERENCES tpdm.Application (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
;

CREATE INDEX FK_143de6_Application
ON tpdm.ApplicationEvent (ApplicantIdentifier ASC, ApplicationIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicationEvent ADD CONSTRAINT FK_143de6_ApplicationEventResultDescriptor FOREIGN KEY (ApplicationEventResultDescriptorId)
REFERENCES tpdm.ApplicationEventResultDescriptor (ApplicationEventResultDescriptorId)
;

CREATE INDEX FK_143de6_ApplicationEventResultDescriptor
ON tpdm.ApplicationEvent (ApplicationEventResultDescriptorId ASC);

ALTER TABLE tpdm.ApplicationEvent ADD CONSTRAINT FK_143de6_ApplicationEventTypeDescriptor FOREIGN KEY (ApplicationEventTypeDescriptorId)
REFERENCES tpdm.ApplicationEventTypeDescriptor (ApplicationEventTypeDescriptorId)
;

CREATE INDEX FK_143de6_ApplicationEventTypeDescriptor
ON tpdm.ApplicationEvent (ApplicationEventTypeDescriptorId ASC);

ALTER TABLE tpdm.ApplicationEvent ADD CONSTRAINT FK_143de6_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_143de6_SchoolYearType
ON tpdm.ApplicationEvent (SchoolYear ASC);

ALTER TABLE tpdm.ApplicationEvent ADD CONSTRAINT FK_143de6_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_143de6_TermDescriptor
ON tpdm.ApplicationEvent (TermDescriptorId ASC);

ALTER TABLE tpdm.ApplicationEventResultDescriptor ADD CONSTRAINT FK_3ade4b_Descriptor FOREIGN KEY (ApplicationEventResultDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ApplicationEventTypeDescriptor ADD CONSTRAINT FK_07ba8e_Descriptor FOREIGN KEY (ApplicationEventTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ApplicationOpenStaffPosition ADD CONSTRAINT FK_078448_Application FOREIGN KEY (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
REFERENCES tpdm.Application (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_078448_Application
ON tpdm.ApplicationOpenStaffPosition (ApplicantIdentifier ASC, ApplicationIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicationOpenStaffPosition ADD CONSTRAINT FK_078448_OpenStaffPosition FOREIGN KEY (EducationOrganizationId, RequisitionNumber)
REFERENCES edfi.OpenStaffPosition (EducationOrganizationId, RequisitionNumber)
;

CREATE INDEX FK_078448_OpenStaffPosition
ON tpdm.ApplicationOpenStaffPosition (EducationOrganizationId ASC, RequisitionNumber ASC);

ALTER TABLE tpdm.ApplicationSourceDescriptor ADD CONSTRAINT FK_bbb2ec_Descriptor FOREIGN KEY (ApplicationSourceDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ApplicationStatusDescriptor ADD CONSTRAINT FK_268ed8_Descriptor FOREIGN KEY (ApplicationStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ApplicationTerm ADD CONSTRAINT FK_dff24c_Application FOREIGN KEY (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
REFERENCES tpdm.Application (ApplicantIdentifier, ApplicationIdentifier, EducationOrganizationId)
ON DELETE CASCADE
;

CREATE INDEX FK_dff24c_Application
ON tpdm.ApplicationTerm (ApplicantIdentifier ASC, ApplicationIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.ApplicationTerm ADD CONSTRAINT FK_dff24c_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_dff24c_TermDescriptor
ON tpdm.ApplicationTerm (TermDescriptorId ASC);

ALTER TABLE tpdm.AssessmentExtension ADD CONSTRAINT FK_75a008_Assessment FOREIGN KEY (AssessmentIdentifier, Namespace)
REFERENCES edfi.Assessment (AssessmentIdentifier, Namespace)
ON DELETE CASCADE
;

ALTER TABLE tpdm.AssessmentExtension ADD CONSTRAINT FK_75a008_ProgramGatewayDescriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES tpdm.ProgramGatewayDescriptor (ProgramGatewayDescriptorId)
;

CREATE INDEX FK_75a008_ProgramGatewayDescriptor
ON tpdm.AssessmentExtension (ProgramGatewayDescriptorId ASC);

ALTER TABLE tpdm.BackgroundCheckStatusDescriptor ADD CONSTRAINT FK_00ba96_Descriptor FOREIGN KEY (BackgroundCheckStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.BackgroundCheckTypeDescriptor ADD CONSTRAINT FK_ed9c02_Descriptor FOREIGN KEY (BackgroundCheckTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.BoardCertificationTypeDescriptor ADD CONSTRAINT FK_5d9556_Descriptor FOREIGN KEY (BoardCertificationTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CertificationExamStatusDescriptor ADD CONSTRAINT FK_ffe8b6_Descriptor FOREIGN KEY (CertificationExamStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CertificationExamTypeDescriptor ADD CONSTRAINT FK_9ccf0f_Descriptor FOREIGN KEY (CertificationExamTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CommunityOrganizationExtension ADD CONSTRAINT FK_3e81e4_CommunityOrganization FOREIGN KEY (CommunityOrganizationId)
REFERENCES edfi.CommunityOrganization (CommunityOrganizationId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CommunityOrganizationExtension ADD CONSTRAINT FK_3e81e4_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_3e81e4_FederalLocaleCodeDescriptor
ON tpdm.CommunityOrganizationExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.CommunityProviderExtension ADD CONSTRAINT FK_cdc438_CommunityProvider FOREIGN KEY (CommunityProviderId)
REFERENCES edfi.CommunityProvider (CommunityProviderId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CommunityProviderExtension ADD CONSTRAINT FK_cdc438_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_cdc438_FederalLocaleCodeDescriptor
ON tpdm.CommunityProviderExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.CompleterAsStaffAssociation ADD CONSTRAINT FK_447e8f_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_447e8f_Staff
ON tpdm.CompleterAsStaffAssociation (StaffUSI ASC);

ALTER TABLE tpdm.CompleterAsStaffAssociation ADD CONSTRAINT FK_447e8f_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_447e8f_TeacherCandidate
ON tpdm.CompleterAsStaffAssociation (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.CoteachingStyleObservedDescriptor ADD CONSTRAINT FK_932c9a_Descriptor FOREIGN KEY (CoteachingStyleObservedDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseCourseTranscriptFacts ADD CONSTRAINT FK_055fb2_CourseStudentAcademicRecordFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseStudentAcademicRecordFacts (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
;

CREATE INDEX FK_055fb2_CourseStudentAcademicRecordFacts
ON tpdm.CourseCourseTranscriptFacts (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC, SchoolYear ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned ADD CONSTRAINT FK_fd3f31_CourseCourseTranscriptFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseCourseTranscriptFacts (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_fd3f31_CourseCourseTranscriptFacts
ON tpdm.CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC, FactsAsOfDate ASC, SchoolYear ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.CourseCourseTranscriptFactsAggregatedNumericGradeEarned ADD CONSTRAINT FK_a41b8a_CourseCourseTranscriptFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseCourseTranscriptFacts (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseCourseTranscriptFactsStudentsEnrolled ADD CONSTRAINT FK_68b540_CourseCourseTranscriptFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseCourseTranscriptFacts (CourseCode, EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseCourseTranscriptFactsStudentsEnrolled ADD CONSTRAINT FK_68b540_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_68b540_ValueTypeDescriptor
ON tpdm.CourseCourseTranscriptFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAcademicRecordFacts ADD CONSTRAINT FK_6cdc01_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_6cdc01_Course
ON tpdm.CourseStudentAcademicRecordFacts (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.CourseStudentAcademicRecordFacts ADD CONSTRAINT FK_6cdc01_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_6cdc01_SchoolYearType
ON tpdm.CourseStudentAcademicRecordFacts (SchoolYear ASC);

ALTER TABLE tpdm.CourseStudentAcademicRecordFacts ADD CONSTRAINT FK_6cdc01_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_6cdc01_TermDescriptor
ON tpdm.CourseStudentAcademicRecordFacts (TermDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAcademicRecordFactsAggregatedCumulativeGrad_4b17a5 ADD CONSTRAINT FK_4b17a5_CourseStudentAcademicRecordFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseStudentAcademicRecordFacts (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentAcademicRecordFactsAggregatedSessionGradePo_c23df4 ADD CONSTRAINT FK_c23df4_CourseStudentAcademicRecordFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseStudentAcademicRecordFacts (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentAcademicRecordFactsStudentsEnrolled ADD CONSTRAINT FK_341fb1_CourseStudentAcademicRecordFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.CourseStudentAcademicRecordFacts (CourseCode, EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentAcademicRecordFactsStudentsEnrolled ADD CONSTRAINT FK_341fb1_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_341fb1_ValueTypeDescriptor
ON tpdm.CourseStudentAcademicRecordFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFacts ADD CONSTRAINT FK_157c1d_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_157c1d_AcademicSubjectDescriptor
ON tpdm.CourseStudentAssessmentFacts (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFacts ADD CONSTRAINT FK_157c1d_AssessmentCategoryDescriptor FOREIGN KEY (AssessmentCategoryDescriptorId)
REFERENCES edfi.AssessmentCategoryDescriptor (AssessmentCategoryDescriptorId)
;

CREATE INDEX FK_157c1d_AssessmentCategoryDescriptor
ON tpdm.CourseStudentAssessmentFacts (AssessmentCategoryDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFacts ADD CONSTRAINT FK_157c1d_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_157c1d_Course
ON tpdm.CourseStudentAssessmentFacts (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFacts ADD CONSTRAINT FK_157c1d_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_157c1d_GradeLevelDescriptor
ON tpdm.CourseStudentAssessmentFacts (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFacts ADD CONSTRAINT FK_157c1d_SchoolYearType FOREIGN KEY (TakenSchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_157c1d_SchoolYearType
ON tpdm.CourseStudentAssessmentFacts (TakenSchoolYear ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFacts ADD CONSTRAINT FK_157c1d_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_157c1d_TermDescriptor
ON tpdm.CourseStudentAssessmentFacts (TermDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel ADD CONSTRAINT FK_5c3d45_CourseStudentAssessmentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
REFERENCES tpdm.CourseStudentAssessmentFacts (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_5c3d45_CourseStudentAssessmentFacts
ON tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC, TakenSchoolYear ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel ADD CONSTRAINT FK_5c3d45_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorId)
REFERENCES edfi.PerformanceLevelDescriptor (PerformanceLevelDescriptorId)
;

CREATE INDEX FK_5c3d45_PerformanceLevelDescriptor
ON tpdm.CourseStudentAssessmentFactsAggregatedPerformanceLevel (PerformanceLevelDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedScoreResult ADD CONSTRAINT FK_43edd1_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorId)
REFERENCES edfi.AssessmentReportingMethodDescriptor (AssessmentReportingMethodDescriptorId)
;

CREATE INDEX FK_43edd1_AssessmentReportingMethodDescriptor
ON tpdm.CourseStudentAssessmentFactsAggregatedScoreResult (AssessmentReportingMethodDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedScoreResult ADD CONSTRAINT FK_43edd1_CourseStudentAssessmentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
REFERENCES tpdm.CourseStudentAssessmentFacts (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentAssessmentFactsAggregatedScoreResult ADD CONSTRAINT FK_43edd1_ResultDatatypeTypeDescriptor FOREIGN KEY (AverageScoreResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_43edd1_ResultDatatypeTypeDescriptor
ON tpdm.CourseStudentAssessmentFactsAggregatedScoreResult (AverageScoreResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentAssessmentFactsStudentsEnrolled ADD CONSTRAINT FK_2dbdeb_CourseStudentAssessmentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
REFERENCES tpdm.CourseStudentAssessmentFacts (CourseCode, EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentAssessmentFactsStudentsEnrolled ADD CONSTRAINT FK_2dbdeb_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_2dbdeb_ValueTypeDescriptor
ON tpdm.CourseStudentAssessmentFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFacts ADD CONSTRAINT FK_81ddd0_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_81ddd0_Course
ON tpdm.CourseStudentFacts (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedByDisability ADD CONSTRAINT FK_9c6c3e_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_9c6c3e_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedByDisability (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedByDisability ADD CONSTRAINT FK_9c6c3e_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_9c6c3e_DisabilityDescriptor
ON tpdm.CourseStudentFactsAggregatedByDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedByDisability ADD CONSTRAINT FK_9c6c3e_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_9c6c3e_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedByDisability (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled ADD CONSTRAINT FK_61ef52_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled ADD CONSTRAINT FK_61ef52_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_61ef52_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedELLEnrollment ADD CONSTRAINT FK_8ad7c0_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsAggregatedELLEnrollment ADD CONSTRAINT FK_8ad7c0_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_8ad7c0_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedELLEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedESLEnrollment ADD CONSTRAINT FK_f4617b_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsAggregatedESLEnrollment ADD CONSTRAINT FK_f4617b_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_f4617b_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedESLEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedGender ADD CONSTRAINT FK_cffc06_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_cffc06_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedGender (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedGender ADD CONSTRAINT FK_cffc06_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_cffc06_GenderDescriptor
ON tpdm.CourseStudentFactsAggregatedGender (GenderDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedGender ADD CONSTRAINT FK_cffc06_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_cffc06_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedGender (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity ADD CONSTRAINT FK_055e4e_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_055e4e_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity ADD CONSTRAINT FK_055e4e_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_055e4e_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedHispanicLatinoEthnicity (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedLanguage ADD CONSTRAINT FK_2e1622_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_2e1622_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedLanguage (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedLanguage ADD CONSTRAINT FK_2e1622_LanguageDescriptor FOREIGN KEY (LanguageDescriptorId)
REFERENCES edfi.LanguageDescriptor (LanguageDescriptorId)
;

CREATE INDEX FK_2e1622_LanguageDescriptor
ON tpdm.CourseStudentFactsAggregatedLanguage (LanguageDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedLanguage ADD CONSTRAINT FK_2e1622_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_2e1622_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedLanguage (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedRace ADD CONSTRAINT FK_66b0b5_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_66b0b5_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedRace (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedRace ADD CONSTRAINT FK_66b0b5_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_66b0b5_RaceDescriptor
ON tpdm.CourseStudentFactsAggregatedRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedRace ADD CONSTRAINT FK_66b0b5_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_66b0b5_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedRace (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService ADD CONSTRAINT FK_381a24_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_381a24_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService ADD CONSTRAINT FK_381a24_SchoolFoodServiceProgramServiceDescriptor FOREIGN KEY (SchoolFoodServiceProgramServiceDescriptorId)
REFERENCES edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorId)
;

CREATE INDEX FK_381a24_SchoolFoodServiceProgramServiceDescriptor
ON tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService (SchoolFoodServiceProgramServiceDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService ADD CONSTRAINT FK_381a24_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_381a24_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedSchoolFoodServiceProgramService (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSection504Enrollment ADD CONSTRAINT FK_fd3901_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsAggregatedSection504Enrollment ADD CONSTRAINT FK_fd3901_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_fd3901_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedSection504Enrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSex ADD CONSTRAINT FK_ea9051_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_ea9051_CourseStudentFacts
ON tpdm.CourseStudentFactsAggregatedSex (CourseCode ASC, EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSex ADD CONSTRAINT FK_ea9051_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_ea9051_SexDescriptor
ON tpdm.CourseStudentFactsAggregatedSex (SexDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSex ADD CONSTRAINT FK_ea9051_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_ea9051_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedSex (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedSPED ADD CONSTRAINT FK_b2d297_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsAggregatedSPED ADD CONSTRAINT FK_b2d297_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_b2d297_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedSPED (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsAggregatedTitleIEnrollment ADD CONSTRAINT FK_e1d5ef_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsAggregatedTitleIEnrollment ADD CONSTRAINT FK_e1d5ef_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_e1d5ef_ValueTypeDescriptor
ON tpdm.CourseStudentFactsAggregatedTitleIEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CourseStudentFactsStudentsEnrolled ADD CONSTRAINT FK_790107_CourseStudentFacts FOREIGN KEY (CourseCode, EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.CourseStudentFacts (CourseCode, EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CourseStudentFactsStudentsEnrolled ADD CONSTRAINT FK_790107_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_790107_ValueTypeDescriptor
ON tpdm.CourseStudentFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CredentialBoardCertification ADD CONSTRAINT FK_45bf06_BoardCertificationTypeDescriptor FOREIGN KEY (BoardCertificationTypeDescriptorId)
REFERENCES tpdm.BoardCertificationTypeDescriptor (BoardCertificationTypeDescriptorId)
;

CREATE INDEX FK_45bf06_BoardCertificationTypeDescriptor
ON tpdm.CredentialBoardCertification (BoardCertificationTypeDescriptorId ASC);

ALTER TABLE tpdm.CredentialBoardCertification ADD CONSTRAINT FK_45bf06_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CredentialCertificationExam ADD CONSTRAINT FK_889037_CertificationExamStatusDescriptor FOREIGN KEY (CertificationExamStatusDescriptorId)
REFERENCES tpdm.CertificationExamStatusDescriptor (CertificationExamStatusDescriptorId)
;

CREATE INDEX FK_889037_CertificationExamStatusDescriptor
ON tpdm.CredentialCertificationExam (CertificationExamStatusDescriptorId ASC);

ALTER TABLE tpdm.CredentialCertificationExam ADD CONSTRAINT FK_889037_CertificationExamTypeDescriptor FOREIGN KEY (CertificationExamTypeDescriptorId)
REFERENCES tpdm.CertificationExamTypeDescriptor (CertificationExamTypeDescriptorId)
;

CREATE INDEX FK_889037_CertificationExamTypeDescriptor
ON tpdm.CredentialCertificationExam (CertificationExamTypeDescriptorId ASC);

ALTER TABLE tpdm.CredentialCertificationExam ADD CONSTRAINT FK_889037_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_889037_Credential
ON tpdm.CredentialCertificationExam (CredentialIdentifier ASC, StateOfIssueStateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.CredentialExtension ADD CONSTRAINT FK_6fae52_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CredentialExtension ADD CONSTRAINT FK_6fae52_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_6fae52_ValueTypeDescriptor
ON tpdm.CredentialExtension (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.CredentialRecommendation ADD CONSTRAINT FK_fa4699_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CredentialRecommendation ADD CONSTRAINT FK_fa4699_CredentialFieldDescriptor FOREIGN KEY (CredentialFieldDescriptorId)
REFERENCES edfi.CredentialFieldDescriptor (CredentialFieldDescriptorId)
;

CREATE INDEX FK_fa4699_CredentialFieldDescriptor
ON tpdm.CredentialRecommendation (CredentialFieldDescriptorId ASC);

ALTER TABLE tpdm.CredentialRecommendation ADD CONSTRAINT FK_fa4699_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_fa4699_GradeLevelDescriptor
ON tpdm.CredentialRecommendation (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.CredentialRecommendation ADD CONSTRAINT FK_fa4699_TeachingCredentialDescriptor FOREIGN KEY (TeachingCredentialDescriptorId)
REFERENCES edfi.TeachingCredentialDescriptor (TeachingCredentialDescriptorId)
;

CREATE INDEX FK_fa4699_TeachingCredentialDescriptor
ON tpdm.CredentialRecommendation (TeachingCredentialDescriptorId ASC);

ALTER TABLE tpdm.CredentialRecommendingInstitution ADD CONSTRAINT FK_fc3d10_CountryDescriptor FOREIGN KEY (RecommendingInstitutionCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_fc3d10_CountryDescriptor
ON tpdm.CredentialRecommendingInstitution (RecommendingInstitutionCountryDescriptorId ASC);

ALTER TABLE tpdm.CredentialRecommendingInstitution ADD CONSTRAINT FK_fc3d10_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.CredentialRecommendingInstitution ADD CONSTRAINT FK_fc3d10_StateAbbreviationDescriptor FOREIGN KEY (RecommendingInstitutionStateAbbreviationDescriptorId)
REFERENCES edfi.StateAbbreviationDescriptor (StateAbbreviationDescriptorId)
;

CREATE INDEX FK_fc3d10_StateAbbreviationDescriptor
ON tpdm.CredentialRecommendingInstitution (RecommendingInstitutionStateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFacts ADD CONSTRAINT FK_092fc4_EducationOrganizationStudentAcademicRecordFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationStudentAcademicRecordFacts (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
;

CREATE INDEX FK_092fc4_EducationOrganizationStudentAcademicRecordFacts
ON tpdm.EducationOrganizationCourseTranscriptFacts (EducationOrganizationId ASC, FactAsOfDate ASC, SchoolYear ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsAggregatedFina_c260fb ADD CONSTRAINT FK_c260fb_EducationOrganizationCourseTranscriptFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationCourseTranscriptFacts (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_c260fb_EducationOrganizationCourseTranscriptFacts
ON tpdm.EducationOrganizationCourseTranscriptFactsAggregatedFina_c260fb (EducationOrganizationId ASC, FactAsOfDate ASC, FactsAsOfDate ASC, SchoolYear ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsAggregatedNume_80e712 ADD CONSTRAINT FK_80e712_EducationOrganizationCourseTranscriptFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationCourseTranscriptFacts (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsStudentsEnrolled ADD CONSTRAINT FK_ad8c2e_EducationOrganizationCourseTranscriptFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationCourseTranscriptFacts (EducationOrganizationId, FactAsOfDate, FactsAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationCourseTranscriptFactsStudentsEnrolled ADD CONSTRAINT FK_ad8c2e_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_ad8c2e_ValueTypeDescriptor
ON tpdm.EducationOrganizationCourseTranscriptFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationFacts ADD CONSTRAINT FK_f4fab0_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_f4fab0_EducationOrganization
ON tpdm.EducationOrganizationFacts (EducationOrganizationId ASC);

ALTER TABLE tpdm.EducationOrganizationFacts ADD CONSTRAINT FK_f4fab0_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_f4fab0_SchoolYearType
ON tpdm.EducationOrganizationFacts (SchoolYear ASC);

ALTER TABLE tpdm.EducationOrganizationFactsAggregatedSalary ADD CONSTRAINT FK_cf5648_EducationOrganizationFacts FOREIGN KEY (EducationOrganizationId, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.EducationOrganizationFacts (EducationOrganizationId, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationFactsVacancies ADD CONSTRAINT FK_e99d3f_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_e99d3f_AcademicSubjectDescriptor
ON tpdm.EducationOrganizationFactsVacancies (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationFactsVacancies ADD CONSTRAINT FK_e99d3f_EducationOrganizationFacts FOREIGN KEY (EducationOrganizationId, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.EducationOrganizationFacts (EducationOrganizationId, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_e99d3f_EducationOrganizationFacts
ON tpdm.EducationOrganizationFactsVacancies (EducationOrganizationId ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.EducationOrganizationFactsVacancies ADD CONSTRAINT FK_e99d3f_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_e99d3f_ValueTypeDescriptor
ON tpdm.EducationOrganizationFactsVacancies (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationFactsVacanciesGradeLevel ADD CONSTRAINT FK_9d78ac_EducationOrganizationFactsVacancies FOREIGN KEY (AcademicSubjectDescriptorId, EducationOrganizationId, FactsAsOfDate, SchoolYear)
REFERENCES tpdm.EducationOrganizationFactsVacancies (AcademicSubjectDescriptorId, EducationOrganizationId, FactsAsOfDate, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_9d78ac_EducationOrganizationFactsVacancies
ON tpdm.EducationOrganizationFactsVacanciesGradeLevel (AcademicSubjectDescriptorId ASC, EducationOrganizationId ASC, FactsAsOfDate ASC, SchoolYear ASC);

ALTER TABLE tpdm.EducationOrganizationFactsVacanciesGradeLevel ADD CONSTRAINT FK_9d78ac_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_9d78ac_GradeLevelDescriptor
ON tpdm.EducationOrganizationFactsVacanciesGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationNetworkExtension ADD CONSTRAINT FK_e81d7b_EducationOrganizationNetwork FOREIGN KEY (EducationOrganizationNetworkId)
REFERENCES edfi.EducationOrganizationNetwork (EducationOrganizationNetworkId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationNetworkExtension ADD CONSTRAINT FK_e81d7b_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_e81d7b_FederalLocaleCodeDescriptor
ON tpdm.EducationOrganizationNetworkExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts ADD CONSTRAINT FK_347c34_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_347c34_EducationOrganization
ON tpdm.EducationOrganizationStudentAcademicRecordFacts (EducationOrganizationId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts ADD CONSTRAINT FK_347c34_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_347c34_SchoolYearType
ON tpdm.EducationOrganizationStudentAcademicRecordFacts (SchoolYear ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFacts ADD CONSTRAINT FK_347c34_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_347c34_TermDescriptor
ON tpdm.EducationOrganizationStudentAcademicRecordFacts (TermDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_8992b4 ADD CONSTRAINT FK_8992b4_EducationOrganizationStudentAcademicRecordFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationStudentAcademicRecordFacts (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsAggregate_cb9987 ADD CONSTRAINT FK_cb9987_EducationOrganizationStudentAcademicRecordFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationStudentAcademicRecordFacts (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled ADD CONSTRAINT FK_22edfd_EducationOrganizationStudentAcademicRecordFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
REFERENCES tpdm.EducationOrganizationStudentAcademicRecordFacts (EducationOrganizationId, FactAsOfDate, SchoolYear, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled ADD CONSTRAINT FK_22edfd_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_22edfd_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ADD CONSTRAINT FK_7c74f1_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_7c74f1_AcademicSubjectDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFacts (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ADD CONSTRAINT FK_7c74f1_AssessmentCategoryDescriptor FOREIGN KEY (AssessmentCategoryDescriptorId)
REFERENCES edfi.AssessmentCategoryDescriptor (AssessmentCategoryDescriptorId)
;

CREATE INDEX FK_7c74f1_AssessmentCategoryDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFacts (AssessmentCategoryDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ADD CONSTRAINT FK_7c74f1_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_7c74f1_EducationOrganization
ON tpdm.EducationOrganizationStudentAssessmentFacts (EducationOrganizationId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ADD CONSTRAINT FK_7c74f1_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_7c74f1_GradeLevelDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFacts (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ADD CONSTRAINT FK_7c74f1_SchoolYearType FOREIGN KEY (TakenSchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_7c74f1_SchoolYearType
ON tpdm.EducationOrganizationStudentAssessmentFacts (TakenSchoolYear ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFacts ADD CONSTRAINT FK_7c74f1_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_7c74f1_TermDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFacts (TermDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce ADD CONSTRAINT FK_18e7ce_EducationOrganizationStudentAssessmentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
REFERENCES tpdm.EducationOrganizationStudentAssessmentFacts (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_18e7ce_EducationOrganizationStudentAssessmentFacts
ON tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce (EducationOrganizationId ASC, FactAsOfDate ASC, TakenSchoolYear ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce ADD CONSTRAINT FK_18e7ce_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorId)
REFERENCES edfi.PerformanceLevelDescriptor (PerformanceLevelDescriptorId)
;

CREATE INDEX FK_18e7ce_PerformanceLevelDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFactsAggregatedPer_18e7ce (PerformanceLevelDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 ADD CONSTRAINT FK_37bcc2_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorId)
REFERENCES edfi.AssessmentReportingMethodDescriptor (AssessmentReportingMethodDescriptorId)
;

CREATE INDEX FK_37bcc2_AssessmentReportingMethodDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 (AssessmentReportingMethodDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 ADD CONSTRAINT FK_37bcc2_EducationOrganizationStudentAssessmentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
REFERENCES tpdm.EducationOrganizationStudentAssessmentFacts (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 ADD CONSTRAINT FK_37bcc2_ResultDatatypeTypeDescriptor FOREIGN KEY (AverageScoreResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_37bcc2_ResultDatatypeTypeDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFactsAggregatedSco_37bcc2 (AverageScoreResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsStudentsEnrolled ADD CONSTRAINT FK_5eb7cd_EducationOrganizationStudentAssessmentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
REFERENCES tpdm.EducationOrganizationStudentAssessmentFacts (EducationOrganizationId, FactAsOfDate, TakenSchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentAssessmentFactsStudentsEnrolled ADD CONSTRAINT FK_5eb7cd_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_5eb7cd_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentAssessmentFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFacts ADD CONSTRAINT FK_eedec2_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_eedec2_EducationOrganization
ON tpdm.EducationOrganizationStudentFacts (EducationOrganizationId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedByDisability ADD CONSTRAINT FK_174ab3_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_174ab3_DisabilityDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedByDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedByDisability ADD CONSTRAINT FK_174ab3_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_174ab3_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedByDisability (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedByDisability ADD CONSTRAINT FK_174ab3_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_174ab3_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedByDisability (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedDisabilityTot_2e2e1e ADD CONSTRAINT FK_2e2e1e_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedDisabilityTot_2e2e1e ADD CONSTRAINT FK_2e2e1e_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_2e2e1e_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedDisabilityTot_2e2e1e (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedELLEnrollment ADD CONSTRAINT FK_9d808a_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedELLEnrollment ADD CONSTRAINT FK_9d808a_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_9d808a_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedELLEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedESLEnrollment ADD CONSTRAINT FK_d7677c_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedESLEnrollment ADD CONSTRAINT FK_d7677c_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_d7677c_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedESLEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedGender ADD CONSTRAINT FK_cdcd86_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_cdcd86_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedGender (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedGender ADD CONSTRAINT FK_cdcd86_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_cdcd86_GenderDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedGender (GenderDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedGender ADD CONSTRAINT FK_cdcd86_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_cdcd86_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedGender (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a ADD CONSTRAINT FK_4ee82a_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_4ee82a_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a ADD CONSTRAINT FK_4ee82a_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_4ee82a_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedHispanicLatin_4ee82a (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedLanguage ADD CONSTRAINT FK_4f5f77_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_4f5f77_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedLanguage (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedLanguage ADD CONSTRAINT FK_4f5f77_LanguageDescriptor FOREIGN KEY (LanguageDescriptorId)
REFERENCES edfi.LanguageDescriptor (LanguageDescriptorId)
;

CREATE INDEX FK_4f5f77_LanguageDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedLanguage (LanguageDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedLanguage ADD CONSTRAINT FK_4f5f77_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_4f5f77_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedLanguage (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedRace ADD CONSTRAINT FK_f4c698_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_f4c698_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedRace (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedRace ADD CONSTRAINT FK_f4c698_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_f4c698_RaceDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedRace ADD CONSTRAINT FK_f4c698_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_f4c698_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedRace (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 ADD CONSTRAINT FK_b449c2_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_b449c2_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 ADD CONSTRAINT FK_b449c2_SchoolFoodServiceProgramServiceDescriptor FOREIGN KEY (SchoolFoodServiceProgramServiceDescriptorId)
REFERENCES edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorId)
;

CREATE INDEX FK_b449c2_SchoolFoodServiceProgramServiceDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 (SchoolFoodServiceProgramServiceDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 ADD CONSTRAINT FK_b449c2_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_b449c2_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedSchoolFoodSer_b449c2 (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSection504Enrollment ADD CONSTRAINT FK_23244f_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSection504Enrollment ADD CONSTRAINT FK_23244f_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_23244f_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedSection504Enrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSex ADD CONSTRAINT FK_b55d60_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

CREATE INDEX FK_b55d60_EducationOrganizationStudentFacts
ON tpdm.EducationOrganizationStudentFactsAggregatedSex (EducationOrganizationId ASC, FactAsOfDate ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSex ADD CONSTRAINT FK_b55d60_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_b55d60_SexDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedSex (SexDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSex ADD CONSTRAINT FK_b55d60_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_b55d60_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedSex (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSPED ADD CONSTRAINT FK_44bed5_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedSPED ADD CONSTRAINT FK_44bed5_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_44bed5_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedSPED (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedTitleIEnrollment ADD CONSTRAINT FK_ff9c02_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsAggregatedTitleIEnrollment ADD CONSTRAINT FK_ff9c02_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_ff9c02_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsAggregatedTitleIEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationOrganizationStudentFactsStudentsEnrolled ADD CONSTRAINT FK_c6f237_EducationOrganizationStudentFacts FOREIGN KEY (EducationOrganizationId, FactAsOfDate)
REFERENCES tpdm.EducationOrganizationStudentFacts (EducationOrganizationId, FactAsOfDate)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationOrganizationStudentFactsStudentsEnrolled ADD CONSTRAINT FK_c6f237_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_c6f237_ValueTypeDescriptor
ON tpdm.EducationOrganizationStudentFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.EducationServiceCenterExtension ADD CONSTRAINT FK_5453a2_EducationServiceCenter FOREIGN KEY (EducationServiceCenterId)
REFERENCES edfi.EducationServiceCenter (EducationServiceCenterId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EducationServiceCenterExtension ADD CONSTRAINT FK_5453a2_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_5453a2_FederalLocaleCodeDescriptor
ON tpdm.EducationServiceCenterExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.EmploymentEvent ADD CONSTRAINT FK_786774_EmploymentEventTypeDescriptor FOREIGN KEY (EmploymentEventTypeDescriptorId)
REFERENCES tpdm.EmploymentEventTypeDescriptor (EmploymentEventTypeDescriptorId)
;

CREATE INDEX FK_786774_EmploymentEventTypeDescriptor
ON tpdm.EmploymentEvent (EmploymentEventTypeDescriptorId ASC);

ALTER TABLE tpdm.EmploymentEvent ADD CONSTRAINT FK_786774_InternalExternalHireDescriptor FOREIGN KEY (InternalExternalHireDescriptorId)
REFERENCES tpdm.InternalExternalHireDescriptor (InternalExternalHireDescriptorId)
;

CREATE INDEX FK_786774_InternalExternalHireDescriptor
ON tpdm.EmploymentEvent (InternalExternalHireDescriptorId ASC);

ALTER TABLE tpdm.EmploymentEvent ADD CONSTRAINT FK_786774_OpenStaffPosition FOREIGN KEY (EducationOrganizationId, RequisitionNumber)
REFERENCES edfi.OpenStaffPosition (EducationOrganizationId, RequisitionNumber)
;

CREATE INDEX FK_786774_OpenStaffPosition
ON tpdm.EmploymentEvent (EducationOrganizationId ASC, RequisitionNumber ASC);

ALTER TABLE tpdm.EmploymentEventTypeDescriptor ADD CONSTRAINT FK_aa55e0_Descriptor FOREIGN KEY (EmploymentEventTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EmploymentSeparationEvent ADD CONSTRAINT FK_f51cef_EmploymentSeparationReasonDescriptor FOREIGN KEY (EmploymentSeparationReasonDescriptorId)
REFERENCES tpdm.EmploymentSeparationReasonDescriptor (EmploymentSeparationReasonDescriptorId)
;

CREATE INDEX FK_f51cef_EmploymentSeparationReasonDescriptor
ON tpdm.EmploymentSeparationEvent (EmploymentSeparationReasonDescriptorId ASC);

ALTER TABLE tpdm.EmploymentSeparationEvent ADD CONSTRAINT FK_f51cef_EmploymentSeparationTypeDescriptor FOREIGN KEY (EmploymentSeparationTypeDescriptorId)
REFERENCES tpdm.EmploymentSeparationTypeDescriptor (EmploymentSeparationTypeDescriptorId)
;

CREATE INDEX FK_f51cef_EmploymentSeparationTypeDescriptor
ON tpdm.EmploymentSeparationEvent (EmploymentSeparationTypeDescriptorId ASC);

ALTER TABLE tpdm.EmploymentSeparationEvent ADD CONSTRAINT FK_f51cef_OpenStaffPosition FOREIGN KEY (EducationOrganizationId, RequisitionNumber)
REFERENCES edfi.OpenStaffPosition (EducationOrganizationId, RequisitionNumber)
;

CREATE INDEX FK_f51cef_OpenStaffPosition
ON tpdm.EmploymentSeparationEvent (EducationOrganizationId ASC, RequisitionNumber ASC);

ALTER TABLE tpdm.EmploymentSeparationReasonDescriptor ADD CONSTRAINT FK_6ff06d_Descriptor FOREIGN KEY (EmploymentSeparationReasonDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EmploymentSeparationTypeDescriptor ADD CONSTRAINT FK_7e945f_Descriptor FOREIGN KEY (EmploymentSeparationTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.EnglishLanguageExamDescriptor ADD CONSTRAINT FK_76d6e8_Descriptor FOREIGN KEY (EnglishLanguageExamDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.FederalLocaleCodeDescriptor ADD CONSTRAINT FK_cec0ca_Descriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.FieldworkTypeDescriptor ADD CONSTRAINT FK_a16a29_Descriptor FOREIGN KEY (FieldworkTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.FundingSourceDescriptor ADD CONSTRAINT FK_3ecd1a_Descriptor FOREIGN KEY (FundingSourceDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.GenderDescriptor ADD CONSTRAINT FK_554e4f_Descriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.GradebookEntryExtension ADD CONSTRAINT FK_8342b2_GradebookEntry FOREIGN KEY (DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.GradebookEntry (DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.GradebookEntryExtension ADD CONSTRAINT FK_8342b2_ProgramGatewayDescriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES tpdm.ProgramGatewayDescriptor (ProgramGatewayDescriptorId)
;

CREATE INDEX FK_8342b2_ProgramGatewayDescriptor
ON tpdm.GradebookEntryExtension (ProgramGatewayDescriptorId ASC);

ALTER TABLE tpdm.HireStatusDescriptor ADD CONSTRAINT FK_f84919_Descriptor FOREIGN KEY (HireStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.HiringSourceDescriptor ADD CONSTRAINT FK_7d10e3_Descriptor FOREIGN KEY (HiringSourceDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.InternalExternalHireDescriptor ADD CONSTRAINT FK_8ae758_Descriptor FOREIGN KEY (InternalExternalHireDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.LevelOfDegreeAwardedDescriptor ADD CONSTRAINT FK_bb5168_Descriptor FOREIGN KEY (LevelOfDegreeAwardedDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.LevelTypeDescriptor ADD CONSTRAINT FK_893ae4_Descriptor FOREIGN KEY (LevelTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.LocalEducationAgencyExtension ADD CONSTRAINT FK_bf6aa4_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_bf6aa4_FederalLocaleCodeDescriptor
ON tpdm.LocalEducationAgencyExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.LocalEducationAgencyExtension ADD CONSTRAINT FK_bf6aa4_LocalEducationAgency FOREIGN KEY (LocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.OpenStaffPositionEvent ADD CONSTRAINT FK_e809b0_OpenStaffPosition FOREIGN KEY (EducationOrganizationId, RequisitionNumber)
REFERENCES edfi.OpenStaffPosition (EducationOrganizationId, RequisitionNumber)
;

CREATE INDEX FK_e809b0_OpenStaffPosition
ON tpdm.OpenStaffPositionEvent (EducationOrganizationId ASC, RequisitionNumber ASC);

ALTER TABLE tpdm.OpenStaffPositionEvent ADD CONSTRAINT FK_e809b0_OpenStaffPositionEventStatusDescriptor FOREIGN KEY (OpenStaffPositionEventStatusDescriptorId)
REFERENCES tpdm.OpenStaffPositionEventStatusDescriptor (OpenStaffPositionEventStatusDescriptorId)
;

CREATE INDEX FK_e809b0_OpenStaffPositionEventStatusDescriptor
ON tpdm.OpenStaffPositionEvent (OpenStaffPositionEventStatusDescriptorId ASC);

ALTER TABLE tpdm.OpenStaffPositionEvent ADD CONSTRAINT FK_e809b0_OpenStaffPositionEventTypeDescriptor FOREIGN KEY (OpenStaffPositionEventTypeDescriptorId)
REFERENCES tpdm.OpenStaffPositionEventTypeDescriptor (OpenStaffPositionEventTypeDescriptorId)
;

CREATE INDEX FK_e809b0_OpenStaffPositionEventTypeDescriptor
ON tpdm.OpenStaffPositionEvent (OpenStaffPositionEventTypeDescriptorId ASC);

ALTER TABLE tpdm.OpenStaffPositionEventStatusDescriptor ADD CONSTRAINT FK_1910c5_Descriptor FOREIGN KEY (OpenStaffPositionEventStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.OpenStaffPositionEventTypeDescriptor ADD CONSTRAINT FK_f48cc2_Descriptor FOREIGN KEY (OpenStaffPositionEventTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.OpenStaffPositionExtension ADD CONSTRAINT FK_892567_FundingSourceDescriptor FOREIGN KEY (FundingSourceDescriptorId)
REFERENCES tpdm.FundingSourceDescriptor (FundingSourceDescriptorId)
;

CREATE INDEX FK_892567_FundingSourceDescriptor
ON tpdm.OpenStaffPositionExtension (FundingSourceDescriptorId ASC);

ALTER TABLE tpdm.OpenStaffPositionExtension ADD CONSTRAINT FK_892567_OpenStaffPosition FOREIGN KEY (EducationOrganizationId, RequisitionNumber)
REFERENCES edfi.OpenStaffPosition (EducationOrganizationId, RequisitionNumber)
ON DELETE CASCADE
;

ALTER TABLE tpdm.OpenStaffPositionExtension ADD CONSTRAINT FK_892567_OpenStaffPositionReasonDescriptor FOREIGN KEY (OpenStaffPositionReasonDescriptorId)
REFERENCES tpdm.OpenStaffPositionReasonDescriptor (OpenStaffPositionReasonDescriptorId)
;

CREATE INDEX FK_892567_OpenStaffPositionReasonDescriptor
ON tpdm.OpenStaffPositionExtension (OpenStaffPositionReasonDescriptorId ASC);

ALTER TABLE tpdm.OpenStaffPositionExtension ADD CONSTRAINT FK_892567_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_892567_SchoolYearType
ON tpdm.OpenStaffPositionExtension (SchoolYear ASC);

ALTER TABLE tpdm.OpenStaffPositionExtension ADD CONSTRAINT FK_892567_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_892567_TermDescriptor
ON tpdm.OpenStaffPositionExtension (TermDescriptorId ASC);

ALTER TABLE tpdm.OpenStaffPositionReasonDescriptor ADD CONSTRAINT FK_80ebb8_Descriptor FOREIGN KEY (OpenStaffPositionReasonDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.PerformanceMeasure ADD CONSTRAINT FK_97e755_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_97e755_AcademicSubjectDescriptor
ON tpdm.PerformanceMeasure (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasure ADD CONSTRAINT FK_97e755_CoteachingStyleObservedDescriptor FOREIGN KEY (CoteachingStyleObservedDescriptorId)
REFERENCES tpdm.CoteachingStyleObservedDescriptor (CoteachingStyleObservedDescriptorId)
;

CREATE INDEX FK_97e755_CoteachingStyleObservedDescriptor
ON tpdm.PerformanceMeasure (CoteachingStyleObservedDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasure ADD CONSTRAINT FK_97e755_PerformanceMeasureInstanceDescriptor FOREIGN KEY (PerformanceMeasureInstanceDescriptorId)
REFERENCES tpdm.PerformanceMeasureInstanceDescriptor (PerformanceMeasureInstanceDescriptorId)
;

CREATE INDEX FK_97e755_PerformanceMeasureInstanceDescriptor
ON tpdm.PerformanceMeasure (PerformanceMeasureInstanceDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasure ADD CONSTRAINT FK_97e755_PerformanceMeasureTypeDescriptor FOREIGN KEY (PerformanceMeasureTypeDescriptorId)
REFERENCES tpdm.PerformanceMeasureTypeDescriptor (PerformanceMeasureTypeDescriptorId)
;

CREATE INDEX FK_97e755_PerformanceMeasureTypeDescriptor
ON tpdm.PerformanceMeasure (PerformanceMeasureTypeDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasure ADD CONSTRAINT FK_97e755_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_97e755_TermDescriptor
ON tpdm.PerformanceMeasure (TermDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureCourseAssociation ADD CONSTRAINT FK_e21917_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_e21917_Course
ON tpdm.PerformanceMeasureCourseAssociation (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.PerformanceMeasureCourseAssociation ADD CONSTRAINT FK_e21917_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
;

CREATE INDEX FK_e21917_PerformanceMeasure
ON tpdm.PerformanceMeasureCourseAssociation (PerformanceMeasureIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasureFacts ADD CONSTRAINT FK_be96e7_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_be96e7_AcademicSubjectDescriptor
ON tpdm.PerformanceMeasureFacts (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureFacts ADD CONSTRAINT FK_be96e7_PerformanceMeasureTypeDescriptor FOREIGN KEY (PerformanceMeasureTypeDescriptorId)
REFERENCES tpdm.PerformanceMeasureTypeDescriptor (PerformanceMeasureTypeDescriptorId)
;

CREATE INDEX FK_be96e7_PerformanceMeasureTypeDescriptor
ON tpdm.PerformanceMeasureFacts (PerformanceMeasureTypeDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureFacts ADD CONSTRAINT FK_be96e7_Rubric FOREIGN KEY (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.Rubric (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
;

CREATE INDEX FK_be96e7_Rubric
ON tpdm.PerformanceMeasureFacts (EducationOrganizationId ASC, RubricTitle ASC, RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureFacts ADD CONSTRAINT FK_be96e7_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_be96e7_SchoolYearType
ON tpdm.PerformanceMeasureFacts (SchoolYear ASC);

ALTER TABLE tpdm.PerformanceMeasureFactsGradeLevel ADD CONSTRAINT FK_670479_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_670479_GradeLevelDescriptor
ON tpdm.PerformanceMeasureFactsGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureFactsGradeLevel ADD CONSTRAINT FK_670479_PerformanceMeasureFacts FOREIGN KEY (EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear)
REFERENCES tpdm.PerformanceMeasureFacts (EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_670479_PerformanceMeasureFacts
ON tpdm.PerformanceMeasureFactsGradeLevel (EducationOrganizationId ASC, FactsAsOfDate ASC, RubricTitle ASC, RubricTypeDescriptorId ASC, SchoolYear ASC);

ALTER TABLE tpdm.PerformanceMeasureGradeLevel ADD CONSTRAINT FK_7bad6f_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_7bad6f_GradeLevelDescriptor
ON tpdm.PerformanceMeasureGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureGradeLevel ADD CONSTRAINT FK_7bad6f_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_7bad6f_PerformanceMeasure
ON tpdm.PerformanceMeasureGradeLevel (PerformanceMeasureIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasureInstanceDescriptor ADD CONSTRAINT FK_5ccb34_Descriptor FOREIGN KEY (PerformanceMeasureInstanceDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.PerformanceMeasurePersonBeingReviewed ADD CONSTRAINT FK_e68dfa_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.PerformanceMeasurePersonBeingReviewed ADD CONSTRAINT FK_e68dfa_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
;

CREATE INDEX FK_e68dfa_Prospect
ON tpdm.PerformanceMeasurePersonBeingReviewed (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasurePersonBeingReviewed ADD CONSTRAINT FK_e68dfa_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_e68dfa_Staff
ON tpdm.PerformanceMeasurePersonBeingReviewed (StaffUSI ASC);

ALTER TABLE tpdm.PerformanceMeasurePersonBeingReviewed ADD CONSTRAINT FK_e68dfa_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_e68dfa_TeacherCandidate
ON tpdm.PerformanceMeasurePersonBeingReviewed (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasureProgramGateway ADD CONSTRAINT FK_c7bb24_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_c7bb24_PerformanceMeasure
ON tpdm.PerformanceMeasureProgramGateway (PerformanceMeasureIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasureProgramGateway ADD CONSTRAINT FK_c7bb24_ProgramGatewayDescriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES tpdm.ProgramGatewayDescriptor (ProgramGatewayDescriptorId)
;

CREATE INDEX FK_c7bb24_ProgramGatewayDescriptor
ON tpdm.PerformanceMeasureProgramGateway (ProgramGatewayDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureReviewer ADD CONSTRAINT FK_8e6ade_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_8e6ade_PerformanceMeasure
ON tpdm.PerformanceMeasureReviewer (PerformanceMeasureIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasureReviewer ADD CONSTRAINT FK_8e6ade_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_8e6ade_Staff
ON tpdm.PerformanceMeasureReviewer (StaffUSI ASC);

ALTER TABLE tpdm.PerformanceMeasureReviewerReceivedTraining ADD CONSTRAINT FK_36f6d1_PerformanceMeasureReviewer FOREIGN KEY (FirstName, LastSurname, PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasureReviewer (FirstName, LastSurname, PerformanceMeasureIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.PerformanceMeasureRubric ADD CONSTRAINT FK_7564a0_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_7564a0_PerformanceMeasure
ON tpdm.PerformanceMeasureRubric (PerformanceMeasureIdentifier ASC);

ALTER TABLE tpdm.PerformanceMeasureRubric ADD CONSTRAINT FK_7564a0_Rubric FOREIGN KEY (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.Rubric (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
;

CREATE INDEX FK_7564a0_Rubric
ON tpdm.PerformanceMeasureRubric (EducationOrganizationId ASC, RubricTitle ASC, RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.PerformanceMeasureTypeDescriptor ADD CONSTRAINT FK_2745c1_Descriptor FOREIGN KEY (PerformanceMeasureTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.PostSecondaryInstitutionExtension ADD CONSTRAINT FK_bd2efc_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_bd2efc_FederalLocaleCodeDescriptor
ON tpdm.PostSecondaryInstitutionExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.PostSecondaryInstitutionExtension ADD CONSTRAINT FK_bd2efc_PostSecondaryInstitution FOREIGN KEY (PostSecondaryInstitutionId)
REFERENCES edfi.PostSecondaryInstitution (PostSecondaryInstitutionId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.PreviousCareerDescriptor ADD CONSTRAINT FK_29798f_Descriptor FOREIGN KEY (PreviousCareerDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ProfessionalDevelopmentEvent ADD CONSTRAINT FK_8c4ca1_ProfessionalDevelopmentOfferedByDescriptor FOREIGN KEY (ProfessionalDevelopmentOfferedByDescriptorId)
REFERENCES tpdm.ProfessionalDevelopmentOfferedByDescriptor (ProfessionalDevelopmentOfferedByDescriptorId)
;

CREATE INDEX FK_8c4ca1_ProfessionalDevelopmentOfferedByDescriptor
ON tpdm.ProfessionalDevelopmentEvent (ProfessionalDevelopmentOfferedByDescriptorId ASC);

ALTER TABLE tpdm.ProfessionalDevelopmentOfferedByDescriptor ADD CONSTRAINT FK_b58d9b_Descriptor FOREIGN KEY (ProfessionalDevelopmentOfferedByDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ProgramGatewayDescriptor ADD CONSTRAINT FK_d0ca9b_Descriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.Prospect ADD CONSTRAINT FK_f84f61_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_f84f61_EducationOrganization
ON tpdm.Prospect (EducationOrganizationId ASC);

ALTER TABLE tpdm.Prospect ADD CONSTRAINT FK_f84f61_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_f84f61_GenderDescriptor
ON tpdm.Prospect (GenderDescriptorId ASC);

ALTER TABLE tpdm.Prospect ADD CONSTRAINT FK_f84f61_ProspectTypeDescriptor FOREIGN KEY (ProspectTypeDescriptorId)
REFERENCES tpdm.ProspectTypeDescriptor (ProspectTypeDescriptorId)
;

CREATE INDEX FK_f84f61_ProspectTypeDescriptor
ON tpdm.Prospect (ProspectTypeDescriptorId ASC);

ALTER TABLE tpdm.Prospect ADD CONSTRAINT FK_f84f61_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_f84f61_SexDescriptor
ON tpdm.Prospect (SexDescriptorId ASC);

ALTER TABLE tpdm.Prospect ADD CONSTRAINT FK_f84f61_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_f84f61_TeacherCandidate
ON tpdm.Prospect (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.ProspectAid ADD CONSTRAINT FK_f864a7_AidTypeDescriptor FOREIGN KEY (AidTypeDescriptorId)
REFERENCES tpdm.AidTypeDescriptor (AidTypeDescriptorId)
;

CREATE INDEX FK_f864a7_AidTypeDescriptor
ON tpdm.ProspectAid (AidTypeDescriptorId ASC);

ALTER TABLE tpdm.ProspectAid ADD CONSTRAINT FK_f864a7_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ProspectCredential ADD CONSTRAINT FK_6a8d2f_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
;

CREATE INDEX FK_6a8d2f_Credential
ON tpdm.ProspectCredential (CredentialIdentifier ASC, StateOfIssueStateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.ProspectCredential ADD CONSTRAINT FK_6a8d2f_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_6a8d2f_Prospect
ON tpdm.ProspectCredential (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectCurrentPosition ADD CONSTRAINT FK_f29793_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_f29793_AcademicSubjectDescriptor
ON tpdm.ProspectCurrentPosition (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.ProspectCurrentPosition ADD CONSTRAINT FK_f29793_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ProspectCurrentPositionGradeLevel ADD CONSTRAINT FK_918bf6_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_918bf6_GradeLevelDescriptor
ON tpdm.ProspectCurrentPositionGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.ProspectCurrentPositionGradeLevel ADD CONSTRAINT FK_918bf6_ProspectCurrentPosition FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.ProspectCurrentPosition (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_918bf6_ProspectCurrentPosition
ON tpdm.ProspectCurrentPositionGradeLevel (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectDisability ADD CONSTRAINT FK_4804fb_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_4804fb_DisabilityDescriptor
ON tpdm.ProspectDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.ProspectDisability ADD CONSTRAINT FK_4804fb_DisabilityDeterminationSourceTypeDescriptor FOREIGN KEY (DisabilityDeterminationSourceTypeDescriptorId)
REFERENCES edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorId)
;

CREATE INDEX FK_4804fb_DisabilityDeterminationSourceTypeDescriptor
ON tpdm.ProspectDisability (DisabilityDeterminationSourceTypeDescriptorId ASC);

ALTER TABLE tpdm.ProspectDisability ADD CONSTRAINT FK_4804fb_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_4804fb_Prospect
ON tpdm.ProspectDisability (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectDisabilityDesignation ADD CONSTRAINT FK_5c4c1c_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorId)
REFERENCES edfi.DisabilityDesignationDescriptor (DisabilityDesignationDescriptorId)
;

CREATE INDEX FK_5c4c1c_DisabilityDesignationDescriptor
ON tpdm.ProspectDisabilityDesignation (DisabilityDesignationDescriptorId ASC);

ALTER TABLE tpdm.ProspectDisabilityDesignation ADD CONSTRAINT FK_5c4c1c_ProspectDisability FOREIGN KEY (DisabilityDescriptorId, EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.ProspectDisability (DisabilityDescriptorId, EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_5c4c1c_ProspectDisability
ON tpdm.ProspectDisabilityDesignation (DisabilityDescriptorId ASC, EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectPersonalIdentificationDocument ADD CONSTRAINT FK_6b942a_CountryDescriptor FOREIGN KEY (IssuerCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_6b942a_CountryDescriptor
ON tpdm.ProspectPersonalIdentificationDocument (IssuerCountryDescriptorId ASC);

ALTER TABLE tpdm.ProspectPersonalIdentificationDocument ADD CONSTRAINT FK_6b942a_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorId)
REFERENCES edfi.IdentificationDocumentUseDescriptor (IdentificationDocumentUseDescriptorId)
;

CREATE INDEX FK_6b942a_IdentificationDocumentUseDescriptor
ON tpdm.ProspectPersonalIdentificationDocument (IdentificationDocumentUseDescriptorId ASC);

ALTER TABLE tpdm.ProspectPersonalIdentificationDocument ADD CONSTRAINT FK_6b942a_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorId)
REFERENCES edfi.PersonalInformationVerificationDescriptor (PersonalInformationVerificationDescriptorId)
;

CREATE INDEX FK_6b942a_PersonalInformationVerificationDescriptor
ON tpdm.ProspectPersonalIdentificationDocument (PersonalInformationVerificationDescriptorId ASC);

ALTER TABLE tpdm.ProspectPersonalIdentificationDocument ADD CONSTRAINT FK_6b942a_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_6b942a_Prospect
ON tpdm.ProspectPersonalIdentificationDocument (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_dc8233_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorId)
REFERENCES edfi.AttendanceEventCategoryDescriptor (AttendanceEventCategoryDescriptorId)
;

CREATE INDEX FK_dc8233_AttendanceEventCategoryDescriptor
ON tpdm.ProspectProfessionalDevelopmentEventAttendance (AttendanceEventCategoryDescriptorId ASC);

ALTER TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_dc8233_ProfessionalDevelopmentEvent FOREIGN KEY (ProfessionalDevelopmentTitle)
REFERENCES tpdm.ProfessionalDevelopmentEvent (ProfessionalDevelopmentTitle)
;

CREATE INDEX FK_dc8233_ProfessionalDevelopmentEvent
ON tpdm.ProspectProfessionalDevelopmentEventAttendance (ProfessionalDevelopmentTitle ASC);

ALTER TABLE tpdm.ProspectProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_dc8233_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
;

CREATE INDEX FK_dc8233_Prospect
ON tpdm.ProspectProfessionalDevelopmentEventAttendance (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectQualifications ADD CONSTRAINT FK_c954a4_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.ProspectRace ADD CONSTRAINT FK_f29b59_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_f29b59_Prospect
ON tpdm.ProspectRace (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectRace ADD CONSTRAINT FK_f29b59_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_f29b59_RaceDescriptor
ON tpdm.ProspectRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.ProspectRecruitmentEvent ADD CONSTRAINT FK_69cd94_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_69cd94_Prospect
ON tpdm.ProspectRecruitmentEvent (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectRecruitmentEvent ADD CONSTRAINT FK_69cd94_RecruitmentEvent FOREIGN KEY (EventDate, EventTitle)
REFERENCES tpdm.RecruitmentEvent (EventDate, EventTitle)
;

CREATE INDEX FK_69cd94_RecruitmentEvent
ON tpdm.ProspectRecruitmentEvent (EventDate ASC, EventTitle ASC);

ALTER TABLE tpdm.ProspectTelephone ADD CONSTRAINT FK_347256_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_347256_Prospect
ON tpdm.ProspectTelephone (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectTelephone ADD CONSTRAINT FK_347256_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorId)
REFERENCES edfi.TelephoneNumberTypeDescriptor (TelephoneNumberTypeDescriptorId)
;

CREATE INDEX FK_347256_TelephoneNumberTypeDescriptor
ON tpdm.ProspectTelephone (TelephoneNumberTypeDescriptorId ASC);

ALTER TABLE tpdm.ProspectTouchpoint ADD CONSTRAINT FK_2ecb98_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_2ecb98_Prospect
ON tpdm.ProspectTouchpoint (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.ProspectTypeDescriptor ADD CONSTRAINT FK_22c5bc_Descriptor FOREIGN KEY (ProspectTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.RecruitmentEvent ADD CONSTRAINT FK_6232e8_RecruitmentEventTypeDescriptor FOREIGN KEY (RecruitmentEventTypeDescriptorId)
REFERENCES tpdm.RecruitmentEventTypeDescriptor (RecruitmentEventTypeDescriptorId)
;

CREATE INDEX FK_6232e8_RecruitmentEventTypeDescriptor
ON tpdm.RecruitmentEvent (RecruitmentEventTypeDescriptorId ASC);

ALTER TABLE tpdm.RecruitmentEventTypeDescriptor ADD CONSTRAINT FK_4075e3_Descriptor FOREIGN KEY (RecruitmentEventTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.Rubric ADD CONSTRAINT FK_f13a78_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_f13a78_EducationOrganization
ON tpdm.Rubric (EducationOrganizationId ASC);

ALTER TABLE tpdm.Rubric ADD CONSTRAINT FK_f13a78_RubricTypeDescriptor FOREIGN KEY (RubricTypeDescriptorId)
REFERENCES tpdm.RubricTypeDescriptor (RubricTypeDescriptorId)
;

CREATE INDEX FK_f13a78_RubricTypeDescriptor
ON tpdm.Rubric (RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.RubricLevel ADD CONSTRAINT FK_6ab97b_Rubric FOREIGN KEY (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.Rubric (EducationOrganizationId, RubricTitle, RubricTypeDescriptorId)
;

CREATE INDEX FK_6ab97b_Rubric
ON tpdm.RubricLevel (EducationOrganizationId ASC, RubricTitle ASC, RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.RubricLevelInformation ADD CONSTRAINT FK_dba7ba_LevelTypeDescriptor FOREIGN KEY (LevelTypeDescriptorId)
REFERENCES tpdm.LevelTypeDescriptor (LevelTypeDescriptorId)
;

CREATE INDEX FK_dba7ba_LevelTypeDescriptor
ON tpdm.RubricLevelInformation (LevelTypeDescriptorId ASC);

ALTER TABLE tpdm.RubricLevelInformation ADD CONSTRAINT FK_dba7ba_RubricLevel FOREIGN KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.RubricLevel (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.RubricLevelResponse ADD CONSTRAINT FK_c8ffc2_PerformanceMeasure FOREIGN KEY (PerformanceMeasureIdentifier)
REFERENCES tpdm.PerformanceMeasure (PerformanceMeasureIdentifier)
;

CREATE INDEX FK_c8ffc2_PerformanceMeasure
ON tpdm.RubricLevelResponse (PerformanceMeasureIdentifier ASC);

ALTER TABLE tpdm.RubricLevelResponse ADD CONSTRAINT FK_c8ffc2_RubricLevel FOREIGN KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.RubricLevel (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
;

CREATE INDEX FK_c8ffc2_RubricLevel
ON tpdm.RubricLevelResponse (EducationOrganizationId ASC, RubricLevelCode ASC, RubricTitle ASC, RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.RubricLevelResponseFacts ADD CONSTRAINT FK_98f7aa_PerformanceMeasureFacts FOREIGN KEY (EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear)
REFERENCES tpdm.PerformanceMeasureFacts (EducationOrganizationId, FactsAsOfDate, RubricTitle, RubricTypeDescriptorId, SchoolYear)
;

CREATE INDEX FK_98f7aa_PerformanceMeasureFacts
ON tpdm.RubricLevelResponseFacts (EducationOrganizationId ASC, FactsAsOfDate ASC, RubricTitle ASC, RubricTypeDescriptorId ASC, SchoolYear ASC);

ALTER TABLE tpdm.RubricLevelResponseFacts ADD CONSTRAINT FK_98f7aa_RubricLevel FOREIGN KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.RubricLevel (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
;

CREATE INDEX FK_98f7aa_RubricLevel
ON tpdm.RubricLevelResponseFacts (EducationOrganizationId ASC, RubricLevelCode ASC, RubricTitle ASC, RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.RubricLevelResponseFactsAggregatedNumericResponse ADD CONSTRAINT FK_5176ad_RubricLevelResponseFacts FOREIGN KEY (EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear)
REFERENCES tpdm.RubricLevelResponseFacts (EducationOrganizationId, FactsAsOfDate, RubricLevelCode, RubricTitle, RubricTypeDescriptorId, SchoolYear)
ON DELETE CASCADE
;

ALTER TABLE tpdm.RubricLevelTheme ADD CONSTRAINT FK_9f5d06_RubricLevel FOREIGN KEY (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
REFERENCES tpdm.RubricLevel (EducationOrganizationId, RubricLevelCode, RubricTitle, RubricTypeDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_9f5d06_RubricLevel
ON tpdm.RubricLevelTheme (EducationOrganizationId ASC, RubricLevelCode ASC, RubricTitle ASC, RubricTypeDescriptorId ASC);

ALTER TABLE tpdm.RubricLevelTheme ADD CONSTRAINT FK_9f5d06_ThemeDescriptor FOREIGN KEY (ThemeDescriptorId)
REFERENCES tpdm.ThemeDescriptor (ThemeDescriptorId)
;

CREATE INDEX FK_9f5d06_ThemeDescriptor
ON tpdm.RubricLevelTheme (ThemeDescriptorId ASC);

ALTER TABLE tpdm.RubricTypeDescriptor ADD CONSTRAINT FK_25633b_Descriptor FOREIGN KEY (RubricTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.SalaryTypeDescriptor ADD CONSTRAINT FK_9bdb03_Descriptor FOREIGN KEY (SalaryTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.SchoolExtension ADD CONSTRAINT FK_2199be_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_2199be_FederalLocaleCodeDescriptor
ON tpdm.SchoolExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.SchoolExtension ADD CONSTRAINT FK_2199be_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.SchoolExtension ADD CONSTRAINT FK_2199be_SchoolStatusDescriptor FOREIGN KEY (SchoolStatusDescriptorId)
REFERENCES tpdm.SchoolStatusDescriptor (SchoolStatusDescriptorId)
;

CREATE INDEX FK_2199be_SchoolStatusDescriptor
ON tpdm.SchoolExtension (SchoolStatusDescriptorId ASC);

ALTER TABLE tpdm.SchoolStatusDescriptor ADD CONSTRAINT FK_3bd25e_Descriptor FOREIGN KEY (SchoolStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.SectionCourseTranscriptFacts ADD CONSTRAINT FK_51c6b9_SectionStudentAcademicRecordFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentAcademicRecordFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_51c6b9_SectionStudentAcademicRecordFacts
ON tpdm.SectionCourseTranscriptFacts (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned ADD CONSTRAINT FK_c4b53b_SectionCourseTranscriptFacts FOREIGN KEY (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionCourseTranscriptFacts (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_c4b53b_SectionCourseTranscriptFacts
ON tpdm.SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned (FactAsOfDate ASC, FactsAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionCourseTranscriptFactsAggregatedNumericGradeEarned ADD CONSTRAINT FK_030f78_SectionCourseTranscriptFacts FOREIGN KEY (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionCourseTranscriptFacts (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionCourseTranscriptFactsStudentsEnrolled ADD CONSTRAINT FK_335d64_SectionCourseTranscriptFacts FOREIGN KEY (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionCourseTranscriptFacts (FactAsOfDate, FactsAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionCourseTranscriptFactsStudentsEnrolled ADD CONSTRAINT FK_335d64_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_335d64_ValueTypeDescriptor
ON tpdm.SectionCourseTranscriptFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAcademicRecordFacts ADD CONSTRAINT FK_f7814e_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_f7814e_Section
ON tpdm.SectionStudentAcademicRecordFacts (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentAcademicRecordFactsAggregatedCumulativeGra_f08d2d ADD CONSTRAINT FK_f08d2d_SectionStudentAcademicRecordFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentAcademicRecordFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentAcademicRecordFactsAggregatedSessionGradeP_fca301 ADD CONSTRAINT FK_fca301_SectionStudentAcademicRecordFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentAcademicRecordFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentAcademicRecordFactsStudentsEnrolled ADD CONSTRAINT FK_e97f7b_SectionStudentAcademicRecordFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentAcademicRecordFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentAcademicRecordFactsStudentsEnrolled ADD CONSTRAINT FK_e97f7b_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_e97f7b_ValueTypeDescriptor
ON tpdm.SectionStudentAcademicRecordFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFacts ADD CONSTRAINT FK_aeccab_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_aeccab_AcademicSubjectDescriptor
ON tpdm.SectionStudentAssessmentFacts (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFacts ADD CONSTRAINT FK_aeccab_AssessmentCategoryDescriptor FOREIGN KEY (AssessmentCategoryDescriptorId)
REFERENCES edfi.AssessmentCategoryDescriptor (AssessmentCategoryDescriptorId)
;

CREATE INDEX FK_aeccab_AssessmentCategoryDescriptor
ON tpdm.SectionStudentAssessmentFacts (AssessmentCategoryDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFacts ADD CONSTRAINT FK_aeccab_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_aeccab_GradeLevelDescriptor
ON tpdm.SectionStudentAssessmentFacts (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFacts ADD CONSTRAINT FK_aeccab_SchoolYearType FOREIGN KEY (TakenSchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_aeccab_SchoolYearType
ON tpdm.SectionStudentAssessmentFacts (TakenSchoolYear ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFacts ADD CONSTRAINT FK_aeccab_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_aeccab_Section
ON tpdm.SectionStudentAssessmentFacts (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel ADD CONSTRAINT FK_47f0b3_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorId)
REFERENCES edfi.PerformanceLevelDescriptor (PerformanceLevelDescriptorId)
;

CREATE INDEX FK_47f0b3_PerformanceLevelDescriptor
ON tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel (PerformanceLevelDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel ADD CONSTRAINT FK_47f0b3_SectionStudentAssessmentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
REFERENCES tpdm.SectionStudentAssessmentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_47f0b3_SectionStudentAssessmentFacts
ON tpdm.SectionStudentAssessmentFactsAggregatedPerformanceLevel (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC, TakenSchoolYear ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedScoreResult ADD CONSTRAINT FK_a8f1d0_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorId)
REFERENCES edfi.AssessmentReportingMethodDescriptor (AssessmentReportingMethodDescriptorId)
;

CREATE INDEX FK_a8f1d0_AssessmentReportingMethodDescriptor
ON tpdm.SectionStudentAssessmentFactsAggregatedScoreResult (AssessmentReportingMethodDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedScoreResult ADD CONSTRAINT FK_a8f1d0_ResultDatatypeTypeDescriptor FOREIGN KEY (AverageScoreResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_a8f1d0_ResultDatatypeTypeDescriptor
ON tpdm.SectionStudentAssessmentFactsAggregatedScoreResult (AverageScoreResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentAssessmentFactsAggregatedScoreResult ADD CONSTRAINT FK_a8f1d0_SectionStudentAssessmentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
REFERENCES tpdm.SectionStudentAssessmentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentAssessmentFactsStudentsEnrolled ADD CONSTRAINT FK_8c8c88_SectionStudentAssessmentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
REFERENCES tpdm.SectionStudentAssessmentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, TakenSchoolYear)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentAssessmentFactsStudentsEnrolled ADD CONSTRAINT FK_8c8c88_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_8c8c88_ValueTypeDescriptor
ON tpdm.SectionStudentAssessmentFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFacts ADD CONSTRAINT FK_5b8d40_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_5b8d40_Section
ON tpdm.SectionStudentFacts (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedByDisability ADD CONSTRAINT FK_b4d03c_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_b4d03c_DisabilityDescriptor
ON tpdm.SectionStudentFactsAggregatedByDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedByDisability ADD CONSTRAINT FK_b4d03c_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_b4d03c_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedByDisability (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedByDisability ADD CONSTRAINT FK_b4d03c_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_b4d03c_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedByDisability (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled ADD CONSTRAINT FK_d9754b_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled ADD CONSTRAINT FK_d9754b_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_d9754b_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedELLEnrollment ADD CONSTRAINT FK_f26971_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsAggregatedELLEnrollment ADD CONSTRAINT FK_f26971_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_f26971_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedELLEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedESLEnrollment ADD CONSTRAINT FK_5dc672_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsAggregatedESLEnrollment ADD CONSTRAINT FK_5dc672_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_5dc672_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedESLEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedGender ADD CONSTRAINT FK_b32f83_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_b32f83_GenderDescriptor
ON tpdm.SectionStudentFactsAggregatedGender (GenderDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedGender ADD CONSTRAINT FK_b32f83_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_b32f83_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedGender (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedGender ADD CONSTRAINT FK_b32f83_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_b32f83_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedGender (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity ADD CONSTRAINT FK_5fe64f_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_5fe64f_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity ADD CONSTRAINT FK_5fe64f_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_5fe64f_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedHispanicLatinoEthnicity (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedLanguage ADD CONSTRAINT FK_0bf4da_LanguageDescriptor FOREIGN KEY (LanguageDescriptorId)
REFERENCES edfi.LanguageDescriptor (LanguageDescriptorId)
;

CREATE INDEX FK_0bf4da_LanguageDescriptor
ON tpdm.SectionStudentFactsAggregatedLanguage (LanguageDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedLanguage ADD CONSTRAINT FK_0bf4da_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_0bf4da_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedLanguage (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedLanguage ADD CONSTRAINT FK_0bf4da_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_0bf4da_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedLanguage (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedRace ADD CONSTRAINT FK_974481_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_974481_RaceDescriptor
ON tpdm.SectionStudentFactsAggregatedRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedRace ADD CONSTRAINT FK_974481_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_974481_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedRace (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedRace ADD CONSTRAINT FK_974481_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_974481_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedRace (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService ADD CONSTRAINT FK_664e43_SchoolFoodServiceProgramServiceDescriptor FOREIGN KEY (SchoolFoodServiceProgramServiceDescriptorId)
REFERENCES edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorId)
;

CREATE INDEX FK_664e43_SchoolFoodServiceProgramServiceDescriptor
ON tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService (SchoolFoodServiceProgramServiceDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService ADD CONSTRAINT FK_664e43_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_664e43_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService ADD CONSTRAINT FK_664e43_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_664e43_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedSchoolFoodServiceProgramService (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSection504Enrollment ADD CONSTRAINT FK_a21725_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsAggregatedSection504Enrollment ADD CONSTRAINT FK_a21725_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_a21725_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedSection504Enrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSex ADD CONSTRAINT FK_40becd_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_40becd_SectionStudentFacts
ON tpdm.SectionStudentFactsAggregatedSex (FactAsOfDate ASC, LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSex ADD CONSTRAINT FK_40becd_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_40becd_SexDescriptor
ON tpdm.SectionStudentFactsAggregatedSex (SexDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSex ADD CONSTRAINT FK_40becd_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_40becd_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedSex (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedSPED ADD CONSTRAINT FK_abb497_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsAggregatedSPED ADD CONSTRAINT FK_abb497_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_abb497_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedSPED (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsAggregatedTitleIEnrollment ADD CONSTRAINT FK_7cf0a4_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsAggregatedTitleIEnrollment ADD CONSTRAINT FK_7cf0a4_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_7cf0a4_ValueTypeDescriptor
ON tpdm.SectionStudentFactsAggregatedTitleIEnrollment (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.SectionStudentFactsStudentsEnrolled ADD CONSTRAINT FK_15796b_SectionStudentFacts FOREIGN KEY (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES tpdm.SectionStudentFacts (FactAsOfDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.SectionStudentFactsStudentsEnrolled ADD CONSTRAINT FK_15796b_ValueTypeDescriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES tpdm.ValueTypeDescriptor (ValueTypeDescriptorId)
;

CREATE INDEX FK_15796b_ValueTypeDescriptor
ON tpdm.SectionStudentFactsStudentsEnrolled (ValueTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffApplicantAssociation ADD CONSTRAINT FK_11e466_Applicant FOREIGN KEY (ApplicantIdentifier, EducationOrganizationId)
REFERENCES tpdm.Applicant (ApplicantIdentifier, EducationOrganizationId)
;

CREATE INDEX FK_11e466_Applicant
ON tpdm.StaffApplicantAssociation (ApplicantIdentifier ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.StaffApplicantAssociation ADD CONSTRAINT FK_11e466_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_11e466_Staff
ON tpdm.StaffApplicantAssociation (StaffUSI ASC);

ALTER TABLE tpdm.StaffBackgroundCheck ADD CONSTRAINT FK_69e4a8_BackgroundCheckStatusDescriptor FOREIGN KEY (BackgroundCheckStatusDescriptorId)
REFERENCES tpdm.BackgroundCheckStatusDescriptor (BackgroundCheckStatusDescriptorId)
;

CREATE INDEX FK_69e4a8_BackgroundCheckStatusDescriptor
ON tpdm.StaffBackgroundCheck (BackgroundCheckStatusDescriptorId ASC);

ALTER TABLE tpdm.StaffBackgroundCheck ADD CONSTRAINT FK_69e4a8_BackgroundCheckTypeDescriptor FOREIGN KEY (BackgroundCheckTypeDescriptorId)
REFERENCES tpdm.BackgroundCheckTypeDescriptor (BackgroundCheckTypeDescriptorId)
;

CREATE INDEX FK_69e4a8_BackgroundCheckTypeDescriptor
ON tpdm.StaffBackgroundCheck (BackgroundCheckTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffBackgroundCheck ADD CONSTRAINT FK_69e4a8_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_69e4a8_Staff
ON tpdm.StaffBackgroundCheck (StaffUSI ASC);

ALTER TABLE tpdm.StaffEducationOrganizationAssignmentAssociationExtension ADD CONSTRAINT FK_6ea356_StaffEducationOrganizationAssignmentAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
REFERENCES edfi.StaffEducationOrganizationAssignmentAssociation (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffEvaluation ADD CONSTRAINT FK_5f5473_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_5f5473_EducationOrganization
ON tpdm.StaffEvaluation (EducationOrganizationId ASC);

ALTER TABLE tpdm.StaffEvaluation ADD CONSTRAINT FK_5f5473_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_5f5473_SchoolYearType
ON tpdm.StaffEvaluation (SchoolYear ASC);

ALTER TABLE tpdm.StaffEvaluation ADD CONSTRAINT FK_5f5473_StaffEvaluationPeriodDescriptor FOREIGN KEY (StaffEvaluationPeriodDescriptorId)
REFERENCES tpdm.StaffEvaluationPeriodDescriptor (StaffEvaluationPeriodDescriptorId)
;

CREATE INDEX FK_5f5473_StaffEvaluationPeriodDescriptor
ON tpdm.StaffEvaluation (StaffEvaluationPeriodDescriptorId ASC);

ALTER TABLE tpdm.StaffEvaluation ADD CONSTRAINT FK_5f5473_StaffEvaluationTypeDescriptor FOREIGN KEY (StaffEvaluationTypeDescriptorId)
REFERENCES tpdm.StaffEvaluationTypeDescriptor (StaffEvaluationTypeDescriptorId)
;

CREATE INDEX FK_5f5473_StaffEvaluationTypeDescriptor
ON tpdm.StaffEvaluation (StaffEvaluationTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffEvaluationComponent ADD CONSTRAINT FK_60e7ab_StaffEvaluation FOREIGN KEY (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluation (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
;

CREATE INDEX FK_60e7ab_StaffEvaluation
ON tpdm.StaffEvaluationComponent (EducationOrganizationId ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationComponent ADD CONSTRAINT FK_60e7ab_StaffEvaluationTypeDescriptor FOREIGN KEY (StaffEvaluationTypeDescriptorId)
REFERENCES tpdm.StaffEvaluationTypeDescriptor (StaffEvaluationTypeDescriptorId)
;

CREATE INDEX FK_60e7ab_StaffEvaluationTypeDescriptor
ON tpdm.StaffEvaluationComponent (StaffEvaluationTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffEvaluationComponentRating ADD CONSTRAINT FK_6b5a36_StaffEvaluationComponent FOREIGN KEY (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluationComponent (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
;

CREATE INDEX FK_6b5a36_StaffEvaluationComponent
ON tpdm.StaffEvaluationComponentRating (EducationOrganizationId ASC, EvaluationComponent ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationComponentRating ADD CONSTRAINT FK_6b5a36_StaffEvaluationRating FOREIGN KEY (EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
REFERENCES tpdm.StaffEvaluationRating (EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
;

CREATE INDEX FK_6b5a36_StaffEvaluationRating
ON tpdm.StaffEvaluationComponentRating (EducationOrganizationId ASC, SchoolYear ASC, StaffEvaluationDate ASC, StaffEvaluationTitle ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffEvaluationComponentRating ADD CONSTRAINT FK_6b5a36_StaffEvaluationRatingLevelDescriptor FOREIGN KEY (StaffEvaluationRatingLevelDescriptorId)
REFERENCES tpdm.StaffEvaluationRatingLevelDescriptor (StaffEvaluationRatingLevelDescriptorId)
;

CREATE INDEX FK_6b5a36_StaffEvaluationRatingLevelDescriptor
ON tpdm.StaffEvaluationComponentRating (StaffEvaluationRatingLevelDescriptorId ASC);

ALTER TABLE tpdm.StaffEvaluationComponentStaffRatingLevel ADD CONSTRAINT FK_c002a7_StaffEvaluationComponent FOREIGN KEY (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluationComponent (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
ON DELETE CASCADE
;

CREATE INDEX FK_c002a7_StaffEvaluationComponent
ON tpdm.StaffEvaluationComponentStaffRatingLevel (EducationOrganizationId ASC, EvaluationComponent ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationElement ADD CONSTRAINT FK_9e0757_StaffEvaluationComponent FOREIGN KEY (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluationComponent (EducationOrganizationId, EvaluationComponent, SchoolYear, StaffEvaluationTitle)
;

CREATE INDEX FK_9e0757_StaffEvaluationComponent
ON tpdm.StaffEvaluationElement (EducationOrganizationId ASC, EvaluationComponent ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationElementRating ADD CONSTRAINT FK_e94b2b_StaffEvaluationElement FOREIGN KEY (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluationElement (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle)
;

CREATE INDEX FK_e94b2b_StaffEvaluationElement
ON tpdm.StaffEvaluationElementRating (EducationOrganizationId ASC, EvaluationComponent ASC, EvaluationElement ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationElementRating ADD CONSTRAINT FK_e94b2b_StaffEvaluationRating FOREIGN KEY (EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
REFERENCES tpdm.StaffEvaluationRating (EducationOrganizationId, SchoolYear, StaffEvaluationDate, StaffEvaluationTitle, StaffUSI)
;

CREATE INDEX FK_e94b2b_StaffEvaluationRating
ON tpdm.StaffEvaluationElementRating (EducationOrganizationId ASC, SchoolYear ASC, StaffEvaluationDate ASC, StaffEvaluationTitle ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffEvaluationElementRating ADD CONSTRAINT FK_e94b2b_StaffEvaluationRatingLevelDescriptor FOREIGN KEY (StaffEvaluationRatingLevelDescriptorId)
REFERENCES tpdm.StaffEvaluationRatingLevelDescriptor (StaffEvaluationRatingLevelDescriptorId)
;

CREATE INDEX FK_e94b2b_StaffEvaluationRatingLevelDescriptor
ON tpdm.StaffEvaluationElementRating (StaffEvaluationRatingLevelDescriptorId ASC);

ALTER TABLE tpdm.StaffEvaluationElementStaffRatingLevel ADD CONSTRAINT FK_7ff769_StaffEvaluationElement FOREIGN KEY (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluationElement (EducationOrganizationId, EvaluationComponent, EvaluationElement, SchoolYear, StaffEvaluationTitle)
ON DELETE CASCADE
;

CREATE INDEX FK_7ff769_StaffEvaluationElement
ON tpdm.StaffEvaluationElementStaffRatingLevel (EducationOrganizationId ASC, EvaluationComponent ASC, EvaluationElement ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationPeriodDescriptor ADD CONSTRAINT FK_35577d_Descriptor FOREIGN KEY (StaffEvaluationPeriodDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffEvaluationRating ADD CONSTRAINT FK_e34e81_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_e34e81_Staff
ON tpdm.StaffEvaluationRating (StaffUSI ASC);

ALTER TABLE tpdm.StaffEvaluationRating ADD CONSTRAINT FK_e34e81_Staff1 FOREIGN KEY (EvaluatedByStaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_e34e81_Staff1
ON tpdm.StaffEvaluationRating (EvaluatedByStaffUSI ASC);

ALTER TABLE tpdm.StaffEvaluationRating ADD CONSTRAINT FK_e34e81_StaffEvaluation FOREIGN KEY (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluation (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
;

CREATE INDEX FK_e34e81_StaffEvaluation
ON tpdm.StaffEvaluationRating (EducationOrganizationId ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationRating ADD CONSTRAINT FK_e34e81_StaffEvaluationRatingLevelDescriptor FOREIGN KEY (StaffEvaluationRatingLevelDescriptorId)
REFERENCES tpdm.StaffEvaluationRatingLevelDescriptor (StaffEvaluationRatingLevelDescriptorId)
;

CREATE INDEX FK_e34e81_StaffEvaluationRatingLevelDescriptor
ON tpdm.StaffEvaluationRating (StaffEvaluationRatingLevelDescriptorId ASC);

ALTER TABLE tpdm.StaffEvaluationRatingLevelDescriptor ADD CONSTRAINT FK_bccbac_Descriptor FOREIGN KEY (StaffEvaluationRatingLevelDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffEvaluationStaffRatingLevel ADD CONSTRAINT FK_090e45_StaffEvaluation FOREIGN KEY (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
REFERENCES tpdm.StaffEvaluation (EducationOrganizationId, SchoolYear, StaffEvaluationTitle)
ON DELETE CASCADE
;

CREATE INDEX FK_090e45_StaffEvaluation
ON tpdm.StaffEvaluationStaffRatingLevel (EducationOrganizationId ASC, SchoolYear ASC, StaffEvaluationTitle ASC);

ALTER TABLE tpdm.StaffEvaluationTypeDescriptor ADD CONSTRAINT FK_1186b3_Descriptor FOREIGN KEY (StaffEvaluationTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffExtension ADD CONSTRAINT FK_d7b81a_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_d7b81a_GenderDescriptor
ON tpdm.StaffExtension (GenderDescriptorId ASC);

ALTER TABLE tpdm.StaffExtension ADD CONSTRAINT FK_d7b81a_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffFieldworkAbsenceEvent ADD CONSTRAINT FK_420d2e_AbsenceEventCategoryDescriptor FOREIGN KEY (AbsenceEventCategoryDescriptorId)
REFERENCES edfi.AbsenceEventCategoryDescriptor (AbsenceEventCategoryDescriptorId)
;

CREATE INDEX FK_420d2e_AbsenceEventCategoryDescriptor
ON tpdm.StaffFieldworkAbsenceEvent (AbsenceEventCategoryDescriptorId ASC);

ALTER TABLE tpdm.StaffFieldworkAbsenceEvent ADD CONSTRAINT FK_420d2e_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_420d2e_Staff
ON tpdm.StaffFieldworkAbsenceEvent (StaffUSI ASC);

ALTER TABLE tpdm.StaffFieldworkExperience ADD CONSTRAINT FK_fe2944_FieldworkTypeDescriptor FOREIGN KEY (FieldworkTypeDescriptorId)
REFERENCES tpdm.FieldworkTypeDescriptor (FieldworkTypeDescriptorId)
;

CREATE INDEX FK_fe2944_FieldworkTypeDescriptor
ON tpdm.StaffFieldworkExperience (FieldworkTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffFieldworkExperience ADD CONSTRAINT FK_fe2944_ProgramGatewayDescriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES tpdm.ProgramGatewayDescriptor (ProgramGatewayDescriptorId)
;

CREATE INDEX FK_fe2944_ProgramGatewayDescriptor
ON tpdm.StaffFieldworkExperience (ProgramGatewayDescriptorId ASC);

ALTER TABLE tpdm.StaffFieldworkExperience ADD CONSTRAINT FK_fe2944_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_fe2944_Staff
ON tpdm.StaffFieldworkExperience (StaffUSI ASC);

ALTER TABLE tpdm.StaffFieldworkExperienceCoteaching ADD CONSTRAINT FK_1cf4c8_StaffFieldworkExperience FOREIGN KEY (BeginDate, FieldworkIdentifier, StaffUSI)
REFERENCES tpdm.StaffFieldworkExperience (BeginDate, FieldworkIdentifier, StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffFieldworkExperienceSchool ADD CONSTRAINT FK_6e47f9_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_6e47f9_School
ON tpdm.StaffFieldworkExperienceSchool (SchoolId ASC);

ALTER TABLE tpdm.StaffFieldworkExperienceSchool ADD CONSTRAINT FK_6e47f9_StaffFieldworkExperience FOREIGN KEY (BeginDate, FieldworkIdentifier, StaffUSI)
REFERENCES tpdm.StaffFieldworkExperience (BeginDate, FieldworkIdentifier, StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_6e47f9_StaffFieldworkExperience
ON tpdm.StaffFieldworkExperienceSchool (BeginDate ASC, FieldworkIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffFieldworkExperienceSectionAssociation ADD CONSTRAINT FK_aa4534_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_aa4534_Section
ON tpdm.StaffFieldworkExperienceSectionAssociation (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.StaffFieldworkExperienceSectionAssociation ADD CONSTRAINT FK_aa4534_StaffFieldworkExperience FOREIGN KEY (BeginDate, FieldworkIdentifier, StaffUSI)
REFERENCES tpdm.StaffFieldworkExperience (BeginDate, FieldworkIdentifier, StaffUSI)
;

CREATE INDEX FK_aa4534_StaffFieldworkExperience
ON tpdm.StaffFieldworkExperienceSectionAssociation (BeginDate ASC, FieldworkIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffHighlyQualifiedAcademicSubject ADD CONSTRAINT FK_37449d_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_37449d_AcademicSubjectDescriptor
ON tpdm.StaffHighlyQualifiedAcademicSubject (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.StaffHighlyQualifiedAcademicSubject ADD CONSTRAINT FK_37449d_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_37449d_Staff
ON tpdm.StaffHighlyQualifiedAcademicSubject (StaffUSI ASC);

ALTER TABLE tpdm.StaffProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_b4a1e0_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorId)
REFERENCES edfi.AttendanceEventCategoryDescriptor (AttendanceEventCategoryDescriptorId)
;

CREATE INDEX FK_b4a1e0_AttendanceEventCategoryDescriptor
ON tpdm.StaffProfessionalDevelopmentEventAttendance (AttendanceEventCategoryDescriptorId ASC);

ALTER TABLE tpdm.StaffProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_b4a1e0_ProfessionalDevelopmentEvent FOREIGN KEY (ProfessionalDevelopmentTitle)
REFERENCES tpdm.ProfessionalDevelopmentEvent (ProfessionalDevelopmentTitle)
;

CREATE INDEX FK_b4a1e0_ProfessionalDevelopmentEvent
ON tpdm.StaffProfessionalDevelopmentEventAttendance (ProfessionalDevelopmentTitle ASC);

ALTER TABLE tpdm.StaffProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_b4a1e0_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_b4a1e0_Staff
ON tpdm.StaffProfessionalDevelopmentEventAttendance (StaffUSI ASC);

ALTER TABLE tpdm.StaffProspectAssociation ADD CONSTRAINT FK_990b71_Prospect FOREIGN KEY (EducationOrganizationId, ProspectIdentifier)
REFERENCES tpdm.Prospect (EducationOrganizationId, ProspectIdentifier)
;

CREATE INDEX FK_990b71_Prospect
ON tpdm.StaffProspectAssociation (EducationOrganizationId ASC, ProspectIdentifier ASC);

ALTER TABLE tpdm.StaffProspectAssociation ADD CONSTRAINT FK_990b71_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_990b71_Staff
ON tpdm.StaffProspectAssociation (StaffUSI ASC);

ALTER TABLE tpdm.StaffSalary ADD CONSTRAINT FK_0169b7_SalaryTypeDescriptor FOREIGN KEY (SalaryTypeDescriptorId)
REFERENCES tpdm.SalaryTypeDescriptor (SalaryTypeDescriptorId)
;

CREATE INDEX FK_0169b7_SalaryTypeDescriptor
ON tpdm.StaffSalary (SalaryTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffSalary ADD CONSTRAINT FK_0169b7_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffSeniority ADD CONSTRAINT FK_3cc480_CredentialFieldDescriptor FOREIGN KEY (CredentialFieldDescriptorId)
REFERENCES edfi.CredentialFieldDescriptor (CredentialFieldDescriptorId)
;

CREATE INDEX FK_3cc480_CredentialFieldDescriptor
ON tpdm.StaffSeniority (CredentialFieldDescriptorId ASC);

ALTER TABLE tpdm.StaffSeniority ADD CONSTRAINT FK_3cc480_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_3cc480_Staff
ON tpdm.StaffSeniority (StaffUSI ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasure ADD CONSTRAINT FK_609983_ResultDatatypeTypeDescriptor FOREIGN KEY (ResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_609983_ResultDatatypeTypeDescriptor
ON tpdm.StaffStudentGrowthMeasure (ResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasure ADD CONSTRAINT FK_609983_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_609983_SchoolYearType
ON tpdm.StaffStudentGrowthMeasure (SchoolYear ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasure ADD CONSTRAINT FK_609983_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_609983_Staff
ON tpdm.StaffStudentGrowthMeasure (StaffUSI ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasure ADD CONSTRAINT FK_609983_StudentGrowthTypeDescriptor FOREIGN KEY (StudentGrowthTypeDescriptorId)
REFERENCES tpdm.StudentGrowthTypeDescriptor (StudentGrowthTypeDescriptorId)
;

CREATE INDEX FK_609983_StudentGrowthTypeDescriptor
ON tpdm.StaffStudentGrowthMeasure (StudentGrowthTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureAcademicSubject ADD CONSTRAINT FK_517653_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_517653_AcademicSubjectDescriptor
ON tpdm.StaffStudentGrowthMeasureAcademicSubject (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureAcademicSubject ADD CONSTRAINT FK_517653_StaffStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
REFERENCES tpdm.StaffStudentGrowthMeasure (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_517653_StaffStudentGrowthMeasure
ON tpdm.StaffStudentGrowthMeasureAcademicSubject (FactAsOfDate ASC, SchoolYear ASC, StaffStudentGrowthMeasureIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureCourseAssociation ADD CONSTRAINT FK_f22014_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_f22014_Course
ON tpdm.StaffStudentGrowthMeasureCourseAssociation (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureCourseAssociation ADD CONSTRAINT FK_f22014_StaffStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
REFERENCES tpdm.StaffStudentGrowthMeasure (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
;

CREATE INDEX FK_f22014_StaffStudentGrowthMeasure
ON tpdm.StaffStudentGrowthMeasureCourseAssociation (FactAsOfDate ASC, SchoolYear ASC, StaffStudentGrowthMeasureIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation ADD CONSTRAINT FK_120788_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_120788_EducationOrganization
ON tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation (EducationOrganizationId ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation ADD CONSTRAINT FK_120788_StaffStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
REFERENCES tpdm.StaffStudentGrowthMeasure (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
;

CREATE INDEX FK_120788_StaffStudentGrowthMeasure
ON tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation (FactAsOfDate ASC, SchoolYear ASC, StaffStudentGrowthMeasureIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureGradeLevel ADD CONSTRAINT FK_455e3f_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_455e3f_GradeLevelDescriptor
ON tpdm.StaffStudentGrowthMeasureGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureGradeLevel ADD CONSTRAINT FK_455e3f_StaffStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
REFERENCES tpdm.StaffStudentGrowthMeasure (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_455e3f_StaffStudentGrowthMeasure
ON tpdm.StaffStudentGrowthMeasureGradeLevel (FactAsOfDate ASC, SchoolYear ASC, StaffStudentGrowthMeasureIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureSectionAssociation ADD CONSTRAINT FK_fbfeb4_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_fbfeb4_Section
ON tpdm.StaffStudentGrowthMeasureSectionAssociation (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.StaffStudentGrowthMeasureSectionAssociation ADD CONSTRAINT FK_fbfeb4_StaffStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
REFERENCES tpdm.StaffStudentGrowthMeasure (FactAsOfDate, SchoolYear, StaffStudentGrowthMeasureIdentifier, StaffUSI)
;

CREATE INDEX FK_fbfeb4_StaffStudentGrowthMeasure
ON tpdm.StaffStudentGrowthMeasureSectionAssociation (FactAsOfDate ASC, SchoolYear ASC, StaffStudentGrowthMeasureIdentifier ASC, StaffUSI ASC);

ALTER TABLE tpdm.StaffTeacherEducatorResearch ADD CONSTRAINT FK_3234a7_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StaffTeacherPreparationProgram ADD CONSTRAINT FK_41a331_LevelOfDegreeAwardedDescriptor FOREIGN KEY (LevelOfDegreeAwardedDescriptorId)
REFERENCES tpdm.LevelOfDegreeAwardedDescriptor (LevelOfDegreeAwardedDescriptorId)
;

CREATE INDEX FK_41a331_LevelOfDegreeAwardedDescriptor
ON tpdm.StaffTeacherPreparationProgram (LevelOfDegreeAwardedDescriptorId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProgram ADD CONSTRAINT FK_41a331_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_41a331_Staff
ON tpdm.StaffTeacherPreparationProgram (StaffUSI ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProgram ADD CONSTRAINT FK_41a331_TeacherPreparationProgramTypeDescriptor FOREIGN KEY (TeacherPreparationProgramTypeDescriptorId)
REFERENCES tpdm.TeacherPreparationProgramTypeDescriptor (TeacherPreparationProgramTypeDescriptorId)
;

CREATE INDEX FK_41a331_TeacherPreparationProgramTypeDescriptor
ON tpdm.StaffTeacherPreparationProgram (TeacherPreparationProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ADD CONSTRAINT FK_7bf40b_ProgramAssignmentDescriptor FOREIGN KEY (ProgramAssignmentDescriptorId)
REFERENCES edfi.ProgramAssignmentDescriptor (ProgramAssignmentDescriptorId)
;

CREATE INDEX FK_7bf40b_ProgramAssignmentDescriptor
ON tpdm.StaffTeacherPreparationProviderAssociation (ProgramAssignmentDescriptorId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ADD CONSTRAINT FK_7bf40b_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_7bf40b_SchoolYearType
ON tpdm.StaffTeacherPreparationProviderAssociation (SchoolYear ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ADD CONSTRAINT FK_7bf40b_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_7bf40b_Staff
ON tpdm.StaffTeacherPreparationProviderAssociation (StaffUSI ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociation ADD CONSTRAINT FK_7bf40b_TeacherPreparationProvider FOREIGN KEY (TeacherPreparationProviderId)
REFERENCES tpdm.TeacherPreparationProvider (TeacherPreparationProviderId)
;

CREATE INDEX FK_7bf40b_TeacherPreparationProvider
ON tpdm.StaffTeacherPreparationProviderAssociation (TeacherPreparationProviderId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject ADD CONSTRAINT FK_32c1aa_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_32c1aa_AcademicSubjectDescriptor
ON tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject ADD CONSTRAINT FK_32c1aa_StaffTeacherPreparationProviderAssociation FOREIGN KEY (StaffUSI, TeacherPreparationProviderId)
REFERENCES tpdm.StaffTeacherPreparationProviderAssociation (StaffUSI, TeacherPreparationProviderId)
ON DELETE CASCADE
;

CREATE INDEX FK_32c1aa_StaffTeacherPreparationProviderAssociation
ON tpdm.StaffTeacherPreparationProviderAssociationAcademicSubject (StaffUSI ASC, TeacherPreparationProviderId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociationGradeLevel ADD CONSTRAINT FK_e2901f_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_e2901f_GradeLevelDescriptor
ON tpdm.StaffTeacherPreparationProviderAssociationGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderAssociationGradeLevel ADD CONSTRAINT FK_e2901f_StaffTeacherPreparationProviderAssociation FOREIGN KEY (StaffUSI, TeacherPreparationProviderId)
REFERENCES tpdm.StaffTeacherPreparationProviderAssociation (StaffUSI, TeacherPreparationProviderId)
ON DELETE CASCADE
;

CREATE INDEX FK_e2901f_StaffTeacherPreparationProviderAssociation
ON tpdm.StaffTeacherPreparationProviderAssociationGradeLevel (StaffUSI ASC, TeacherPreparationProviderId ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderProgramAssociation ADD CONSTRAINT FK_5bac62_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_5bac62_Staff
ON tpdm.StaffTeacherPreparationProviderProgramAssociation (StaffUSI ASC);

ALTER TABLE tpdm.StaffTeacherPreparationProviderProgramAssociation ADD CONSTRAINT FK_5bac62_TeacherPreparationProviderProgram FOREIGN KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
REFERENCES tpdm.TeacherPreparationProviderProgram (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
;

CREATE INDEX FK_5bac62_TeacherPreparationProviderProgram
ON tpdm.StaffTeacherPreparationProviderProgramAssociation (EducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.StateEducationAgencyExtension ADD CONSTRAINT FK_31f08a_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_31f08a_FederalLocaleCodeDescriptor
ON tpdm.StateEducationAgencyExtension (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.StateEducationAgencyExtension ADD CONSTRAINT FK_31f08a_StateEducationAgency FOREIGN KEY (StateEducationAgencyId)
REFERENCES edfi.StateEducationAgency (StateEducationAgencyId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.StudentGradebookEntryExtension ADD CONSTRAINT FK_c1d2f5_StudentGradebookEntry FOREIGN KEY (BeginDate, DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.StudentGradebookEntry (BeginDate, DateAssigned, GradebookEntryTitle, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE tpdm.StudentGrowthTypeDescriptor ADD CONSTRAINT FK_132667_Descriptor FOREIGN KEY (StudentGrowthTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.SurveyLevelDescriptor ADD CONSTRAINT FK_bce725_Descriptor FOREIGN KEY (SurveyLevelDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TalentManagementGoal ADD CONSTRAINT FK_c4d5a9_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_c4d5a9_SchoolYearType
ON tpdm.TalentManagementGoal (SchoolYear ASC);

ALTER TABLE tpdm.TalentManagementGoalEducationOrganization ADD CONSTRAINT FK_b917ab_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_b917ab_EducationOrganization
ON tpdm.TalentManagementGoalEducationOrganization (EducationOrganizationId ASC);

ALTER TABLE tpdm.TalentManagementGoalEducationOrganization ADD CONSTRAINT FK_b917ab_TalentManagementGoal FOREIGN KEY (GoalTitle, SchoolYear)
REFERENCES tpdm.TalentManagementGoal (GoalTitle, SchoolYear)
ON DELETE CASCADE
;

CREATE INDEX FK_b917ab_TalentManagementGoal
ON tpdm.TalentManagementGoalEducationOrganization (GoalTitle ASC, SchoolYear ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_CitizenshipStatusDescriptor FOREIGN KEY (CitizenshipStatusDescriptorId)
REFERENCES edfi.CitizenshipStatusDescriptor (CitizenshipStatusDescriptorId)
;

CREATE INDEX FK_835b49_CitizenshipStatusDescriptor
ON tpdm.TeacherCandidate (CitizenshipStatusDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_CountryDescriptor FOREIGN KEY (BirthCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_835b49_CountryDescriptor
ON tpdm.TeacherCandidate (BirthCountryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_EnglishLanguageExamDescriptor FOREIGN KEY (EnglishLanguageExamDescriptorId)
REFERENCES tpdm.EnglishLanguageExamDescriptor (EnglishLanguageExamDescriptorId)
;

CREATE INDEX FK_835b49_EnglishLanguageExamDescriptor
ON tpdm.TeacherCandidate (EnglishLanguageExamDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_GenderDescriptor FOREIGN KEY (GenderDescriptorId)
REFERENCES tpdm.GenderDescriptor (GenderDescriptorId)
;

CREATE INDEX FK_835b49_GenderDescriptor
ON tpdm.TeacherCandidate (GenderDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_LimitedEnglishProficiencyDescriptor FOREIGN KEY (LimitedEnglishProficiencyDescriptorId)
REFERENCES edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorId)
;

CREATE INDEX FK_835b49_LimitedEnglishProficiencyDescriptor
ON tpdm.TeacherCandidate (LimitedEnglishProficiencyDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_OldEthnicityDescriptor FOREIGN KEY (OldEthnicityDescriptorId)
REFERENCES edfi.OldEthnicityDescriptor (OldEthnicityDescriptorId)
;

CREATE INDEX FK_835b49_OldEthnicityDescriptor
ON tpdm.TeacherCandidate (OldEthnicityDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_PreviousCareerDescriptor FOREIGN KEY (PreviousCareerDescriptorId)
REFERENCES tpdm.PreviousCareerDescriptor (PreviousCareerDescriptorId)
;

CREATE INDEX FK_835b49_PreviousCareerDescriptor
ON tpdm.TeacherCandidate (PreviousCareerDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_SexDescriptor FOREIGN KEY (SexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_835b49_SexDescriptor
ON tpdm.TeacherCandidate (SexDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_SexDescriptor1 FOREIGN KEY (BirthSexDescriptorId)
REFERENCES edfi.SexDescriptor (SexDescriptorId)
;

CREATE INDEX FK_835b49_SexDescriptor1
ON tpdm.TeacherCandidate (BirthSexDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_StateAbbreviationDescriptor FOREIGN KEY (BirthStateAbbreviationDescriptorId)
REFERENCES edfi.StateAbbreviationDescriptor (StateAbbreviationDescriptorId)
;

CREATE INDEX FK_835b49_StateAbbreviationDescriptor
ON tpdm.TeacherCandidate (BirthStateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidate ADD CONSTRAINT FK_835b49_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_835b49_Student
ON tpdm.TeacherCandidate (StudentUSI ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_CreditTypeDescriptor FOREIGN KEY (CumulativeEarnedCreditTypeDescriptorId)
REFERENCES edfi.CreditTypeDescriptor (CreditTypeDescriptorId)
;

CREATE INDEX FK_163dde_CreditTypeDescriptor
ON tpdm.TeacherCandidateAcademicRecord (CumulativeEarnedCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_CreditTypeDescriptor1 FOREIGN KEY (CumulativeAttemptedCreditTypeDescriptorId)
REFERENCES edfi.CreditTypeDescriptor (CreditTypeDescriptorId)
;

CREATE INDEX FK_163dde_CreditTypeDescriptor1
ON tpdm.TeacherCandidateAcademicRecord (CumulativeAttemptedCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_CreditTypeDescriptor2 FOREIGN KEY (SessionEarnedCreditTypeDescriptorId)
REFERENCES edfi.CreditTypeDescriptor (CreditTypeDescriptorId)
;

CREATE INDEX FK_163dde_CreditTypeDescriptor2
ON tpdm.TeacherCandidateAcademicRecord (SessionEarnedCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_CreditTypeDescriptor3 FOREIGN KEY (SessionAttemptedCreditTypeDescriptorId)
REFERENCES edfi.CreditTypeDescriptor (CreditTypeDescriptorId)
;

CREATE INDEX FK_163dde_CreditTypeDescriptor3
ON tpdm.TeacherCandidateAcademicRecord (SessionAttemptedCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_163dde_EducationOrganization
ON tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_ProgramGatewayDescriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES tpdm.ProgramGatewayDescriptor (ProgramGatewayDescriptorId)
;

CREATE INDEX FK_163dde_ProgramGatewayDescriptor
ON tpdm.TeacherCandidateAcademicRecord (ProgramGatewayDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_163dde_SchoolYearType
ON tpdm.TeacherCandidateAcademicRecord (SchoolYear ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_163dde_TeacherCandidate
ON tpdm.TeacherCandidateAcademicRecord (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

CREATE INDEX FK_163dde_TermDescriptor
ON tpdm.TeacherCandidateAcademicRecord (TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecord ADD CONSTRAINT FK_163dde_TPPDegreeTypeDescriptor FOREIGN KEY (TPPDegreeTypeDescriptorId)
REFERENCES tpdm.TPPDegreeTypeDescriptor (TPPDegreeTypeDescriptorId)
;

CREATE INDEX FK_163dde_TPPDegreeTypeDescriptor
ON tpdm.TeacherCandidateAcademicRecord (TPPDegreeTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordAcademicHonor ADD CONSTRAINT FK_5422f8_AcademicHonorCategoryDescriptor FOREIGN KEY (AcademicHonorCategoryDescriptorId)
REFERENCES edfi.AcademicHonorCategoryDescriptor (AcademicHonorCategoryDescriptorId)
;

CREATE INDEX FK_5422f8_AcademicHonorCategoryDescriptor
ON tpdm.TeacherCandidateAcademicRecordAcademicHonor (AcademicHonorCategoryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordAcademicHonor ADD CONSTRAINT FK_5422f8_AchievementCategoryDescriptor FOREIGN KEY (AchievementCategoryDescriptorId)
REFERENCES edfi.AchievementCategoryDescriptor (AchievementCategoryDescriptorId)
;

CREATE INDEX FK_5422f8_AchievementCategoryDescriptor
ON tpdm.TeacherCandidateAcademicRecordAcademicHonor (AchievementCategoryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordAcademicHonor ADD CONSTRAINT FK_5422f8_TeacherCandidateAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_5422f8_TeacherCandidateAcademicRecord
ON tpdm.TeacherCandidateAcademicRecordAcademicHonor (EducationOrganizationId ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordClassRanking ADD CONSTRAINT FK_e59008_TeacherCandidateAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TeacherCandidateAcademicRecordDiploma ADD CONSTRAINT FK_dd7b47_AchievementCategoryDescriptor FOREIGN KEY (AchievementCategoryDescriptorId)
REFERENCES edfi.AchievementCategoryDescriptor (AchievementCategoryDescriptorId)
;

CREATE INDEX FK_dd7b47_AchievementCategoryDescriptor
ON tpdm.TeacherCandidateAcademicRecordDiploma (AchievementCategoryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordDiploma ADD CONSTRAINT FK_dd7b47_DiplomaLevelDescriptor FOREIGN KEY (DiplomaLevelDescriptorId)
REFERENCES edfi.DiplomaLevelDescriptor (DiplomaLevelDescriptorId)
;

CREATE INDEX FK_dd7b47_DiplomaLevelDescriptor
ON tpdm.TeacherCandidateAcademicRecordDiploma (DiplomaLevelDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordDiploma ADD CONSTRAINT FK_dd7b47_DiplomaTypeDescriptor FOREIGN KEY (DiplomaTypeDescriptorId)
REFERENCES edfi.DiplomaTypeDescriptor (DiplomaTypeDescriptorId)
;

CREATE INDEX FK_dd7b47_DiplomaTypeDescriptor
ON tpdm.TeacherCandidateAcademicRecordDiploma (DiplomaTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordDiploma ADD CONSTRAINT FK_dd7b47_TeacherCandidateAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_dd7b47_TeacherCandidateAcademicRecord
ON tpdm.TeacherCandidateAcademicRecordDiploma (EducationOrganizationId ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordGradePointAverage ADD CONSTRAINT FK_ab13d0_GradePointAverageTypeDescriptor FOREIGN KEY (GradePointAverageTypeDescriptorId)
REFERENCES edfi.GradePointAverageTypeDescriptor (GradePointAverageTypeDescriptorId)
;

CREATE INDEX FK_ab13d0_GradePointAverageTypeDescriptor
ON tpdm.TeacherCandidateAcademicRecordGradePointAverage (GradePointAverageTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordGradePointAverage ADD CONSTRAINT FK_ab13d0_TeacherCandidateAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_ab13d0_TeacherCandidateAcademicRecord
ON tpdm.TeacherCandidateAcademicRecordGradePointAverage (EducationOrganizationId ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordRecognition ADD CONSTRAINT FK_ffa30c_AchievementCategoryDescriptor FOREIGN KEY (AchievementCategoryDescriptorId)
REFERENCES edfi.AchievementCategoryDescriptor (AchievementCategoryDescriptorId)
;

CREATE INDEX FK_ffa30c_AchievementCategoryDescriptor
ON tpdm.TeacherCandidateAcademicRecordRecognition (AchievementCategoryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordRecognition ADD CONSTRAINT FK_ffa30c_RecognitionTypeDescriptor FOREIGN KEY (RecognitionTypeDescriptorId)
REFERENCES edfi.RecognitionTypeDescriptor (RecognitionTypeDescriptorId)
;

CREATE INDEX FK_ffa30c_RecognitionTypeDescriptor
ON tpdm.TeacherCandidateAcademicRecordRecognition (RecognitionTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAcademicRecordRecognition ADD CONSTRAINT FK_ffa30c_TeacherCandidateAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_ffa30c_TeacherCandidateAcademicRecord
ON tpdm.TeacherCandidateAcademicRecordRecognition (EducationOrganizationId ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAddress ADD CONSTRAINT FK_791088_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorId)
REFERENCES edfi.AddressTypeDescriptor (AddressTypeDescriptorId)
;

CREATE INDEX FK_791088_AddressTypeDescriptor
ON tpdm.TeacherCandidateAddress (AddressTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAddress ADD CONSTRAINT FK_791088_LocaleDescriptor FOREIGN KEY (LocaleDescriptorId)
REFERENCES edfi.LocaleDescriptor (LocaleDescriptorId)
;

CREATE INDEX FK_791088_LocaleDescriptor
ON tpdm.TeacherCandidateAddress (LocaleDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAddress ADD CONSTRAINT FK_791088_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorId)
REFERENCES edfi.StateAbbreviationDescriptor (StateAbbreviationDescriptorId)
;

CREATE INDEX FK_791088_StateAbbreviationDescriptor
ON tpdm.TeacherCandidateAddress (StateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAddress ADD CONSTRAINT FK_791088_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_791088_TeacherCandidate
ON tpdm.TeacherCandidateAddress (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateAddressPeriod ADD CONSTRAINT FK_5309d6_TeacherCandidateAddress FOREIGN KEY (AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName, TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidateAddress (AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName, TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_5309d6_TeacherCandidateAddress
ON tpdm.TeacherCandidateAddressPeriod (AddressTypeDescriptorId ASC, City ASC, PostalCode ASC, StateAbbreviationDescriptorId ASC, StreetNumberName ASC, TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateAid ADD CONSTRAINT FK_8d1b7a_AidTypeDescriptor FOREIGN KEY (AidTypeDescriptorId)
REFERENCES tpdm.AidTypeDescriptor (AidTypeDescriptorId)
;

CREATE INDEX FK_8d1b7a_AidTypeDescriptor
ON tpdm.TeacherCandidateAid (AidTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateAid ADD CONSTRAINT FK_8d1b7a_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_8d1b7a_TeacherCandidate
ON tpdm.TeacherCandidateAid (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateBackgroundCheck ADD CONSTRAINT FK_c7750c_BackgroundCheckStatusDescriptor FOREIGN KEY (BackgroundCheckStatusDescriptorId)
REFERENCES tpdm.BackgroundCheckStatusDescriptor (BackgroundCheckStatusDescriptorId)
;

CREATE INDEX FK_c7750c_BackgroundCheckStatusDescriptor
ON tpdm.TeacherCandidateBackgroundCheck (BackgroundCheckStatusDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateBackgroundCheck ADD CONSTRAINT FK_c7750c_BackgroundCheckTypeDescriptor FOREIGN KEY (BackgroundCheckTypeDescriptorId)
REFERENCES tpdm.BackgroundCheckTypeDescriptor (BackgroundCheckTypeDescriptorId)
;

CREATE INDEX FK_c7750c_BackgroundCheckTypeDescriptor
ON tpdm.TeacherCandidateBackgroundCheck (BackgroundCheckTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateBackgroundCheck ADD CONSTRAINT FK_c7750c_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TeacherCandidateCharacteristic ADD CONSTRAINT FK_2a656a_StudentCharacteristicDescriptor FOREIGN KEY (StudentCharacteristicDescriptorId)
REFERENCES edfi.StudentCharacteristicDescriptor (StudentCharacteristicDescriptorId)
;

CREATE INDEX FK_2a656a_StudentCharacteristicDescriptor
ON tpdm.TeacherCandidateCharacteristic (StudentCharacteristicDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCharacteristic ADD CONSTRAINT FK_2a656a_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_2a656a_TeacherCandidate
ON tpdm.TeacherCandidateCharacteristic (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateCharacteristicDescriptor ADD CONSTRAINT FK_953e18_Descriptor FOREIGN KEY (TeacherCandidateCharacteristicDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TeacherCandidateCohortYear ADD CONSTRAINT FK_c65c6e_CohortYearTypeDescriptor FOREIGN KEY (CohortYearTypeDescriptorId)
REFERENCES edfi.CohortYearTypeDescriptor (CohortYearTypeDescriptorId)
;

CREATE INDEX FK_c65c6e_CohortYearTypeDescriptor
ON tpdm.TeacherCandidateCohortYear (CohortYearTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCohortYear ADD CONSTRAINT FK_c65c6e_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_c65c6e_SchoolYearType
ON tpdm.TeacherCandidateCohortYear (SchoolYear ASC);

ALTER TABLE tpdm.TeacherCandidateCohortYear ADD CONSTRAINT FK_c65c6e_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_c65c6e_TeacherCandidate
ON tpdm.TeacherCandidateCohortYear (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_Course FOREIGN KEY (CourseCode, CourseEducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_87fd83_Course
ON tpdm.TeacherCandidateCourseTranscript (CourseCode ASC, CourseEducationOrganizationId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_CourseAttemptResultDescriptor FOREIGN KEY (CourseAttemptResultDescriptorId)
REFERENCES edfi.CourseAttemptResultDescriptor (CourseAttemptResultDescriptorId)
;

CREATE INDEX FK_87fd83_CourseAttemptResultDescriptor
ON tpdm.TeacherCandidateCourseTranscript (CourseAttemptResultDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_CourseRepeatCodeDescriptor FOREIGN KEY (CourseRepeatCodeDescriptorId)
REFERENCES edfi.CourseRepeatCodeDescriptor (CourseRepeatCodeDescriptorId)
;

CREATE INDEX FK_87fd83_CourseRepeatCodeDescriptor
ON tpdm.TeacherCandidateCourseTranscript (CourseRepeatCodeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_CreditTypeDescriptor FOREIGN KEY (AttemptedCreditTypeDescriptorId)
REFERENCES edfi.CreditTypeDescriptor (CreditTypeDescriptorId)
;

CREATE INDEX FK_87fd83_CreditTypeDescriptor
ON tpdm.TeacherCandidateCourseTranscript (AttemptedCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_CreditTypeDescriptor1 FOREIGN KEY (EarnedCreditTypeDescriptorId)
REFERENCES edfi.CreditTypeDescriptor (CreditTypeDescriptorId)
;

CREATE INDEX FK_87fd83_CreditTypeDescriptor1
ON tpdm.TeacherCandidateCourseTranscript (EarnedCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_GradeLevelDescriptor FOREIGN KEY (WhenTakenGradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_87fd83_GradeLevelDescriptor
ON tpdm.TeacherCandidateCourseTranscript (WhenTakenGradeLevelDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_MethodCreditEarnedDescriptor FOREIGN KEY (MethodCreditEarnedDescriptorId)
REFERENCES edfi.MethodCreditEarnedDescriptor (MethodCreditEarnedDescriptorId)
;

CREATE INDEX FK_87fd83_MethodCreditEarnedDescriptor
ON tpdm.TeacherCandidateCourseTranscript (MethodCreditEarnedDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_87fd83_School
ON tpdm.TeacherCandidateCourseTranscript (SchoolId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscript ADD CONSTRAINT FK_87fd83_TeacherCandidateAcademicRecord FOREIGN KEY (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateAcademicRecord (EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
;

CREATE INDEX FK_87fd83_TeacherCandidateAcademicRecord
ON tpdm.TeacherCandidateCourseTranscript (EducationOrganizationId ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits ADD CONSTRAINT FK_ae1084_AdditionalCreditTypeDescriptor FOREIGN KEY (AdditionalCreditTypeDescriptorId)
REFERENCES edfi.AdditionalCreditTypeDescriptor (AdditionalCreditTypeDescriptorId)
;

CREATE INDEX FK_ae1084_AdditionalCreditTypeDescriptor
ON tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits (AdditionalCreditTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits ADD CONSTRAINT FK_ae1084_TeacherCandidateCourseTranscript FOREIGN KEY (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
REFERENCES tpdm.TeacherCandidateCourseTranscript (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, TeacherCandidateIdentifier, TermDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_ae1084_TeacherCandidateCourseTranscript
ON tpdm.TeacherCandidateCourseTranscriptEarnedAdditionalCredits (CourseAttemptResultDescriptorId ASC, CourseCode ASC, CourseEducationOrganizationId ASC, EducationOrganizationId ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TermDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCredential ADD CONSTRAINT FK_5e2af2_Credential FOREIGN KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
REFERENCES edfi.Credential (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
;

CREATE INDEX FK_5e2af2_Credential
ON tpdm.TeacherCandidateCredential (CredentialIdentifier ASC, StateOfIssueStateAbbreviationDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateCredential ADD CONSTRAINT FK_5e2af2_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_5e2af2_TeacherCandidate
ON tpdm.TeacherCandidateCredential (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateDegreeSpecialization ADD CONSTRAINT FK_8b2999_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_8b2999_TeacherCandidate
ON tpdm.TeacherCandidateDegreeSpecialization (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateDisability ADD CONSTRAINT FK_976a42_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

CREATE INDEX FK_976a42_DisabilityDescriptor
ON tpdm.TeacherCandidateDisability (DisabilityDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateDisability ADD CONSTRAINT FK_976a42_DisabilityDeterminationSourceTypeDescriptor FOREIGN KEY (DisabilityDeterminationSourceTypeDescriptorId)
REFERENCES edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorId)
;

CREATE INDEX FK_976a42_DisabilityDeterminationSourceTypeDescriptor
ON tpdm.TeacherCandidateDisability (DisabilityDeterminationSourceTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateDisability ADD CONSTRAINT FK_976a42_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_976a42_TeacherCandidate
ON tpdm.TeacherCandidateDisability (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateDisabilityDesignation ADD CONSTRAINT FK_b5627c_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorId)
REFERENCES edfi.DisabilityDesignationDescriptor (DisabilityDesignationDescriptorId)
;

CREATE INDEX FK_b5627c_DisabilityDesignationDescriptor
ON tpdm.TeacherCandidateDisabilityDesignation (DisabilityDesignationDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateDisabilityDesignation ADD CONSTRAINT FK_b5627c_TeacherCandidateDisability FOREIGN KEY (DisabilityDescriptorId, TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidateDisability (DisabilityDescriptorId, TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_b5627c_TeacherCandidateDisability
ON tpdm.TeacherCandidateDisabilityDesignation (DisabilityDescriptorId ASC, TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateElectronicMail ADD CONSTRAINT FK_a3a2ab_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorId)
REFERENCES edfi.ElectronicMailTypeDescriptor (ElectronicMailTypeDescriptorId)
;

CREATE INDEX FK_a3a2ab_ElectronicMailTypeDescriptor
ON tpdm.TeacherCandidateElectronicMail (ElectronicMailTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateElectronicMail ADD CONSTRAINT FK_a3a2ab_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_a3a2ab_TeacherCandidate
ON tpdm.TeacherCandidateElectronicMail (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkAbsenceEvent ADD CONSTRAINT FK_30d301_AbsenceEventCategoryDescriptor FOREIGN KEY (AbsenceEventCategoryDescriptorId)
REFERENCES edfi.AbsenceEventCategoryDescriptor (AbsenceEventCategoryDescriptorId)
;

CREATE INDEX FK_30d301_AbsenceEventCategoryDescriptor
ON tpdm.TeacherCandidateFieldworkAbsenceEvent (AbsenceEventCategoryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkAbsenceEvent ADD CONSTRAINT FK_30d301_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_30d301_TeacherCandidate
ON tpdm.TeacherCandidateFieldworkAbsenceEvent (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperience ADD CONSTRAINT FK_fe5770_FieldworkTypeDescriptor FOREIGN KEY (FieldworkTypeDescriptorId)
REFERENCES tpdm.FieldworkTypeDescriptor (FieldworkTypeDescriptorId)
;

CREATE INDEX FK_fe5770_FieldworkTypeDescriptor
ON tpdm.TeacherCandidateFieldworkExperience (FieldworkTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperience ADD CONSTRAINT FK_fe5770_ProgramGatewayDescriptor FOREIGN KEY (ProgramGatewayDescriptorId)
REFERENCES tpdm.ProgramGatewayDescriptor (ProgramGatewayDescriptorId)
;

CREATE INDEX FK_fe5770_ProgramGatewayDescriptor
ON tpdm.TeacherCandidateFieldworkExperience (ProgramGatewayDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperience ADD CONSTRAINT FK_fe5770_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_fe5770_TeacherCandidate
ON tpdm.TeacherCandidateFieldworkExperience (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceCoteaching ADD CONSTRAINT FK_fb9534_TeacherCandidateFieldworkExperience FOREIGN KEY (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidateFieldworkExperience (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSchool ADD CONSTRAINT FK_c8ae63_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_c8ae63_School
ON tpdm.TeacherCandidateFieldworkExperienceSchool (SchoolId ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSchool ADD CONSTRAINT FK_c8ae63_TeacherCandidateFieldworkExperience FOREIGN KEY (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidateFieldworkExperience (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_c8ae63_TeacherCandidateFieldworkExperience
ON tpdm.TeacherCandidateFieldworkExperienceSchool (BeginDate ASC, FieldworkIdentifier ASC, TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSectionAssociation ADD CONSTRAINT FK_1a948e_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_1a948e_Section
ON tpdm.TeacherCandidateFieldworkExperienceSectionAssociation (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.TeacherCandidateFieldworkExperienceSectionAssociation ADD CONSTRAINT FK_1a948e_TeacherCandidateFieldworkExperience FOREIGN KEY (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidateFieldworkExperience (BeginDate, FieldworkIdentifier, TeacherCandidateIdentifier)
;

CREATE INDEX FK_1a948e_TeacherCandidateFieldworkExperience
ON tpdm.TeacherCandidateFieldworkExperienceSectionAssociation (BeginDate ASC, FieldworkIdentifier ASC, TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateIdentificationCode ADD CONSTRAINT FK_6f624f_StudentIdentificationSystemDescriptor FOREIGN KEY (StudentIdentificationSystemDescriptorId)
REFERENCES edfi.StudentIdentificationSystemDescriptor (StudentIdentificationSystemDescriptorId)
;

CREATE INDEX FK_6f624f_StudentIdentificationSystemDescriptor
ON tpdm.TeacherCandidateIdentificationCode (StudentIdentificationSystemDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateIdentificationCode ADD CONSTRAINT FK_6f624f_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_6f624f_TeacherCandidate
ON tpdm.TeacherCandidateIdentificationCode (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateIdentificationDocument ADD CONSTRAINT FK_b8a0a3_CountryDescriptor FOREIGN KEY (IssuerCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_b8a0a3_CountryDescriptor
ON tpdm.TeacherCandidateIdentificationDocument (IssuerCountryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateIdentificationDocument ADD CONSTRAINT FK_b8a0a3_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorId)
REFERENCES edfi.IdentificationDocumentUseDescriptor (IdentificationDocumentUseDescriptorId)
;

CREATE INDEX FK_b8a0a3_IdentificationDocumentUseDescriptor
ON tpdm.TeacherCandidateIdentificationDocument (IdentificationDocumentUseDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateIdentificationDocument ADD CONSTRAINT FK_b8a0a3_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorId)
REFERENCES edfi.PersonalInformationVerificationDescriptor (PersonalInformationVerificationDescriptorId)
;

CREATE INDEX FK_b8a0a3_PersonalInformationVerificationDescriptor
ON tpdm.TeacherCandidateIdentificationDocument (PersonalInformationVerificationDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateIdentificationDocument ADD CONSTRAINT FK_b8a0a3_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_b8a0a3_TeacherCandidate
ON tpdm.TeacherCandidateIdentificationDocument (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateIndicator ADD CONSTRAINT FK_ab19f4_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_ab19f4_TeacherCandidate
ON tpdm.TeacherCandidateIndicator (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateInternationalAddress ADD CONSTRAINT FK_d625c9_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorId)
REFERENCES edfi.AddressTypeDescriptor (AddressTypeDescriptorId)
;

CREATE INDEX FK_d625c9_AddressTypeDescriptor
ON tpdm.TeacherCandidateInternationalAddress (AddressTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateInternationalAddress ADD CONSTRAINT FK_d625c9_CountryDescriptor FOREIGN KEY (CountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_d625c9_CountryDescriptor
ON tpdm.TeacherCandidateInternationalAddress (CountryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateInternationalAddress ADD CONSTRAINT FK_d625c9_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_d625c9_TeacherCandidate
ON tpdm.TeacherCandidateInternationalAddress (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateLanguage ADD CONSTRAINT FK_e2f84b_LanguageDescriptor FOREIGN KEY (LanguageDescriptorId)
REFERENCES edfi.LanguageDescriptor (LanguageDescriptorId)
;

CREATE INDEX FK_e2f84b_LanguageDescriptor
ON tpdm.TeacherCandidateLanguage (LanguageDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateLanguage ADD CONSTRAINT FK_e2f84b_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_e2f84b_TeacherCandidate
ON tpdm.TeacherCandidateLanguage (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateLanguageUse ADD CONSTRAINT FK_95cf0d_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorId)
REFERENCES edfi.LanguageUseDescriptor (LanguageUseDescriptorId)
;

CREATE INDEX FK_95cf0d_LanguageUseDescriptor
ON tpdm.TeacherCandidateLanguageUse (LanguageUseDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateLanguageUse ADD CONSTRAINT FK_95cf0d_TeacherCandidateLanguage FOREIGN KEY (LanguageDescriptorId, TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidateLanguage (LanguageDescriptorId, TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_95cf0d_TeacherCandidateLanguage
ON tpdm.TeacherCandidateLanguageUse (LanguageDescriptorId ASC, TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateOtherName ADD CONSTRAINT FK_c3040c_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorId)
REFERENCES edfi.OtherNameTypeDescriptor (OtherNameTypeDescriptorId)
;

CREATE INDEX FK_c3040c_OtherNameTypeDescriptor
ON tpdm.TeacherCandidateOtherName (OtherNameTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateOtherName ADD CONSTRAINT FK_c3040c_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_c3040c_TeacherCandidate
ON tpdm.TeacherCandidateOtherName (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidatePersonalIdentificationDocument ADD CONSTRAINT FK_9f2892_CountryDescriptor FOREIGN KEY (IssuerCountryDescriptorId)
REFERENCES edfi.CountryDescriptor (CountryDescriptorId)
;

CREATE INDEX FK_9f2892_CountryDescriptor
ON tpdm.TeacherCandidatePersonalIdentificationDocument (IssuerCountryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidatePersonalIdentificationDocument ADD CONSTRAINT FK_9f2892_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorId)
REFERENCES edfi.IdentificationDocumentUseDescriptor (IdentificationDocumentUseDescriptorId)
;

CREATE INDEX FK_9f2892_IdentificationDocumentUseDescriptor
ON tpdm.TeacherCandidatePersonalIdentificationDocument (IdentificationDocumentUseDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidatePersonalIdentificationDocument ADD CONSTRAINT FK_9f2892_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorId)
REFERENCES edfi.PersonalInformationVerificationDescriptor (PersonalInformationVerificationDescriptorId)
;

CREATE INDEX FK_9f2892_PersonalInformationVerificationDescriptor
ON tpdm.TeacherCandidatePersonalIdentificationDocument (PersonalInformationVerificationDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidatePersonalIdentificationDocument ADD CONSTRAINT FK_9f2892_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_9f2892_TeacherCandidate
ON tpdm.TeacherCandidatePersonalIdentificationDocument (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_8c39c1_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorId)
REFERENCES edfi.AttendanceEventCategoryDescriptor (AttendanceEventCategoryDescriptorId)
;

CREATE INDEX FK_8c39c1_AttendanceEventCategoryDescriptor
ON tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance (AttendanceEventCategoryDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_8c39c1_ProfessionalDevelopmentEvent FOREIGN KEY (ProfessionalDevelopmentTitle)
REFERENCES tpdm.ProfessionalDevelopmentEvent (ProfessionalDevelopmentTitle)
;

CREATE INDEX FK_8c39c1_ProfessionalDevelopmentEvent
ON tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance (ProfessionalDevelopmentTitle ASC);

ALTER TABLE tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance ADD CONSTRAINT FK_8c39c1_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_8c39c1_TeacherCandidate
ON tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateRace ADD CONSTRAINT FK_9c1586_RaceDescriptor FOREIGN KEY (RaceDescriptorId)
REFERENCES edfi.RaceDescriptor (RaceDescriptorId)
;

CREATE INDEX FK_9c1586_RaceDescriptor
ON tpdm.TeacherCandidateRace (RaceDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateRace ADD CONSTRAINT FK_9c1586_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_9c1586_TeacherCandidate
ON tpdm.TeacherCandidateRace (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStaffAssociation ADD CONSTRAINT FK_3395e5_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

CREATE INDEX FK_3395e5_Staff
ON tpdm.TeacherCandidateStaffAssociation (StaffUSI ASC);

ALTER TABLE tpdm.TeacherCandidateStaffAssociation ADD CONSTRAINT FK_3395e5_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_3395e5_TeacherCandidate
ON tpdm.TeacherCandidateStaffAssociation (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ADD CONSTRAINT FK_464a58_ResultDatatypeTypeDescriptor FOREIGN KEY (ResultDatatypeTypeDescriptorId)
REFERENCES edfi.ResultDatatypeTypeDescriptor (ResultDatatypeTypeDescriptorId)
;

CREATE INDEX FK_464a58_ResultDatatypeTypeDescriptor
ON tpdm.TeacherCandidateStudentGrowthMeasure (ResultDatatypeTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ADD CONSTRAINT FK_464a58_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_464a58_SchoolYearType
ON tpdm.TeacherCandidateStudentGrowthMeasure (SchoolYear ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ADD CONSTRAINT FK_464a58_StudentGrowthTypeDescriptor FOREIGN KEY (StudentGrowthTypeDescriptorId)
REFERENCES tpdm.StudentGrowthTypeDescriptor (StudentGrowthTypeDescriptorId)
;

CREATE INDEX FK_464a58_StudentGrowthTypeDescriptor
ON tpdm.TeacherCandidateStudentGrowthMeasure (StudentGrowthTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasure ADD CONSTRAINT FK_464a58_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_464a58_TeacherCandidate
ON tpdm.TeacherCandidateStudentGrowthMeasure (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject ADD CONSTRAINT FK_0ff099_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_0ff099_AcademicSubjectDescriptor
ON tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject ADD CONSTRAINT FK_0ff099_TeacherCandidateStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
REFERENCES tpdm.TeacherCandidateStudentGrowthMeasure (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_0ff099_TeacherCandidateStudentGrowthMeasure
ON tpdm.TeacherCandidateStudentGrowthMeasureAcademicSubject (FactAsOfDate ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TeacherCandidateStudentGrowthMeasureIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation ADD CONSTRAINT FK_512fab_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_512fab_Course
ON tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation ADD CONSTRAINT FK_512fab_TeacherCandidateStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
REFERENCES tpdm.TeacherCandidateStudentGrowthMeasure (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
;

CREATE INDEX FK_512fab_TeacherCandidateStudentGrowthMeasure
ON tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation (FactAsOfDate ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TeacherCandidateStudentGrowthMeasureIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 ADD CONSTRAINT FK_22b9a4_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_22b9a4_EducationOrganization
ON tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 (EducationOrganizationId ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 ADD CONSTRAINT FK_22b9a4_TeacherCandidateStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
REFERENCES tpdm.TeacherCandidateStudentGrowthMeasure (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
;

CREATE INDEX FK_22b9a4_TeacherCandidateStudentGrowthMeasure
ON tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4 (FactAsOfDate ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TeacherCandidateStudentGrowthMeasureIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel ADD CONSTRAINT FK_eaf52b_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_eaf52b_GradeLevelDescriptor
ON tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel ADD CONSTRAINT FK_eaf52b_TeacherCandidateStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
REFERENCES tpdm.TeacherCandidateStudentGrowthMeasure (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_eaf52b_TeacherCandidateStudentGrowthMeasure
ON tpdm.TeacherCandidateStudentGrowthMeasureGradeLevel (FactAsOfDate ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TeacherCandidateStudentGrowthMeasureIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation ADD CONSTRAINT FK_b8b1b0_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON UPDATE CASCADE
;

CREATE INDEX FK_b8b1b0_Section
ON tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation ADD CONSTRAINT FK_b8b1b0_TeacherCandidateStudentGrowthMeasure FOREIGN KEY (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
REFERENCES tpdm.TeacherCandidateStudentGrowthMeasure (FactAsOfDate, SchoolYear, TeacherCandidateIdentifier, TeacherCandidateStudentGrowthMeasureIdentifier)
;

CREATE INDEX FK_b8b1b0_TeacherCandidateStudentGrowthMeasure
ON tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation (FactAsOfDate ASC, SchoolYear ASC, TeacherCandidateIdentifier ASC, TeacherCandidateStudentGrowthMeasureIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ADD CONSTRAINT FK_0dff08_EntryTypeDescriptor FOREIGN KEY (EntryTypeDescriptorId)
REFERENCES edfi.EntryTypeDescriptor (EntryTypeDescriptorId)
;

CREATE INDEX FK_0dff08_EntryTypeDescriptor
ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation (EntryTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ADD CONSTRAINT FK_0dff08_ExitWithdrawTypeDescriptor FOREIGN KEY (ExitWithdrawTypeDescriptorId)
REFERENCES edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorId)
;

CREATE INDEX FK_0dff08_ExitWithdrawTypeDescriptor
ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation (ExitWithdrawTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ADD CONSTRAINT FK_0dff08_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_0dff08_SchoolYearType
ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation (SchoolYear ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ADD CONSTRAINT FK_0dff08_SchoolYearType1 FOREIGN KEY (ClassOfSchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_0dff08_SchoolYearType1
ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation (ClassOfSchoolYear ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ADD CONSTRAINT FK_0dff08_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_0dff08_TeacherCandidate
ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderAssociation ADD CONSTRAINT FK_0dff08_TeacherPreparationProvider FOREIGN KEY (TeacherPreparationProviderId)
REFERENCES tpdm.TeacherPreparationProvider (TeacherPreparationProviderId)
;

CREATE INDEX FK_0dff08_TeacherPreparationProvider
ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation (TeacherPreparationProviderId ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ADD CONSTRAINT FK_81475b_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_81475b_EducationOrganization
ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation (EducationOrganizationId ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ADD CONSTRAINT FK_81475b_ReasonExitedDescriptor FOREIGN KEY (ReasonExitedDescriptorId)
REFERENCES edfi.ReasonExitedDescriptor (ReasonExitedDescriptorId)
;

CREATE INDEX FK_81475b_ReasonExitedDescriptor
ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation (ReasonExitedDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ADD CONSTRAINT FK_81475b_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
;

CREATE INDEX FK_81475b_TeacherCandidate
ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation ADD CONSTRAINT FK_81475b_TeacherPreparationProviderProgram FOREIGN KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
REFERENCES tpdm.TeacherPreparationProviderProgram (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
;

CREATE INDEX FK_81475b_TeacherPreparationProviderProgram
ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation (EducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTelephone ADD CONSTRAINT FK_1c8b27_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_1c8b27_TeacherCandidate
ON tpdm.TeacherCandidateTelephone (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateTelephone ADD CONSTRAINT FK_1c8b27_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorId)
REFERENCES edfi.TelephoneNumberTypeDescriptor (TelephoneNumberTypeDescriptorId)
;

CREATE INDEX FK_1c8b27_TelephoneNumberTypeDescriptor
ON tpdm.TeacherCandidateTelephone (TelephoneNumberTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTPPProgramDegree ADD CONSTRAINT FK_1b991e_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

CREATE INDEX FK_1b991e_AcademicSubjectDescriptor
ON tpdm.TeacherCandidateTPPProgramDegree (AcademicSubjectDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTPPProgramDegree ADD CONSTRAINT FK_1b991e_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_1b991e_GradeLevelDescriptor
ON tpdm.TeacherCandidateTPPProgramDegree (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateTPPProgramDegree ADD CONSTRAINT FK_1b991e_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_1b991e_TeacherCandidate
ON tpdm.TeacherCandidateTPPProgramDegree (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateTPPProgramDegree ADD CONSTRAINT FK_1b991e_TPPDegreeTypeDescriptor FOREIGN KEY (TPPDegreeTypeDescriptorId)
REFERENCES tpdm.TPPDegreeTypeDescriptor (TPPDegreeTypeDescriptorId)
;

CREATE INDEX FK_1b991e_TPPDegreeTypeDescriptor
ON tpdm.TeacherCandidateTPPProgramDegree (TPPDegreeTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherCandidateVisa ADD CONSTRAINT FK_d72a7b_TeacherCandidate FOREIGN KEY (TeacherCandidateIdentifier)
REFERENCES tpdm.TeacherCandidate (TeacherCandidateIdentifier)
ON DELETE CASCADE
;

CREATE INDEX FK_d72a7b_TeacherCandidate
ON tpdm.TeacherCandidateVisa (TeacherCandidateIdentifier ASC);

ALTER TABLE tpdm.TeacherCandidateVisa ADD CONSTRAINT FK_d72a7b_VisaDescriptor FOREIGN KEY (VisaDescriptorId)
REFERENCES edfi.VisaDescriptor (VisaDescriptorId)
;

CREATE INDEX FK_d72a7b_VisaDescriptor
ON tpdm.TeacherCandidateVisa (VisaDescriptorId ASC);

ALTER TABLE tpdm.TeacherPreparationProgramTypeDescriptor ADD CONSTRAINT FK_18e97d_Descriptor FOREIGN KEY (TeacherPreparationProgramTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TeacherPreparationProvider ADD CONSTRAINT FK_ea8f5b_EducationOrganization FOREIGN KEY (TeacherPreparationProviderId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TeacherPreparationProvider ADD CONSTRAINT FK_ea8f5b_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_ea8f5b_FederalLocaleCodeDescriptor
ON tpdm.TeacherPreparationProvider (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.TeacherPreparationProvider ADD CONSTRAINT FK_ea8f5b_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_ea8f5b_School
ON tpdm.TeacherPreparationProvider (SchoolId ASC);

ALTER TABLE tpdm.TeacherPreparationProvider ADD CONSTRAINT FK_ea8f5b_University FOREIGN KEY (UniversityId)
REFERENCES tpdm.University (UniversityId)
;

CREATE INDEX FK_ea8f5b_University
ON tpdm.TeacherPreparationProvider (UniversityId ASC);

ALTER TABLE tpdm.TeacherPreparationProviderProgram ADD CONSTRAINT FK_aceeb9_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_aceeb9_EducationOrganization
ON tpdm.TeacherPreparationProviderProgram (EducationOrganizationId ASC);

ALTER TABLE tpdm.TeacherPreparationProviderProgram ADD CONSTRAINT FK_aceeb9_ProgramTypeDescriptor FOREIGN KEY (ProgramTypeDescriptorId)
REFERENCES edfi.ProgramTypeDescriptor (ProgramTypeDescriptorId)
;

CREATE INDEX FK_aceeb9_ProgramTypeDescriptor
ON tpdm.TeacherPreparationProviderProgram (ProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherPreparationProviderProgram ADD CONSTRAINT FK_aceeb9_TeacherPreparationProgramTypeDescriptor FOREIGN KEY (TeacherPreparationProgramTypeDescriptorId)
REFERENCES tpdm.TeacherPreparationProgramTypeDescriptor (TeacherPreparationProgramTypeDescriptorId)
;

CREATE INDEX FK_aceeb9_TeacherPreparationProgramTypeDescriptor
ON tpdm.TeacherPreparationProviderProgram (TeacherPreparationProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.TeacherPreparationProviderProgram ADD CONSTRAINT FK_aceeb9_TPPProgramPathwayDescriptor FOREIGN KEY (TPPProgramPathwayDescriptorId)
REFERENCES tpdm.TPPProgramPathwayDescriptor (TPPProgramPathwayDescriptorId)
;

CREATE INDEX FK_aceeb9_TPPProgramPathwayDescriptor
ON tpdm.TeacherPreparationProviderProgram (TPPProgramPathwayDescriptorId ASC);

ALTER TABLE tpdm.TeacherPreparationProviderProgramGradeLevel ADD CONSTRAINT FK_f3e683_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorId)
REFERENCES edfi.GradeLevelDescriptor (GradeLevelDescriptorId)
;

CREATE INDEX FK_f3e683_GradeLevelDescriptor
ON tpdm.TeacherPreparationProviderProgramGradeLevel (GradeLevelDescriptorId ASC);

ALTER TABLE tpdm.TeacherPreparationProviderProgramGradeLevel ADD CONSTRAINT FK_f3e683_TeacherPreparationProviderProgram FOREIGN KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
REFERENCES tpdm.TeacherPreparationProviderProgram (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_f3e683_TeacherPreparationProviderProgram
ON tpdm.TeacherPreparationProviderProgramGradeLevel (EducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC);

ALTER TABLE tpdm.ThemeDescriptor ADD CONSTRAINT FK_65bea1_Descriptor FOREIGN KEY (ThemeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TPPDegreeTypeDescriptor ADD CONSTRAINT FK_5d35e7_Descriptor FOREIGN KEY (TPPDegreeTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.TPPProgramPathwayDescriptor ADD CONSTRAINT FK_1807ea_Descriptor FOREIGN KEY (TPPProgramPathwayDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.University ADD CONSTRAINT FK_9d3844_EducationOrganization FOREIGN KEY (UniversityId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.University ADD CONSTRAINT FK_9d3844_FederalLocaleCodeDescriptor FOREIGN KEY (FederalLocaleCodeDescriptorId)
REFERENCES tpdm.FederalLocaleCodeDescriptor (FederalLocaleCodeDescriptorId)
;

CREATE INDEX FK_9d3844_FederalLocaleCodeDescriptor
ON tpdm.University (FederalLocaleCodeDescriptorId ASC);

ALTER TABLE tpdm.University ADD CONSTRAINT FK_9d3844_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_9d3844_School
ON tpdm.University (SchoolId ASC);

ALTER TABLE tpdm.ValueTypeDescriptor ADD CONSTRAINT FK_7111a6_Descriptor FOREIGN KEY (ValueTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE tpdm.WithdrawReasonDescriptor ADD CONSTRAINT FK_8936a1_Descriptor FOREIGN KEY (WithdrawReasonDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

