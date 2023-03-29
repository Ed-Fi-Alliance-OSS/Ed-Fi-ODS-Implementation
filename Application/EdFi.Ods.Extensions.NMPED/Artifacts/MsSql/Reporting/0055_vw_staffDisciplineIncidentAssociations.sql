/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a staffDisciplineIncidentAssociations view 
			from the staffDisciplineIncidentAssociations resource
 */

CREATE OR ALTER VIEW nmped_rpt.vw_staffDisciplineIncidentAssociations AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,StaffUniqueId
	,DisciplineIncidentParticipationCode.CodeValue		[DisciplineIncidentParticipationCode]
	,DisciplineIncidentParticipationCode.Description	[DisciplineIncidentParticipationDescription]
	,SDIA.IncidentIdentifier

	--table CreateDate/LastModifiedDate
	,SDIA.CreateDate										
	,SDIA.LastModifiedDate
FROM
	edfi.StaffDisciplineIncidentAssociation SDIA WITH (NOLOCK)

	JOIN edfi.Staff S WITH (NOLOCK)
		ON S.StaffUSI = SDIA.StaffUSI

	LEFT JOIN edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode SDIADIPC WITH (NOLOCK)
		ON SDIADIPC.IncidentIdentifier = SDIA.IncidentIdentifier
		AND SDIADIPC.SchoolId = SDIA.SchoolId
		AND SDIADIPC.StaffUSI = SDIA.StaffUSI

	LEFT JOIN edfi.Descriptor DisciplineIncidentParticipationCode WITH (NOLOCK)
		ON DisciplineIncidentParticipationCode.DescriptorId = SDIADIPC.DisciplineIncidentParticipationCodeDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SDIA.SchoolId