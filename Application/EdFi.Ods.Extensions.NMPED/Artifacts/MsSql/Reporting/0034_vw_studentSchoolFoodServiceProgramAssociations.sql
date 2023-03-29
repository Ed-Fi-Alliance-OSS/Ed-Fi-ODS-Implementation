/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Kristina Fernandez | App Dev III
 * Email:	Kristina.Fernandez@ped.nm.gov
 * Date:	03.06.2023
 * Desc:	This script creates a studentSchoolFoodServiceProgramAssociation view from the studentSchoolFoodServiceProgramAssociation resource
 *			
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
		views.name = 'vw_studentSchoolFoodServiceProgramAssociations'
		AND schemas.name = 'nmped_rpt'
)

DROP VIEW nmped_rpt.vw_studentSchoolFoodServiceProgramAssociations;
GO

CREATE VIEW nmped_rpt.vw_studentSchoolFoodServiceProgramAssociations AS 

SELECT  edfi.StudentSchoolFoodServiceProgramAssociation.ProgramEducationOrganizationId, 
		nmped_rpt.vw_district_location.DistrictCode, 
        nmped_rpt.vw_district_location.DistrictName, 
        edfi.StudentSchoolFoodServiceProgramAssociation.EducationOrganizationId, 
        nmped_rpt.vw_district_location.LocationCode, 
        nmped_rpt.vw_district_location.SchoolName, 
        edfi.Student.StudentUniqueId AS [Student ID], 
        edfi.StudentSchoolFoodServiceProgramAssociation.ProgramName, 
        edfi.Descriptor.CodeValue AS [Direct Certification Code], 
        edfi.Descriptor.Description AS [Direct Certification Description]
FROM	edfi.StudentSchoolFoodServiceProgramAssociation WITH (NOLOCK)
			INNER JOIN nmped_rpt.vw_district_location WITH (NOLOCK)
				ON edfi.StudentSchoolFoodServiceProgramAssociation.ProgramEducationOrganizationId = nmped_rpt.vw_district_location.EducationOrganizationId_District AND 
                      edfi.StudentSchoolFoodServiceProgramAssociation.EducationOrganizationId = nmped_rpt.vw_district_location.EducationOrganizationId_School 
            LEFT OUTER JOIN edfi.Student WITH (NOLOCK)
				ON edfi.StudentSchoolFoodServiceProgramAssociation.StudentUSI = edfi.Student.StudentUSI 
            LEFT OUTER JOIN nmped.StudentSchoolFoodServiceProgramAssociationExtension WITH (NOLOCK)
				ON edfi.StudentSchoolFoodServiceProgramAssociation.StudentUSI = nmped.StudentSchoolFoodServiceProgramAssociationExtension.StudentUSI 
            LEFT OUTER JOIN edfi.Descriptor WITH (NOLOCK)
				ON nmped.StudentSchoolFoodServiceProgramAssociationExtension.DirectCertificationStatusDescriptorId = edfi.Descriptor.DescriptorId