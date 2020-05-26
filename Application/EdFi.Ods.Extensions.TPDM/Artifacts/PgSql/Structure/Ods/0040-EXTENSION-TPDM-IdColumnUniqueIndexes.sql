-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE UNIQUE INDEX IF NOT EXISTS UX_91a31b_Id ON tpdm.AnonymizedStudent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_a5aeb2_Id ON tpdm.AnonymizedStudentAcademicRecord(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e4eb73_Id ON tpdm.AnonymizedStudentAssessment(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e6ba6c_Id ON tpdm.AnonymizedStudentAssessmentCourseAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_64d5d3_Id ON tpdm.AnonymizedStudentAssessmentSectionAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_2abb16_Id ON tpdm.AnonymizedStudentCourseAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_d194a8_Id ON tpdm.AnonymizedStudentCourseTranscript(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_7f59f4_Id ON tpdm.AnonymizedStudentEducationOrganizationAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_562e9d_Id ON tpdm.AnonymizedStudentSectionAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_0a1ce1_Id ON tpdm.Applicant(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_57cdba_Id ON tpdm.ApplicantProspectAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e7ad52_Id ON tpdm.Application(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_143de6_Id ON tpdm.ApplicationEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_447e8f_Id ON tpdm.CompleterAsStaffAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_055fb2_Id ON tpdm.CourseCourseTranscriptFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_6cdc01_Id ON tpdm.CourseStudentAcademicRecordFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_157c1d_Id ON tpdm.CourseStudentAssessmentFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_81ddd0_Id ON tpdm.CourseStudentFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_092fc4_Id ON tpdm.EducationOrganizationCourseTranscriptFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_f4fab0_Id ON tpdm.EducationOrganizationFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_347c34_Id ON tpdm.EducationOrganizationStudentAcademicRecordFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_7c74f1_Id ON tpdm.EducationOrganizationStudentAssessmentFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_eedec2_Id ON tpdm.EducationOrganizationStudentFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_786774_Id ON tpdm.EmploymentEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_f51cef_Id ON tpdm.EmploymentSeparationEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e809b0_Id ON tpdm.OpenStaffPositionEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_97e755_Id ON tpdm.PerformanceMeasure(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e21917_Id ON tpdm.PerformanceMeasureCourseAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_be96e7_Id ON tpdm.PerformanceMeasureFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_8c4ca1_Id ON tpdm.ProfessionalDevelopmentEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_f84f61_Id ON tpdm.Prospect(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_dc8233_Id ON tpdm.ProspectProfessionalDevelopmentEventAttendance(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_6232e8_Id ON tpdm.RecruitmentEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_f13a78_Id ON tpdm.Rubric(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_6ab97b_Id ON tpdm.RubricLevel(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_c8ffc2_Id ON tpdm.RubricLevelResponse(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_98f7aa_Id ON tpdm.RubricLevelResponseFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_51c6b9_Id ON tpdm.SectionCourseTranscriptFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_f7814e_Id ON tpdm.SectionStudentAcademicRecordFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_aeccab_Id ON tpdm.SectionStudentAssessmentFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_5b8d40_Id ON tpdm.SectionStudentFacts(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_11e466_Id ON tpdm.StaffApplicantAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_5f5473_Id ON tpdm.StaffEvaluation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_60e7ab_Id ON tpdm.StaffEvaluationComponent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_6b5a36_Id ON tpdm.StaffEvaluationComponentRating(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_9e0757_Id ON tpdm.StaffEvaluationElement(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e94b2b_Id ON tpdm.StaffEvaluationElementRating(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_e34e81_Id ON tpdm.StaffEvaluationRating(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_420d2e_Id ON tpdm.StaffFieldworkAbsenceEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_fe2944_Id ON tpdm.StaffFieldworkExperience(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_aa4534_Id ON tpdm.StaffFieldworkExperienceSectionAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_b4a1e0_Id ON tpdm.StaffProfessionalDevelopmentEventAttendance(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_990b71_Id ON tpdm.StaffProspectAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_609983_Id ON tpdm.StaffStudentGrowthMeasure(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_f22014_Id ON tpdm.StaffStudentGrowthMeasureCourseAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_120788_Id ON tpdm.StaffStudentGrowthMeasureEducationOrganizationAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_fbfeb4_Id ON tpdm.StaffStudentGrowthMeasureSectionAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_7bf40b_Id ON tpdm.StaffTeacherPreparationProviderAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_5bac62_Id ON tpdm.StaffTeacherPreparationProviderProgramAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_c4d5a9_Id ON tpdm.TalentManagementGoal(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_835b49_Id ON tpdm.TeacherCandidate(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_163dde_Id ON tpdm.TeacherCandidateAcademicRecord(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_87fd83_Id ON tpdm.TeacherCandidateCourseTranscript(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_30d301_Id ON tpdm.TeacherCandidateFieldworkAbsenceEvent(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_fe5770_Id ON tpdm.TeacherCandidateFieldworkExperience(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_1a948e_Id ON tpdm.TeacherCandidateFieldworkExperienceSectionAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_8c39c1_Id ON tpdm.TeacherCandidateProfessionalDevelopmentEventAttendance(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_3395e5_Id ON tpdm.TeacherCandidateStaffAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_464a58_Id ON tpdm.TeacherCandidateStudentGrowthMeasure(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_512fab_Id ON tpdm.TeacherCandidateStudentGrowthMeasureCourseAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_22b9a4_Id ON tpdm.TeacherCandidateStudentGrowthMeasureEducationOrganizatio_22b9a4(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_b8b1b0_Id ON tpdm.TeacherCandidateStudentGrowthMeasureSectionAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_0dff08_Id ON tpdm.TeacherCandidateTeacherPreparationProviderAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_81475b_Id ON tpdm.TeacherCandidateTeacherPreparationProviderProgramAssociation(Id);

CREATE UNIQUE INDEX IF NOT EXISTS UX_aceeb9_Id ON tpdm.TeacherPreparationProviderProgram(Id);

