/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-23-2023
 * Desc:	This script creates a DisciplineAction view from the 
 *			disciplineActions resource
 *
 */

USE [NM_Staging_EdFi_v5.3.0_Ods]
GO

 IF EXISTS 
(
	SELECT 
		1 
	FROM 
		sys.views
		JOIN sys.schemas
			ON views.schema_id = schemas.schema_id
	WHERE 
		views.name = 'vw_disciplineActions'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_disciplineActions;
GO

CREATE VIEW nmped_rpt.vw_disciplineActions AS 
SELECT
	 SUBSTRING(CAST(DASDIA.SchoolId AS VARCHAR(10)), 3, 3)	[DistrictCode]
	,EO2.NameOfInstitution									[DistrictName]
	,DASDIA.SchoolId
	,EO.NameOfInstitution									[SchoolName]
	,DA.DisciplineActionIdentifier
	,DA.DisciplineDate
	,DAD.DisciplineDescriptorId
	,Discipline.CodeValue									[DisciplineCode]
	,Discipline.Description									[DisciplineDescription]
	,DASDIA.IncidentIdentifier
	,ResponsibilitySchoolId 
	,AssignmentSchoolId
	,StudentUniqueId
	,ActualDisciplineActionLength
	,DisciplineActionLength
	,DA.DisciplineActionLengthDifferenceReasonDescriptorId
	,DisciplineActionLengthDifferenceReason.CodeValue		[DisciplineActionLengthDifferenceReasonCode]
	,DisciplineActionLengthDifferenceReason.Description		[DisciplineActionLengthDifferenceReasonDescription]
	,IEPPlacementMeetingIndicator
	,ReceivedEducationServicesDuringExpulsion
	,RelatedToZeroTolerancePolicy
	,StaffUniqueId
	,DASDIBA.BehaviorDescriptorId		
	,Behavior.CodeValue										[BehaviorCode]
	,Behavior.Description									[BehaviorDescription]
	,DAE.DisciplineActionDetailedResponse
	,DA.CreateDate
	,DA.LastModifiedDate
FROM 
	edfi.DisciplineAction DA WITH (NOLOCK)

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON DA.StudentUSI = S.StudentUSI

	LEFT JOIN edfi.DisciplineActionDiscipline DAD WITH (NOLOCK)
		ON DAD.DisciplineActionIdentifier = DA.DisciplineActionIdentifier
		AND DAD.DisciplineDate = DA.DisciplineDate
		AND DAD.StudentUSI = DA.StudentUSI

	LEFT JOIN edfi.DisciplineActionStudentDisciplineIncidentAssociation DASDIA WITH (NOLOCK)
		ON DASDIA.DisciplineActionIdentifier = DA.DisciplineActionIdentifier
		AND DASDIA.DisciplineDate = DA.DisciplineDate
		AND DASDIA.StudentUSI = DA.StudentUSI
		AND DASDIA.SchoolId = DA.ResponsibilitySchoolId

	LEFT JOIN edfi.DisciplineActionStaff DAS WITH (NOLOCK)
		ON DAS.DisciplineActionIdentifier = DA.DisciplineActionIdentifier
		AND DAS.DisciplineDate = DA.DisciplineDate
		AND DAS.StudentUSI = DA.StudentUSI

	LEFT JOIN edfi.Staff Staff WITH (NOLOCK)
		ON Staff.StaffUSI = DAS.StaffUSI

	LEFT JOIN edfi.DisciplineActionStudentDisciplineIncidentBehaviorAssociation DASDIBA WITH (NOLOCK)
		ON DASDIBA.DisciplineActionIdentifier = DA.DisciplineActionIdentifier
		AND DASDIBA.DisciplineDate = DA.DisciplineDate
		AND DASDIBA.StudentUSI = DA.StudentUSI
		AND DASDIBA.SchoolId = DA.ResponsibilitySchoolId

	LEFT JOIN nmped.DisciplineActionExtension DAE WITH (NOLOCK)
		ON DAE.DisciplineActionIdentifier = DA.DisciplineActionIdentifier
		AND DAE.DisciplineDate = DA.DisciplineDate
		AND DAE.StudentUSI = DA.StudentUSI

	LEFT JOIN edfi.Descriptor Discipline WITH (NOLOCK)
		ON Discipline.DescriptorId = DAD.DisciplineDescriptorId

	LEFT JOIN edfi.Descriptor DisciplineActionLengthDifferenceReason WITH (NOLOCK)
		ON DisciplineActionLengthDifferenceReason.DescriptorId = DA.DisciplineActionLengthDifferenceReasonDescriptorId

	LEFT JOIN edfi.Descriptor Behavior WITH (NOLOCK)
		ON Behavior.DescriptorId = DASDIBA.BehaviorDescriptorId

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = DA.ResponsibilitySchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(DA.ResponsibilitySchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'