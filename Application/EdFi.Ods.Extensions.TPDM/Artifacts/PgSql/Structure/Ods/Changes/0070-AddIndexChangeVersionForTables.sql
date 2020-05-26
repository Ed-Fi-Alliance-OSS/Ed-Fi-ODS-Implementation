-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE INDEX IF NOT EXISTS UX_91a31b_ChangeVersion ON tpdm.AnonymizedStudent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_a5aeb2_ChangeVersion ON tpdm.AnonymizedStudentAcademicRecord(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e4eb73_ChangeVersion ON tpdm.AnonymizedStudentAssessment(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e6ba6c_ChangeVersion ON tpdm.AnonymizedStudentAssessmentCourseAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_64d5d3_ChangeVersion ON tpdm.AnonymizedStudentAssessmentSectionAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_2abb16_ChangeVersion ON tpdm.AnonymizedStudentCourseAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_d194a8_ChangeVersion ON tpdm.AnonymizedStudentCourseTranscript(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_7f59f4_ChangeVersion ON tpdm.AnonymizedStudentEducationOrganizationAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_562e9d_ChangeVersion ON tpdm.AnonymizedStudentSectionAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_0a1ce1_ChangeVersion ON tpdm.Applicant(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_57cdba_ChangeVersion ON tpdm.ApplicantProspectAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e7ad52_ChangeVersion ON tpdm.Application(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_143de6_ChangeVersion ON tpdm.ApplicationEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_447e8f_ChangeVersion ON tpdm.CompleterAsStaffAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_055fb2_ChangeVersion ON tpdm.CourseCourseTranscriptFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_6cdc01_ChangeVersion ON tpdm.CourseStudentAcademicRecordFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_157c1d_ChangeVersion ON tpdm.CourseStudentAssessmentFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_81ddd0_ChangeVersion ON tpdm.CourseStudentFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_092fc4_ChangeVersion ON tpdm.EducationOrganizationCourseTranscriptFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_f4fab0_ChangeVersion ON tpdm.EducationOrganizationFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_347c34_ChangeVersion ON tpdm.EducationOrganizationStudentAcademicRecordFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_7c74f1_ChangeVersion ON tpdm.EducationOrganizationStudentAssessmentFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_eedec2_ChangeVersion ON tpdm.EducationOrganizationStudentFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_786774_ChangeVersion ON tpdm.EmploymentEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_f51cef_ChangeVersion ON tpdm.EmploymentSeparationEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e809b0_ChangeVersion ON tpdm.OpenStaffPositionEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_97e755_ChangeVersion ON tpdm.PerformanceMeasure(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e21917_ChangeVersion ON tpdm.PerformanceMeasureCourseAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_be96e7_ChangeVersion ON tpdm.PerformanceMeasureFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_8c4ca1_ChangeVersion ON tpdm.ProfessionalDevelopmentEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_f84f61_ChangeVersion ON tpdm.Prospect(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_dc8233_ChangeVersion ON tpdm.ProspectProfessionalDevelopmentEventAttendance(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_6232e8_ChangeVersion ON tpdm.RecruitmentEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_f13a78_ChangeVersion ON tpdm.Rubric(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_6ab97b_ChangeVersion ON tpdm.RubricLevel(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_c8ffc2_ChangeVersion ON tpdm.RubricLevelResponse(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_98f7aa_ChangeVersion ON tpdm.RubricLevelResponseFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_51c6b9_ChangeVersion ON tpdm.SectionCourseTranscriptFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_f7814e_ChangeVersion ON tpdm.SectionStudentAcademicRecordFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_aeccab_ChangeVersion ON tpdm.SectionStudentAssessmentFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_5b8d40_ChangeVersion ON tpdm.SectionStudentFacts(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_11e466_ChangeVersion ON tpdm.StaffApplicantAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_5f5473_ChangeVersion ON tpdm.StaffEvaluation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_60e7ab_ChangeVersion ON tpdm.StaffEvaluationComponent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_6b5a36_ChangeVersion ON tpdm.StaffEvaluationComponentRating(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_9e0757_ChangeVersion ON tpdm.StaffEvaluationElement(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e94b2b_ChangeVersion ON tpdm.StaffEvaluationElementRating(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_e34e81_ChangeVersion ON tpdm.StaffEvaluationRating(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_420d2e_ChangeVersion ON tpdm.StaffFieldworkAbsenceEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_fe2944_ChangeVersion ON tpdm.StaffFieldworkExperience(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_aa4534_ChangeVersion ON tpdm.StaffFieldworkExperienceSectionAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_b4a1e0_ChangeVersion ON tpdm.StaffProfessionalDevelopmentEventAttendance(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_990b71_ChangeVersion ON tpdm.StaffProspectAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_609983_ChangeVersion ON tpdm.StaffStudentGrowthMeasure(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_f22014_ChangeVersion ON tpdm.StaffStudentGrowthMeasureCourseAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_120788_ChangeVersion ON tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_fbfeb4_ChangeVersion ON tpdm.StaffStudentGrowthMeasureSectionAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_7bf40b_ChangeVersion ON tpdm.StaffTeacherPreparationProviderAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_5bac62_ChangeVersion ON tpdm.StaffTeacherPreparationProviderProgramAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_c4d5a9_ChangeVersion ON tpdm.TalentManagementGoal(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_835b49_ChangeVersion ON tpdm.TeacherCandidate(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_163dde_ChangeVersion ON tpdm.TeacherCandidateAcademicRecord(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_87fd83_ChangeVersion ON tpdm.TeacherCandidateCourseTranscript(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_30d301_ChangeVersion ON tpdm.TeacherCandidateFieldworkAbsenceEvent(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_fe5770_ChangeVersion ON tpdm.TeacherCandidateFieldworkExperience(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_1a948e_ChangeVersion ON tpdm.TeacherCandidateFieldworkExperienceSectionAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_8c39c1_ChangeVersion ON tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_3395e5_ChangeVersion ON tpdm.TeacherCandidateStaffAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_464a58_ChangeVersion ON tpdm.TeacherCandidateStudentGrowthMeasure(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_512fab_ChangeVersion ON tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_22b9a4_ChangeVersion ON tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_b8b1b0_ChangeVersion ON tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_0dff08_ChangeVersion ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_81475b_ChangeVersion ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation(ChangeVersion);

CREATE INDEX IF NOT EXISTS UX_aceeb9_ChangeVersion ON tpdm.TeacherPreparationProviderProgram(ChangeVersion);

