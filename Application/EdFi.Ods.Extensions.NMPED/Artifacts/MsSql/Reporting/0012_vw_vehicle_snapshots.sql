/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	Vehicle Snapshot
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */

CREATE or ALTER VIEW nmped_rpt.vw_vehicle_snapshots AS 
SELECT 
	NVS.LocalEducationAgencyId
	,SUBSTRING(CAST(NVS.LocalEducationAgencyId AS VARCHAR(10)), 3, 3)	DistrictCode
	 ,NVS.SchoolYear
	,NVS.VehicleId
	,NVS.VehicleIdentificationNumber
	,NVS.GrossVehicleWeightRating
	,NVS.SpecialLiftEquipmentIndicator
	,NVS.SeatingCapacity
	,NVS.RegisteredOwnerCode
	,NVS.OdometerMileage
	,NVS.OdometerReadingDate
	,NVS.NumberOfDaysInUse
	,NVS.VehicleUseIndicator
	,VehicleBodyManufacturerDescriptor.CodeValue VehicleBodyManufacturerCode
	,VehicleBodyManufacturerDescriptor.ShortDescription VehicleBodyManufacturerShortDescription
	,VehicleChassisManufacturerDescriptor.CodeValue VehicleChassisManufacturerCode
	,VehicleChassisManufacturerDescriptor.ShortDescription VehicleChassisManufacturerShortDescription
	,VehicleFuelTypeDescriptor.CodeValue VehicleFuelTypeCode
	,VehicleTypeDescriptor.CodeValue VehicleTypeCodeValue
	,VehicleTypeDescriptor.ShortDescription VehicleTypeShortDescription
FROM nmped.VehicleSnapshot NVS WITH (NOLOCK)
JOIN edfi.Descriptor VehicleBodyManufacturerDescriptor WITH (NOLOCK)
	ON VehicleBodyManufacturerDescriptor.DescriptorId = NVS.VehicleBodyManufacturerDescriptorId
JOIN edfi.Descriptor VehicleChassisManufacturerDescriptor WITH (NOLOCK)
	ON VehicleChassisManufacturerDescriptor.DescriptorId = NVS.VehicleChassisManufacturerDescriptorId
JOIN edfi.Descriptor VehicleFuelTypeDescriptor WITH (NOLOCK)
	ON VehicleFuelTypeDescriptor.descriptorId = NVS.VehicleFuelTypeDescriptorId
JOIN edfi.Descriptor VehicleTypeDescriptor WITH (NOLOCK)
	ON VehicleTypeDescriptor.DescriptorId = NVS.VehicleTypeDescriptorId
