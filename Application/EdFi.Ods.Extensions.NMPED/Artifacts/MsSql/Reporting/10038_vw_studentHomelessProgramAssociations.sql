/****** Object:  View [nmped_rpt].[vw_studentHomelessProgramAssociations]    Script Date: 11/22/2023 10:32:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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


CREATE or alter  VIEW [nmped_rpt].[vw_studentHomelessProgramAssociations] AS 

SELECT	VDL.EducationOrganizationId_District, 
		VDL.DistrictCode, 
		VDL.DistrictName, 
        VDL.EducationOrganizationId_School, 
        VDL.LocationCode, 
        VDL.SchoolName, 
        S.StudentUniqueId AS [Student ID], 
		S.StudentUSI,
		S.FirstName,
		S.LastSurname,
		GSPA.BeginDate,
		GSPA.EndDate,
        SHPA.ProgramName, 
        edfi.Descriptor.Description AS [Program Description], 
        Descriptor_1.CodeValue AS [Primary Nighttime Residence], 
        SHPA.AwaitingFosterCare, 
        SHPA.HomelessUnaccompaniedYouth AS [Unaccompanied Youth]
FROM	edfi.StudentHomelessProgramAssociation SHPA WITH (NOLOCK)
			INNER JOIN edfi.Student S WITH (NOLOCK) 
				ON SHPA.StudentUSI = S.StudentUSI 
			INNER JOIN edfi.GeneralStudentProgramAssociation GSPA
				ON GSPA.BeginDate = SHPA.BeginDate
				AND GSPA.EducationOrganizationId = SHPA.EducationOrganizationId
				AND GSPA.ProgramEducationOrganizationId = SHPA.ProgramEducationOrganizationId
				AND GSPA.ProgramName = SHPA.ProgramName
				AND GSPA.ProgramTypeDescriptorId = SHPA.ProgramTypeDescriptorId
				AND GSPA.StudentUSI  = SHPA.StudentUSI
			INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
				ON SHPA.EducationOrganizationId = VDL.EducationOrganizationId_School AND 
					SHPA.ProgramEducationOrganizationId = VDL.EducationOrganizationId_District 
            LEFT JOIN edfi.Descriptor WITH (NOLOCK)
				ON SHPA.ProgramTypeDescriptorId = edfi.Descriptor.DescriptorId 
			LEFT JOIN edfi.Descriptor Descriptor_1 WITH (NOLOCK)
				ON SHPA.HomelessPrimaryNighttimeResidenceDescriptorId = Descriptor_1.DescriptorId

GO


