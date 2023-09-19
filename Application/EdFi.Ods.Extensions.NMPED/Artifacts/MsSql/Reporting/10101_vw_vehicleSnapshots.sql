/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a vehicleSnapshots view
 *			from the vehicleSnapshots Ed-Fi Resource
 */

CREATE OR ALTER VIEW nmped_rpt.vw_vehicleSnapshots AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName

	--resource documentation starts
	,VehicleId
	,VehicleIdentificationNumber
	,SchoolYear
	,GrossVehicleWeightRating
	,LicensePlateNumber
	,ManufacturerYear
	,NumberOfDaysInUse
	,OdometerMileage
	,OdometerReadingDate
	,RegisteredOwnerCode
	,SeatingCapacity
	,SpecialLiftEquipmentIndicator
	,VehicleBodyManufacturer.CodeValue		[VehicleBodyManufacturerCode]
	,VehicleBodyManufacturer.Description	[VehicleBodyManufacturerDescription]
	,VehicleChassisManufacturer.CodeValue	[VehicleChassisManufacturerCode]
	,VehicleChassisManufacturer.Description	[VehicleChassisManufacturerDescription]
	,VehicleFuelType.CodeValue				[VehicleFuelTypeCode]
	,VehicleFuelType.Description			[VehicleFuelTypeDescription]
	,VehicleType.CodeValue					[VehicleTypeCode]
	,VehicleType.Description				[VehicleTypeDescription]
	,VehicleUseIndicator

	--table CreateDate/LastModifiedDate
	,VS.CreateDate										
	,VS.LastModifiedDate
	,VS.Id AS [VehicleSnapshot_Id]
FROM 
	nmped.VehicleSnapshot VS WITH (NOLOCK)
	
	LEFT JOIN edfi.Descriptor VehicleBodyManufacturer WITH (NOLOCK)
		ON VehicleBodyManufacturer.DescriptorId = VS.VehicleBodyManufacturerDescriptorId

	LEFT JOIN edfi.Descriptor VehicleChassisManufacturer WITH (NOLOCK)
		ON VehicleChassisManufacturer.DescriptorId = VS.VehicleChassisManufacturerDescriptorId

	LEFT JOIN edfi.Descriptor VehicleFuelType WITH (NOLOCK)
		ON VehicleFuelType.DescriptorId = VS.VehicleFuelTypeDescriptorId

	LEFT JOIN edfi.Descriptor VehicleType WITH (NOLOCK)
		ON VehicleType.DescriptorId = VS.VehicleTypeDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = VS.LocalEducationAgencyId
