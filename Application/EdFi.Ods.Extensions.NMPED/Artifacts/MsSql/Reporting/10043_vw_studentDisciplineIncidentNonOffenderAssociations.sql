/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Kristina Fernandez | App Dev III
 * Email:	Kristina.Fernandez@ped.nm.gov
 * Date:	03.06.2023
 * Desc:	This script creates a studentDisciplineNonOffenderAssociations view from the studentDisciplineNonOffenderAssociation resource
 *			
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_studentDisciplineIncidentNonOffenderAssociation AS 

SELECT  
		VDL.EducationOrganizationId_District,
		VDL.DistrictCode, 
		VDL.DistrictName, 
		VDL.EducationOrganizationId_School,
		VDL.LocationCode, 
        VDL.SchoolName, 
        edfi.Student.StudentUniqueId, 
		edfi.Student.StudentUSI,
		DisciplineIncidentParticipationCode.CodeValue AS [DisciplineIncidentParticipationCode],
		DisciplineIncidentParticipationCode.Description AS [DisciplineIncidentParticipationDescription],
        edfi.Descriptor.Description AS [Incident Description], 
        SDINOA.Discriminator,
		SDINOA.CreateDate,
		SDINOA.LastModifiedDate,
		SDINOA.Id AS [StudentDisciplineIncidentNonOffenderAssociation_Id]

FROM    edfi.StudentDisciplineIncidentNonOffenderAssociation SDINOA WITH (NOLOCK)

		INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
			ON SDINOA.SchoolId = VDL.EducationOrganizationId_School 

		INNER JOIN edfi.Student WITH (NOLOCK)
			ON SDINOA.StudentUSI = edfi.Student.StudentUSI 

		LEFT JOIN edfi.Descriptor WITH (NOLOCK)
			ON SDINOA.IncidentIdentifier = edfi.Descriptor.DescriptorId

		LEFT JOIN edfi.StudentDisciplineIncidentNonOffenderAssociationDisciplineIncidentParticipationCode SDINOADIPC  WITH (NOLOCK)
			ON SDINOADIPC.IncidentIdentifier = SDINOA.IncidentIdentifier
			AND SDINOADIPC.SchoolId = SDINOA.SchoolId
			AND SDINOADIPC.StudentUSI = SDINOA.StudentUSI

		LEFT JOIN edfi.Descriptor DisciplineIncidentParticipationCode WITH (NOLOCK) 
			ON DisciplineIncidentParticipationCode.DescriptorId = SDINOADIPC.DisciplineIncidentParticipationCodeDescriptorId