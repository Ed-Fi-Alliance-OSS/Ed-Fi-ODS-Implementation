CREATE OR REPLACE VIEW auth.StudentWithCTECourseEnrollments AS
    SELECT DISTINCT
        ssa.StudentUSI
    FROM
        edfi.StudentSectionAssociation ssa
        INNER JOIN edfi.CourseOffering co ON co.LocalCourseCode = ssa.LocalCourseCode
        AND co.SchoolId = ssa.SchoolId
        AND co.SchoolYear = ssa.SchoolYear
        AND co.SessionName = ssa.SessionName
        INNER JOIN edfi.CourseAcademicSubject csubj ON csubj.CourseCode = co.CourseCode
        AND csubj.EducationOrganizationId = co.EducationOrganizationId
        INNER JOIN edfi.descriptor d ON csubj.AcademicSubjectDescriptorId = d.descriptorid
    WHERE
        d.CodeValue = 'Career and Technical Education';

CREATE OR REPLACE VIEW auth.AssessmentWithAnACTIdentifier AS
    SELECT
        a.AssessmentIdentifier,
        a.Namespace
    FROM
        edfi.Assessment a
    WHERE
        a.AssessmentIdentifier LIKE 'ACT%';

CREATE OR REPLACE VIEW auth.TransportationTypeDescriptorWithABus AS
    SELECT TransportationTypeDescriptorId
    FROM edfi.TransportationTypeDescriptor td
        INNER JOIN edfi.Descriptor d ON td.TransportationTypeDescriptorId = d.DescriptorId
    WHERE	CodeValue LIKE '%Bus%';

    
CREATE OR REPLACE VIEW auth.EducationOrganizationWithACategoryContainingAnSWord AS
    SELECT DISTINCT EducationOrganizationId
    FROM edfi.EducationOrganizationCategory cat
        INNER JOIN edfi.Descriptor d ON cat.EducationOrganizationCategoryDescriptorId = d.DescriptorId
    WHERE CodeValue LIKE 'S%' OR CodeValue LIKE '% S%';
