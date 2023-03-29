/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Kristina Fernandez | App Dev III
 * Email:	Kristina.Fernandez@ped.nm.gov
 * Date:	03.06.2023
 * Desc:	This script creates a studentDisciplineNonOffenderAssociations view from the studentDisciplineNonOffenderAssociation resource
 *			The view also combines the resource courses.
 *
 */

IF EXISTS 
(
	SELECT 
		1 
	FROM 
		sys.views
		JOIN sys.schemas
			ON views.schema_id = schemas.schema_id
	WHERE 
		views.name = 'vw_studentDisciplineIncidentNonOffenderAssociation'
		AND schemas.name = 'nmped_rpt'
)

DROP VIEW nmped_rpt.vw_studentDisciplineIncidentNonOffenderAssociation;
GO

CREATE VIEW nmped_rpt.vw_studentDisciplineIncidentNonOffenderAssociation AS 

SELECT  nmped_rpt.vw_district_location.DistrictCode, 
		nmped_rpt.vw_district_location.DistrictName, 
		nmped_rpt.vw_district_location.LocationCode, 
        nmped_rpt.vw_district_location.SchoolName, 
        edfi.Student.StudentUniqueId, 
        edfi.Descriptor.Description AS [Incident Description], 
        edfi.StudentDisciplineIncidentNonOffenderAssociation.Discriminator
FROM    edfi.StudentDisciplineIncidentNonOffenderAssociation WITH (NOLOCK)
			INNER JOIN nmped_rpt.vw_district_location WITH (NOLOCK)
				ON edfi.StudentDisciplineIncidentNonOffenderAssociation.SchoolId = nmped_rpt.vw_district_location.EducationOrganizationId_School 
			INNER JOIN edfi.Student WITH (NOLOCK)
				ON edfi.StudentDisciplineIncidentNonOffenderAssociation.StudentUSI = edfi.Student.StudentUSI 
			INNER JOIN edfi.Descriptor WITH (NOLOCK)
				ON edfi.StudentDisciplineIncidentNonOffenderAssociation.IncidentIdentifier = edfi.Descriptor.DescriptorId