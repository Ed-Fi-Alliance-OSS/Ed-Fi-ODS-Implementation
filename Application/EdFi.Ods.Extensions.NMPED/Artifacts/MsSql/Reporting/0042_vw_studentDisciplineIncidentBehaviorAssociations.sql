/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Kristina Fernandez | App Dev III
 * Email:	Kristina.Fernandez@ped.nm.gov
 * Date:	03.06.2023
 * Desc:	This script creates a studentDisciplineIncidentBehaviorAssociations view from the studentDisciplineIncidentBehaviorAssociations resource
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
		views.name = 'vw_studentDisciplineIncidentBehaviorAssociations'
		AND schemas.name = 'nmped_rpt'
)

DROP VIEW nmped_rpt.vw_studentDisciplineIncidentBehaviorAssociations;
GO

CREATE VIEW nmped_rpt.vw_studentDisciplineIncidentBehaviorAssociations AS 

SELECT	nmped_rpt.vw_district_location.EducationOrganizationId_District, 
	nmped_rpt.vw_district_location.DistrictCode, 
	nmped_rpt.vw_district_location.DistrictName, 
        nmped_rpt.vw_district_location.EducationOrganizationId_School, 
        nmped_rpt.vw_district_location.LocationCode, 
        nmped_rpt.vw_district_location.SchoolName, 
        edfi.Student.StudentUniqueId, 
        edfi.StudentDisciplineIncidentBehaviorAssociation.BehaviorDetailedDescription,
        edfi.DisciplineIncident.IncidentDate, 
        edfi.DisciplineIncident.IncidentTime, 
        edfi.Descriptor.Description AS [Incident Location Description], 
        edfi.DisciplineIncident.IncidentDescription, 
        edfi.DisciplineIncident.ReporterDescriptionDescriptorId, 
        edfi.DisciplineIncident.ReporterName, edfi.DisciplineIncident.ReportedToLawEnforcement, 
        edfi.DisciplineIncident.CaseNumber, edfi.DisciplineIncident.IncidentCost, 
        edfi.Staff.StaffUniqueId, edfi.DisciplineIncident.Discriminator
FROM    edfi.StudentDisciplineIncidentBehaviorAssociation WITH (NOLOCK)
		INNER JOIN edfi.Student WITH (NOLOCK)
			ON edfi.StudentDisciplineIncidentBehaviorAssociation.StudentUSI = edfi.Student.StudentUSI 
		INNER JOIN edfi.DisciplineIncident WITH (NOLOCK)
                	ON edfi.StudentDisciplineIncidentBehaviorAssociation.IncidentIdentifier = edfi.DisciplineIncident.IncidentIdentifier 
            INNER JOIN nmped_rpt.vw_district_location WITH (NOLOCK)
                ON edfi.StudentDisciplineIncidentBehaviorAssociation.SchoolId = nmped_rpt.vw_district_location.EducationOrganizationId_School 
            INNER JOIN edfi.Descriptor WITH (NOLOCK)
                ON edfi.DisciplineIncident.IncidentLocationDescriptorId = edfi.Descriptor.DescriptorId 
            LEFT OUTER JOIN edfi.Staff WITH (NOLOCK) 
                ON edfi.DisciplineIncident.StaffUSI = edfi.Staff.StaffUSI
