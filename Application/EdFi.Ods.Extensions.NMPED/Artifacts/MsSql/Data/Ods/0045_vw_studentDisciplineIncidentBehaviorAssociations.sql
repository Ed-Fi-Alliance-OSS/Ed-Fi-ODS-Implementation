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

CREATE OR ALTER VIEW nmped_rpt.vw_studentDisciplineIncidentBehaviorAssociations AS 

SELECT	nmped_rpt.vw_district_location.EducationOrganizationId_District, 
		nmped_rpt.vw_district_location.DistrictCode, 
		nmped_rpt.vw_district_location.DistrictName, 
        nmped_rpt.vw_district_location.EducationOrganizationId_School, 
        nmped_rpt.vw_district_location.LocationCode, 
        nmped_rpt.vw_district_location.SchoolName, 

        edfi.Student.StudentUniqueId, 
		edfi.Student.StudentUSI,
        SDIBA.BehaviorDetailedDescription,
		Behavior.CodeValue AS [BehaviorCode],
		Behavior.Description AS [BehaviorDescription],
        edfi.DisciplineIncident.IncidentDate, 
        edfi.DisciplineIncident.IncidentTime, 
        edfi.Descriptor.Description AS [Incident Location Description], 
        edfi.DisciplineIncident.IncidentDescription, 
        edfi.DisciplineIncident.ReporterDescriptionDescriptorId, 
        edfi.DisciplineIncident.ReporterName, edfi.DisciplineIncident.ReportedToLawEnforcement, 
        edfi.DisciplineIncident.CaseNumber, edfi.DisciplineIncident.IncidentCost, 
		DisciplineIncidentParticipationCode.CodeValue AS [DisciplineIncidentParticipationCode],
		DisciplineIncidentParticipationCode.Description AS [DisciplineIncidentParticipationDescription],
        edfi.Staff.StaffUniqueId,
		edfi.Staff.StaffUSI,
		edfi.DisciplineIncident.Discriminator,
		SDIBA.CreateDate,
		SDIBA.LastModifiedDate

FROM    edfi.StudentDisciplineIncidentBehaviorAssociation SDIBA WITH (NOLOCK)
		
		INNER JOIN edfi.Student WITH (NOLOCK)
			ON SDIBA.StudentUSI = edfi.Student.StudentUSI 

		INNER JOIN edfi.DisciplineIncident WITH (NOLOCK)
            ON SDIBA.IncidentIdentifier = edfi.DisciplineIncident.IncidentIdentifier
					
        INNER JOIN nmped_rpt.vw_district_location WITH (NOLOCK)
            ON SDIBA.SchoolId = nmped_rpt.vw_district_location.EducationOrganizationId_School 

		LEFT JOIN edfi.StudentDisciplineIncidentBehaviorAssociationDisciplineIncidentParticipationCode SDIBADIPC WITH (NOLOCK)
			ON SDIBADIPC.BehaviorDescriptorId = SDIBA.BehaviorDescriptorId
			AND SDIBADIPC.IncidentIdentifier = SDIBA.IncidentIdentifier
			AND SDIBADIPC.SchoolId = SDIBA.SchoolId
			AND SDIBADIPC.StudentUSI = SDIBA.StudentUSI

		LEFT JOIN edfi.Descriptor DisciplineIncidentParticipationCode WITH (NOLOCK) 
			ON DisciplineIncidentParticipationCode.DescriptorId = SDIBADIPC.DisciplineIncidentParticipationCodeDescriptorId
	
		LEFT JOIN edfi.Descriptor Behavior WITH (NOLOCK)
			ON Behavior.DescriptorId = SDIBA.BehaviorDescriptorId
            
		LEFT JOIN edfi.Descriptor WITH (NOLOCK)
             ON edfi.DisciplineIncident.IncidentLocationDescriptorId = edfi.Descriptor.DescriptorId 
            
		LEFT JOIN edfi.Staff WITH (NOLOCK) 
             ON edfi.DisciplineIncident.StaffUSI = edfi.Staff.StaffUSI
