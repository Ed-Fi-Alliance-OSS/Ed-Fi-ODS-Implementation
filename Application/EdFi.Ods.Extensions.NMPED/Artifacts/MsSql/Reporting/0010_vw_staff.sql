/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	This script creates a staff view from Ed-Fi Resources
 *
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */

CREATE or alter view nmped_rpt.vw_staff_race AS
		SELECT StaffUSI,
		race.CodeValue race,
		RANK () OVER ( PARTITION BY StaffUSI
		ORDER BY race.descriptorId 
	   ) race_rank
		FROM edfi.StaffRace
		JOIN edfi.descriptor race
			ON race.DescriptorId = StaffRace.RaceDescriptorId

GO


CREATE or ALTER VIEW nmped_rpt.vw_staff_Employment AS 
SELECT 
	 s.StaffUniqueId
	 ,s.StaffUSI
	 ,SEOEA.EducationOrganizationId		LocalEducationAgencyId
	 ,SUBSTRING(CAST(SEOEA.EducationOrganizationId AS VARCHAR(10)), 3, 3)	'DistrictCode'
	 ,SexDescriptor.CodeValue				'SexCode'
	 ,EO2.NameOfInstitution								'DistrictName'
	 ,S.MiddleName 
	 ,s.LastSurname 
	 ,s.BirthDate 
	 ,SEOEAN.teacherOrPrincipalYearsOverall
	 ,SEOEAN.teacherOrPrincipalYearsInDistrict
	 ,SEOEAN.NationalCertified
	 ,HighestCompletedLevelOfEducationDescriptor.CodeValue HighestCompletedLevelOfEducationDescriptor
	 ,HighestCompletedLevelOfEducationInstitutionDescriptor.CodeValue HighestCompletedLevelOfEducationInstitutionDescriptor
	 ,BaccalaureateLevelOfEducationInstitutionDescriptor.CodeValue BaccalaureateLevelOfEducationInstitutionDescriptor
	 ,S.HispanicLatinoEthnicity	 
	 ,EmploymentStatusDescriptor.CodeValue EmploymentStatusDescriptor
	 ,SEOEA.HireDate
	 ,SEOEA.EndDate
	 ,SEOEA.HourlyWage
	 ,SeparationReasonDescriptor.CodeValue SeparationReasonDescriptor
	 ,SEOEA.FullTimeEquivalency
	 ,vw_sr1.Race RaceCode1
	 ,vw_sr2.Race RaceCode2
	 ,vw_sr3.Race RaceCode3
	 ,TribalAffiliation.CodeValue TribalAffiliation
FROM 
	edfi.Staff S WITH (NOLOCK)
	RIGHT JOIN edfi.StaffEducationOrganizationEmploymentAssociation SEOEA
		ON S.StaffUSI = SEOEA.StaffUSI
    RIGHT JOIN edfi.EducationOrganization EO2 WITH  (NOLOCK)
		ON EO2.EducationOrganizationId = SEOEA.EducationOrganizationId
	LEFT JOIN edfi.Descriptor SexDescriptor WITH (NOLOCK)
		ON SexDescriptor.DescriptorId = S.SexDescriptorId
	LEFT JOIN nmped.StaffEducationOrganizationEmploymentAssociationExtension SEOEAN WITH (NOLOCK)
		ON SEOEAN.EducationOrganizationId = SEOEA.EducationOrganizationId
		AND SEOEAN.StaffUSI = SEOEA.StaffUSI
	LEFT JOIN edfi.Descriptor HighestCompletedLevelOfEducationDescriptor WITH (NOLOCK)
		ON HighestCompletedLevelOfEducationDescriptor.DescriptorId =S.HighestCompletedLevelOfEducationDescriptorId
	LEFT JOIN edfi.descriptor BaccalaureateLevelOfEducationInstitutionDescriptor WITH (NOLOCK)
		ON SEOEAN.BaccalaureateLevelOfEducationInstitutionDescriptorId = BaccalaureateLevelOfEducationInstitutionDescriptor.DescriptorId
    LEFT JOIN edfi.descriptor EmploymentStatusDescriptor WITH (NOLOCK)
		ON EmploymentStatusDescriptor.DescriptorId = SEOEA.EmploymentStatusDescriptorId
	LEFT JOIN nmped_rpt.vw_staff_race vw_sr1 WITH (NOLOCK)
		ON vw_sr1.staffUsi = s.StaffUSI
		AND vw_sr1.race_rank = 1
	LEFT JOIN nmped_rpt.vw_staff_race vw_sr2 WITH (NOLOCK)
		ON vw_sr2.staffUsi = s.StaffUSI
		AND vw_sr2.race_rank = 2
	LEFT JOIN nmped_rpt.vw_staff_race vw_sr3 WITH (NOLOCK)
		ON vw_sr3.staffUsi = s.StaffUSI
		AND vw_sr3.race_rank = 3
	LEFT JOIN edfi.Descriptor HighestCompletedLevelOfEducationInstitutionDescriptor WITH (NOLOCK)
		ON HighestCompletedLevelOfEducationInstitutionDescriptor.descriptorId = SEOEAN.HighestCompletedLevelOfEducationInstitutionDescriptorId
	LEFT JOIN edfi.Descriptor  SeparationReasonDescriptor WITH (NOLOCK)
		ON SeparationReasonDescriptor.DescriptorId = SEOEA.SeparationReasonDescriptorId
	LEFT JOIN
	(
	SELECT StaffUSI,
		Descriptor.CodeValue,
		RANK () OVER ( PARTITION BY StaffUSI
		ORDER BY Descriptor.descriptorId 
	   ) rk 
	FROM edfi.StaffTribalAffiliation 
	JOIN edfi.Descriptor WITH (NOLOCK)
		on Descriptor.DescriptorId = StaffTribalAffiliation.TribalAffiliationDescriptorId) TribalAffiliation
	ON TribalAffiliation.StaffUSI = S.StaffUSI

	go
	




CREATE or ALTER VIEW nmped_rpt.vw_staff_Assignment AS 
SELECT 
	 s.StaffUniqueId
	 ,s.StaffUSI
	 ,School.NameOfInstitution SchoolName
	 ,SUBSTRING(CAST(SEOAA.EducationOrganizationId AS VARCHAR(10)), 3, 3)	'DistrictCode'
	 ,EO2.NameOfInstitution								'DistrictName'
	 ,S.MiddleName 
	 ,s.LastSurname 
	 ,s.BirthDate
	 ,EmploymentStatusDescriptor.CodeValue EmploymentStatusDescriptor
	 ,SEOAA.fullTimeEquivalency
	 ,staffClassificationDescriptor.CodeValue staffClassificationDescriptor
    ,SEOAA.beginDate
	,SIC.IdentificationCode IdentificationCode
	FROM 
	edfi.Staff S WITH (NOLOCK)
	RIGHT JOIN edfi.StaffEducationOrganizationAssignmentAssociation SEOAA
		ON S.StaffUSI = SEOAA.StaffUSI
    RIGHT JOIN edfi.EducationOrganization School WITH  (NOLOCK)
		ON School.EducationOrganizationId = SEOAA.EducationOrganizationId
	RIGHT JOIN edfi.EducationOrganization EO2
		ON EO2.EducationOrganizationId =   SEOAA.EmploymentEducationOrganizationId
	LEFT JOIN edfi.Descriptor EmploymentStatusDescriptor WITH (NOLOCK)
		ON EmploymentStatusDescriptor.DescriptorId = SEOAA.EmploymentStatusDescriptorId
	LEFT JOIN edfi.Descriptor staffClassificationDescriptor
		ON staffClassificationDescriptor.DescriptorId = SEOAA.StaffClassificationDescriptorId
	LEFT JOIN 
		(
		select MAX(IdentificationCode) IdentificationCode,
		StaffUSI
		from edfi.StaffIdentificationCode
		JOIN edfi.descriptor StaffIdentificationSystemDescriptor
			ON StaffIdentificationSystemDescriptor.DescriptorId = StaffIdentificationCode.StaffIdentificationSystemDescriptorId
		where namespace like '%StaffIdentificationSystemDescriptor%'
		and   CodeValue = 'SSN'
		GROUP BY StaffUSI) SIC
		ON SIC.StaffUSI = S.StaffUSI
	
