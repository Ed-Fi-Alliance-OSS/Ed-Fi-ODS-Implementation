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

CREATE OR ALTER VIEW nmped_rpt.vw_disciplineIncidents AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	
	--resource documentation starts
	,DI.IncidentIdentifier
	,StaffUniqueId	
	,Behavior.CodeValue										[BehaviorCode]
	,Behavior.Description									[BehaviorDescription]
	,DIB.BehaviorDetailedDescription
	,CaseNumber	
	,DisciplineIncidentParticipationCode.CodeValue			[DisciplineIncidentParticipationCode] -- alias altered to prevent "CodeCode" 
	,DisciplineIncidentParticipationCode.Description		[DisciplineIncidentParticipationCodeDescription]
	,DIEP.FirstName											[ExternalParticipant_FirstName]
	,DIEP.LastSurname										[ExternalParticipant_LastSurname]
	,IncidentCost
	,IncidentDate
	,IncidentDescription
	,IncidentLocation.CodeValue								[IncidentLocationCode]
	,IncidentLocation.Description							[IncidentLocationDescription]
	,IncidentTime
	,ReportedToLawEnforcement
	,ReporterDescription.CodeValue							[ReporterDescriptionCode]
	,ReporterDescription.Description						[ReporterDescription] -- alias altered to prevent "DescriptionDescription" 
	,ReporterName
	,Weapon.CodeValue										[WeaponCode]
	,Weapon.Description										[WeaponDescription]
	,DIE.AlcoholRelatedIndicator
	,DIE.DrugRelatedIndicator
	,DIE.GangRelatedIndicator
	,DIE.HateCrimeRelatedIndicator
	,DIE.SeriousBodilyInjuryIndicator
	,DI.CreateDate
	,DI.LastModifiedDate
	,DI.Id AS [DisciplineIncident_Id]
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

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = DI.SchoolId
