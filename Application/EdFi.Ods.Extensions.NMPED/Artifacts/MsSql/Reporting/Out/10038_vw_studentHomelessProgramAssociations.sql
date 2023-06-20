/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Kristina Fernandez | App Dev III
 * Email:	Kristina.Fernandez@ped.nm.gov
 * Date:	03.06.2023
 * Desc:	This script creates a studentHomelessProgramAssociations view from the studentHomelessProgramAssociation resource
 *			The view also combines the resource courses.
 *
 */


CREATE OR ALTER VIEW nmped_rpt.vw_studentHomelessProgramAssociations AS 

SELECT	nmped_rpt.vw_district_location.EducationOrganizationId_District, 
		nmped_rpt.vw_district_location.DistrictCode, 
		nmped_rpt.vw_district_location.DistrictName, 
        nmped_rpt.vw_district_location.EducationOrganizationId_School, 
        nmped_rpt.vw_district_location.LocationCode, 
        nmped_rpt.vw_district_location.SchoolName, 
        edfi.Student.StudentUniqueId AS [Student ID], 
		edfi.Student.FirstName,
		edfi.Student.LastSurname,
        edfi.StudentHomelessProgramAssociation.ProgramName, 
        edfi.Descriptor.Description AS [Program Description], 
        Descriptor_1.CodeValue AS [Primary Nighttime Residence], 
        edfi.StudentHomelessProgramAssociation.AwaitingFosterCare, 
        edfi.StudentHomelessProgramAssociation.HomelessUnaccompaniedYouth AS [Unaccompanied Youth]
FROM	edfi.StudentHomelessProgramAssociation WITH (NOLOCK)
			INNER JOIN edfi.Student WITH (NOLOCK) 
				ON edfi.StudentHomelessProgramAssociation.StudentUSI = edfi.Student.StudentUSI 
			INNER JOIN nmped_rpt.vw_district_location WITH (NOLOCK)
				ON edfi.StudentHomelessProgramAssociation.EducationOrganizationId = nmped_rpt.vw_district_location.EducationOrganizationId_School AND 
					edfi.StudentHomelessProgramAssociation.ProgramEducationOrganizationId = nmped_rpt.vw_district_location.EducationOrganizationId_District 
            LEFT JOIN edfi.Descriptor WITH (NOLOCK)
				ON edfi.StudentHomelessProgramAssociation.ProgramTypeDescriptorId = edfi.Descriptor.DescriptorId 
			LEFT JOIN edfi.Descriptor Descriptor_1 WITH (NOLOCK)
				ON edfi.StudentHomelessProgramAssociation.HomelessPrimaryNighttimeResidenceDescriptorId = Descriptor_1.DescriptorId

