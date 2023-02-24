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
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 * Questions to ask still:
 *		What is the order of the columns? Alphabetical, common sense, or resource documentation?
 *
 * This query will not show students with a missing record in the StudentSchoolAssociation table
 * Students that join a school, leave, and join another school will have two records in the table,
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
		views.name = 'vw_students'
		AND schemas.name = 'nmped_rpt'
)
DROP VIEW nmped_rpt.vw_students;
GO

CREATE VIEW nmped_rpt.vw_students AS 
SELECT 
	 SUBSTRING(CAST(SSA.SchoolId AS VARCHAR(10)), 3, 3)	'DistrictCode'
	,EO2.NameOfInstitution								'DistrictName'
	,SSA.SchoolId
	,EO.NameOfInstitution								'SchoolName'
	,[S].StudentUniqueId
--  ,[personReference] not collected
	,[S].BirthCity
	,[S].BirthCountryDescriptorId
	,[BirthCountry].CodeValue							'BirthCountryCode'							--BirthCountryDescriptorId
	,[BirthCountry].Description							'BirthCountryDescription'					--BirthCountryDescriptorId
	,[S].BirthDate
	,[S].BirthInternationalProvince
	,[S].BirthSexDescriptorId
	,[BirthSex].CodeValue								'BirthSexCode'								--BirthSexDescriptorId
	,[BirthSex].Description								'BirthSexDescription'						--BirthSexDescriptorId
	,[S].BirthStateAbbreviationDescriptorId
	,[BirthStateAbbreviation].CodeValue					'BirthStateAbbreviationCode'				--BirthStateAbbreviationDescriptorId
	,[BirthStateAbbreviation].Description				'BirthStateAbbreviationDescription'			--BirthStateAbbreviationDescriptorId
	,[S].CitizenshipStatusDescriptorId
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
	,[S].CreateDate										
	,[S].LastModifiedDate
FROM 
	edfi.Student S WITH (NOLOCK)

	LEFT JOIN edfi.Descriptor BirthCountry WITH (NOLOCK)
		ON BirthCountry.DescriptorId = S.BirthCountryDescriptorId

	LEFT JOIN edfi.Descriptor BirthSex WITH (NOLOCK)
		ON BirthSex.DescriptorId = S.BirthSexDescriptorId

	LEFT JOIN edfi.Descriptor BirthStateAbbreviation WITH (NOLOCK)
		ON BirthStateAbbreviation.DescriptorId = S.BirthStateAbbreviationDescriptorId

	LEFT JOIN edfi.Descriptor CitizenshipStatus WITH (NOLOCK)
		ON CitizenshipStatus.DescriptorId = S.CitizenshipStatusDescriptorId

	JOIN edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
		ON SSA.StudentUSI = S.StudentUSI

	JOIN edfi.EducationOrganization EO WITH (NOLOCK)
		ON EO.EducationOrganizationId = SSA.SchoolId
		AND EO.Discriminator = 'edfi.School'

	JOIN edfi.EducationOrganization EO2 WITH (NOLOCK)
		ON SUBSTRING(CAST(SSA.SchoolId AS VARCHAR(10)), 3, 3) = SUBSTRING(CAST(EO2.EducationOrganizationId AS VARCHAR(10)), 3, 3)
		AND EO2.Discriminator = 'edfi.LocalEducationAgency'
