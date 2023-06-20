/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a Student view from the Students Ed-Fi Resource
 *
 * Alt Id:	001 (Increment value each change)
 * By:		Collin Neville | App Dev I
 * Email:	collin.neville@ped.nm.gov
 * Date:	04/19/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 *
 *
 * This query will not show students with a missing record in the StudentSchoolAssociation table
 * Students that join a school, leave, and join another school will have two records in the table,
 */

CREATE OR ALTER VIEW nmped_rpt.vw_students AS 
--Alt Id: 001 - New CTE using control tables for descriptors
WITH cte_Descriptors AS (
	SELECT DescriptorId
		,CodeValue
		,Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE 
		DescriptorId IN (	SELECT * FROM edfi.CountryDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.SexDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.StateAbbreviationDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.CitizenshipStatusDescriptor WITH (NOLOCK)
						)
							

)

SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,[S].StudentUniqueId
--  ,[personReference] not collected
	,[S].BirthCity
	,[BirthCountry].CodeValue							'BirthCountryCode'							--BirthCountryDescriptorId
	,[BirthCountry].Description							'BirthCountryDescription'					--BirthCountryDescriptorId
	,[S].BirthDate
	,[S].BirthInternationalProvince
	,[BirthSex].CodeValue								'BirthSexCode'								--BirthSexDescriptorId
	,[BirthSex].Description								'BirthSexDescription'						--BirthSexDescriptorId
	,[BirthStateAbbreviation].CodeValue					'BirthStateAbbreviationCode'				--BirthStateAbbreviationDescriptorId
	,[BirthStateAbbreviation].Description				'BirthStateAbbreviationDescription'			--BirthStateAbbreviationDescriptorId
	,[CitizenshipStatus].CodeValue						'CitizenshipStatusCode'						--CitizenshipStatusDescriptorId
	,[CitizenshipStatus].Description					'CitizenshipStatusDescription'				--CitizenshipStatusDescriptorId
	,[S].DateEnteredUS
	,[S].FirstName										
	,[S].GenerationCodeSuffix							
--  ,[identificationDocuments] not collected
	,[S].LastSurname									
	,[S].MaidenName										
	,[S].MiddleName										
	,[S].MultipleBirthStatus
--  ,[otherNames] not collected
--	,[personalIdentificationDocuments] not collected
	,[S].PersonalTitlePrefix							
--	,[visas] not collected

	--table CreateDate/LastModifiedDate
	,[S].CreateDate										
	,[S].LastModifiedDate
FROM 
	edfi.Student S WITH (NOLOCK)

	JOIN edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
		ON SSA.StudentUSI = S.StudentUSI

-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
	LEFT JOIN cte_Descriptors BirthCountry WITH (NOLOCK)
		ON BirthCountry.DescriptorId = S.BirthCountryDescriptorId

	LEFT JOIN cte_Descriptors BirthSex WITH (NOLOCK)
		ON BirthSex.DescriptorId = S.BirthSexDescriptorId

	LEFT JOIN cte_Descriptors BirthStateAbbreviation WITH (NOLOCK)
		ON BirthStateAbbreviation.DescriptorId = S.BirthStateAbbreviationDescriptorId

	LEFT JOIN cte_Descriptors CitizenshipStatus WITH (NOLOCK)
		ON CitizenshipStatus.DescriptorId = S.CitizenshipStatusDescriptorId
-- Alt Id: 001 - End

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId