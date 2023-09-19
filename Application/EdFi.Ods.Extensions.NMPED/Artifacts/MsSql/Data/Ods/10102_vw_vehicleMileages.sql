/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a vehicleMileages view
 *			from the vehicleMileages Ed-Fi Resource
 */

CREATE OR ALTER VIEW nmped_rpt.vw_vehicleMileages AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName

	--resource documentation starts
	,VehicleId
	,MileageType.CodeValue		[MileageTypeCode]
	,MileageType.Description	[MileageTypeDescription]
	,ReportingDate
	,RoadType.CodeValue			[RoadTypeCode]
	,RoadType.Description		[RoadTypeDescription]
	,VehicleRoute.CodeValue		[VehicleRouteCode]
	,VehicleRoute.Description	[VehicleRouteDescription]
	,DailyMileage

	--table CreateDate/LastModifiedDate
	,VM.CreateDate										
	,VM.LastModifiedDate
	,VM.Id AS [VehicleMileage_Id]
FROM
	nmped.VehicleMileage VM WITH (NOLOCK)

	LEFT JOIN edfi.Descriptor MileageType WITH (NOLOCK)
		ON MileageType.DescriptorId = VM.MileageTypeDescriptorId

	LEFT JOIN edfi.Descriptor RoadType WITH (NOLOCK)
		ON RoadType.DescriptorId = VM.RoadTypeDescriptorId

	LEFT JOIN edfi.Descriptor VehicleRoute WITH (NOLOCK)
		ON VehicleRoute.DescriptorId = VM.VehicleRouteDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = VM.LocalEducationAgencyId




