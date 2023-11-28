/* � NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	11-16-2023
 * Desc:	This script creates a staff derived race view

 * Logic for derived race:
 *	Hispanic takes priority 
 *	If not hispanic
 *		If multiple races, then 'multi-racial'
 *		If one race, then Race.Description
 */

CREATE OR ALTER VIEW [nmped_rpt].[vw_staffDerivedRace] AS 
SELECT DISTINCT
	 S.StaffUniqueId
	,S.StaffUSI
	,S.FirstName
	,S.LastSurname
	,CASE 
		WHEN HispanicLatinoEthnicity = 1 THEN						'Hispanic'
		ELSE CASE
				WHEN NumRaces > 1 THEN								'Multi-Racial'
				ELSE Race.Description
			 END
	 END AS															'Derived Race Ethnicity'
	,COALESCE(pvt.[American Indian/Alaskan Native], 'N')			'American Indian/Alaskan Native'
	,COALESCE(pvt.Asian, 'N')										'Asian'
	,COALESCE(pvt.[Black or African American], 'N')					'Black or African American'
	,COALESCE(pvt.Caucasian, 'N')									'Caucasian'
	,COALESCE(pvt.[Native Hawaiian or Other Pacific Islander], 'N') 'Native Hawaiian or Other Pacific Islander'
	,CASE 
		S.HispanicLatinoEthnicity
		WHEN 1 THEN 'Y'
		WHEN 0 THEN 'N'
	 END AS															'HispanicLatinoEthnicity'
	,TribalAffiliation.CodeValue									'Tribal Code'
	,TribalAffiliation.Description									'Tribal Affiliation'
FROM 
	(
		SELECT
			  Race.Description [Race] 
			 ,SR.StaffUSI
			 ,CASE
				WHEN Race.Description IS NOT NULL THEN 'Y'
			  END AS 'RaceIndicator'
			 ,COUNT(SR.StaffUSI) OVER (PARTITION BY SR.StaffUSI) AS 'NumRaces'
		FROM
			edfi.StaffRace SR WITH (NOLOCK)
			JOIN edfi.Descriptor Race WITH (NOLOCK)
				ON Race.DescriptorId = SR.RaceDescriptorId
	) AS src
	PIVOT
	(
		MAX([RaceIndicator]) 
		FOR [Race] IN ([American Indian/Alaskan Native],[Asian],[Black or African American],[Caucasian],[Native Hawaiian or Other Pacific Islander])
	) AS pvt
	JOIN edfi.StaffRace SR WITH (NOLOCK)
		ON SR.StaffUSI = pvt.StaffUSI
	JOIN edfi.Descriptor Race WITH (NOLOCK)
		ON Race.DescriptorId = SR.RaceDescriptorId
	JOIN edfi.Staff S WITH (NOLOCK)	
		ON S.StaffUSI = pvt.StaffUSI
	LEFT JOIN edfi.StaffTribalAffiliation STA WITH (NOLOCK)
		ON STA.StaffUSI = pvt.StaffUSI
	LEFT JOIN edfi.Descriptor TribalAffiliation WITH (NOLOCK)
		ON TribalAffiliation.DescriptorId = STA.TribalAffiliationDescriptorId
WHERE 
	StaffUniqueId NOT IN ('333333333','555555555', '777777777', '888888888')