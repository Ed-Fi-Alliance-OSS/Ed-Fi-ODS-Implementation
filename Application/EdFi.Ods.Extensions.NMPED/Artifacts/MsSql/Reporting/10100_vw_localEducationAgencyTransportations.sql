
/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a localEducationAgencyTransportations view
 *			from the localEducationAgencyTransportations Ed-Fi Resource
 */
 
CREATE OR ALTER   VIEW [nmped_rpt].[vw_localEducationAgencyTransportations] AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName

	--resource documentation starts
	,CategoryDescriptor01TransportationCategory.CodeValue	[TransportationCategory01Code]
	,CategoryDescriptor01TransportationCategory.Description [TransportationCategory01Description]
	,CategoryDescriptor02TransportationCategory.CodeValue	[TransportationCategory02Code]
	,CategoryDescriptor02TransportationCategory.Description [TransportationCategory02Description]
	,TransportationSetCode.CodeValue						[TransportationSetCode]
	,TransportationSetCode.Description						[TransportationSetDescription]
	,Count

	--table CreateDate/LastModifiedDate
	,LEAT.CreateDate
	,LEAT.LastModifiedDate
	,LEAT.Id AS [LocalEducationAgencyTransportationId]

FROM
	nmped.LocalEducationAgencyTransportation LEAT WITH (NOLOCK)

	LEFT JOIN edfi.Descriptor CategoryDescriptor01TransportationCategory WITH (NOLOCK)
		ON CategoryDescriptor01TransportationCategory.DescriptorId = LEAT.CategoryDescriptor01TransportationCategoryDescriptorId

	LEFT JOIN edfi.Descriptor CategoryDescriptor02TransportationCategory WITH (NOLOCK)
		ON CategoryDescriptor02TransportationCategory.DescriptorId = LEAT.CategoryDescriptor02TransportationCategoryDescriptorId

	LEFT JOIN edfi.Descriptor TransportationSetCode WITH (NOLOCK)
		ON TransportationSetCode.DescriptorId = LEAT.TransportationSetCodeDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = LEAT.LocalEducationAgencyId
GO

