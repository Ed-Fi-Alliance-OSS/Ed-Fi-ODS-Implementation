/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	03-7-2023
 * Desc:	This script provides an overview of a student. It includes enrollment data from studentSchoolAssociation and demographics from StudentEducationOrganization
 * Alt Id:		 001 (Increment value each change)
 * By:			'Updaters Name' | 'Creators Title'
 * Email:		'Updaters Email'
 * Date:		'Date Updated'
 * Alt Desc:	'Description of the change'
 *
 */



 CREATE or alter view nmped_rpt.vw_student_race AS
		SELECT StudentUSI,
		EducationOrganizationId,
		race.CodeValue race,
		RANK () OVER ( PARTITION BY StudentUSI
		ORDER BY race.descriptorId 
	   ) race_rank
		FROM edfi.StudentEducationOrganizationAssociationRace  WITH (NOLOCK)
		JOIN edfi.descriptor race  WITH (NOLOCK)
			ON race.DescriptorId = RaceDescriptorId

GO



CREATE OR ALTER VIEW nmped_rpt.vw_student_characteristic
AS  SELECT
'Y' yes
,SEOASC.StudentUSI
,SEOASC.EducationOrganizationId
,StudentCharacteristic.CodeValue Characteristic
,SEOASC.StudentCharacteristicDescriptorId
FROM edfi.StudentEducationOrganizationAssociationStudentCharacteristic SEOASC  WITH (NOLOCK)
JOIN edfi.descriptor StudentCharacteristic  WITH (NOLOCK)
	ON StudentCharacteristicDescriptorId = DescriptorId


GO

CREATE OR ALTER VIEW nmped_rpt.vw_student_totals
AS SELECT
	s.StudentUniqueId
	,s.FirstName
	,s.LastSurname
	,s.BirthDate
	,s.DateEnteredUS
	,ssa.schoolId
	,school_EO.NameOfInstitution SchoolName
	,district_EO.NameOfInstitution DistrictName
	,SUBSTRING(cast(school.LocalEducationAgencyId AS VARCHAR(10)),3,3) DistrictCode
	,SSA.Entrydate
	,SSA.ExitWithdrawDate
	,SSA.RepeatGradeIndicator
	,EntryTypeDescriptor.CodeValue EntryTypeCode
	,EntryTypeDescriptor.ShortDescription EntryTypeShortDescription
	,ExitWithdrawTypeDescriptor.CodeValue ExitWithdrawTypeCode
	,ExitWithdrawTypeDescriptor.ShortDescription ExitWithdrawTypeShortDescription
	,EntryGradeLevelDescriptor.CodeValue grade
	,BirthSexDescriptor.CodeValue BirthSexCode

	-- from studentEducationOrganizationAssociation
	,SEOA.EducationOrganizationId SEOA_EducationOrganizationId
	,SEOA_EO.NameOfInstitution SEOA_NameOfInstitution
	,SEOA_EO.Discriminator SEOA_Discriminator
	--,SexDescriptor.CodeValue BirthSexCode
	,SEOA.HispanicLatinoEthnicity
	,SEOAE.Grade09Entry
	,DentalExaminationVerificationCodeDescriptor.CodeValue DentalExaminationVerificationCode
	,DentalExaminationVerificationCodeDescriptor.ShortDescription DentalExaminationVerificationDescription
	,MilitaryFamilyDescriptor.CodeValue MilitaryFamilyCode
	,MilitaryFamilyDescriptor.ShortDescription MilitaryFamilyDescription
	,GenderIdentityDescriptor.CodeValue GenderIdentityCode
	,GenderIdentityDescriptor.ShortDescription GenderIdentityDescription
	,ISNULL(DisplacedHomemaker.yes, 'N') DisplacedHomemaker
	,ISNULL(ForeignExchange.yes, 'N') ForeignExchange
	,ISNULL(Form506.yes, 'N') Form506
	,ISNULL(Gifted.yes, 'N') Gifted
	,GiftedLevelOfIntegrationDescriptor.CodeValue GiftedLevelOfIntegrationDescriptorCode
	,GiftedLevelOfIntegrationDescriptor.ShortDescription GiftedLevelOfIntegrationDescription
	,ISNULL(SingleParent.yes, 'N') HomeSchooled
	,ISNULL(NP.yes, 'N') NotAParent
	,ISNULL(NS.yes, 'N') ParentNotSingle
	,ISNULL(Pregnant.yes, 'N') Pregnant
	,ISNULL(SingleParent.yes, 'N')  SingleParent
	,ISNULL(Section504.yes, 'N') Section504
	/*
	,SEOA_AD.ApartmentRoomSuiteNumber
	,SEOA_AD.BuildingSiteNumber
	,SEOA_AD.City
	,SEOA_AD.PostalCode
	,SEOA_AD.StateCode
    */
	,race1.Race race1
	,race2.Race race2
	,race3.Race race3
	,race4.Race race4
	,race5.Race race5
	,TribalDescriptor.CodeValue TribalCode
	,TribalDescriptor.ShortDescription TribalDescription


	-- digital equity
	,primaryLearningDeviceAwayFromSchoolDescriptor.CodeValue primaryLearningDeviceAwayFromSchoolDescriptorCode
	,primaryLearningDeviceAwayFromSchoolDescriptor.ShortDescription primaryLearningDeviceAwayFromSchoolDescriptorDecription
	,primaryLearningDeviceProviderDescriptor.codeValue primaryLearningDeviceProviderDescriptorCode
	,primaryLearningDeviceProviderDescriptor.ShortDescription primaryLearningDeviceProviderDescriptorDescription
	,primaryLearningDeviceAccessDescriptor.CodeValue primaryLearningDeviceAccessDescriptorCode
	,primaryLearningDeviceAccessDescriptor.ShortDescription primaryLearningDeviceAccessDescriptorDescription
	,InternetPerformanceInResidenceDescriptor.CodeValue InternetPerformanceInResidenceCode
	,InternetPerformanceInResidenceDescriptor.ShortDescription InternetPerformanceInResidenceDescription

FROM edfi.Student S WITH (NOLOCK)
INNER JOIN edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
	ON S.StudentUSI = SSA.StudentUSI
INNER JOIN edfi.School WITH (NOLOCK)
	ON SSA.SchoolId = School.SchoolId
INNER JOIN edfi.Educationorganization school_EO WITH (NOLOCK)
	ON school_EO.EducationOrganizationId = SSA.SchoolId
INNER JOIN edfi.Educationorganization district_EO WITH (NOLOCK)
	ON School.LocalEducationAgencyId = district_EO.EducationOrganizationid
LEFT JOIN  edfi.descriptor  EntryGradeLevelDescriptor WITH (NOLOCK)
	ON SSA.EntryGradeLevelDescriptorId = EntryGradeLevelDescriptor.DescriptorId
LEFT JOIN edfi.Descriptor EntryTypeDescriptor WITH (NOLOCK)
	ON SSA.EntryTypeDescriptorId = EntryTypeDescriptor.descriptorId
LEFT JOIN edfi.Descriptor ExitWithdrawTypeDescriptor WITH (NOLOCK)
	ON SSA.ExitWithdrawTypeDescriptorId = ExitWithdrawTypeDescriptor.DescriptorId
INNER JOIN edfi.descriptor BirthSexDescriptor  WITH (NOLOCK)
	ON s.BirthSexDescriptorId = BirthSexDescriptor.DescriptorId

--demographics from studentEducationOrganizationAssociation
INNER JOIN edfi.StudentEducationOrganizationAssociation SEOA WITH (NOLOCK) 
	ON S.StudentUSI = SEOA.StudentUSI
	AND (SEOA.EducationOrganizationId = School.LocalEducationAgencyId OR
		SEOA.EducationOrganizationId = School.SchoolId)
INNER JOIN edfi.EducationOrganization SEOA_EO WITH (NOLOCK)
	ON SEOA.EducationOrganizationId = SEOA_EO.EducationOrganizationId
-- LEFT JOIN edfi.descriptor SexDescriptor  WITH (NOLOCK)
--	ON SEOA.SexDescriptorId = SexDescriptor.DescriptorId
LEFT JOIN nmped.StudentEducationOrganizationAssociationExtension SEOAE WITH (NOLOCK)
	on SEOAE.StudentUSI = SEOA.StudentUSI
	AND SEOAE.EducationOrganizationId = SEOA.EducationOrganizationId
LEFT JOIN edfi.Descriptor DentalExaminationVerificationCodeDescriptor WITH (NOLOCK)
	ON SEOAE.DentalExaminationVerificationCodeDescriptorId = DentalExaminationVerificationCodeDescriptor.DescriptorId
LEFT JOIN edfi.descriptor MilitaryFamilyDescriptor WITH (NOLOCK)
	ON SEOAE.MilitaryFamilyDescriptorId = MilitaryFamilyDescriptor.DescriptorId
Left JOIN edfi.Descriptor GenderIdentityDescriptor WITH (NOLOCK)
	ON SEOAE.GenderIdentityDescriptorId = GenderIdentityDescriptor.DescriptorId

-- student characteristics
LEFT JOIN nmped_rpt.vw_student_characteristic DisplacedHomemaker WITH (NOLOCK)
	ON SEOA.StudentUSI = DisplacedHomemaker.StudentUSI
	AND SEOA.EducationOrganizationId = DisplacedHomemaker.EducationOrganizationId
	AND DisplacedHomemaker.Characteristic = 'Displaced Homemaker'
LEFT JOIN nmped_rpt.vw_student_characteristic ForeignExchange WITH (NOLOCK)
	ON SEOA.StudentUSI = ForeignExchange.StudentUSI
	AND SEOA.EducationOrganizationId = ForeignExchange.EducationOrganizationId
	AND ForeignExchange.Characteristic = 'Foreign Exchange'
LEFT JOIN nmped_rpt.vw_student_characteristic Form506 WITH (NOLOCK)
	ON SEOA.StudentUSI = Form506.StudentUSI
	AND SEOA.EducationOrganizationId = Form506.EducationOrganizationId
	AND Form506.Characteristic = 'Form 506'
LEFT JOIN nmped_rpt.vw_student_characteristic Gifted WITH (NOLOCK)
	ON SEOA.StudentUSI = Gifted.StudentUSI
	AND SEOA.EducationOrganizationId = Gifted.EducationOrganizationId
	AND Gifted.Characteristic = 'Gifted'
LEFT JOIN nmped.StudentEducationOrganizationAssociationStudentCharacteristicExtension SEOASCE  WITH (NOLOCK)
	ON SEOA.StudentUSI = SEOASCE.StudentUSI
	AND SEOA.StudentUSI = SEOASCE.EducationOrganizationid 
	AND Gifted.StudentCharacteristicDescriptorId = SEOASCE.StudentCharacteristicDescriptorId
LEFT JOIN edfi.descriptor GiftedLevelOfIntegrationDescriptor  WITH (NOLOCK)
	ON GiftedLevelOfIntegrationDescriptor.DescriptorId = SEOASCE.GiftedLevelOfIntegrationDescriptorId

LEFT JOIN nmped_rpt.vw_student_characteristic HomeSchooled WITH (NOLOCK)
	ON SEOA.StudentUSI = HomeSchooled.StudentUSI
	AND SEOA.EducationOrganizationId = HomeSchooled.EducationOrganizationId
	AND HomeSchooled.Characteristic = 'Home Schooled' 
LEFT JOIN nmped_rpt.vw_student_characteristic NP WITH (NOLOCK)
	ON SEOA.StudentUSI = NP.StudentUSI
	AND SEOA.EducationOrganizationId = NP.EducationOrganizationId
	AND NP.Characteristic = 'NP'
LEFT JOIN nmped_rpt.vw_student_characteristic NS WITH (NOLOCK)
	ON SEOA.StudentUSI = NS.StudentUSI
	AND SEOA.EducationOrganizationId = NS.EducationOrganizationId
	AND NS.Characteristic = 'NS'
LEFT JOIN nmped_rpt.vw_student_characteristic Pregnant WITH (NOLOCK)
	ON SEOA.StudentUSI = Pregnant.StudentUSI
	AND SEOA.EducationOrganizationId = Pregnant.EducationOrganizationId
	AND Pregnant.Characteristic = 'Pregnant'
LEFT JOIN nmped_rpt.vw_student_characteristic SingleParent WITH (NOLOCK)
	ON SEOA.StudentUSI = SingleParent.StudentUSI
	AND SEOA.EducationOrganizationId = SingleParent.EducationOrganizationId
	AND SingleParent.Characteristic = 'S'
LEFT JOIN nmped_rpt.vw_student_characteristic  Section504  WITH (NOLOCK)
	ON SEOA.StudentUSI = Section504.StudentUSI
	AND SEOA.EducationOrganizationId = Section504.EducationOrganizationId
	AND Section504.Characteristic = 'Section 504'


-- race
LEFT JOIN nmped_rpt.vw_student_race race1 WITH (NOLOCK)
	ON SEOA.StudentUSI = race1.StudentUSI
	AND SEOA.EducationOrganizationId = race1.EducationOrganizationId
	AND race1.race_rank = 1
LEFT JOIN nmped_rpt.vw_student_race race2 WITH (NOLOCK)
	ON SEOA.StudentUSI = race2.StudentUSI
	AND SEOA.EducationOrganizationId = race2.EducationOrganizationId
	AND race2.race_rank = 2
LEFT JOIN nmped_rpt.vw_student_race race3 WITH (NOLOCK)
	ON SEOA.StudentUSI = race3.StudentUSI
	AND SEOA.EducationOrganizationId = race3.EducationOrganizationId
	AND race3.race_rank = 3
LEFT JOIN nmped_rpt.vw_student_race race4 WITH (NOLOCK)
	ON SEOA.StudentUSI = race4.StudentUSI
	AND SEOA.EducationOrganizationId = race4.EducationOrganizationId
	AND race4.race_rank = 4
LEFT JOIN nmped_rpt.vw_student_race race5 WITH (NOLOCK)
	ON SEOA.StudentUSI = race5.StudentUSI
	AND SEOA.EducationOrganizationId = race5.EducationOrganizationId
	AND race5.race_rank = 5
LEFT JOIN edfi.StudentEducationOrganizationAssociationTribalAffiliation SEOA_TRIBAL WITH (NOLOCK)
	ON SEOA.StudentUSI  = SEOA_TRIBAL.StudentUSI
	AND SEOA.EducationOrganizationId = SEOA_TRIBAL.EducationOrganizationId
LEFT JOIN edfi.Descriptor TribalDescriptor WITH (NOLOCK)
	ON SEOA_TRIBAL.TribalAffiliationDescriptorId = TribalDescriptor.DescriptorId
LEFT JOIN edfi.descriptor primaryLearningDeviceAwayFromSchoolDescriptor
	ON SEOA.PrimaryLearningDeviceAccessDescriptorId = primaryLearningDeviceAwayFromSchoolDescriptor.DescriptorId
LEFT JOIN edfi.descriptor primaryLearningDeviceProviderDescriptor
	ON SEOA.primaryLearningDeviceProviderDescriptorId = primaryLearningDeviceProviderDescriptor.DescriptorId
LEFT JOIN edfi.descriptor primaryLearningDeviceAccessDescriptor
	ON SEOA.primaryLearningDeviceAccessDescriptorId = primaryLearningDeviceAccessDescriptor.DescriptorId
LEFT JOIN edfi.Descriptor InternetPerformanceInResidenceDescriptor
	ON InternetPerformanceInResidenceDescriptor.DescriptorId = SEOA.InternetPerformanceInResidenceDescriptorId
