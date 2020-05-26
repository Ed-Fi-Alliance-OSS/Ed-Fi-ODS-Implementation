-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [tpdm].[AidTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_AidTypeDescriptor_Descriptor] FOREIGN KEY ([AidTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[AnonymizedStudent] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudent_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudent_GenderDescriptor]
ON [tpdm].[AnonymizedStudent] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudent] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudent_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudent_GradeLevelDescriptor]
ON [tpdm].[AnonymizedStudent] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudent] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudent_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudent_SchoolYearType]
ON [tpdm].[AnonymizedStudent] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudent] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudent_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudent_SexDescriptor]
ON [tpdm].[AnonymizedStudent] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudent] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudent_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudent_ValueTypeDescriptor]
ON [tpdm].[AnonymizedStudent] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAcademicRecord_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAcademicRecord_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentAcademicRecord] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAcademicRecord_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAcademicRecord_EducationOrganization]
ON [tpdm].[AnonymizedStudentAcademicRecord] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAcademicRecord_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAcademicRecord_SchoolYearType]
ON [tpdm].[AnonymizedStudentAcademicRecord] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAcademicRecord_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAcademicRecord_TermDescriptor]
ON [tpdm].[AnonymizedStudentAcademicRecord] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessment_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessment_AcademicSubjectDescriptor]
ON [tpdm].[AnonymizedStudentAssessment] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessment_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessment_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentAssessment] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessment_AssessmentCategoryDescriptor] FOREIGN KEY ([AssessmentCategoryDescriptorId])
REFERENCES [edfi].[AssessmentCategoryDescriptor] ([AssessmentCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessment_AssessmentCategoryDescriptor]
ON [tpdm].[AnonymizedStudentAssessment] ([AssessmentCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessment_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessment_GradeLevelDescriptor]
ON [tpdm].[AnonymizedStudentAssessment] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessment_SchoolYearType] FOREIGN KEY ([TakenSchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessment_SchoolYearType]
ON [tpdm].[AnonymizedStudentAssessment] ([TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessment_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessment_TermDescriptor]
ON [tpdm].[AnonymizedStudentAssessment] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentCourseAssociation_AnonymizedStudentAssessment] FOREIGN KEY ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
REFERENCES [tpdm].[AnonymizedStudentAssessment] ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentCourseAssociation_AnonymizedStudentAssessment]
ON [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ([AdministrationDate] ASC, [AnonymizedStudentIdentifier] ASC, [AssessmentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC, [TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentCourseAssociation_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentCourseAssociation_Course]
ON [tpdm].[AnonymizedStudentAssessmentCourseAssociation] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentPerformanceLevel_AnonymizedStudentAssessment] FOREIGN KEY ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
REFERENCES [tpdm].[AnonymizedStudentAssessment] ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor] FOREIGN KEY ([AssessmentReportingMethodDescriptorId])
REFERENCES [edfi].[AssessmentReportingMethodDescriptor] ([AssessmentReportingMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor]
ON [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] ([AssessmentReportingMethodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentPerformanceLevel_PerformanceLevelDescriptor] FOREIGN KEY ([PerformanceLevelDescriptorId])
REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentPerformanceLevel_PerformanceLevelDescriptor]
ON [tpdm].[AnonymizedStudentAssessmentPerformanceLevel] ([PerformanceLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentScoreResult] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentScoreResult_AnonymizedStudentAssessment] FOREIGN KEY ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
REFERENCES [tpdm].[AnonymizedStudentAssessment] ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentScoreResult] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentScoreResult_AssessmentReportingMethodDescriptor] FOREIGN KEY ([AssessmentReportingMethodDescriptorId])
REFERENCES [edfi].[AssessmentReportingMethodDescriptor] ([AssessmentReportingMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentScoreResult_AssessmentReportingMethodDescriptor]
ON [tpdm].[AnonymizedStudentAssessmentScoreResult] ([AssessmentReportingMethodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentScoreResult] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentScoreResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentScoreResult_ResultDatatypeTypeDescriptor]
ON [tpdm].[AnonymizedStudentAssessmentScoreResult] ([ResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentSectionAssociation_AnonymizedStudentAssessment] FOREIGN KEY ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
REFERENCES [tpdm].[AnonymizedStudentAssessment] ([AdministrationDate], [AnonymizedStudentIdentifier], [AssessmentIdentifier], [FactsAsOfDate], [SchoolYear], [TakenSchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentSectionAssociation_AnonymizedStudentAssessment]
ON [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ([AdministrationDate] ASC, [AnonymizedStudentIdentifier] ASC, [AssessmentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC, [TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentAssessmentSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentAssessmentSectionAssociation_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentAssessmentSectionAssociation_Section]
ON [tpdm].[AnonymizedStudentAssessmentSectionAssociation] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentCourseAssociation_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentCourseAssociation_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentCourseAssociation] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentCourseAssociation_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentCourseAssociation_Course]
ON [tpdm].[AnonymizedStudentCourseAssociation] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentCourseTranscript_AnonymizedStudentAcademicRecord] FOREIGN KEY ([AnonymizedStudentIdentifier], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[AnonymizedStudentAcademicRecord] ([AnonymizedStudentIdentifier], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentCourseTranscript_AnonymizedStudentAcademicRecord]
ON [tpdm].[AnonymizedStudentCourseTranscript] ([AnonymizedStudentIdentifier] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentCourseTranscript_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentCourseTranscript_Course]
ON [tpdm].[AnonymizedStudentCourseTranscript] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentCourseTranscript_CourseRepeatCodeDescriptor] FOREIGN KEY ([CourseRepeatCodeDescriptorId])
REFERENCES [edfi].[CourseRepeatCodeDescriptor] ([CourseRepeatCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentCourseTranscript_CourseRepeatCodeDescriptor]
ON [tpdm].[AnonymizedStudentCourseTranscript] ([CourseRepeatCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentDisability] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentDisability_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentDisability_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentDisability] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentDisability] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentDisability_DisabilityDescriptor]
ON [tpdm].[AnonymizedStudentDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentDisability] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId])
REFERENCES [edfi].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentDisability_DisabilityDeterminationSourceTypeDescriptor]
ON [tpdm].[AnonymizedStudentDisability] ([DisabilityDeterminationSourceTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentDisabilityDesignation_AnonymizedStudentDisability] FOREIGN KEY ([AnonymizedStudentIdentifier], [DisabilityDescriptorId], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudentDisability] ([AnonymizedStudentIdentifier], [DisabilityDescriptorId], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentDisabilityDesignation_AnonymizedStudentDisability]
ON [tpdm].[AnonymizedStudentDisabilityDesignation] ([AnonymizedStudentIdentifier] ASC, [DisabilityDescriptorId] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId])
REFERENCES [edfi].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentDisabilityDesignation_DisabilityDesignationDescriptor]
ON [tpdm].[AnonymizedStudentDisabilityDesignation] ([DisabilityDesignationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentEducationOrganizationAssociation_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentEducationOrganizationAssociation_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentEducationOrganizationAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentEducationOrganizationAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentEducationOrganizationAssociation_EducationOrganization]
ON [tpdm].[AnonymizedStudentEducationOrganizationAssociation] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentLanguage] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentLanguage_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentLanguage_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentLanguage] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentLanguage] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentLanguage_LanguageDescriptor]
ON [tpdm].[AnonymizedStudentLanguage] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentLanguageUse] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentLanguageUse_AnonymizedStudentLanguage] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [LanguageDescriptorId], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudentLanguage] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [LanguageDescriptorId], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentLanguageUse_AnonymizedStudentLanguage]
ON [tpdm].[AnonymizedStudentLanguageUse] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [LanguageDescriptorId] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentLanguageUse] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentLanguageUse_LanguageUseDescriptor] FOREIGN KEY ([LanguageUseDescriptorId])
REFERENCES [edfi].[LanguageUseDescriptor] ([LanguageUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentLanguageUse_LanguageUseDescriptor]
ON [tpdm].[AnonymizedStudentLanguageUse] ([LanguageUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentRace] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentRace_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentRace_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentRace] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentRace] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentRace_RaceDescriptor]
ON [tpdm].[AnonymizedStudentRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentSectionAssociation_AnonymizedStudent] FOREIGN KEY ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[AnonymizedStudent] ([AnonymizedStudentIdentifier], [FactsAsOfDate], [SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentSectionAssociation_AnonymizedStudent]
ON [tpdm].[AnonymizedStudentSectionAssociation] ([AnonymizedStudentIdentifier] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[AnonymizedStudentSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_AnonymizedStudentSectionAssociation_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AnonymizedStudentSectionAssociation_Section]
ON [tpdm].[AnonymizedStudentSectionAssociation] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_AcademicSubjectDescriptor] FOREIGN KEY ([HighlyQualifiedAcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_AcademicSubjectDescriptor]
ON [tpdm].[Applicant] ([HighlyQualifiedAcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_CitizenshipStatusDescriptor] FOREIGN KEY ([CitizenshipStatusDescriptorId])
REFERENCES [edfi].[CitizenshipStatusDescriptor] ([CitizenshipStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_CitizenshipStatusDescriptor]
ON [tpdm].[Applicant] ([CitizenshipStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_EducationOrganization]
ON [tpdm].[Applicant] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_GenderDescriptor]
ON [tpdm].[Applicant] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_LevelOfEducationDescriptor] FOREIGN KEY ([HighestCompletedLevelOfEducationDescriptorId])
REFERENCES [edfi].[LevelOfEducationDescriptor] ([LevelOfEducationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_LevelOfEducationDescriptor]
ON [tpdm].[Applicant] ([HighestCompletedLevelOfEducationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_SexDescriptor]
ON [tpdm].[Applicant] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Applicant] WITH CHECK ADD CONSTRAINT [FK_Applicant_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_Applicant_TeacherCandidate]
ON [tpdm].[Applicant] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_AddressTypeDescriptor]
ON [tpdm].[ApplicantAddress] ([AddressTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_Applicant]
ON [tpdm].[ApplicantAddress] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_LocaleDescriptor] FOREIGN KEY ([LocaleDescriptorId])
REFERENCES [edfi].[LocaleDescriptor] ([LocaleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_LocaleDescriptor]
ON [tpdm].[ApplicantAddress] ([LocaleDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddress_StateAbbreviationDescriptor] FOREIGN KEY ([StateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddress_StateAbbreviationDescriptor]
ON [tpdm].[ApplicantAddress] ([StateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAddressPeriod] WITH CHECK ADD CONSTRAINT [FK_ApplicantAddressPeriod_ApplicantAddress] FOREIGN KEY ([AddressTypeDescriptorId], [ApplicantIdentifier], [City], [EducationOrganizationId], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [tpdm].[ApplicantAddress] ([AddressTypeDescriptorId], [ApplicantIdentifier], [City], [EducationOrganizationId], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAddressPeriod_ApplicantAddress]
ON [tpdm].[ApplicantAddressPeriod] ([AddressTypeDescriptorId] ASC, [ApplicantIdentifier] ASC, [City] ASC, [EducationOrganizationId] ASC, [PostalCode] ASC, [StateAbbreviationDescriptorId] ASC, [StreetNumberName] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAid] WITH CHECK ADD CONSTRAINT [FK_ApplicantAid_AidTypeDescriptor] FOREIGN KEY ([AidTypeDescriptorId])
REFERENCES [tpdm].[AidTypeDescriptor] ([AidTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAid_AidTypeDescriptor]
ON [tpdm].[ApplicantAid] ([AidTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantAid] WITH CHECK ADD CONSTRAINT [FK_ApplicantAid_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantAid_Applicant]
ON [tpdm].[ApplicantAid] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_ApplicantBackgroundCheck_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantBackgroundCheck_Applicant]
ON [tpdm].[ApplicantBackgroundCheck] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_ApplicantBackgroundCheck_BackgroundCheckStatusDescriptor] FOREIGN KEY ([BackgroundCheckStatusDescriptorId])
REFERENCES [tpdm].[BackgroundCheckStatusDescriptor] ([BackgroundCheckStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantBackgroundCheck_BackgroundCheckStatusDescriptor]
ON [tpdm].[ApplicantBackgroundCheck] ([BackgroundCheckStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_ApplicantBackgroundCheck_BackgroundCheckTypeDescriptor] FOREIGN KEY ([BackgroundCheckTypeDescriptorId])
REFERENCES [tpdm].[BackgroundCheckTypeDescriptor] ([BackgroundCheckTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantBackgroundCheck_BackgroundCheckTypeDescriptor]
ON [tpdm].[ApplicantBackgroundCheck] ([BackgroundCheckTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantCharacteristic] WITH CHECK ADD CONSTRAINT [FK_ApplicantCharacteristic_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantCharacteristic_Applicant]
ON [tpdm].[ApplicantCharacteristic] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantCharacteristic] WITH CHECK ADD CONSTRAINT [FK_ApplicantCharacteristic_StudentCharacteristicDescriptor] FOREIGN KEY ([StudentCharacteristicDescriptorId])
REFERENCES [edfi].[StudentCharacteristicDescriptor] ([StudentCharacteristicDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantCharacteristic_StudentCharacteristicDescriptor]
ON [tpdm].[ApplicantCharacteristic] ([StudentCharacteristicDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantCredential] WITH CHECK ADD CONSTRAINT [FK_ApplicantCredential_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantCredential_Applicant]
ON [tpdm].[ApplicantCredential] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantCredential] WITH CHECK ADD CONSTRAINT [FK_ApplicantCredential_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantCredential_Credential]
ON [tpdm].[ApplicantCredential] ([CredentialIdentifier] ASC, [StateOfIssueStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantDisability] WITH CHECK ADD CONSTRAINT [FK_ApplicantDisability_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantDisability_Applicant]
ON [tpdm].[ApplicantDisability] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantDisability] WITH CHECK ADD CONSTRAINT [FK_ApplicantDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantDisability_DisabilityDescriptor]
ON [tpdm].[ApplicantDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantDisability] WITH CHECK ADD CONSTRAINT [FK_ApplicantDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId])
REFERENCES [edfi].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantDisability_DisabilityDeterminationSourceTypeDescriptor]
ON [tpdm].[ApplicantDisability] ([DisabilityDeterminationSourceTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_ApplicantDisabilityDesignation_ApplicantDisability] FOREIGN KEY ([ApplicantIdentifier], [DisabilityDescriptorId], [EducationOrganizationId])
REFERENCES [tpdm].[ApplicantDisability] ([ApplicantIdentifier], [DisabilityDescriptorId], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantDisabilityDesignation_ApplicantDisability]
ON [tpdm].[ApplicantDisabilityDesignation] ([ApplicantIdentifier] ASC, [DisabilityDescriptorId] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_ApplicantDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId])
REFERENCES [edfi].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantDisabilityDesignation_DisabilityDesignationDescriptor]
ON [tpdm].[ApplicantDisabilityDesignation] ([DisabilityDesignationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantElectronicMail] WITH CHECK ADD CONSTRAINT [FK_ApplicantElectronicMail_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantElectronicMail_Applicant]
ON [tpdm].[ApplicantElectronicMail] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantElectronicMail] WITH CHECK ADD CONSTRAINT [FK_ApplicantElectronicMail_ElectronicMailTypeDescriptor] FOREIGN KEY ([ElectronicMailTypeDescriptorId])
REFERENCES [edfi].[ElectronicMailTypeDescriptor] ([ElectronicMailTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantElectronicMail_ElectronicMailTypeDescriptor]
ON [tpdm].[ApplicantElectronicMail] ([ElectronicMailTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_ApplicantGradePointAverage_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantGradePointAverage_Applicant]
ON [tpdm].[ApplicantGradePointAverage] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_ApplicantGradePointAverage_GradePointAverageTypeDescriptor] FOREIGN KEY ([GradePointAverageTypeDescriptorId])
REFERENCES [edfi].[GradePointAverageTypeDescriptor] ([GradePointAverageTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantGradePointAverage_GradePointAverageTypeDescriptor]
ON [tpdm].[ApplicantGradePointAverage] ([GradePointAverageTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantIdentificationDocument_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantIdentificationDocument_Applicant]
ON [tpdm].[ApplicantIdentificationDocument] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantIdentificationDocument_CountryDescriptor]
ON [tpdm].[ApplicantIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [tpdm].[ApplicantIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [tpdm].[ApplicantIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantInternationalAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantInternationalAddress_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantInternationalAddress_AddressTypeDescriptor]
ON [tpdm].[ApplicantInternationalAddress] ([AddressTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantInternationalAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantInternationalAddress_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantInternationalAddress_Applicant]
ON [tpdm].[ApplicantInternationalAddress] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantInternationalAddress] WITH CHECK ADD CONSTRAINT [FK_ApplicantInternationalAddress_CountryDescriptor] FOREIGN KEY ([CountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantInternationalAddress_CountryDescriptor]
ON [tpdm].[ApplicantInternationalAddress] ([CountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantLanguage] WITH CHECK ADD CONSTRAINT [FK_ApplicantLanguage_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantLanguage_Applicant]
ON [tpdm].[ApplicantLanguage] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantLanguage] WITH CHECK ADD CONSTRAINT [FK_ApplicantLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantLanguage_LanguageDescriptor]
ON [tpdm].[ApplicantLanguage] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantLanguageUse] WITH CHECK ADD CONSTRAINT [FK_ApplicantLanguageUse_ApplicantLanguage] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId], [LanguageDescriptorId])
REFERENCES [tpdm].[ApplicantLanguage] ([ApplicantIdentifier], [EducationOrganizationId], [LanguageDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantLanguageUse_ApplicantLanguage]
ON [tpdm].[ApplicantLanguageUse] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC, [LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantLanguageUse] WITH CHECK ADD CONSTRAINT [FK_ApplicantLanguageUse_LanguageUseDescriptor] FOREIGN KEY ([LanguageUseDescriptorId])
REFERENCES [edfi].[LanguageUseDescriptor] ([LanguageUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantLanguageUse_LanguageUseDescriptor]
ON [tpdm].[ApplicantLanguageUse] ([LanguageUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantPersonalIdentificationDocument_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantPersonalIdentificationDocument_Applicant]
ON [tpdm].[ApplicantPersonalIdentificationDocument] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantPersonalIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantPersonalIdentificationDocument_CountryDescriptor]
ON [tpdm].[ApplicantPersonalIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantPersonalIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantPersonalIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [tpdm].[ApplicantPersonalIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ApplicantPersonalIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantPersonalIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [tpdm].[ApplicantPersonalIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantProspectAssociation] WITH CHECK ADD CONSTRAINT [FK_ApplicantProspectAssociation_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantProspectAssociation_Applicant]
ON [tpdm].[ApplicantProspectAssociation] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantProspectAssociation] WITH CHECK ADD CONSTRAINT [FK_ApplicantProspectAssociation_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantProspectAssociation_Prospect]
ON [tpdm].[ApplicantProspectAssociation] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ApplicantRace] WITH CHECK ADD CONSTRAINT [FK_ApplicantRace_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantRace_Applicant]
ON [tpdm].[ApplicantRace] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantRace] WITH CHECK ADD CONSTRAINT [FK_ApplicantRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantRace_RaceDescriptor]
ON [tpdm].[ApplicantRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantScoreResult] WITH CHECK ADD CONSTRAINT [FK_ApplicantScoreResult_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantScoreResult_Applicant]
ON [tpdm].[ApplicantScoreResult] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantScoreResult] WITH CHECK ADD CONSTRAINT [FK_ApplicantScoreResult_AssessmentReportingMethodDescriptor] FOREIGN KEY ([AssessmentReportingMethodDescriptorId])
REFERENCES [edfi].[AssessmentReportingMethodDescriptor] ([AssessmentReportingMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantScoreResult_AssessmentReportingMethodDescriptor]
ON [tpdm].[ApplicantScoreResult] ([AssessmentReportingMethodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantScoreResult] WITH CHECK ADD CONSTRAINT [FK_ApplicantScoreResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantScoreResult_ResultDatatypeTypeDescriptor]
ON [tpdm].[ApplicantScoreResult] ([ResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantStaffIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_ApplicantStaffIdentificationCode_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantStaffIdentificationCode_Applicant]
ON [tpdm].[ApplicantStaffIdentificationCode] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantStaffIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_ApplicantStaffIdentificationCode_StaffIdentificationSystemDescriptor] FOREIGN KEY ([StaffIdentificationSystemDescriptorId])
REFERENCES [edfi].[StaffIdentificationSystemDescriptor] ([StaffIdentificationSystemDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantStaffIdentificationCode_StaffIdentificationSystemDescriptor]
ON [tpdm].[ApplicantStaffIdentificationCode] ([StaffIdentificationSystemDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantTeacherPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_ApplicantTeacherPreparationProgram_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantTeacherPreparationProgram_Applicant]
ON [tpdm].[ApplicantTeacherPreparationProgram] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantTeacherPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_ApplicantTeacherPreparationProgram_LevelOfDegreeAwardedDescriptor] FOREIGN KEY ([LevelOfDegreeAwardedDescriptorId])
REFERENCES [tpdm].[LevelOfDegreeAwardedDescriptor] ([LevelOfDegreeAwardedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantTeacherPreparationProgram_LevelOfDegreeAwardedDescriptor]
ON [tpdm].[ApplicantTeacherPreparationProgram] ([LevelOfDegreeAwardedDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantTeacherPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_ApplicantTeacherPreparationProgram_TeacherPreparationProgramTypeDescriptor] FOREIGN KEY ([TeacherPreparationProgramTypeDescriptorId])
REFERENCES [tpdm].[TeacherPreparationProgramTypeDescriptor] ([TeacherPreparationProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantTeacherPreparationProgram_TeacherPreparationProgramTypeDescriptor]
ON [tpdm].[ApplicantTeacherPreparationProgram] ([TeacherPreparationProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantTelephone] WITH CHECK ADD CONSTRAINT [FK_ApplicantTelephone_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantTelephone_Applicant]
ON [tpdm].[ApplicantTelephone] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantTelephone] WITH CHECK ADD CONSTRAINT [FK_ApplicantTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantTelephone_TelephoneNumberTypeDescriptor]
ON [tpdm].[ApplicantTelephone] ([TelephoneNumberTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantVisa] WITH CHECK ADD CONSTRAINT [FK_ApplicantVisa_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantVisa_Applicant]
ON [tpdm].[ApplicantVisa] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicantVisa] WITH CHECK ADD CONSTRAINT [FK_ApplicantVisa_VisaDescriptor] FOREIGN KEY ([VisaDescriptorId])
REFERENCES [edfi].[VisaDescriptor] ([VisaDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicantVisa_VisaDescriptor]
ON [tpdm].[ApplicantVisa] ([VisaDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_AcademicSubjectDescriptor]
ON [tpdm].[Application] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_AcademicSubjectDescriptor1] FOREIGN KEY ([HighNeedsAcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_AcademicSubjectDescriptor1]
ON [tpdm].[Application] ([HighNeedsAcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_Applicant]
ON [tpdm].[Application] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_ApplicationSourceDescriptor] FOREIGN KEY ([ApplicationSourceDescriptorId])
REFERENCES [tpdm].[ApplicationSourceDescriptor] ([ApplicationSourceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_ApplicationSourceDescriptor]
ON [tpdm].[Application] ([ApplicationSourceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_ApplicationStatusDescriptor] FOREIGN KEY ([ApplicationStatusDescriptorId])
REFERENCES [tpdm].[ApplicationStatusDescriptor] ([ApplicationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_ApplicationStatusDescriptor]
ON [tpdm].[Application] ([ApplicationStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_EducationOrganization]
ON [tpdm].[Application] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_HireStatusDescriptor] FOREIGN KEY ([HireStatusDescriptorId])
REFERENCES [tpdm].[HireStatusDescriptor] ([HireStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_HireStatusDescriptor]
ON [tpdm].[Application] ([HireStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_HiringSourceDescriptor] FOREIGN KEY ([HiringSourceDescriptorId])
REFERENCES [tpdm].[HiringSourceDescriptor] ([HiringSourceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_HiringSourceDescriptor]
ON [tpdm].[Application] ([HiringSourceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Application] WITH CHECK ADD CONSTRAINT [FK_Application_WithdrawReasonDescriptor] FOREIGN KEY ([WithdrawReasonDescriptorId])
REFERENCES [tpdm].[WithdrawReasonDescriptor] ([WithdrawReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Application_WithdrawReasonDescriptor]
ON [tpdm].[Application] ([WithdrawReasonDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationEvent] WITH CHECK ADD CONSTRAINT [FK_ApplicationEvent_Application] FOREIGN KEY ([ApplicantIdentifier], [ApplicationIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Application] ([ApplicantIdentifier], [ApplicationIdentifier], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationEvent_Application]
ON [tpdm].[ApplicationEvent] ([ApplicantIdentifier] ASC, [ApplicationIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationEvent] WITH CHECK ADD CONSTRAINT [FK_ApplicationEvent_ApplicationEventResultDescriptor] FOREIGN KEY ([ApplicationEventResultDescriptorId])
REFERENCES [tpdm].[ApplicationEventResultDescriptor] ([ApplicationEventResultDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationEvent_ApplicationEventResultDescriptor]
ON [tpdm].[ApplicationEvent] ([ApplicationEventResultDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationEvent] WITH CHECK ADD CONSTRAINT [FK_ApplicationEvent_ApplicationEventTypeDescriptor] FOREIGN KEY ([ApplicationEventTypeDescriptorId])
REFERENCES [tpdm].[ApplicationEventTypeDescriptor] ([ApplicationEventTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationEvent_ApplicationEventTypeDescriptor]
ON [tpdm].[ApplicationEvent] ([ApplicationEventTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationEvent] WITH CHECK ADD CONSTRAINT [FK_ApplicationEvent_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationEvent_SchoolYearType]
ON [tpdm].[ApplicationEvent] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[ApplicationEvent] WITH CHECK ADD CONSTRAINT [FK_ApplicationEvent_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationEvent_TermDescriptor]
ON [tpdm].[ApplicationEvent] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationEventResultDescriptor] WITH CHECK ADD CONSTRAINT [FK_ApplicationEventResultDescriptor_Descriptor] FOREIGN KEY ([ApplicationEventResultDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ApplicationEventTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ApplicationEventTypeDescriptor_Descriptor] FOREIGN KEY ([ApplicationEventTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ApplicationOpenStaffPosition] WITH CHECK ADD CONSTRAINT [FK_ApplicationOpenStaffPosition_Application] FOREIGN KEY ([ApplicantIdentifier], [ApplicationIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Application] ([ApplicantIdentifier], [ApplicationIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationOpenStaffPosition_Application]
ON [tpdm].[ApplicationOpenStaffPosition] ([ApplicantIdentifier] ASC, [ApplicationIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationOpenStaffPosition] WITH CHECK ADD CONSTRAINT [FK_ApplicationOpenStaffPosition_OpenStaffPosition] FOREIGN KEY ([EducationOrganizationId], [RequisitionNumber])
REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [RequisitionNumber])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationOpenStaffPosition_OpenStaffPosition]
ON [tpdm].[ApplicationOpenStaffPosition] ([EducationOrganizationId] ASC, [RequisitionNumber] ASC)
GO

ALTER TABLE [tpdm].[ApplicationSourceDescriptor] WITH CHECK ADD CONSTRAINT [FK_ApplicationSourceDescriptor_Descriptor] FOREIGN KEY ([ApplicationSourceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ApplicationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ApplicationStatusDescriptor_Descriptor] FOREIGN KEY ([ApplicationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ApplicationTerm] WITH CHECK ADD CONSTRAINT [FK_ApplicationTerm_Application] FOREIGN KEY ([ApplicantIdentifier], [ApplicationIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Application] ([ApplicantIdentifier], [ApplicationIdentifier], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationTerm_Application]
ON [tpdm].[ApplicationTerm] ([ApplicantIdentifier] ASC, [ApplicationIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[ApplicationTerm] WITH CHECK ADD CONSTRAINT [FK_ApplicationTerm_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ApplicationTerm_TermDescriptor]
ON [tpdm].[ApplicationTerm] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[AssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_AssessmentExtension_Assessment] FOREIGN KEY ([AssessmentIdentifier], [Namespace])
REFERENCES [edfi].[Assessment] ([AssessmentIdentifier], [Namespace])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[AssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_AssessmentExtension_ProgramGatewayDescriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [tpdm].[ProgramGatewayDescriptor] ([ProgramGatewayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AssessmentExtension_ProgramGatewayDescriptor]
ON [tpdm].[AssessmentExtension] ([ProgramGatewayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[BackgroundCheckStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_BackgroundCheckStatusDescriptor_Descriptor] FOREIGN KEY ([BackgroundCheckStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[BackgroundCheckTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_BackgroundCheckTypeDescriptor_Descriptor] FOREIGN KEY ([BackgroundCheckTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[BoardCertificationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_BoardCertificationTypeDescriptor_Descriptor] FOREIGN KEY ([BoardCertificationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CertificationExamStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificationExamStatusDescriptor_Descriptor] FOREIGN KEY ([CertificationExamStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CertificationExamTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificationExamTypeDescriptor_Descriptor] FOREIGN KEY ([CertificationExamTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CommunityOrganizationExtension] WITH CHECK ADD CONSTRAINT [FK_CommunityOrganizationExtension_CommunityOrganization] FOREIGN KEY ([CommunityOrganizationId])
REFERENCES [edfi].[CommunityOrganization] ([CommunityOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CommunityOrganizationExtension] WITH CHECK ADD CONSTRAINT [FK_CommunityOrganizationExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CommunityOrganizationExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[CommunityOrganizationExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CommunityProviderExtension] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderExtension_CommunityProvider] FOREIGN KEY ([CommunityProviderId])
REFERENCES [edfi].[CommunityProvider] ([CommunityProviderId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CommunityProviderExtension] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CommunityProviderExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[CommunityProviderExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CompleterAsStaffAssociation] WITH CHECK ADD CONSTRAINT [FK_CompleterAsStaffAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_CompleterAsStaffAssociation_Staff]
ON [tpdm].[CompleterAsStaffAssociation] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[CompleterAsStaffAssociation] WITH CHECK ADD CONSTRAINT [FK_CompleterAsStaffAssociation_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_CompleterAsStaffAssociation_TeacherCandidate]
ON [tpdm].[CompleterAsStaffAssociation] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[CoteachingStyleObservedDescriptor] WITH CHECK ADD CONSTRAINT [FK_CoteachingStyleObservedDescriptor_Descriptor] FOREIGN KEY ([CoteachingStyleObservedDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseCourseTranscriptFacts] WITH CHECK ADD CONSTRAINT [FK_CourseCourseTranscriptFacts_CourseStudentAcademicRecordFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseStudentAcademicRecordFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseCourseTranscriptFacts_CourseStudentAcademicRecordFacts]
ON [tpdm].[CourseCourseTranscriptFacts] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC, [SchoolYear] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned] WITH CHECK ADD CONSTRAINT [FK_CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned_CourseCourseTranscriptFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseCourseTranscriptFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned_CourseCourseTranscriptFacts]
ON [tpdm].[CourseCourseTranscriptFactsAggregatedFinalLetterGradeEarned] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseCourseTranscriptFactsAggregatedNumericGradeEarned] WITH CHECK ADD CONSTRAINT [FK_CourseCourseTranscriptFactsAggregatedNumericGradeEarned_CourseCourseTranscriptFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseCourseTranscriptFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseCourseTranscriptFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseCourseTranscriptFactsStudentsEnrolled_CourseCourseTranscriptFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseCourseTranscriptFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseCourseTranscriptFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseCourseTranscriptFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseCourseTranscriptFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[CourseCourseTranscriptFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFacts_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAcademicRecordFacts_Course]
ON [tpdm].[CourseStudentAcademicRecordFacts] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFacts_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAcademicRecordFacts_SchoolYearType]
ON [tpdm].[CourseStudentAcademicRecordFacts] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFacts_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAcademicRecordFacts_TermDescriptor]
ON [tpdm].[CourseStudentAcademicRecordFacts] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_CourseStudentAcademicRecordFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseStudentAcademicRecordFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFactsAggregatedSessionGradePointAverage_CourseStudentAcademicRecordFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseStudentAcademicRecordFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFactsStudentsEnrolled_CourseStudentAcademicRecordFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[CourseStudentAcademicRecordFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentAcademicRecordFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAcademicRecordFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAcademicRecordFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[CourseStudentAcademicRecordFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFacts_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFacts_AcademicSubjectDescriptor]
ON [tpdm].[CourseStudentAssessmentFacts] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFacts_AssessmentCategoryDescriptor] FOREIGN KEY ([AssessmentCategoryDescriptorId])
REFERENCES [edfi].[AssessmentCategoryDescriptor] ([AssessmentCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFacts_AssessmentCategoryDescriptor]
ON [tpdm].[CourseStudentAssessmentFacts] ([AssessmentCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFacts_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFacts_Course]
ON [tpdm].[CourseStudentAssessmentFacts] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFacts_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFacts_GradeLevelDescriptor]
ON [tpdm].[CourseStudentAssessmentFacts] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFacts_SchoolYearType] FOREIGN KEY ([TakenSchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFacts_SchoolYearType]
ON [tpdm].[CourseStudentAssessmentFacts] ([TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFacts_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFacts_TermDescriptor]
ON [tpdm].[CourseStudentAssessmentFacts] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsAggregatedPerformanceLevel_CourseStudentAssessmentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
REFERENCES [tpdm].[CourseStudentAssessmentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFactsAggregatedPerformanceLevel_CourseStudentAssessmentFacts]
ON [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC, [TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsAggregatedPerformanceLevel_PerformanceLevelDescriptor] FOREIGN KEY ([PerformanceLevelDescriptorId])
REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFactsAggregatedPerformanceLevel_PerformanceLevelDescriptor]
ON [tpdm].[CourseStudentAssessmentFactsAggregatedPerformanceLevel] ([PerformanceLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsAggregatedScoreResult_AssessmentReportingMethodDescriptor] FOREIGN KEY ([AssessmentReportingMethodDescriptorId])
REFERENCES [edfi].[AssessmentReportingMethodDescriptor] ([AssessmentReportingMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFactsAggregatedScoreResult_AssessmentReportingMethodDescriptor]
ON [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] ([AssessmentReportingMethodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsAggregatedScoreResult_CourseStudentAssessmentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
REFERENCES [tpdm].[CourseStudentAssessmentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsAggregatedScoreResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([AverageScoreResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFactsAggregatedScoreResult_ResultDatatypeTypeDescriptor]
ON [tpdm].[CourseStudentAssessmentFactsAggregatedScoreResult] ([AverageScoreResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsStudentsEnrolled_CourseStudentAssessmentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
REFERENCES [tpdm].[CourseStudentAssessmentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentAssessmentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentAssessmentFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentAssessmentFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[CourseStudentAssessmentFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFacts] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFacts_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFacts_Course]
ON [tpdm].[CourseStudentFacts] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedByDisability_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedByDisability_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedByDisability] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedByDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedByDisability_DisabilityDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedByDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedByDisability_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedByDisability_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedByDisability] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedDisabilityTotalStudentsDisabled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedELLEnrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedELLEnrollment_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedELLEnrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedELLEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedELLEnrollment_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedELLEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedESLEnrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedESLEnrollment_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedESLEnrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedESLEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedESLEnrollment_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedESLEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedGender_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedGender_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedGender] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedGender_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedGender_GenderDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedGender] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedGender_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedGender_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedGender] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedHispanicLatinoEthnicity_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedHispanicLatinoEthnicity_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedHispanicLatinoEthnicity_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedHispanicLatinoEthnicity_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedHispanicLatinoEthnicity] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedLanguage_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedLanguage_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedLanguage] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedLanguage_LanguageDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedLanguage] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedLanguage_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedLanguage_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedLanguage] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedRace_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedRace_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedRace] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedRace_RaceDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedRace_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedRace_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedRace] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSchoolFoodServiceProgramService_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSchoolFoodServiceProgramService_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor] FOREIGN KEY ([SchoolFoodServiceProgramServiceDescriptorId])
REFERENCES [edfi].[SchoolFoodServiceProgramServiceDescriptor] ([SchoolFoodServiceProgramServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] ([SchoolFoodServiceProgramServiceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSchoolFoodServiceProgramService_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSchoolFoodServiceProgramService_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedSchoolFoodServiceProgramService] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSection504Enrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSection504Enrollment_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSection504Enrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSection504Enrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSection504Enrollment_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedSection504Enrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSex_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSex_CourseStudentFacts]
ON [tpdm].[CourseStudentFactsAggregatedSex] ([CourseCode] ASC, [EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSex_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSex_SexDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedSex] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSex_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSex_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedSex] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSPED] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSPED_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedSPED] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedSPED_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedSPED_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedSPED] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedTitleIEnrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedTitleIEnrollment_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsAggregatedTitleIEnrollment] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsAggregatedTitleIEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsAggregatedTitleIEnrollment_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsAggregatedTitleIEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CourseStudentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsStudentsEnrolled_CourseStudentFacts] FOREIGN KEY ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[CourseStudentFacts] ([CourseCode], [EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CourseStudentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_CourseStudentFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseStudentFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[CourseStudentFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialBoardCertification] WITH CHECK ADD CONSTRAINT [FK_CredentialBoardCertification_BoardCertificationTypeDescriptor] FOREIGN KEY ([BoardCertificationTypeDescriptorId])
REFERENCES [tpdm].[BoardCertificationTypeDescriptor] ([BoardCertificationTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialBoardCertification_BoardCertificationTypeDescriptor]
ON [tpdm].[CredentialBoardCertification] ([BoardCertificationTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialBoardCertification] WITH CHECK ADD CONSTRAINT [FK_CredentialBoardCertification_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialCertificationExam] WITH CHECK ADD CONSTRAINT [FK_CredentialCertificationExam_CertificationExamStatusDescriptor] FOREIGN KEY ([CertificationExamStatusDescriptorId])
REFERENCES [tpdm].[CertificationExamStatusDescriptor] ([CertificationExamStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialCertificationExam_CertificationExamStatusDescriptor]
ON [tpdm].[CredentialCertificationExam] ([CertificationExamStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialCertificationExam] WITH CHECK ADD CONSTRAINT [FK_CredentialCertificationExam_CertificationExamTypeDescriptor] FOREIGN KEY ([CertificationExamTypeDescriptorId])
REFERENCES [tpdm].[CertificationExamTypeDescriptor] ([CertificationExamTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialCertificationExam_CertificationExamTypeDescriptor]
ON [tpdm].[CredentialCertificationExam] ([CertificationExamTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialCertificationExam] WITH CHECK ADD CONSTRAINT [FK_CredentialCertificationExam_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CredentialCertificationExam_Credential]
ON [tpdm].[CredentialCertificationExam] ([CredentialIdentifier] ASC, [StateOfIssueStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialExtension_ValueTypeDescriptor]
ON [tpdm].[CredentialExtension] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialRecommendation] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendation_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialRecommendation] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendation_CredentialFieldDescriptor] FOREIGN KEY ([CredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialRecommendation_CredentialFieldDescriptor]
ON [tpdm].[CredentialRecommendation] ([CredentialFieldDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialRecommendation] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendation_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialRecommendation_GradeLevelDescriptor]
ON [tpdm].[CredentialRecommendation] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialRecommendation] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendation_TeachingCredentialDescriptor] FOREIGN KEY ([TeachingCredentialDescriptorId])
REFERENCES [edfi].[TeachingCredentialDescriptor] ([TeachingCredentialDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialRecommendation_TeachingCredentialDescriptor]
ON [tpdm].[CredentialRecommendation] ([TeachingCredentialDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialRecommendingInstitution] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendingInstitution_CountryDescriptor] FOREIGN KEY ([RecommendingInstitutionCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialRecommendingInstitution_CountryDescriptor]
ON [tpdm].[CredentialRecommendingInstitution] ([RecommendingInstitutionCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[CredentialRecommendingInstitution] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendingInstitution_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialRecommendingInstitution] WITH CHECK ADD CONSTRAINT [FK_CredentialRecommendingInstitution_StateAbbreviationDescriptor] FOREIGN KEY ([RecommendingInstitutionStateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CredentialRecommendingInstitution_StateAbbreviationDescriptor]
ON [tpdm].[CredentialRecommendingInstitution] ([RecommendingInstitutionStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationCourseTranscriptFacts_EducationOrganizationStudentAcademicRecordFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationCourseTranscriptFacts_EducationOrganizationStudentAcademicRecordFacts]
ON [tpdm].[EducationOrganizationCourseTranscriptFacts] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC, [SchoolYear] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned_EducationOrganizationCourseTranscriptFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationCourseTranscriptFacts] ([EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned_EducationOrganizationCourseTranscriptFacts]
ON [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedFinalLetterGradeEarned] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationCourseTranscriptFactsAggregatedNumericGradeEarned_EducationOrganizationCourseTranscriptFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationCourseTranscriptFacts] ([EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationCourseTranscriptFactsStudentsEnrolled_EducationOrganizationCourseTranscriptFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationCourseTranscriptFacts] ([EducationOrganizationId], [FactAsOfDate], [FactsAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationCourseTranscriptFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationCourseTranscriptFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationCourseTranscriptFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationCourseTranscriptFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFacts_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFacts_EducationOrganization]
ON [tpdm].[EducationOrganizationFacts] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFacts_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFacts_SchoolYearType]
ON [tpdm].[EducationOrganizationFacts] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFactsAggregatedSalary] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFactsAggregatedSalary_EducationOrganizationFacts] FOREIGN KEY ([EducationOrganizationId], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[EducationOrganizationFacts] ([EducationOrganizationId], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationFactsVacancies] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFactsVacancies_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFactsVacancies_AcademicSubjectDescriptor]
ON [tpdm].[EducationOrganizationFactsVacancies] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFactsVacancies] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFactsVacancies_EducationOrganizationFacts] FOREIGN KEY ([EducationOrganizationId], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[EducationOrganizationFacts] ([EducationOrganizationId], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFactsVacancies_EducationOrganizationFacts]
ON [tpdm].[EducationOrganizationFactsVacancies] ([EducationOrganizationId] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFactsVacancies] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFactsVacancies_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFactsVacancies_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationFactsVacancies] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFactsVacanciesGradeLevel_EducationOrganizationFactsVacancies] FOREIGN KEY ([AcademicSubjectDescriptorId], [EducationOrganizationId], [FactsAsOfDate], [SchoolYear])
REFERENCES [tpdm].[EducationOrganizationFactsVacancies] ([AcademicSubjectDescriptorId], [EducationOrganizationId], [FactsAsOfDate], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFactsVacanciesGradeLevel_EducationOrganizationFactsVacancies]
ON [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] ([AcademicSubjectDescriptorId] ASC, [EducationOrganizationId] ASC, [FactsAsOfDate] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationFactsVacanciesGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationFactsVacanciesGradeLevel_GradeLevelDescriptor]
ON [tpdm].[EducationOrganizationFactsVacanciesGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationNetworkExtension] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationNetworkExtension_EducationOrganizationNetwork] FOREIGN KEY ([EducationOrganizationNetworkId])
REFERENCES [edfi].[EducationOrganizationNetwork] ([EducationOrganizationNetworkId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationNetworkExtension] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationNetworkExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationNetworkExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[EducationOrganizationNetworkExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFacts_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAcademicRecordFacts_EducationOrganization]
ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFacts_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAcademicRecordFacts_SchoolYearType]
ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFacts_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAcademicRecordFacts_TermDescriptor]
ON [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_EducationOrganizationStudentAcademicReco] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFactsAggregatedSessionGradePointAverage_EducationOrganizationStudentAcademicRecordF] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled_EducationOrganizationStudentAcademicRecordFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EducationOrganizationStudentAcademicRecordFacts] ([EducationOrganizationId], [FactAsOfDate], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentAcademicRecordFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFacts_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFacts_AcademicSubjectDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFacts_AssessmentCategoryDescriptor] FOREIGN KEY ([AssessmentCategoryDescriptorId])
REFERENCES [edfi].[AssessmentCategoryDescriptor] ([AssessmentCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFacts_AssessmentCategoryDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([AssessmentCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFacts_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFacts_EducationOrganization]
ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFacts_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFacts_GradeLevelDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFacts_SchoolYearType] FOREIGN KEY ([TakenSchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFacts_SchoolYearType]
ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFacts_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFacts_TermDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFacts] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel_EducationOrganizationStudentAssessmentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
REFERENCES [tpdm].[EducationOrganizationStudentAssessmentFacts] ([EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel_EducationOrganizationStudentAssessmentFacts]
ON [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC, [TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel_PerformanceLevelDescriptor] FOREIGN KEY ([PerformanceLevelDescriptorId])
REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel_PerformanceLevelDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedPerformanceLevel] ([PerformanceLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_AssessmentReportingMethodDescriptor] FOREIGN KEY ([AssessmentReportingMethodDescriptorId])
REFERENCES [edfi].[AssessmentReportingMethodDescriptor] ([AssessmentReportingMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_AssessmentReportingMethodDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] ([AssessmentReportingMethodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_EducationOrganizationStudentAssessmentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
REFERENCES [tpdm].[EducationOrganizationStudentAssessmentFacts] ([EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([AverageScoreResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFactsAggregatedScoreResult_ResultDatatypeTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFactsAggregatedScoreResult] ([AverageScoreResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsStudentsEnrolled_EducationOrganizationStudentAssessmentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
REFERENCES [tpdm].[EducationOrganizationStudentAssessmentFacts] ([EducationOrganizationId], [FactAsOfDate], [TakenSchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentAssessmentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentAssessmentFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentAssessmentFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentAssessmentFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFacts] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFacts_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFacts_EducationOrganization]
ON [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedByDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedByDisability_DisabilityDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedByDisability_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedByDisability_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedByDisability_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedByDisability_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedByDisability] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedDisabilityTotalStudentsDisabled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedELLEnrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedELLEnrollment_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedELLEnrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedELLEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedELLEnrollment_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedELLEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedESLEnrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedESLEnrollment_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedESLEnrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedESLEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedESLEnrollment_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedESLEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedGender_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedGender_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedGender] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedGender_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedGender_GenderDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedGender] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedGender_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedGender_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedGender] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedHispanicLatinoEthnicity] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedLanguage_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedLanguage_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedLanguage_LanguageDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedLanguage_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedLanguage_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedLanguage] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedRace_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedRace_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedRace] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedRace_RaceDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedRace_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedRace_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedRace] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor] FOREIGN KEY ([SchoolFoodServiceProgramServiceDescriptorId])
REFERENCES [edfi].[SchoolFoodServiceProgramServiceDescriptor] ([SchoolFoodServiceProgramServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] ([SchoolFoodServiceProgramServiceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSchoolFoodServiceProgramService] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSection504Enrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSection504Enrollment_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSection504Enrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSection504Enrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSection504Enrollment_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSection504Enrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSex_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSex_EducationOrganizationStudentFacts]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSex] ([EducationOrganizationId] ASC, [FactAsOfDate] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSex_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSex_SexDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSex] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSex_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSex_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSex] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSPED] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSPED_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedSPED] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedSPED_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedSPED_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedSPED] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedTitleIEnrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedTitleIEnrollment_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsAggregatedTitleIEnrollment] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsAggregatedTitleIEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsAggregatedTitleIEnrollment_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsAggregatedTitleIEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsStudentsEnrolled_EducationOrganizationStudentFacts] FOREIGN KEY ([EducationOrganizationId], [FactAsOfDate])
REFERENCES [tpdm].[EducationOrganizationStudentFacts] ([EducationOrganizationId], [FactAsOfDate])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationOrganizationStudentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_EducationOrganizationStudentFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationOrganizationStudentFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[EducationOrganizationStudentFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EducationServiceCenterExtension] WITH CHECK ADD CONSTRAINT [FK_EducationServiceCenterExtension_EducationServiceCenter] FOREIGN KEY ([EducationServiceCenterId])
REFERENCES [edfi].[EducationServiceCenter] ([EducationServiceCenterId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducationServiceCenterExtension] WITH CHECK ADD CONSTRAINT [FK_EducationServiceCenterExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EducationServiceCenterExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[EducationServiceCenterExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EmploymentEvent] WITH CHECK ADD CONSTRAINT [FK_EmploymentEvent_EmploymentEventTypeDescriptor] FOREIGN KEY ([EmploymentEventTypeDescriptorId])
REFERENCES [tpdm].[EmploymentEventTypeDescriptor] ([EmploymentEventTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EmploymentEvent_EmploymentEventTypeDescriptor]
ON [tpdm].[EmploymentEvent] ([EmploymentEventTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EmploymentEvent] WITH CHECK ADD CONSTRAINT [FK_EmploymentEvent_InternalExternalHireDescriptor] FOREIGN KEY ([InternalExternalHireDescriptorId])
REFERENCES [tpdm].[InternalExternalHireDescriptor] ([InternalExternalHireDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EmploymentEvent_InternalExternalHireDescriptor]
ON [tpdm].[EmploymentEvent] ([InternalExternalHireDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EmploymentEvent] WITH CHECK ADD CONSTRAINT [FK_EmploymentEvent_OpenStaffPosition] FOREIGN KEY ([EducationOrganizationId], [RequisitionNumber])
REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [RequisitionNumber])
GO

CREATE NONCLUSTERED INDEX [FK_EmploymentEvent_OpenStaffPosition]
ON [tpdm].[EmploymentEvent] ([EducationOrganizationId] ASC, [RequisitionNumber] ASC)
GO

ALTER TABLE [tpdm].[EmploymentEventTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EmploymentEventTypeDescriptor_Descriptor] FOREIGN KEY ([EmploymentEventTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EmploymentSeparationEvent] WITH CHECK ADD CONSTRAINT [FK_EmploymentSeparationEvent_EmploymentSeparationReasonDescriptor] FOREIGN KEY ([EmploymentSeparationReasonDescriptorId])
REFERENCES [tpdm].[EmploymentSeparationReasonDescriptor] ([EmploymentSeparationReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EmploymentSeparationEvent_EmploymentSeparationReasonDescriptor]
ON [tpdm].[EmploymentSeparationEvent] ([EmploymentSeparationReasonDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EmploymentSeparationEvent] WITH CHECK ADD CONSTRAINT [FK_EmploymentSeparationEvent_EmploymentSeparationTypeDescriptor] FOREIGN KEY ([EmploymentSeparationTypeDescriptorId])
REFERENCES [tpdm].[EmploymentSeparationTypeDescriptor] ([EmploymentSeparationTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_EmploymentSeparationEvent_EmploymentSeparationTypeDescriptor]
ON [tpdm].[EmploymentSeparationEvent] ([EmploymentSeparationTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[EmploymentSeparationEvent] WITH CHECK ADD CONSTRAINT [FK_EmploymentSeparationEvent_OpenStaffPosition] FOREIGN KEY ([EducationOrganizationId], [RequisitionNumber])
REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [RequisitionNumber])
GO

CREATE NONCLUSTERED INDEX [FK_EmploymentSeparationEvent_OpenStaffPosition]
ON [tpdm].[EmploymentSeparationEvent] ([EducationOrganizationId] ASC, [RequisitionNumber] ASC)
GO

ALTER TABLE [tpdm].[EmploymentSeparationReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_EmploymentSeparationReasonDescriptor_Descriptor] FOREIGN KEY ([EmploymentSeparationReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EmploymentSeparationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EmploymentSeparationTypeDescriptor_Descriptor] FOREIGN KEY ([EmploymentSeparationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EnglishLanguageExamDescriptor] WITH CHECK ADD CONSTRAINT [FK_EnglishLanguageExamDescriptor_Descriptor] FOREIGN KEY ([EnglishLanguageExamDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[FederalLocaleCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_FederalLocaleCodeDescriptor_Descriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[FieldworkTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_FieldworkTypeDescriptor_Descriptor] FOREIGN KEY ([FieldworkTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[FundingSourceDescriptor] WITH CHECK ADD CONSTRAINT [FK_FundingSourceDescriptor_Descriptor] FOREIGN KEY ([FundingSourceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[GenderDescriptor] WITH CHECK ADD CONSTRAINT [FK_GenderDescriptor_Descriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[GradebookEntryExtension] WITH CHECK ADD CONSTRAINT [FK_GradebookEntryExtension_GradebookEntry] FOREIGN KEY ([DateAssigned], [GradebookEntryTitle], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[GradebookEntry] ([DateAssigned], [GradebookEntryTitle], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[GradebookEntryExtension] WITH CHECK ADD CONSTRAINT [FK_GradebookEntryExtension_ProgramGatewayDescriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [tpdm].[ProgramGatewayDescriptor] ([ProgramGatewayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_GradebookEntryExtension_ProgramGatewayDescriptor]
ON [tpdm].[GradebookEntryExtension] ([ProgramGatewayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[HireStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_HireStatusDescriptor_Descriptor] FOREIGN KEY ([HireStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[HiringSourceDescriptor] WITH CHECK ADD CONSTRAINT [FK_HiringSourceDescriptor_Descriptor] FOREIGN KEY ([HiringSourceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[InternalExternalHireDescriptor] WITH CHECK ADD CONSTRAINT [FK_InternalExternalHireDescriptor_Descriptor] FOREIGN KEY ([InternalExternalHireDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[LevelOfDegreeAwardedDescriptor] WITH CHECK ADD CONSTRAINT [FK_LevelOfDegreeAwardedDescriptor_Descriptor] FOREIGN KEY ([LevelOfDegreeAwardedDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[LevelTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_LevelTypeDescriptor_Descriptor] FOREIGN KEY ([LevelTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[LocalEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[LocalEducationAgencyExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[LocalEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyExtension_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[OpenStaffPositionEvent] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionEvent_OpenStaffPosition] FOREIGN KEY ([EducationOrganizationId], [RequisitionNumber])
REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [RequisitionNumber])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionEvent_OpenStaffPosition]
ON [tpdm].[OpenStaffPositionEvent] ([EducationOrganizationId] ASC, [RequisitionNumber] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionEvent] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionEvent_OpenStaffPositionEventStatusDescriptor] FOREIGN KEY ([OpenStaffPositionEventStatusDescriptorId])
REFERENCES [tpdm].[OpenStaffPositionEventStatusDescriptor] ([OpenStaffPositionEventStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionEvent_OpenStaffPositionEventStatusDescriptor]
ON [tpdm].[OpenStaffPositionEvent] ([OpenStaffPositionEventStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionEvent] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionEvent_OpenStaffPositionEventTypeDescriptor] FOREIGN KEY ([OpenStaffPositionEventTypeDescriptorId])
REFERENCES [tpdm].[OpenStaffPositionEventTypeDescriptor] ([OpenStaffPositionEventTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionEvent_OpenStaffPositionEventTypeDescriptor]
ON [tpdm].[OpenStaffPositionEvent] ([OpenStaffPositionEventTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionEventStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionEventStatusDescriptor_Descriptor] FOREIGN KEY ([OpenStaffPositionEventStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[OpenStaffPositionEventTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionEventTypeDescriptor_Descriptor] FOREIGN KEY ([OpenStaffPositionEventTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[OpenStaffPositionExtension] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionExtension_FundingSourceDescriptor] FOREIGN KEY ([FundingSourceDescriptorId])
REFERENCES [tpdm].[FundingSourceDescriptor] ([FundingSourceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionExtension_FundingSourceDescriptor]
ON [tpdm].[OpenStaffPositionExtension] ([FundingSourceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionExtension] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionExtension_OpenStaffPosition] FOREIGN KEY ([EducationOrganizationId], [RequisitionNumber])
REFERENCES [edfi].[OpenStaffPosition] ([EducationOrganizationId], [RequisitionNumber])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[OpenStaffPositionExtension] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionExtension_OpenStaffPositionReasonDescriptor] FOREIGN KEY ([OpenStaffPositionReasonDescriptorId])
REFERENCES [tpdm].[OpenStaffPositionReasonDescriptor] ([OpenStaffPositionReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionExtension_OpenStaffPositionReasonDescriptor]
ON [tpdm].[OpenStaffPositionExtension] ([OpenStaffPositionReasonDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionExtension] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionExtension_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionExtension_SchoolYearType]
ON [tpdm].[OpenStaffPositionExtension] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionExtension] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionExtension_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_OpenStaffPositionExtension_TermDescriptor]
ON [tpdm].[OpenStaffPositionExtension] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[OpenStaffPositionReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_OpenStaffPositionReasonDescriptor_Descriptor] FOREIGN KEY ([OpenStaffPositionReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceMeasure] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasure_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasure_AcademicSubjectDescriptor]
ON [tpdm].[PerformanceMeasure] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasure] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasure_CoteachingStyleObservedDescriptor] FOREIGN KEY ([CoteachingStyleObservedDescriptorId])
REFERENCES [tpdm].[CoteachingStyleObservedDescriptor] ([CoteachingStyleObservedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasure_CoteachingStyleObservedDescriptor]
ON [tpdm].[PerformanceMeasure] ([CoteachingStyleObservedDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasure] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasure_PerformanceMeasureInstanceDescriptor] FOREIGN KEY ([PerformanceMeasureInstanceDescriptorId])
REFERENCES [tpdm].[PerformanceMeasureInstanceDescriptor] ([PerformanceMeasureInstanceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasure_PerformanceMeasureInstanceDescriptor]
ON [tpdm].[PerformanceMeasure] ([PerformanceMeasureInstanceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasure] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasure_PerformanceMeasureTypeDescriptor] FOREIGN KEY ([PerformanceMeasureTypeDescriptorId])
REFERENCES [tpdm].[PerformanceMeasureTypeDescriptor] ([PerformanceMeasureTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasure_PerformanceMeasureTypeDescriptor]
ON [tpdm].[PerformanceMeasure] ([PerformanceMeasureTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasure] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasure_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasure_TermDescriptor]
ON [tpdm].[PerformanceMeasure] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureCourseAssociation_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureCourseAssociation_Course]
ON [tpdm].[PerformanceMeasureCourseAssociation] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureCourseAssociation_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureCourseAssociation_PerformanceMeasure]
ON [tpdm].[PerformanceMeasureCourseAssociation] ([PerformanceMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureFacts] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureFacts_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureFacts_AcademicSubjectDescriptor]
ON [tpdm].[PerformanceMeasureFacts] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureFacts] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureFacts_PerformanceMeasureTypeDescriptor] FOREIGN KEY ([PerformanceMeasureTypeDescriptorId])
REFERENCES [tpdm].[PerformanceMeasureTypeDescriptor] ([PerformanceMeasureTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureFacts_PerformanceMeasureTypeDescriptor]
ON [tpdm].[PerformanceMeasureFacts] ([PerformanceMeasureTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureFacts] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureFacts_Rubric] FOREIGN KEY ([EducationOrganizationId], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[Rubric] ([EducationOrganizationId], [RubricTitle], [RubricTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureFacts_Rubric]
ON [tpdm].[PerformanceMeasureFacts] ([EducationOrganizationId] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureFacts] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureFacts_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureFacts_SchoolYearType]
ON [tpdm].[PerformanceMeasureFacts] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureFactsGradeLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureFactsGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureFactsGradeLevel_GradeLevelDescriptor]
ON [tpdm].[PerformanceMeasureFactsGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureFactsGradeLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureFactsGradeLevel_PerformanceMeasureFacts] FOREIGN KEY ([EducationOrganizationId], [FactsAsOfDate], [RubricTitle], [RubricTypeDescriptorId], [SchoolYear])
REFERENCES [tpdm].[PerformanceMeasureFacts] ([EducationOrganizationId], [FactsAsOfDate], [RubricTitle], [RubricTypeDescriptorId], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureFactsGradeLevel_PerformanceMeasureFacts]
ON [tpdm].[PerformanceMeasureFactsGradeLevel] ([EducationOrganizationId] ASC, [FactsAsOfDate] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureGradeLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureGradeLevel_GradeLevelDescriptor]
ON [tpdm].[PerformanceMeasureGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureGradeLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureGradeLevel_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureGradeLevel_PerformanceMeasure]
ON [tpdm].[PerformanceMeasureGradeLevel] ([PerformanceMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureInstanceDescriptor] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureInstanceDescriptor_Descriptor] FOREIGN KEY ([PerformanceMeasureInstanceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceMeasurePersonBeingReviewed] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasurePersonBeingReviewed_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceMeasurePersonBeingReviewed] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasurePersonBeingReviewed_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasurePersonBeingReviewed_Prospect]
ON [tpdm].[PerformanceMeasurePersonBeingReviewed] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasurePersonBeingReviewed] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasurePersonBeingReviewed_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasurePersonBeingReviewed_Staff]
ON [tpdm].[PerformanceMeasurePersonBeingReviewed] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasurePersonBeingReviewed] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasurePersonBeingReviewed_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasurePersonBeingReviewed_TeacherCandidate]
ON [tpdm].[PerformanceMeasurePersonBeingReviewed] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureProgramGateway] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureProgramGateway_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureProgramGateway_PerformanceMeasure]
ON [tpdm].[PerformanceMeasureProgramGateway] ([PerformanceMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureProgramGateway] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureProgramGateway_ProgramGatewayDescriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [tpdm].[ProgramGatewayDescriptor] ([ProgramGatewayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureProgramGateway_ProgramGatewayDescriptor]
ON [tpdm].[PerformanceMeasureProgramGateway] ([ProgramGatewayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureReviewer] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureReviewer_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureReviewer_PerformanceMeasure]
ON [tpdm].[PerformanceMeasureReviewer] ([PerformanceMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureReviewer] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureReviewer_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureReviewer_Staff]
ON [tpdm].[PerformanceMeasureReviewer] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureReviewerReceivedTraining] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureReviewerReceivedTraining_PerformanceMeasureReviewer] FOREIGN KEY ([FirstName], [LastSurname], [PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasureReviewer] ([FirstName], [LastSurname], [PerformanceMeasureIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceMeasureRubric] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureRubric_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureRubric_PerformanceMeasure]
ON [tpdm].[PerformanceMeasureRubric] ([PerformanceMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureRubric] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureRubric_Rubric] FOREIGN KEY ([EducationOrganizationId], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[Rubric] ([EducationOrganizationId], [RubricTitle], [RubricTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PerformanceMeasureRubric_Rubric]
ON [tpdm].[PerformanceMeasureRubric] ([EducationOrganizationId] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PerformanceMeasureTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_PerformanceMeasureTypeDescriptor_Descriptor] FOREIGN KEY ([PerformanceMeasureTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PostSecondaryInstitutionExtension] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryInstitutionExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryInstitutionExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[PostSecondaryInstitutionExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[PostSecondaryInstitutionExtension] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryInstitutionExtension_PostSecondaryInstitution] FOREIGN KEY ([PostSecondaryInstitutionId])
REFERENCES [edfi].[PostSecondaryInstitution] ([PostSecondaryInstitutionId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PreviousCareerDescriptor] WITH CHECK ADD CONSTRAINT [FK_PreviousCareerDescriptor_Descriptor] FOREIGN KEY ([PreviousCareerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] WITH CHECK ADD CONSTRAINT [FK_ProfessionalDevelopmentEvent_ProfessionalDevelopmentOfferedByDescriptor] FOREIGN KEY ([ProfessionalDevelopmentOfferedByDescriptorId])
REFERENCES [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] ([ProfessionalDevelopmentOfferedByDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProfessionalDevelopmentEvent_ProfessionalDevelopmentOfferedByDescriptor]
ON [tpdm].[ProfessionalDevelopmentEvent] ([ProfessionalDevelopmentOfferedByDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProfessionalDevelopmentOfferedByDescriptor_Descriptor] FOREIGN KEY ([ProfessionalDevelopmentOfferedByDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ProgramGatewayDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProgramGatewayDescriptor_Descriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[Prospect] WITH CHECK ADD CONSTRAINT [FK_Prospect_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_Prospect_EducationOrganization]
ON [tpdm].[Prospect] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[Prospect] WITH CHECK ADD CONSTRAINT [FK_Prospect_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Prospect_GenderDescriptor]
ON [tpdm].[Prospect] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Prospect] WITH CHECK ADD CONSTRAINT [FK_Prospect_ProspectTypeDescriptor] FOREIGN KEY ([ProspectTypeDescriptorId])
REFERENCES [tpdm].[ProspectTypeDescriptor] ([ProspectTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Prospect_ProspectTypeDescriptor]
ON [tpdm].[Prospect] ([ProspectTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Prospect] WITH CHECK ADD CONSTRAINT [FK_Prospect_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Prospect_SexDescriptor]
ON [tpdm].[Prospect] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[Prospect] WITH CHECK ADD CONSTRAINT [FK_Prospect_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_Prospect_TeacherCandidate]
ON [tpdm].[Prospect] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectAid] WITH CHECK ADD CONSTRAINT [FK_ProspectAid_AidTypeDescriptor] FOREIGN KEY ([AidTypeDescriptorId])
REFERENCES [tpdm].[AidTypeDescriptor] ([AidTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectAid_AidTypeDescriptor]
ON [tpdm].[ProspectAid] ([AidTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectAid] WITH CHECK ADD CONSTRAINT [FK_ProspectAid_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ProspectCredential] WITH CHECK ADD CONSTRAINT [FK_ProspectCredential_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectCredential_Credential]
ON [tpdm].[ProspectCredential] ([CredentialIdentifier] ASC, [StateOfIssueStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectCredential] WITH CHECK ADD CONSTRAINT [FK_ProspectCredential_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectCredential_Prospect]
ON [tpdm].[ProspectCredential] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectCurrentPosition] WITH CHECK ADD CONSTRAINT [FK_ProspectCurrentPosition_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectCurrentPosition_AcademicSubjectDescriptor]
ON [tpdm].[ProspectCurrentPosition] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectCurrentPosition] WITH CHECK ADD CONSTRAINT [FK_ProspectCurrentPosition_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ProspectCurrentPositionGradeLevel] WITH CHECK ADD CONSTRAINT [FK_ProspectCurrentPositionGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectCurrentPositionGradeLevel_GradeLevelDescriptor]
ON [tpdm].[ProspectCurrentPositionGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectCurrentPositionGradeLevel] WITH CHECK ADD CONSTRAINT [FK_ProspectCurrentPositionGradeLevel_ProspectCurrentPosition] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[ProspectCurrentPosition] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectCurrentPositionGradeLevel_ProspectCurrentPosition]
ON [tpdm].[ProspectCurrentPositionGradeLevel] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectDisability] WITH CHECK ADD CONSTRAINT [FK_ProspectDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectDisability_DisabilityDescriptor]
ON [tpdm].[ProspectDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectDisability] WITH CHECK ADD CONSTRAINT [FK_ProspectDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId])
REFERENCES [edfi].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectDisability_DisabilityDeterminationSourceTypeDescriptor]
ON [tpdm].[ProspectDisability] ([DisabilityDeterminationSourceTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectDisability] WITH CHECK ADD CONSTRAINT [FK_ProspectDisability_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectDisability_Prospect]
ON [tpdm].[ProspectDisability] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_ProspectDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId])
REFERENCES [edfi].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectDisabilityDesignation_DisabilityDesignationDescriptor]
ON [tpdm].[ProspectDisabilityDesignation] ([DisabilityDesignationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_ProspectDisabilityDesignation_ProspectDisability] FOREIGN KEY ([DisabilityDescriptorId], [EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[ProspectDisability] ([DisabilityDescriptorId], [EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectDisabilityDesignation_ProspectDisability]
ON [tpdm].[ProspectDisabilityDesignation] ([DisabilityDescriptorId] ASC, [EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ProspectPersonalIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectPersonalIdentificationDocument_CountryDescriptor]
ON [tpdm].[ProspectPersonalIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ProspectPersonalIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectPersonalIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [tpdm].[ProspectPersonalIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ProspectPersonalIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectPersonalIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [tpdm].[ProspectPersonalIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_ProspectPersonalIdentificationDocument_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectPersonalIdentificationDocument_Prospect]
ON [tpdm].[ProspectPersonalIdentificationDocument] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_ProspectProfessionalDevelopmentEventAttendance_AttendanceEventCategoryDescriptor] FOREIGN KEY ([AttendanceEventCategoryDescriptorId])
REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectProfessionalDevelopmentEventAttendance_AttendanceEventCategoryDescriptor]
ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ([AttendanceEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_ProspectProfessionalDevelopmentEventAttendance_ProfessionalDevelopmentEvent] FOREIGN KEY ([ProfessionalDevelopmentTitle])
REFERENCES [tpdm].[ProfessionalDevelopmentEvent] ([ProfessionalDevelopmentTitle])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectProfessionalDevelopmentEventAttendance_ProfessionalDevelopmentEvent]
ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ([ProfessionalDevelopmentTitle] ASC)
GO

ALTER TABLE [tpdm].[ProspectProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_ProspectProfessionalDevelopmentEventAttendance_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectProfessionalDevelopmentEventAttendance_Prospect]
ON [tpdm].[ProspectProfessionalDevelopmentEventAttendance] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectQualifications] WITH CHECK ADD CONSTRAINT [FK_ProspectQualifications_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ProspectRace] WITH CHECK ADD CONSTRAINT [FK_ProspectRace_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectRace_Prospect]
ON [tpdm].[ProspectRace] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectRace] WITH CHECK ADD CONSTRAINT [FK_ProspectRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectRace_RaceDescriptor]
ON [tpdm].[ProspectRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectRecruitmentEvent] WITH CHECK ADD CONSTRAINT [FK_ProspectRecruitmentEvent_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectRecruitmentEvent_Prospect]
ON [tpdm].[ProspectRecruitmentEvent] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectRecruitmentEvent] WITH CHECK ADD CONSTRAINT [FK_ProspectRecruitmentEvent_RecruitmentEvent] FOREIGN KEY ([EventDate], [EventTitle])
REFERENCES [tpdm].[RecruitmentEvent] ([EventDate], [EventTitle])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectRecruitmentEvent_RecruitmentEvent]
ON [tpdm].[ProspectRecruitmentEvent] ([EventDate] ASC, [EventTitle] ASC)
GO

ALTER TABLE [tpdm].[ProspectTelephone] WITH CHECK ADD CONSTRAINT [FK_ProspectTelephone_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectTelephone_Prospect]
ON [tpdm].[ProspectTelephone] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectTelephone] WITH CHECK ADD CONSTRAINT [FK_ProspectTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProspectTelephone_TelephoneNumberTypeDescriptor]
ON [tpdm].[ProspectTelephone] ([TelephoneNumberTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ProspectTouchpoint] WITH CHECK ADD CONSTRAINT [FK_ProspectTouchpoint_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProspectTouchpoint_Prospect]
ON [tpdm].[ProspectTouchpoint] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[ProspectTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProspectTypeDescriptor_Descriptor] FOREIGN KEY ([ProspectTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[RecruitmentEvent] WITH CHECK ADD CONSTRAINT [FK_RecruitmentEvent_RecruitmentEventTypeDescriptor] FOREIGN KEY ([RecruitmentEventTypeDescriptorId])
REFERENCES [tpdm].[RecruitmentEventTypeDescriptor] ([RecruitmentEventTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RecruitmentEvent_RecruitmentEventTypeDescriptor]
ON [tpdm].[RecruitmentEvent] ([RecruitmentEventTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RecruitmentEventTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_RecruitmentEventTypeDescriptor_Descriptor] FOREIGN KEY ([RecruitmentEventTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[Rubric] WITH CHECK ADD CONSTRAINT [FK_Rubric_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_Rubric_EducationOrganization]
ON [tpdm].[Rubric] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[Rubric] WITH CHECK ADD CONSTRAINT [FK_Rubric_RubricTypeDescriptor] FOREIGN KEY ([RubricTypeDescriptorId])
REFERENCES [tpdm].[RubricTypeDescriptor] ([RubricTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Rubric_RubricTypeDescriptor]
ON [tpdm].[Rubric] ([RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricLevel] WITH CHECK ADD CONSTRAINT [FK_RubricLevel_Rubric] FOREIGN KEY ([EducationOrganizationId], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[Rubric] ([EducationOrganizationId], [RubricTitle], [RubricTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevel_Rubric]
ON [tpdm].[RubricLevel] ([EducationOrganizationId] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelInformation] WITH CHECK ADD CONSTRAINT [FK_RubricLevelInformation_LevelTypeDescriptor] FOREIGN KEY ([LevelTypeDescriptorId])
REFERENCES [tpdm].[LevelTypeDescriptor] ([LevelTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelInformation_LevelTypeDescriptor]
ON [tpdm].[RubricLevelInformation] ([LevelTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelInformation] WITH CHECK ADD CONSTRAINT [FK_RubricLevelInformation_RubricLevel] FOREIGN KEY ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[RubricLevel] ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[RubricLevelResponse] WITH CHECK ADD CONSTRAINT [FK_RubricLevelResponse_PerformanceMeasure] FOREIGN KEY ([PerformanceMeasureIdentifier])
REFERENCES [tpdm].[PerformanceMeasure] ([PerformanceMeasureIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelResponse_PerformanceMeasure]
ON [tpdm].[RubricLevelResponse] ([PerformanceMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelResponse] WITH CHECK ADD CONSTRAINT [FK_RubricLevelResponse_RubricLevel] FOREIGN KEY ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[RubricLevel] ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelResponse_RubricLevel]
ON [tpdm].[RubricLevelResponse] ([EducationOrganizationId] ASC, [RubricLevelCode] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelResponseFacts] WITH CHECK ADD CONSTRAINT [FK_RubricLevelResponseFacts_PerformanceMeasureFacts] FOREIGN KEY ([EducationOrganizationId], [FactsAsOfDate], [RubricTitle], [RubricTypeDescriptorId], [SchoolYear])
REFERENCES [tpdm].[PerformanceMeasureFacts] ([EducationOrganizationId], [FactsAsOfDate], [RubricTitle], [RubricTypeDescriptorId], [SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelResponseFacts_PerformanceMeasureFacts]
ON [tpdm].[RubricLevelResponseFacts] ([EducationOrganizationId] ASC, [FactsAsOfDate] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelResponseFacts] WITH CHECK ADD CONSTRAINT [FK_RubricLevelResponseFacts_RubricLevel] FOREIGN KEY ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[RubricLevel] ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelResponseFacts_RubricLevel]
ON [tpdm].[RubricLevelResponseFacts] ([EducationOrganizationId] ASC, [RubricLevelCode] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelResponseFactsAggregatedNumericResponse] WITH CHECK ADD CONSTRAINT [FK_RubricLevelResponseFactsAggregatedNumericResponse_RubricLevelResponseFacts] FOREIGN KEY ([EducationOrganizationId], [FactsAsOfDate], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId], [SchoolYear])
REFERENCES [tpdm].[RubricLevelResponseFacts] ([EducationOrganizationId], [FactsAsOfDate], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[RubricLevelTheme] WITH CHECK ADD CONSTRAINT [FK_RubricLevelTheme_RubricLevel] FOREIGN KEY ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
REFERENCES [tpdm].[RubricLevel] ([EducationOrganizationId], [RubricLevelCode], [RubricTitle], [RubricTypeDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelTheme_RubricLevel]
ON [tpdm].[RubricLevelTheme] ([EducationOrganizationId] ASC, [RubricLevelCode] ASC, [RubricTitle] ASC, [RubricTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricLevelTheme] WITH CHECK ADD CONSTRAINT [FK_RubricLevelTheme_ThemeDescriptor] FOREIGN KEY ([ThemeDescriptorId])
REFERENCES [tpdm].[ThemeDescriptor] ([ThemeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RubricLevelTheme_ThemeDescriptor]
ON [tpdm].[RubricLevelTheme] ([ThemeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[RubricTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_RubricTypeDescriptor_Descriptor] FOREIGN KEY ([RubricTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SalaryTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SalaryTypeDescriptor_Descriptor] FOREIGN KEY ([SalaryTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[SchoolExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_SchoolStatusDescriptor] FOREIGN KEY ([SchoolStatusDescriptorId])
REFERENCES [tpdm].[SchoolStatusDescriptor] ([SchoolStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_SchoolStatusDescriptor]
ON [tpdm].[SchoolExtension] ([SchoolStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SchoolStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_SchoolStatusDescriptor_Descriptor] FOREIGN KEY ([SchoolStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SectionCourseTranscriptFacts] WITH CHECK ADD CONSTRAINT [FK_SectionCourseTranscriptFacts_SectionStudentAcademicRecordFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentAcademicRecordFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionCourseTranscriptFacts_SectionStudentAcademicRecordFacts]
ON [tpdm].[SectionCourseTranscriptFacts] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned] WITH CHECK ADD CONSTRAINT [FK_SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned_SectionCourseTranscriptFacts] FOREIGN KEY ([FactAsOfDate], [FactsAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionCourseTranscriptFacts] ([FactAsOfDate], [FactsAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned_SectionCourseTranscriptFacts]
ON [tpdm].[SectionCourseTranscriptFactsAggregatedFinalLetterGradeEarned] ([FactAsOfDate] ASC, [FactsAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionCourseTranscriptFactsAggregatedNumericGradeEarned] WITH CHECK ADD CONSTRAINT [FK_SectionCourseTranscriptFactsAggregatedNumericGradeEarned_SectionCourseTranscriptFacts] FOREIGN KEY ([FactAsOfDate], [FactsAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionCourseTranscriptFacts] ([FactAsOfDate], [FactsAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionCourseTranscriptFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionCourseTranscriptFactsStudentsEnrolled_SectionCourseTranscriptFacts] FOREIGN KEY ([FactAsOfDate], [FactsAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionCourseTranscriptFacts] ([FactAsOfDate], [FactsAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionCourseTranscriptFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionCourseTranscriptFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionCourseTranscriptFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[SectionCourseTranscriptFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAcademicRecordFacts_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAcademicRecordFacts_Section]
ON [tpdm].[SectionStudentAcademicRecordFacts] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAcademicRecordFactsAggregatedCumulativeGradePointAverage_SectionStudentAcademicRecordFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentAcademicRecordFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAcademicRecordFactsAggregatedSessionGradePointAverage_SectionStudentAcademicRecordFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentAcademicRecordFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAcademicRecordFactsStudentsEnrolled_SectionStudentAcademicRecordFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentAcademicRecordFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentAcademicRecordFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAcademicRecordFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAcademicRecordFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[SectionStudentAcademicRecordFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFacts_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFacts_AcademicSubjectDescriptor]
ON [tpdm].[SectionStudentAssessmentFacts] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFacts_AssessmentCategoryDescriptor] FOREIGN KEY ([AssessmentCategoryDescriptorId])
REFERENCES [edfi].[AssessmentCategoryDescriptor] ([AssessmentCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFacts_AssessmentCategoryDescriptor]
ON [tpdm].[SectionStudentAssessmentFacts] ([AssessmentCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFacts_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFacts_GradeLevelDescriptor]
ON [tpdm].[SectionStudentAssessmentFacts] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFacts_SchoolYearType] FOREIGN KEY ([TakenSchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFacts_SchoolYearType]
ON [tpdm].[SectionStudentAssessmentFacts] ([TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFacts_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFacts_Section]
ON [tpdm].[SectionStudentAssessmentFacts] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsAggregatedPerformanceLevel_PerformanceLevelDescriptor] FOREIGN KEY ([PerformanceLevelDescriptorId])
REFERENCES [edfi].[PerformanceLevelDescriptor] ([PerformanceLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFactsAggregatedPerformanceLevel_PerformanceLevelDescriptor]
ON [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] ([PerformanceLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsAggregatedPerformanceLevel_SectionStudentAssessmentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [TakenSchoolYear])
REFERENCES [tpdm].[SectionStudentAssessmentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [TakenSchoolYear])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFactsAggregatedPerformanceLevel_SectionStudentAssessmentFacts]
ON [tpdm].[SectionStudentAssessmentFactsAggregatedPerformanceLevel] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC, [TakenSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsAggregatedScoreResult_AssessmentReportingMethodDescriptor] FOREIGN KEY ([AssessmentReportingMethodDescriptorId])
REFERENCES [edfi].[AssessmentReportingMethodDescriptor] ([AssessmentReportingMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFactsAggregatedScoreResult_AssessmentReportingMethodDescriptor]
ON [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] ([AssessmentReportingMethodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsAggregatedScoreResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([AverageScoreResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFactsAggregatedScoreResult_ResultDatatypeTypeDescriptor]
ON [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] ([AverageScoreResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsAggregatedScoreResult] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsAggregatedScoreResult_SectionStudentAssessmentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [TakenSchoolYear])
REFERENCES [tpdm].[SectionStudentAssessmentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [TakenSchoolYear])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsStudentsEnrolled_SectionStudentAssessmentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [TakenSchoolYear])
REFERENCES [tpdm].[SectionStudentAssessmentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [TakenSchoolYear])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentAssessmentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentAssessmentFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentAssessmentFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[SectionStudentAssessmentFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFacts] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFacts_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFacts_Section]
ON [tpdm].[SectionStudentFacts] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedByDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedByDisability_DisabilityDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedByDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedByDisability_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedByDisability_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedByDisability] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedByDisability] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedByDisability_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedByDisability_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedByDisability] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedDisabilityTotalStudentsDisabled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedELLEnrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedELLEnrollment_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedELLEnrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedELLEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedELLEnrollment_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedELLEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedESLEnrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedESLEnrollment_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedESLEnrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedESLEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedESLEnrollment_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedESLEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedGender_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedGender_GenderDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedGender] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedGender_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedGender_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedGender] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedGender] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedGender_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedGender_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedGender] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedHispanicLatinoEthnicity_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedHispanicLatinoEthnicity_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedHispanicLatinoEthnicity_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedHispanicLatinoEthnicity_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedHispanicLatinoEthnicity] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedLanguage_LanguageDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedLanguage] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedLanguage_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedLanguage_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedLanguage] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedLanguage] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedLanguage_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedLanguage_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedLanguage] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedRace_RaceDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedRace_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedRace_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedRace] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedRace] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedRace_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedRace_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedRace] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor] FOREIGN KEY ([SchoolFoodServiceProgramServiceDescriptorId])
REFERENCES [edfi].[SchoolFoodServiceProgramServiceDescriptor] ([SchoolFoodServiceProgramServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] ([SchoolFoodServiceProgramServiceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSchoolFoodServiceProgramService_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSchoolFoodServiceProgramService_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSchoolFoodServiceProgramService_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSchoolFoodServiceProgramService_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedSchoolFoodServiceProgramService] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSection504Enrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSection504Enrollment_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSection504Enrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSection504Enrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSection504Enrollment_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedSection504Enrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSex_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSex_SectionStudentFacts]
ON [tpdm].[SectionStudentFactsAggregatedSex] ([FactAsOfDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSex_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSex_SexDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedSex] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSex] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSex_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSex_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedSex] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSPED] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSPED_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedSPED] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedSPED_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedSPED_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedSPED] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedTitleIEnrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedTitleIEnrollment_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsAggregatedTitleIEnrollment] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsAggregatedTitleIEnrollment_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsAggregatedTitleIEnrollment_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsAggregatedTitleIEnrollment] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[SectionStudentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsStudentsEnrolled_SectionStudentFacts] FOREIGN KEY ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [tpdm].[SectionStudentFacts] ([FactAsOfDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[SectionStudentFactsStudentsEnrolled] WITH CHECK ADD CONSTRAINT [FK_SectionStudentFactsStudentsEnrolled_ValueTypeDescriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [tpdm].[ValueTypeDescriptor] ([ValueTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionStudentFactsStudentsEnrolled_ValueTypeDescriptor]
ON [tpdm].[SectionStudentFactsStudentsEnrolled] ([ValueTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffApplicantAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffApplicantAssociation_Applicant] FOREIGN KEY ([ApplicantIdentifier], [EducationOrganizationId])
REFERENCES [tpdm].[Applicant] ([ApplicantIdentifier], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffApplicantAssociation_Applicant]
ON [tpdm].[StaffApplicantAssociation] ([ApplicantIdentifier] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[StaffApplicantAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffApplicantAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffApplicantAssociation_Staff]
ON [tpdm].[StaffApplicantAssociation] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_StaffBackgroundCheck_BackgroundCheckStatusDescriptor] FOREIGN KEY ([BackgroundCheckStatusDescriptorId])
REFERENCES [tpdm].[BackgroundCheckStatusDescriptor] ([BackgroundCheckStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffBackgroundCheck_BackgroundCheckStatusDescriptor]
ON [tpdm].[StaffBackgroundCheck] ([BackgroundCheckStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_StaffBackgroundCheck_BackgroundCheckTypeDescriptor] FOREIGN KEY ([BackgroundCheckTypeDescriptorId])
REFERENCES [tpdm].[BackgroundCheckTypeDescriptor] ([BackgroundCheckTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffBackgroundCheck_BackgroundCheckTypeDescriptor]
ON [tpdm].[StaffBackgroundCheck] ([BackgroundCheckTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_StaffBackgroundCheck_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffBackgroundCheck_Staff]
ON [tpdm].[StaffBackgroundCheck] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffEvaluation] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluation_EducationOrganization]
ON [tpdm].[StaffEvaluation] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluation] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluation_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluation_SchoolYearType]
ON [tpdm].[StaffEvaluation] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluation] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluation_StaffEvaluationPeriodDescriptor] FOREIGN KEY ([StaffEvaluationPeriodDescriptorId])
REFERENCES [tpdm].[StaffEvaluationPeriodDescriptor] ([StaffEvaluationPeriodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluation_StaffEvaluationPeriodDescriptor]
ON [tpdm].[StaffEvaluation] ([StaffEvaluationPeriodDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluation] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluation_StaffEvaluationTypeDescriptor] FOREIGN KEY ([StaffEvaluationTypeDescriptorId])
REFERENCES [tpdm].[StaffEvaluationTypeDescriptor] ([StaffEvaluationTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluation_StaffEvaluationTypeDescriptor]
ON [tpdm].[StaffEvaluation] ([StaffEvaluationTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationComponent] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationComponent_StaffEvaluation] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluation] ([EducationOrganizationId], [SchoolYear], [StaffEvaluationTitle])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationComponent_StaffEvaluation]
ON [tpdm].[StaffEvaluationComponent] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationComponent] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationComponent_StaffEvaluationTypeDescriptor] FOREIGN KEY ([StaffEvaluationTypeDescriptorId])
REFERENCES [tpdm].[StaffEvaluationTypeDescriptor] ([StaffEvaluationTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationComponent_StaffEvaluationTypeDescriptor]
ON [tpdm].[StaffEvaluationComponent] ([StaffEvaluationTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationComponentRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationComponentRating_StaffEvaluationComponent] FOREIGN KEY ([EducationOrganizationId], [EvaluationComponent], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluationComponent] ([EducationOrganizationId], [EvaluationComponent], [SchoolYear], [StaffEvaluationTitle])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationComponentRating_StaffEvaluationComponent]
ON [tpdm].[StaffEvaluationComponentRating] ([EducationOrganizationId] ASC, [EvaluationComponent] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationComponentRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationComponentRating_StaffEvaluationRating] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StaffEvaluationDate], [StaffEvaluationTitle], [StaffUSI])
REFERENCES [tpdm].[StaffEvaluationRating] ([EducationOrganizationId], [SchoolYear], [StaffEvaluationDate], [StaffEvaluationTitle], [StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationComponentRating_StaffEvaluationRating]
ON [tpdm].[StaffEvaluationComponentRating] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StaffEvaluationDate] ASC, [StaffEvaluationTitle] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationComponentRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationComponentRating_StaffEvaluationRatingLevelDescriptor] FOREIGN KEY ([StaffEvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[StaffEvaluationRatingLevelDescriptor] ([StaffEvaluationRatingLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationComponentRating_StaffEvaluationRatingLevelDescriptor]
ON [tpdm].[StaffEvaluationComponentRating] ([StaffEvaluationRatingLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationComponentStaffRatingLevel] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationComponentStaffRatingLevel_StaffEvaluationComponent] FOREIGN KEY ([EducationOrganizationId], [EvaluationComponent], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluationComponent] ([EducationOrganizationId], [EvaluationComponent], [SchoolYear], [StaffEvaluationTitle])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationComponentStaffRatingLevel_StaffEvaluationComponent]
ON [tpdm].[StaffEvaluationComponentStaffRatingLevel] ([EducationOrganizationId] ASC, [EvaluationComponent] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationElement] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationElement_StaffEvaluationComponent] FOREIGN KEY ([EducationOrganizationId], [EvaluationComponent], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluationComponent] ([EducationOrganizationId], [EvaluationComponent], [SchoolYear], [StaffEvaluationTitle])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationElement_StaffEvaluationComponent]
ON [tpdm].[StaffEvaluationElement] ([EducationOrganizationId] ASC, [EvaluationComponent] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationElementRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationElementRating_StaffEvaluationElement] FOREIGN KEY ([EducationOrganizationId], [EvaluationComponent], [EvaluationElement], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluationElement] ([EducationOrganizationId], [EvaluationComponent], [EvaluationElement], [SchoolYear], [StaffEvaluationTitle])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationElementRating_StaffEvaluationElement]
ON [tpdm].[StaffEvaluationElementRating] ([EducationOrganizationId] ASC, [EvaluationComponent] ASC, [EvaluationElement] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationElementRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationElementRating_StaffEvaluationRating] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StaffEvaluationDate], [StaffEvaluationTitle], [StaffUSI])
REFERENCES [tpdm].[StaffEvaluationRating] ([EducationOrganizationId], [SchoolYear], [StaffEvaluationDate], [StaffEvaluationTitle], [StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationElementRating_StaffEvaluationRating]
ON [tpdm].[StaffEvaluationElementRating] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StaffEvaluationDate] ASC, [StaffEvaluationTitle] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationElementRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationElementRating_StaffEvaluationRatingLevelDescriptor] FOREIGN KEY ([StaffEvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[StaffEvaluationRatingLevelDescriptor] ([StaffEvaluationRatingLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationElementRating_StaffEvaluationRatingLevelDescriptor]
ON [tpdm].[StaffEvaluationElementRating] ([StaffEvaluationRatingLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationElementStaffRatingLevel] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationElementStaffRatingLevel_StaffEvaluationElement] FOREIGN KEY ([EducationOrganizationId], [EvaluationComponent], [EvaluationElement], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluationElement] ([EducationOrganizationId], [EvaluationComponent], [EvaluationElement], [SchoolYear], [StaffEvaluationTitle])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationElementStaffRatingLevel_StaffEvaluationElement]
ON [tpdm].[StaffEvaluationElementStaffRatingLevel] ([EducationOrganizationId] ASC, [EvaluationComponent] ASC, [EvaluationElement] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationPeriodDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationPeriodDescriptor_Descriptor] FOREIGN KEY ([StaffEvaluationPeriodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationRating_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationRating_Staff]
ON [tpdm].[StaffEvaluationRating] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationRating_Staff1] FOREIGN KEY ([EvaluatedByStaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationRating_Staff1]
ON [tpdm].[StaffEvaluationRating] ([EvaluatedByStaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationRating_StaffEvaluation] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluation] ([EducationOrganizationId], [SchoolYear], [StaffEvaluationTitle])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationRating_StaffEvaluation]
ON [tpdm].[StaffEvaluationRating] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationRating_StaffEvaluationRatingLevelDescriptor] FOREIGN KEY ([StaffEvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[StaffEvaluationRatingLevelDescriptor] ([StaffEvaluationRatingLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationRating_StaffEvaluationRatingLevelDescriptor]
ON [tpdm].[StaffEvaluationRating] ([StaffEvaluationRatingLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationRatingLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationRatingLevelDescriptor_Descriptor] FOREIGN KEY ([StaffEvaluationRatingLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffEvaluationStaffRatingLevel] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationStaffRatingLevel_StaffEvaluation] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StaffEvaluationTitle])
REFERENCES [tpdm].[StaffEvaluation] ([EducationOrganizationId], [SchoolYear], [StaffEvaluationTitle])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffEvaluationStaffRatingLevel_StaffEvaluation]
ON [tpdm].[StaffEvaluationStaffRatingLevel] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StaffEvaluationTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffEvaluationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffEvaluationTypeDescriptor_Descriptor] FOREIGN KEY ([StaffEvaluationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_GenderDescriptor]
ON [tpdm].[StaffExtension] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkAbsenceEvent_AbsenceEventCategoryDescriptor] FOREIGN KEY ([AbsenceEventCategoryDescriptorId])
REFERENCES [edfi].[AbsenceEventCategoryDescriptor] ([AbsenceEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkAbsenceEvent_AbsenceEventCategoryDescriptor]
ON [tpdm].[StaffFieldworkAbsenceEvent] ([AbsenceEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkAbsenceEvent] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkAbsenceEvent_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkAbsenceEvent_Staff]
ON [tpdm].[StaffFieldworkAbsenceEvent] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperience] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperience_FieldworkTypeDescriptor] FOREIGN KEY ([FieldworkTypeDescriptorId])
REFERENCES [tpdm].[FieldworkTypeDescriptor] ([FieldworkTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperience_FieldworkTypeDescriptor]
ON [tpdm].[StaffFieldworkExperience] ([FieldworkTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperience] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperience_ProgramGatewayDescriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [tpdm].[ProgramGatewayDescriptor] ([ProgramGatewayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperience_ProgramGatewayDescriptor]
ON [tpdm].[StaffFieldworkExperience] ([ProgramGatewayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperience] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperience_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperience_Staff]
ON [tpdm].[StaffFieldworkExperience] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperienceCoteaching] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperienceCoteaching_StaffFieldworkExperience] FOREIGN KEY ([BeginDate], [FieldworkIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffFieldworkExperience] ([BeginDate], [FieldworkIdentifier], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffFieldworkExperienceSchool] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperienceSchool_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperienceSchool_School]
ON [tpdm].[StaffFieldworkExperienceSchool] ([SchoolId] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperienceSchool] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperienceSchool_StaffFieldworkExperience] FOREIGN KEY ([BeginDate], [FieldworkIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffFieldworkExperience] ([BeginDate], [FieldworkIdentifier], [StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperienceSchool_StaffFieldworkExperience]
ON [tpdm].[StaffFieldworkExperienceSchool] ([BeginDate] ASC, [FieldworkIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperienceSectionAssociation_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperienceSectionAssociation_Section]
ON [tpdm].[StaffFieldworkExperienceSectionAssociation] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[StaffFieldworkExperienceSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffFieldworkExperienceSectionAssociation_StaffFieldworkExperience] FOREIGN KEY ([BeginDate], [FieldworkIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffFieldworkExperience] ([BeginDate], [FieldworkIdentifier], [StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffFieldworkExperienceSectionAssociation_StaffFieldworkExperience]
ON [tpdm].[StaffFieldworkExperienceSectionAssociation] ([BeginDate] ASC, [FieldworkIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffHighlyQualifiedAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StaffHighlyQualifiedAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffHighlyQualifiedAcademicSubject_AcademicSubjectDescriptor]
ON [tpdm].[StaffHighlyQualifiedAcademicSubject] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffHighlyQualifiedAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StaffHighlyQualifiedAcademicSubject_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffHighlyQualifiedAcademicSubject_Staff]
ON [tpdm].[StaffHighlyQualifiedAcademicSubject] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_StaffProfessionalDevelopmentEventAttendance_AttendanceEventCategoryDescriptor] FOREIGN KEY ([AttendanceEventCategoryDescriptorId])
REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProfessionalDevelopmentEventAttendance_AttendanceEventCategoryDescriptor]
ON [tpdm].[StaffProfessionalDevelopmentEventAttendance] ([AttendanceEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_StaffProfessionalDevelopmentEventAttendance_ProfessionalDevelopmentEvent] FOREIGN KEY ([ProfessionalDevelopmentTitle])
REFERENCES [tpdm].[ProfessionalDevelopmentEvent] ([ProfessionalDevelopmentTitle])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProfessionalDevelopmentEventAttendance_ProfessionalDevelopmentEvent]
ON [tpdm].[StaffProfessionalDevelopmentEventAttendance] ([ProfessionalDevelopmentTitle] ASC)
GO

ALTER TABLE [tpdm].[StaffProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_StaffProfessionalDevelopmentEventAttendance_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProfessionalDevelopmentEventAttendance_Staff]
ON [tpdm].[StaffProfessionalDevelopmentEventAttendance] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffProspectAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffProspectAssociation_Prospect] FOREIGN KEY ([EducationOrganizationId], [ProspectIdentifier])
REFERENCES [tpdm].[Prospect] ([EducationOrganizationId], [ProspectIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProspectAssociation_Prospect]
ON [tpdm].[StaffProspectAssociation] ([EducationOrganizationId] ASC, [ProspectIdentifier] ASC)
GO

ALTER TABLE [tpdm].[StaffProspectAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffProspectAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProspectAssociation_Staff]
ON [tpdm].[StaffProspectAssociation] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffSalary] WITH CHECK ADD CONSTRAINT [FK_StaffSalary_SalaryTypeDescriptor] FOREIGN KEY ([SalaryTypeDescriptorId])
REFERENCES [tpdm].[SalaryTypeDescriptor] ([SalaryTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffSalary_SalaryTypeDescriptor]
ON [tpdm].[StaffSalary] ([SalaryTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffSalary] WITH CHECK ADD CONSTRAINT [FK_StaffSalary_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffSeniority] WITH CHECK ADD CONSTRAINT [FK_StaffSeniority_CredentialFieldDescriptor] FOREIGN KEY ([CredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffSeniority_CredentialFieldDescriptor]
ON [tpdm].[StaffSeniority] ([CredentialFieldDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffSeniority] WITH CHECK ADD CONSTRAINT [FK_StaffSeniority_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffSeniority_Staff]
ON [tpdm].[StaffSeniority] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasure_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasure_ResultDatatypeTypeDescriptor]
ON [tpdm].[StaffStudentGrowthMeasure] ([ResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasure_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasure_SchoolYearType]
ON [tpdm].[StaffStudentGrowthMeasure] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasure_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasure_Staff]
ON [tpdm].[StaffStudentGrowthMeasure] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasure_StudentGrowthTypeDescriptor] FOREIGN KEY ([StudentGrowthTypeDescriptorId])
REFERENCES [tpdm].[StudentGrowthTypeDescriptor] ([StudentGrowthTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasure_StudentGrowthTypeDescriptor]
ON [tpdm].[StaffStudentGrowthMeasure] ([StudentGrowthTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureAcademicSubject_AcademicSubjectDescriptor]
ON [tpdm].[StaffStudentGrowthMeasureAcademicSubject] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureAcademicSubject_StaffStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureAcademicSubject_StaffStudentGrowthMeasure]
ON [tpdm].[StaffStudentGrowthMeasureAcademicSubject] ([FactAsOfDate] ASC, [SchoolYear] ASC, [StaffStudentGrowthMeasureIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureCourseAssociation_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureCourseAssociation_Course]
ON [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureCourseAssociation_StaffStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureCourseAssociation_StaffStudentGrowthMeasure]
ON [tpdm].[StaffStudentGrowthMeasureCourseAssociation] ([FactAsOfDate] ASC, [SchoolYear] ASC, [StaffStudentGrowthMeasureIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureEducationOrganizationAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureEducationOrganizationAssociation_EducationOrganization]
ON [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureEducationOrganizationAssociation_StaffStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureEducationOrganizationAssociation_StaffStudentGrowthMeasure]
ON [tpdm].[StaffStudentGrowthMeasureEducationOrganizationAssociation] ([FactAsOfDate] ASC, [SchoolYear] ASC, [StaffStudentGrowthMeasureIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureGradeLevel] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureGradeLevel_GradeLevelDescriptor]
ON [tpdm].[StaffStudentGrowthMeasureGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureGradeLevel] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureGradeLevel_StaffStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureGradeLevel_StaffStudentGrowthMeasure]
ON [tpdm].[StaffStudentGrowthMeasureGradeLevel] ([FactAsOfDate] ASC, [SchoolYear] ASC, [StaffStudentGrowthMeasureIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureSectionAssociation_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureSectionAssociation_Section]
ON [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[StaffStudentGrowthMeasureSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffStudentGrowthMeasureSectionAssociation_StaffStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
REFERENCES [tpdm].[StaffStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [StaffStudentGrowthMeasureIdentifier], [StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffStudentGrowthMeasureSectionAssociation_StaffStudentGrowthMeasure]
ON [tpdm].[StaffStudentGrowthMeasureSectionAssociation] ([FactAsOfDate] ASC, [SchoolYear] ASC, [StaffStudentGrowthMeasureIdentifier] ASC, [StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherEducatorResearch] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherEducatorResearch_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProgram_LevelOfDegreeAwardedDescriptor] FOREIGN KEY ([LevelOfDegreeAwardedDescriptorId])
REFERENCES [tpdm].[LevelOfDegreeAwardedDescriptor] ([LevelOfDegreeAwardedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProgram_LevelOfDegreeAwardedDescriptor]
ON [tpdm].[StaffTeacherPreparationProgram] ([LevelOfDegreeAwardedDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProgram_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProgram_Staff]
ON [tpdm].[StaffTeacherPreparationProgram] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProgram_TeacherPreparationProgramTypeDescriptor] FOREIGN KEY ([TeacherPreparationProgramTypeDescriptorId])
REFERENCES [tpdm].[TeacherPreparationProgramTypeDescriptor] ([TeacherPreparationProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProgram_TeacherPreparationProgramTypeDescriptor]
ON [tpdm].[StaffTeacherPreparationProgram] ([TeacherPreparationProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociation_ProgramAssignmentDescriptor] FOREIGN KEY ([ProgramAssignmentDescriptorId])
REFERENCES [edfi].[ProgramAssignmentDescriptor] ([ProgramAssignmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociation_ProgramAssignmentDescriptor]
ON [tpdm].[StaffTeacherPreparationProviderAssociation] ([ProgramAssignmentDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociation_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociation_SchoolYearType]
ON [tpdm].[StaffTeacherPreparationProviderAssociation] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociation_Staff]
ON [tpdm].[StaffTeacherPreparationProviderAssociation] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociation_TeacherPreparationProvider] FOREIGN KEY ([TeacherPreparationProviderId])
REFERENCES [tpdm].[TeacherPreparationProvider] ([TeacherPreparationProviderId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociation_TeacherPreparationProvider]
ON [tpdm].[StaffTeacherPreparationProviderAssociation] ([TeacherPreparationProviderId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociationAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociationAcademicSubject_AcademicSubjectDescriptor]
ON [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociationAcademicSubject_StaffTeacherPreparationProviderAssociation] FOREIGN KEY ([StaffUSI], [TeacherPreparationProviderId])
REFERENCES [tpdm].[StaffTeacherPreparationProviderAssociation] ([StaffUSI], [TeacherPreparationProviderId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociationAcademicSubject_StaffTeacherPreparationProviderAssociation]
ON [tpdm].[StaffTeacherPreparationProviderAssociationAcademicSubject] ([StaffUSI] ASC, [TeacherPreparationProviderId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociationGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociationGradeLevel_GradeLevelDescriptor]
ON [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderAssociationGradeLevel_StaffTeacherPreparationProviderAssociation] FOREIGN KEY ([StaffUSI], [TeacherPreparationProviderId])
REFERENCES [tpdm].[StaffTeacherPreparationProviderAssociation] ([StaffUSI], [TeacherPreparationProviderId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderAssociationGradeLevel_StaffTeacherPreparationProviderAssociation]
ON [tpdm].[StaffTeacherPreparationProviderAssociationGradeLevel] ([StaffUSI] ASC, [TeacherPreparationProviderId] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderProgramAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderProgramAssociation_Staff]
ON [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[StaffTeacherPreparationProviderProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StaffTeacherPreparationProviderProgramAssociation_TeacherPreparationProviderProgram] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[TeacherPreparationProviderProgram] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffTeacherPreparationProviderProgramAssociation_TeacherPreparationProviderProgram]
ON [tpdm].[StaffTeacherPreparationProviderProgramAssociation] ([EducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StateEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_StateEducationAgencyExtension_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StateEducationAgencyExtension_FederalLocaleCodeDescriptor]
ON [tpdm].[StateEducationAgencyExtension] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[StateEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_StateEducationAgencyExtension_StateEducationAgency] FOREIGN KEY ([StateEducationAgencyId])
REFERENCES [edfi].[StateEducationAgency] ([StateEducationAgencyId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[StudentGradebookEntryExtension] WITH CHECK ADD CONSTRAINT [FK_StudentGradebookEntryExtension_StudentGradebookEntry] FOREIGN KEY ([BeginDate], [DateAssigned], [GradebookEntryTitle], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentGradebookEntry] ([BeginDate], [DateAssigned], [GradebookEntryTitle], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[StudentGrowthTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentGrowthTypeDescriptor_Descriptor] FOREIGN KEY ([StudentGrowthTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SurveyLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_SurveyLevelDescriptor_Descriptor] FOREIGN KEY ([SurveyLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TalentManagementGoal] WITH CHECK ADD CONSTRAINT [FK_TalentManagementGoal_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_TalentManagementGoal_SchoolYearType]
ON [tpdm].[TalentManagementGoal] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TalentManagementGoalEducationOrganization] WITH CHECK ADD CONSTRAINT [FK_TalentManagementGoalEducationOrganization_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TalentManagementGoalEducationOrganization_EducationOrganization]
ON [tpdm].[TalentManagementGoalEducationOrganization] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TalentManagementGoalEducationOrganization] WITH CHECK ADD CONSTRAINT [FK_TalentManagementGoalEducationOrganization_TalentManagementGoal] FOREIGN KEY ([GoalTitle], [SchoolYear])
REFERENCES [tpdm].[TalentManagementGoal] ([GoalTitle], [SchoolYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TalentManagementGoalEducationOrganization_TalentManagementGoal]
ON [tpdm].[TalentManagementGoalEducationOrganization] ([GoalTitle] ASC, [SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_CitizenshipStatusDescriptor] FOREIGN KEY ([CitizenshipStatusDescriptorId])
REFERENCES [edfi].[CitizenshipStatusDescriptor] ([CitizenshipStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_CitizenshipStatusDescriptor]
ON [tpdm].[TeacherCandidate] ([CitizenshipStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_CountryDescriptor] FOREIGN KEY ([BirthCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_CountryDescriptor]
ON [tpdm].[TeacherCandidate] ([BirthCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_EnglishLanguageExamDescriptor] FOREIGN KEY ([EnglishLanguageExamDescriptorId])
REFERENCES [tpdm].[EnglishLanguageExamDescriptor] ([EnglishLanguageExamDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_EnglishLanguageExamDescriptor]
ON [tpdm].[TeacherCandidate] ([EnglishLanguageExamDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_GenderDescriptor]
ON [tpdm].[TeacherCandidate] ([GenderDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_LimitedEnglishProficiencyDescriptor] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId])
REFERENCES [edfi].[LimitedEnglishProficiencyDescriptor] ([LimitedEnglishProficiencyDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_LimitedEnglishProficiencyDescriptor]
ON [tpdm].[TeacherCandidate] ([LimitedEnglishProficiencyDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_OldEthnicityDescriptor] FOREIGN KEY ([OldEthnicityDescriptorId])
REFERENCES [edfi].[OldEthnicityDescriptor] ([OldEthnicityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_OldEthnicityDescriptor]
ON [tpdm].[TeacherCandidate] ([OldEthnicityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_PreviousCareerDescriptor] FOREIGN KEY ([PreviousCareerDescriptorId])
REFERENCES [tpdm].[PreviousCareerDescriptor] ([PreviousCareerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_PreviousCareerDescriptor]
ON [tpdm].[TeacherCandidate] ([PreviousCareerDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_SexDescriptor]
ON [tpdm].[TeacherCandidate] ([SexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_SexDescriptor1] FOREIGN KEY ([BirthSexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_SexDescriptor1]
ON [tpdm].[TeacherCandidate] ([BirthSexDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_StateAbbreviationDescriptor] FOREIGN KEY ([BirthStateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_StateAbbreviationDescriptor]
ON [tpdm].[TeacherCandidate] ([BirthStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidate] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidate_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidate_Student]
ON [tpdm].[TeacherCandidate] ([StudentUSI] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor] FOREIGN KEY ([CumulativeEarnedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecord] ([CumulativeEarnedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor1] FOREIGN KEY ([CumulativeAttemptedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor1]
ON [tpdm].[TeacherCandidateAcademicRecord] ([CumulativeAttemptedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor2] FOREIGN KEY ([SessionEarnedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor2]
ON [tpdm].[TeacherCandidateAcademicRecord] ([SessionEarnedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor3] FOREIGN KEY ([SessionAttemptedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_CreditTypeDescriptor3]
ON [tpdm].[TeacherCandidateAcademicRecord] ([SessionAttemptedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_EducationOrganization]
ON [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_ProgramGatewayDescriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [tpdm].[ProgramGatewayDescriptor] ([ProgramGatewayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_ProgramGatewayDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecord] ([ProgramGatewayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_SchoolYearType]
ON [tpdm].[TeacherCandidateAcademicRecord] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_TeacherCandidate]
ON [tpdm].[TeacherCandidateAcademicRecord] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_TermDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecord] ([TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecord_TPPDegreeTypeDescriptor] FOREIGN KEY ([TPPDegreeTypeDescriptorId])
REFERENCES [tpdm].[TPPDegreeTypeDescriptor] ([TPPDegreeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecord_TPPDegreeTypeDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecord] ([TPPDegreeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordAcademicHonor_AcademicHonorCategoryDescriptor] FOREIGN KEY ([AcademicHonorCategoryDescriptorId])
REFERENCES [edfi].[AcademicHonorCategoryDescriptor] ([AcademicHonorCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordAcademicHonor_AcademicHonorCategoryDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] ([AcademicHonorCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordAcademicHonor_AchievementCategoryDescriptor] FOREIGN KEY ([AchievementCategoryDescriptorId])
REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordAcademicHonor_AchievementCategoryDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] ([AchievementCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordAcademicHonor_TeacherCandidateAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordAcademicHonor_TeacherCandidateAcademicRecord]
ON [tpdm].[TeacherCandidateAcademicRecordAcademicHonor] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordClassRanking] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordClassRanking_TeacherCandidateAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordDiploma_AchievementCategoryDescriptor] FOREIGN KEY ([AchievementCategoryDescriptorId])
REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordDiploma_AchievementCategoryDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordDiploma] ([AchievementCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordDiploma_DiplomaLevelDescriptor] FOREIGN KEY ([DiplomaLevelDescriptorId])
REFERENCES [edfi].[DiplomaLevelDescriptor] ([DiplomaLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordDiploma_DiplomaLevelDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordDiploma] ([DiplomaLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordDiploma_DiplomaTypeDescriptor] FOREIGN KEY ([DiplomaTypeDescriptorId])
REFERENCES [edfi].[DiplomaTypeDescriptor] ([DiplomaTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordDiploma_DiplomaTypeDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordDiploma] ([DiplomaTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordDiploma_TeacherCandidateAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordDiploma_TeacherCandidateAcademicRecord]
ON [tpdm].[TeacherCandidateAcademicRecordDiploma] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordGradePointAverage_GradePointAverageTypeDescriptor] FOREIGN KEY ([GradePointAverageTypeDescriptorId])
REFERENCES [edfi].[GradePointAverageTypeDescriptor] ([GradePointAverageTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordGradePointAverage_GradePointAverageTypeDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] ([GradePointAverageTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordGradePointAverage_TeacherCandidateAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordGradePointAverage_TeacherCandidateAcademicRecord]
ON [tpdm].[TeacherCandidateAcademicRecordGradePointAverage] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordRecognition] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordRecognition_AchievementCategoryDescriptor] FOREIGN KEY ([AchievementCategoryDescriptorId])
REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordRecognition_AchievementCategoryDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordRecognition] ([AchievementCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordRecognition] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordRecognition_RecognitionTypeDescriptor] FOREIGN KEY ([RecognitionTypeDescriptorId])
REFERENCES [edfi].[RecognitionTypeDescriptor] ([RecognitionTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordRecognition_RecognitionTypeDescriptor]
ON [tpdm].[TeacherCandidateAcademicRecordRecognition] ([RecognitionTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAcademicRecordRecognition] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAcademicRecordRecognition_TeacherCandidateAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAcademicRecordRecognition_TeacherCandidateAcademicRecord]
ON [tpdm].[TeacherCandidateAcademicRecordRecognition] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAddress_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAddress_AddressTypeDescriptor]
ON [tpdm].[TeacherCandidateAddress] ([AddressTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAddress_LocaleDescriptor] FOREIGN KEY ([LocaleDescriptorId])
REFERENCES [edfi].[LocaleDescriptor] ([LocaleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAddress_LocaleDescriptor]
ON [tpdm].[TeacherCandidateAddress] ([LocaleDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAddress_StateAbbreviationDescriptor] FOREIGN KEY ([StateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAddress_StateAbbreviationDescriptor]
ON [tpdm].[TeacherCandidateAddress] ([StateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAddress_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAddress_TeacherCandidate]
ON [tpdm].[TeacherCandidateAddress] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAddressPeriod] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAddressPeriod_TeacherCandidateAddress] FOREIGN KEY ([AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName], [TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidateAddress] ([AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName], [TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAddressPeriod_TeacherCandidateAddress]
ON [tpdm].[TeacherCandidateAddressPeriod] ([AddressTypeDescriptorId] ASC, [City] ASC, [PostalCode] ASC, [StateAbbreviationDescriptorId] ASC, [StreetNumberName] ASC, [TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAid] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAid_AidTypeDescriptor] FOREIGN KEY ([AidTypeDescriptorId])
REFERENCES [tpdm].[AidTypeDescriptor] ([AidTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAid_AidTypeDescriptor]
ON [tpdm].[TeacherCandidateAid] ([AidTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateAid] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateAid_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateAid_TeacherCandidate]
ON [tpdm].[TeacherCandidateAid] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateBackgroundCheck_BackgroundCheckStatusDescriptor] FOREIGN KEY ([BackgroundCheckStatusDescriptorId])
REFERENCES [tpdm].[BackgroundCheckStatusDescriptor] ([BackgroundCheckStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateBackgroundCheck_BackgroundCheckStatusDescriptor]
ON [tpdm].[TeacherCandidateBackgroundCheck] ([BackgroundCheckStatusDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateBackgroundCheck_BackgroundCheckTypeDescriptor] FOREIGN KEY ([BackgroundCheckTypeDescriptorId])
REFERENCES [tpdm].[BackgroundCheckTypeDescriptor] ([BackgroundCheckTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateBackgroundCheck_BackgroundCheckTypeDescriptor]
ON [tpdm].[TeacherCandidateBackgroundCheck] ([BackgroundCheckTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateBackgroundCheck] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateBackgroundCheck_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TeacherCandidateCharacteristic] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCharacteristic_StudentCharacteristicDescriptor] FOREIGN KEY ([StudentCharacteristicDescriptorId])
REFERENCES [edfi].[StudentCharacteristicDescriptor] ([StudentCharacteristicDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCharacteristic_StudentCharacteristicDescriptor]
ON [tpdm].[TeacherCandidateCharacteristic] ([StudentCharacteristicDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCharacteristic] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCharacteristic_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCharacteristic_TeacherCandidate]
ON [tpdm].[TeacherCandidateCharacteristic] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCharacteristicDescriptor] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCharacteristicDescriptor_Descriptor] FOREIGN KEY ([TeacherCandidateCharacteristicDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TeacherCandidateCohortYear] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCohortYear_CohortYearTypeDescriptor] FOREIGN KEY ([CohortYearTypeDescriptorId])
REFERENCES [edfi].[CohortYearTypeDescriptor] ([CohortYearTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCohortYear_CohortYearTypeDescriptor]
ON [tpdm].[TeacherCandidateCohortYear] ([CohortYearTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCohortYear] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCohortYear_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCohortYear_SchoolYearType]
ON [tpdm].[TeacherCandidateCohortYear] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCohortYear] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCohortYear_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCohortYear_TeacherCandidate]
ON [tpdm].[TeacherCandidateCohortYear] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_Course] FOREIGN KEY ([CourseCode], [CourseEducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_Course]
ON [tpdm].[TeacherCandidateCourseTranscript] ([CourseCode] ASC, [CourseEducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_CourseAttemptResultDescriptor] FOREIGN KEY ([CourseAttemptResultDescriptorId])
REFERENCES [edfi].[CourseAttemptResultDescriptor] ([CourseAttemptResultDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_CourseAttemptResultDescriptor]
ON [tpdm].[TeacherCandidateCourseTranscript] ([CourseAttemptResultDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_CourseRepeatCodeDescriptor] FOREIGN KEY ([CourseRepeatCodeDescriptorId])
REFERENCES [edfi].[CourseRepeatCodeDescriptor] ([CourseRepeatCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_CourseRepeatCodeDescriptor]
ON [tpdm].[TeacherCandidateCourseTranscript] ([CourseRepeatCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_CreditTypeDescriptor] FOREIGN KEY ([AttemptedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_CreditTypeDescriptor]
ON [tpdm].[TeacherCandidateCourseTranscript] ([AttemptedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_CreditTypeDescriptor1] FOREIGN KEY ([EarnedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_CreditTypeDescriptor1]
ON [tpdm].[TeacherCandidateCourseTranscript] ([EarnedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_GradeLevelDescriptor] FOREIGN KEY ([WhenTakenGradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_GradeLevelDescriptor]
ON [tpdm].[TeacherCandidateCourseTranscript] ([WhenTakenGradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_MethodCreditEarnedDescriptor] FOREIGN KEY ([MethodCreditEarnedDescriptorId])
REFERENCES [edfi].[MethodCreditEarnedDescriptor] ([MethodCreditEarnedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_MethodCreditEarnedDescriptor]
ON [tpdm].[TeacherCandidateCourseTranscript] ([MethodCreditEarnedDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_School]
ON [tpdm].[TeacherCandidateCourseTranscript] ([SchoolId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscript] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscript_TeacherCandidateAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateAcademicRecord] ([EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscript_TeacherCandidateAcademicRecord]
ON [tpdm].[TeacherCandidateCourseTranscript] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscriptEarnedAdditionalCredits_AdditionalCreditTypeDescriptor] FOREIGN KEY ([AdditionalCreditTypeDescriptorId])
REFERENCES [edfi].[AdditionalCreditTypeDescriptor] ([AdditionalCreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscriptEarnedAdditionalCredits_AdditionalCreditTypeDescriptor]
ON [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] ([AdditionalCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCourseTranscriptEarnedAdditionalCredits_TeacherCandidateCourseTranscript] FOREIGN KEY ([CourseAttemptResultDescriptorId], [CourseCode], [CourseEducationOrganizationId], [EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
REFERENCES [tpdm].[TeacherCandidateCourseTranscript] ([CourseAttemptResultDescriptorId], [CourseCode], [CourseEducationOrganizationId], [EducationOrganizationId], [SchoolYear], [TeacherCandidateIdentifier], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCourseTranscriptEarnedAdditionalCredits_TeacherCandidateCourseTranscript]
ON [tpdm].[TeacherCandidateCourseTranscriptEarnedAdditionalCredits] ([CourseAttemptResultDescriptorId] ASC, [CourseCode] ASC, [CourseEducationOrganizationId] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCredential] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCredential_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCredential_Credential]
ON [tpdm].[TeacherCandidateCredential] ([CredentialIdentifier] ASC, [StateOfIssueStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateCredential] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateCredential_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateCredential_TeacherCandidate]
ON [tpdm].[TeacherCandidateCredential] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateDegreeSpecialization] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateDegreeSpecialization_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateDegreeSpecialization_TeacherCandidate]
ON [tpdm].[TeacherCandidateDegreeSpecialization] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateDisability] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateDisability_DisabilityDescriptor]
ON [tpdm].[TeacherCandidateDisability] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateDisability] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId])
REFERENCES [edfi].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateDisability_DisabilityDeterminationSourceTypeDescriptor]
ON [tpdm].[TeacherCandidateDisability] ([DisabilityDeterminationSourceTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateDisability] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateDisability_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateDisability_TeacherCandidate]
ON [tpdm].[TeacherCandidateDisability] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId])
REFERENCES [edfi].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateDisabilityDesignation_DisabilityDesignationDescriptor]
ON [tpdm].[TeacherCandidateDisabilityDesignation] ([DisabilityDesignationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateDisabilityDesignation_TeacherCandidateDisability] FOREIGN KEY ([DisabilityDescriptorId], [TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidateDisability] ([DisabilityDescriptorId], [TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateDisabilityDesignation_TeacherCandidateDisability]
ON [tpdm].[TeacherCandidateDisabilityDesignation] ([DisabilityDescriptorId] ASC, [TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateElectronicMail] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateElectronicMail_ElectronicMailTypeDescriptor] FOREIGN KEY ([ElectronicMailTypeDescriptorId])
REFERENCES [edfi].[ElectronicMailTypeDescriptor] ([ElectronicMailTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateElectronicMail_ElectronicMailTypeDescriptor]
ON [tpdm].[TeacherCandidateElectronicMail] ([ElectronicMailTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateElectronicMail] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateElectronicMail_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateElectronicMail_TeacherCandidate]
ON [tpdm].[TeacherCandidateElectronicMail] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkAbsenceEvent_AbsenceEventCategoryDescriptor] FOREIGN KEY ([AbsenceEventCategoryDescriptorId])
REFERENCES [edfi].[AbsenceEventCategoryDescriptor] ([AbsenceEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkAbsenceEvent_AbsenceEventCategoryDescriptor]
ON [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ([AbsenceEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkAbsenceEvent] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkAbsenceEvent_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkAbsenceEvent_TeacherCandidate]
ON [tpdm].[TeacherCandidateFieldworkAbsenceEvent] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperience_FieldworkTypeDescriptor] FOREIGN KEY ([FieldworkTypeDescriptorId])
REFERENCES [tpdm].[FieldworkTypeDescriptor] ([FieldworkTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperience_FieldworkTypeDescriptor]
ON [tpdm].[TeacherCandidateFieldworkExperience] ([FieldworkTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperience_ProgramGatewayDescriptor] FOREIGN KEY ([ProgramGatewayDescriptorId])
REFERENCES [tpdm].[ProgramGatewayDescriptor] ([ProgramGatewayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperience_ProgramGatewayDescriptor]
ON [tpdm].[TeacherCandidateFieldworkExperience] ([ProgramGatewayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperience] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperience_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperience_TeacherCandidate]
ON [tpdm].[TeacherCandidateFieldworkExperience] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceCoteaching] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperienceCoteaching_TeacherCandidateFieldworkExperience] FOREIGN KEY ([BeginDate], [FieldworkIdentifier], [TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidateFieldworkExperience] ([BeginDate], [FieldworkIdentifier], [TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSchool] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperienceSchool_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperienceSchool_School]
ON [tpdm].[TeacherCandidateFieldworkExperienceSchool] ([SchoolId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSchool] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperienceSchool_TeacherCandidateFieldworkExperience] FOREIGN KEY ([BeginDate], [FieldworkIdentifier], [TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidateFieldworkExperience] ([BeginDate], [FieldworkIdentifier], [TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperienceSchool_TeacherCandidateFieldworkExperience]
ON [tpdm].[TeacherCandidateFieldworkExperienceSchool] ([BeginDate] ASC, [FieldworkIdentifier] ASC, [TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperienceSectionAssociation_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperienceSectionAssociation_Section]
ON [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateFieldworkExperienceSectionAssociation_TeacherCandidateFieldworkExperience] FOREIGN KEY ([BeginDate], [FieldworkIdentifier], [TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidateFieldworkExperience] ([BeginDate], [FieldworkIdentifier], [TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateFieldworkExperienceSectionAssociation_TeacherCandidateFieldworkExperience]
ON [tpdm].[TeacherCandidateFieldworkExperienceSectionAssociation] ([BeginDate] ASC, [FieldworkIdentifier] ASC, [TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIdentificationCode_StudentIdentificationSystemDescriptor] FOREIGN KEY ([StudentIdentificationSystemDescriptorId])
REFERENCES [edfi].[StudentIdentificationSystemDescriptor] ([StudentIdentificationSystemDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIdentificationCode_StudentIdentificationSystemDescriptor]
ON [tpdm].[TeacherCandidateIdentificationCode] ([StudentIdentificationSystemDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIdentificationCode_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIdentificationCode_TeacherCandidate]
ON [tpdm].[TeacherCandidateIdentificationCode] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIdentificationDocument_CountryDescriptor]
ON [tpdm].[TeacherCandidateIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [tpdm].[TeacherCandidateIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [tpdm].[TeacherCandidateIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIdentificationDocument_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIdentificationDocument_TeacherCandidate]
ON [tpdm].[TeacherCandidateIdentificationDocument] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateIndicator] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateIndicator_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateIndicator_TeacherCandidate]
ON [tpdm].[TeacherCandidateIndicator] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateInternationalAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateInternationalAddress_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateInternationalAddress_AddressTypeDescriptor]
ON [tpdm].[TeacherCandidateInternationalAddress] ([AddressTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateInternationalAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateInternationalAddress_CountryDescriptor] FOREIGN KEY ([CountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateInternationalAddress_CountryDescriptor]
ON [tpdm].[TeacherCandidateInternationalAddress] ([CountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateInternationalAddress] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateInternationalAddress_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateInternationalAddress_TeacherCandidate]
ON [tpdm].[TeacherCandidateInternationalAddress] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateLanguage] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateLanguage_LanguageDescriptor]
ON [tpdm].[TeacherCandidateLanguage] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateLanguage] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateLanguage_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateLanguage_TeacherCandidate]
ON [tpdm].[TeacherCandidateLanguage] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateLanguageUse] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateLanguageUse_LanguageUseDescriptor] FOREIGN KEY ([LanguageUseDescriptorId])
REFERENCES [edfi].[LanguageUseDescriptor] ([LanguageUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateLanguageUse_LanguageUseDescriptor]
ON [tpdm].[TeacherCandidateLanguageUse] ([LanguageUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateLanguageUse] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateLanguageUse_TeacherCandidateLanguage] FOREIGN KEY ([LanguageDescriptorId], [TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidateLanguage] ([LanguageDescriptorId], [TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateLanguageUse_TeacherCandidateLanguage]
ON [tpdm].[TeacherCandidateLanguageUse] ([LanguageDescriptorId] ASC, [TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateOtherName] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateOtherName_OtherNameTypeDescriptor] FOREIGN KEY ([OtherNameTypeDescriptorId])
REFERENCES [edfi].[OtherNameTypeDescriptor] ([OtherNameTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateOtherName_OtherNameTypeDescriptor]
ON [tpdm].[TeacherCandidateOtherName] ([OtherNameTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateOtherName] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateOtherName_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateOtherName_TeacherCandidate]
ON [tpdm].[TeacherCandidateOtherName] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidatePersonalIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidatePersonalIdentificationDocument_CountryDescriptor]
ON [tpdm].[TeacherCandidatePersonalIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidatePersonalIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidatePersonalIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [tpdm].[TeacherCandidatePersonalIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidatePersonalIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidatePersonalIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [tpdm].[TeacherCandidatePersonalIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidatePersonalIdentificationDocument_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidatePersonalIdentificationDocument_TeacherCandidate]
ON [tpdm].[TeacherCandidatePersonalIdentificationDocument] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateProfessionalDevelopmentEventAttendance_AttendanceEventCategoryDescriptor] FOREIGN KEY ([AttendanceEventCategoryDescriptorId])
REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateProfessionalDevelopmentEventAttendance_AttendanceEventCategoryDescriptor]
ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ([AttendanceEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateProfessionalDevelopmentEventAttendance_ProfessionalDevelopmentEvent] FOREIGN KEY ([ProfessionalDevelopmentTitle])
REFERENCES [tpdm].[ProfessionalDevelopmentEvent] ([ProfessionalDevelopmentTitle])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateProfessionalDevelopmentEventAttendance_ProfessionalDevelopmentEvent]
ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ([ProfessionalDevelopmentTitle] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateProfessionalDevelopmentEventAttendance_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateProfessionalDevelopmentEventAttendance_TeacherCandidate]
ON [tpdm].[TeacherCandidateProfessionalDevelopmentEventAttendance] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateRace] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateRace_RaceDescriptor]
ON [tpdm].[TeacherCandidateRace] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateRace] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateRace_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateRace_TeacherCandidate]
ON [tpdm].[TeacherCandidateRace] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStaffAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStaffAssociation_Staff]
ON [tpdm].[TeacherCandidateStaffAssociation] ([StaffUSI] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStaffAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStaffAssociation_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStaffAssociation_TeacherCandidate]
ON [tpdm].[TeacherCandidateStaffAssociation] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasure_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasure_ResultDatatypeTypeDescriptor]
ON [tpdm].[TeacherCandidateStudentGrowthMeasure] ([ResultDatatypeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasure_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasure_SchoolYearType]
ON [tpdm].[TeacherCandidateStudentGrowthMeasure] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasure_StudentGrowthTypeDescriptor] FOREIGN KEY ([StudentGrowthTypeDescriptorId])
REFERENCES [tpdm].[StudentGrowthTypeDescriptor] ([StudentGrowthTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasure_StudentGrowthTypeDescriptor]
ON [tpdm].[TeacherCandidateStudentGrowthMeasure] ([StudentGrowthTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasure] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasure_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasure_TeacherCandidate]
ON [tpdm].[TeacherCandidateStudentGrowthMeasure] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureAcademicSubject_AcademicSubjectDescriptor]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureAcademicSubject_TeacherCandidateStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
REFERENCES [tpdm].[TeacherCandidateStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureAcademicSubject_TeacherCandidateStudentGrowthMeasure]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureAcademicSubject] ([FactAsOfDate] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TeacherCandidateStudentGrowthMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureCourseAssociation_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureCourseAssociation_Course]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureCourseAssociation_TeacherCandidateStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
REFERENCES [tpdm].[TeacherCandidateStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureCourseAssociation_TeacherCandidateStudentGrowthMeasure]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureCourseAssociation] ([FactAsOfDate] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TeacherCandidateStudentGrowthMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_EducationOrganization]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_TeacherCandidateStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
REFERENCES [tpdm].[TeacherCandidateStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation_TeacherCandidateStudentGrowthMeasure]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureEducationOrganizationAssociation] ([FactAsOfDate] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TeacherCandidateStudentGrowthMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureGradeLevel_GradeLevelDescriptor]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureGradeLevel_TeacherCandidateStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
REFERENCES [tpdm].[TeacherCandidateStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureGradeLevel_TeacherCandidateStudentGrowthMeasure]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureGradeLevel] ([FactAsOfDate] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TeacherCandidateStudentGrowthMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureSectionAssociation_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureSectionAssociation_Section]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateStudentGrowthMeasureSectionAssociation_TeacherCandidateStudentGrowthMeasure] FOREIGN KEY ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
REFERENCES [tpdm].[TeacherCandidateStudentGrowthMeasure] ([FactAsOfDate], [SchoolYear], [TeacherCandidateIdentifier], [TeacherCandidateStudentGrowthMeasureIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateStudentGrowthMeasureSectionAssociation_TeacherCandidateStudentGrowthMeasure]
ON [tpdm].[TeacherCandidateStudentGrowthMeasureSectionAssociation] ([FactAsOfDate] ASC, [SchoolYear] ASC, [TeacherCandidateIdentifier] ASC, [TeacherCandidateStudentGrowthMeasureIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderAssociation_EntryTypeDescriptor] FOREIGN KEY ([EntryTypeDescriptorId])
REFERENCES [edfi].[EntryTypeDescriptor] ([EntryTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderAssociation_EntryTypeDescriptor]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([EntryTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderAssociation_ExitWithdrawTypeDescriptor] FOREIGN KEY ([ExitWithdrawTypeDescriptorId])
REFERENCES [edfi].[ExitWithdrawTypeDescriptor] ([ExitWithdrawTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderAssociation_ExitWithdrawTypeDescriptor]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([ExitWithdrawTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderAssociation_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderAssociation_SchoolYearType]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([SchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderAssociation_SchoolYearType1] FOREIGN KEY ([ClassOfSchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderAssociation_SchoolYearType1]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([ClassOfSchoolYear] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderAssociation_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderAssociation_TeacherCandidate]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderAssociation_TeacherPreparationProvider] FOREIGN KEY ([TeacherPreparationProviderId])
REFERENCES [tpdm].[TeacherPreparationProvider] ([TeacherPreparationProviderId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderAssociation_TeacherPreparationProvider]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderAssociation] ([TeacherPreparationProviderId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_EducationOrganization]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_ReasonExitedDescriptor] FOREIGN KEY ([ReasonExitedDescriptorId])
REFERENCES [edfi].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_ReasonExitedDescriptor]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ([ReasonExitedDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_TeacherCandidate]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_TeacherPreparationProviderProgram] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[TeacherPreparationProviderProgram] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTeacherPreparationProviderProgramAssociation_TeacherPreparationProviderProgram]
ON [tpdm].[TeacherCandidateTeacherPreparationProviderProgramAssociation] ([EducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTelephone] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTelephone_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTelephone_TeacherCandidate]
ON [tpdm].[TeacherCandidateTelephone] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTelephone] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTelephone_TelephoneNumberTypeDescriptor]
ON [tpdm].[TeacherCandidateTelephone] ([TelephoneNumberTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTPPProgramDegree] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTPPProgramDegree_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTPPProgramDegree_AcademicSubjectDescriptor]
ON [tpdm].[TeacherCandidateTPPProgramDegree] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTPPProgramDegree] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTPPProgramDegree_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTPPProgramDegree_GradeLevelDescriptor]
ON [tpdm].[TeacherCandidateTPPProgramDegree] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTPPProgramDegree] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTPPProgramDegree_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTPPProgramDegree_TeacherCandidate]
ON [tpdm].[TeacherCandidateTPPProgramDegree] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateTPPProgramDegree] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateTPPProgramDegree_TPPDegreeTypeDescriptor] FOREIGN KEY ([TPPDegreeTypeDescriptorId])
REFERENCES [tpdm].[TPPDegreeTypeDescriptor] ([TPPDegreeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateTPPProgramDegree_TPPDegreeTypeDescriptor]
ON [tpdm].[TeacherCandidateTPPProgramDegree] ([TPPDegreeTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateVisa] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateVisa_TeacherCandidate] FOREIGN KEY ([TeacherCandidateIdentifier])
REFERENCES [tpdm].[TeacherCandidate] ([TeacherCandidateIdentifier])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateVisa_TeacherCandidate]
ON [tpdm].[TeacherCandidateVisa] ([TeacherCandidateIdentifier] ASC)
GO

ALTER TABLE [tpdm].[TeacherCandidateVisa] WITH CHECK ADD CONSTRAINT [FK_TeacherCandidateVisa_VisaDescriptor] FOREIGN KEY ([VisaDescriptorId])
REFERENCES [edfi].[VisaDescriptor] ([VisaDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherCandidateVisa_VisaDescriptor]
ON [tpdm].[TeacherCandidateVisa] ([VisaDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProgramTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProgramTypeDescriptor_Descriptor] FOREIGN KEY ([TeacherPreparationProgramTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TeacherPreparationProvider] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProvider_EducationOrganization] FOREIGN KEY ([TeacherPreparationProviderId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TeacherPreparationProvider] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProvider_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProvider_FederalLocaleCodeDescriptor]
ON [tpdm].[TeacherPreparationProvider] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProvider] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProvider_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProvider_School]
ON [tpdm].[TeacherPreparationProvider] ([SchoolId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProvider] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProvider_University] FOREIGN KEY ([UniversityId])
REFERENCES [tpdm].[University] ([UniversityId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProvider_University]
ON [tpdm].[TeacherPreparationProvider] ([UniversityId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProviderProgram_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProviderProgram_EducationOrganization]
ON [tpdm].[TeacherPreparationProviderProgram] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProviderProgram_ProgramTypeDescriptor] FOREIGN KEY ([ProgramTypeDescriptorId])
REFERENCES [edfi].[ProgramTypeDescriptor] ([ProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProviderProgram_ProgramTypeDescriptor]
ON [tpdm].[TeacherPreparationProviderProgram] ([ProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProviderProgram_TeacherPreparationProgramTypeDescriptor] FOREIGN KEY ([TeacherPreparationProgramTypeDescriptorId])
REFERENCES [tpdm].[TeacherPreparationProgramTypeDescriptor] ([TeacherPreparationProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProviderProgram_TeacherPreparationProgramTypeDescriptor]
ON [tpdm].[TeacherPreparationProviderProgram] ([TeacherPreparationProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgram] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProviderProgram_TPPProgramPathwayDescriptor] FOREIGN KEY ([TPPProgramPathwayDescriptorId])
REFERENCES [tpdm].[TPPProgramPathwayDescriptor] ([TPPProgramPathwayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProviderProgram_TPPProgramPathwayDescriptor]
ON [tpdm].[TeacherPreparationProviderProgram] ([TPPProgramPathwayDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgramGradeLevel] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProviderProgramGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProviderProgramGradeLevel_GradeLevelDescriptor]
ON [tpdm].[TeacherPreparationProviderProgramGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[TeacherPreparationProviderProgramGradeLevel] WITH CHECK ADD CONSTRAINT [FK_TeacherPreparationProviderProgramGradeLevel_TeacherPreparationProviderProgram] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[TeacherPreparationProviderProgram] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_TeacherPreparationProviderProgramGradeLevel_TeacherPreparationProviderProgram]
ON [tpdm].[TeacherPreparationProviderProgramGradeLevel] ([EducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[ThemeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ThemeDescriptor_Descriptor] FOREIGN KEY ([ThemeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TPPDegreeTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_TPPDegreeTypeDescriptor_Descriptor] FOREIGN KEY ([TPPDegreeTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[TPPProgramPathwayDescriptor] WITH CHECK ADD CONSTRAINT [FK_TPPProgramPathwayDescriptor_Descriptor] FOREIGN KEY ([TPPProgramPathwayDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[University] WITH CHECK ADD CONSTRAINT [FK_University_EducationOrganization] FOREIGN KEY ([UniversityId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[University] WITH CHECK ADD CONSTRAINT [FK_University_FederalLocaleCodeDescriptor] FOREIGN KEY ([FederalLocaleCodeDescriptorId])
REFERENCES [tpdm].[FederalLocaleCodeDescriptor] ([FederalLocaleCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_University_FederalLocaleCodeDescriptor]
ON [tpdm].[University] ([FederalLocaleCodeDescriptorId] ASC)
GO

ALTER TABLE [tpdm].[University] WITH CHECK ADD CONSTRAINT [FK_University_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_University_School]
ON [tpdm].[University] ([SchoolId] ASC)
GO

ALTER TABLE [tpdm].[ValueTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ValueTypeDescriptor_Descriptor] FOREIGN KEY ([ValueTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[WithdrawReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_WithdrawReasonDescriptor_Descriptor] FOREIGN KEY ([WithdrawReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

