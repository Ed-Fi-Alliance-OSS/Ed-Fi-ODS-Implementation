/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	vw_vehicle_mileage
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */

CREATE or ALTER VIEW nmped_rpt.vw_vehicle_mileage AS 
SELECT 
	VM.LocalEducationAgencyId
	,SUBSTRING(CAST(VM.LocalEducationAgencyId AS VARCHAR(10)), 3, 3)	DistrictCode
	,VM.ReportingDate
	,VM.VehicleId
	,VM.DailyMileage
	,MileageTypeDescriptor.CodeValue MileageTypeCode
	,MileageTypeDescriptor.ShortDescription MileageShortDescription
	,VehicleRouteDescriptor.CodeValue VehicleRouteCode
	,VehicleRouteDescriptor.ShortDescription VehicleRouteShortDescription
	,RoadTypeDescriptor.CodeValue RoadTypeCode
	,RoadTypeDescriptor.ShortDescription RoadTypeShortDescription
FROM nmped.VehicleMileage VM WITH (NOLOCK)
JOIN edfi.Descriptor MileageTypeDescriptor WITH (NOLOCK)
	ON MileageTypeDescriptor.DescriptorId = VM.MileageTypeDescriptorId

JOIN edfi.Descriptor VehicleRouteDescriptor WITH (NOLOCK)
	ON VehicleRouteDescriptor.DescriptorId = VM.VehicleRouteDescriptorId

JOIN edfi.Descriptor RoadTypeDescriptor WITH (NOLOCK)
	ON RoadTypeDescriptor.descriptorId = VM.RoadTypeDescriptorId
