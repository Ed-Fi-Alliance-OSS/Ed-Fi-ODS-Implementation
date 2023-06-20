/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	06-09-2023
 * Desc:	This script creates a student derived race view

 * Logic for derived race:
 *	Hispanic takes priority 
 *	If not hispanic
 *		If multiple races, then 'multi-racial'
 *		If one race, then Race.Description
 */

CREATE VIEW nmped_rpt.vw_studentDerivedRace AS 
SELECT DISTINCT
	 S.StudentUniqueId
	,S.StudentUSI
	,S.FirstName
	,S.LastSurname
	,CASE 
		WHEN HispanicLatinoEthnicity = 1 THEN 'Hispanic'
		ELSE CASE
				WHEN NumRaces > 1 THEN 'Multi-Racial'
				ELSE Race.Description
			 END
	 END AS							'Derived Race Ethnicity'
	,pvt.EducationOrganizationId
	,COALESCE(pvt.[American Indian/Alaskan Native], 'N')			'American Indian/Alaskan Native'
	,COALESCE(pvt.Asian, 'N')										'Asian'
	,COALESCE(pvt.[Black or African American], 'N')					'Black or African American'
	,COALESCE(pvt.Caucasian, 'N')									'Caucasian'
	,COALESCE(pvt.[Native Hawaiian or Other Pacific Islander], 'N') 'Native Hawaiian or Other Pacific Islander'
	,CASE 
		SEOA.HispanicLatinoEthnicity
		WHEN 1 THEN 'Y'
		WHEN 0 THEN 'N'
	 END AS							'HispanicLatinoEthnicity'
	,TribalAffiliation.CodeValue	'Tribal Code'
	,TribalAffiliation.Description	'Tribal Affiliation'
FROM 
	(
		SELECT
			  EducationOrganizationId
			 ,Race.Description [Race] 
			 ,StudentUSI
			 ,CASE
				WHEN Race.Description IS NOT NULL THEN 'Y'
			  END AS 'RaceIndicator'
			 ,COUNT(StudentUSI) OVER (PARTITION BY StudentUSI, EducationOrganizationId) AS 'NumRaces'
		FROM
			edfi.StudentEducationOrganizationAssociationRace SEOAR WITH (NOLOCK)
			JOIN edfi.Descriptor Race WITH (NOLOCK)
				ON Race.DescriptorId = SEOAR.RaceDescriptorId
	) AS src
PIVOT
	(
		MAX([RaceIndicator]) 
		FOR [Race] IN ([American Indian/Alaskan Native],[Asian],[Black or African American],[Caucasian],[Native Hawaiian or Other Pacific Islander])
	) AS pvt
	JOIN edfi.StudentEducationOrganizationAssociation SEOA WITH (NOLOCK)
		ON SEOA.StudentUSI = pvt.StudentUSI
		AND SEOA.EducationOrganizationId = pvt.EducationOrganizationId
	JOIN edfi.StudentEducationOrganizationAssociationRace SEOAR WITH (NOLOCK)
		ON SEOAR.StudentUSI = pvt.StudentUSI 
		AND SEOAR.EducationOrganizationId = pvt.EducationOrganizationId
	JOIN edfi.Descriptor Race WITH (NOLOCK)
		ON Race.DescriptorId = SEOAR.RaceDescriptorId
	JOIN edfi.Student S WITH (NOLOCK)	
		ON S.StudentUSI = SEOA.StudentUSI
	LEFT JOIN edfi.StudentEducationOrganizationAssociationTribalAffiliation SEOATA WITH (NOLOCK)
		ON SEOATA.StudentUSI = SEOA.StudentUSI
		AND SEOATA.EducationOrganizationId = SEOA.EducationOrganizationId
	LEFT JOIN edfi.Descriptor TribalAffiliation WITH (NOLOCK)
		ON TribalAffiliation.DescriptorId = SEOATA.TribalAffiliationDescriptorId