/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-13-2023
 * Desc:	This script creates a studentSpecialEducationAssociationEvents view from
 *			the studentSpecialEducationAssociationEvents resource
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_studentSpecialEducationAssociationEvents
AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,StudentUniqueId
	,SSEAE.StudentUSI
	,FirstName
	,LastSurname
	,EventDate
	,SpecialEducationEventType.CodeValue				[SpecialEducationEventTypeCode]
	,SpecialEducationEventType.Description				[SpecialEducationEventTypeDescription]
	,BeginDate
	,ProgramName
	,ProgramType.CodeValue								[ProgramTypeCode]
	,ProgramType.Description							[ProgramTypeDescription]
	,SpecialEducationEventReason.CodeValue				[SpecialEducationEventReasonCode]
	,SpecialEducationEventReason.Description			[SpecialEducationEventReasonDescription]
	,SpecialEducationNonComplianceReason.CodeValue		[SpecialEducationNonComplianceReasonCode]
	,SpecialEducationNonComplianceReason.Description	[SpecialEducationNonComplianceReasonDescription]

	--table CreateDate/LastModifiedDate
	,SSEAE.CreateDate
	,SSEAE.LastModifiedDate
	,SSEAE.Id AS [StudentSpecialEducationAssociationEvent_Id]
FROM
	nmped.StudentSpecialEducationAssociationEvent SSEAE WITH (NOLOCK)

	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSEAE.StudentUSI

	LEFT JOIN edfi.Descriptor ProgramType WITH (NOLOCK)
		ON ProgramType.DescriptorId = SSEAE.ProgramTypeDescriptorId

	LEFT JOIN edfi.Descriptor SpecialEducationEventType WITH (NOLOCK)
		ON SpecialEducationEventType.DescriptorId = SSEAE.SpecialEducationEventTypeDescriptorId

	LEFT JOIN edfi.Descriptor SpecialEducationEventReason WITH (NOLOCK)
		ON SpecialEducationEventReason.DescriptorId = SSEAE.SpecialEducationEventReasonDescriptorId

	LEFT JOIN edfi.Descriptor SpecialEducationNonComplianceReason WITH (NOLOCK)
		ON SpecialEducationNonComplianceReason.DescriptorId = SSEAE.SpecialEducationNonComplianceReasonDescriptorId

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSEAE.EducationOrganizationId
