/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-23-2023
 * Desc:	This script creates a DisciplineIncident view from the 
 *			disciplineIncidents resource
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
		views.name = 'vw_disciplineIncidents'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_disciplineIncidents;
GO

CREATE VIEW nmped_rpt.vw_disciplineIncidents AS 
SELECT
	 SUBSTRING(CAST(DI.SchoolId AS VARCHAR(10)), 3, 3)		[DistrictCode]
	,EO2.NameOfInstitution									[DistrictName]
	,DI.SchoolId
	,EO.NameOfInstitution									[SchoolName]
	,DI.IncidentIdentifier
	,StaffUniqueId
	,DIB.BehaviorDescriptorId	
	,Behavior.CodeValue										[BehaviorCode]
	,Behavior.Description									[BehaviorDescription]
	,DIB.BehaviorDetailedDescription
	,CaseNumber
	,DIEP.DisciplineIncidentParticipationCodeDescriptorId	
	,DisciplineIncidentParticipationCode.CodeValue			[DisciplineIncidentParticipationCode] -- alias altered to prevent "CodeCode" 
	,DisciplineIncidentParticipationCode.Description		[DisciplineIncidentParticipationCodeDescription]
	,DIEP.FirstName											[ExternalParticipant_FirstName]
	,DIEP.LastSurname										[ExternalParticipant_LastSurname]
	,IncidentCost
	,IncidentDate
	,IncidentDescription
	,IncidentLocationDescriptorId
	,IncidentLocation.CodeValue								[IncidentLocationCode]
	,IncidentLocation.Description							[IncidentLocationDescription]
	,IncidentTime
	,ReportedToLawEnforcement
	,DI.ReporterDescriptionDescriptorId
	,ReporterDescription.CodeValue							[ReporterDescriptionCode]
	,ReporterDescription.Description						[ReporterDescription] -- alias altered to prevent "DescriptionDescription" 
	,ReporterName
	,DIW.WeaponDescriptorId
	,Weapon.CodeValue										[WeaponCode]
	,Weapon.Description										[WeaponDescription]
	,DIE.AlcoholRelatedIndicator
	,DIE.DrugRelatedIndicator
	,DIE.GangRelatedIndicator
	,DIE.HateCrimeRelatedIndicator
	,DIE.SeriousBodilyInjuryIndicator
	,DI.CreateDate
	,DI.LastModifiedDate
 FROM 
	edfi.DisciplineIncident DI WITH (NOLOCK)

	LEFT JOIN nmped.DisciplineIncidentExtension DIE WITH (NOLOCK)
		ON DIE.IncidentIdentifier = DI.IncidentIdentifier
		AND DIE.SchoolId = DI.SchoolId

	LEFT JOIN edfi.Staff S WITH (NOLOCK)
		ON S.StaffUSI = DI.StaffUSI
		
	LEFT JOIN edfi.DisciplineIncidentBehavior DIB WITH (NOLOCK)
		ON DIB.IncidentIdentifier = DI.IncidentIdentifier
		AND DIB.SchoolId = DI.SchoolId

	LEFT JOIN edfi.DisciplineIncidentExternalParticipant DIEP WITH (NOLOCK)
		ON DIEP.IncidentIdentifier = DI.IncidentIdentifier
		AND DIEP.SchoolId = DI.SchoolId

	LEFT JOIN edfi.DisciplineIncidentWeapon DIW WITH (NOLOCK)
		ON DIW.IncidentIdentifier = DI.IncidentIdentifier
		AND DIW.SchoolId = DI.SchoolId

	LEFT JOIN edfi.Descriptor IncidentLocation WITH (NOLOCK)
		ON IncidentLocation.DescriptorId = DI.IncidentLocationDescriptorId

	LEFT JOIN edfi.Descriptor ReporterDescription WITH (NOLOCK)
		ON ReporterDescription.DescriptorId = DI.ReporterDescriptionDescriptorId

	LEFT JOIN edfi.Descriptor Behavior WITH (NOLOCK)
		ON Behavior.DescriptorId = DIB.BehaviorDescriptorId

	LEFT JOIN edfi.Descriptor DisciplineIncidentParticipationCode WITH (NOLOCK)
		ON DisciplineIncidentParticipationCode.DescriptorId = DIEP.DisciplineIncidentParticipationCodeDescriptorId

	LEFT JOIN edfi.Descriptor Weapon WITH (NOLOCK)
		ON Weapon.DescriptorId = DIW.WeaponDescriptorId

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = DI.SchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(DI.SchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'
