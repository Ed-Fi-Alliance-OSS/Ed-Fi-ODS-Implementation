/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Jon Hickam	
 * Email:	jon@redglobeinc.com
 * Date:	02-23-2023
 * Desc:	This script creates a studentEducationOrganizationAssociations view from Ed-Fi Resources
 *
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
		FROM edfi.StudentEducationOrganizationAssociationRace
		JOIN edfi.descriptor race
			ON race.DescriptorId = RaceDescriptorId

GO



CREATE OR ALTER VIEW nmped_rpt.vw_student_characteristic
AS  SELECT
'Y' yes
,SEOASC.StudentUSI
,SEOASC.EducationOrganizationId
,StudentCharacteristic.CodeValue Characteristic
,GiftedLevelOfIntegrationDescriptor.CodeValue GiftedLevelOfIntegrationDescriptorCodeValue
,GiftedLevelOfIntegrationDescriptor.ShortDescription GiftedLevelOfIntegrationShortDescription
FROM edfi.StudentEducationOrganizationAssociationStudentCharacteristic SEOASC
JOIN edfi.descriptor StudentCharacteristic
	ON StudentCharacteristicDescriptorId = DescriptorId
LEFT JOIN nmped.StudentEducationOrganizationAssociationStudentCharacteristicExtension SEOASCE
	ON SEOASC.StudentUSI = SEOASCE.StudentUSI
	AND SEOASC.EducationOrganizationId = SEOASCE.EducationOrganizationid 
LEFT JOIN edfi.descriptor GiftedLevelOfIntegrationDescriptor
	ON GiftedLevelOfIntegrationDescriptor.DescriptorId = SEOASCE.GiftedLevelOfIntegrationDescriptorId


GO



CREATE or ALTER VIEW nmped_rpt.vw_studentEducationOrganizationAssociations
AS SELECT
	s.StudentUniqueId
	,SUBSTRING(cast(SEOA.EducationOrganizationId AS VARCHAR(10)),3,3) DistrictCode
	,s.FirstName
	,s.LastSurname
	,s.BirthDate
	,EC2.NameOfInstitution DistrictName
	,SEOA.EducationOrganizationId LocalEducationAgencyId
	,SexDescriptor.CodeValue SexCodeValue
	,SexDescriptor.ShortDescription SexShortDescription
	,SEOA.HispanicLatinoEthnicity
	,SEOAE.Grade09Entry
	,DentalExaminationVerificationCodeDescriptor.CodeValue DentalExaminationVerificationCodeValue
	,DentalExaminationVerificationCodeDescriptor.ShortDescription DentalExaminationVerificationShortDescription
	,MilitaryFamilyDescriptor.CodeValue MilitaryFamilyCodeValue
	,MilitaryFamilyDescriptor.ShortDescription MilitaryFamilyShortDescription
	,GenderIdentityDescriptor.CodeValue GenderIdentityCodeValue
	,GenderIdentityDescriptor.ShortDescription GenderIdentityShortDescription
	,ISNULL(DisplacedHomemaker.yes, 'N') DisplacedHomemaker
	,ISNULL(ForeignExchange.yes, 'N') ForeignExchange
	,ISNULL(Form506.yes, 'N') Form506
	,ISNULL(Gifted.yes, 'N') Gifted
	,Gifted.GiftedLevelOfIntegrationDescriptorCodeValue
	,Gifted.GiftedLevelOfIntegrationShortDescription
	,ISNULL(SingleParent.yes, 'N') HomeSchooled
	,ISNULL(NP.yes, 'N') NotAParent
	,ISNULL(NS.yes, 'N') ParentNotSingle
	,ISNULL(Pregnant.yes, 'N') Pregnant
	,ISNULL(SingleParent.yes, 'N')  SingleParent
	,ISNULL(Section504.yes, 'N') Section504
	,SEOA_AD.ApartmentRoomSuiteNumber
	,SEOA_AD.BuildingSiteNumber
	,SEOA_AD.City
	,SEOA_AD.PostalCode
	,SEOA_AD.StateCode
    ,race1.Race race1
	,race2.Race race2
	,TribalDescriptor.CodeValue TribalCodeValue
	,TribalDescriptor.ShortDescription TribalShortDescription
FROM edfi.Student S WITH (NOLOCK)
INNER JOIN edfi.StudentEducationOrganizationAssociation SEOA 
	ON S.StudentUSI = SEOA.StudentUSI
INNER JOIN edfi.EducationOrganization EC2
	ON SEOA.EducationOrganizationId = EC2.EducationOrganizationId
LEFT JOIN edfi.descriptor SexDescriptor 
	ON SEOA.SexDescriptorId = SexDescriptor.DescriptorId
LEFT JOIN nmped.StudentEducationOrganizationAssociationExtension SEOAE
	on SEOAE.StudentUSI = SEOA.StudentUSI
	AND SEOAE.EducationOrganizationId = SEOA.EducationOrganizationId
LEFT JOIN edfi.Descriptor DentalExaminationVerificationCodeDescriptor
	ON SEOAE.DentalExaminationVerificationCodeDescriptorId = DentalExaminationVerificationCodeDescriptor.DescriptorId
LEFT JOIN edfi.descriptor MilitaryFamilyDescriptor
	ON SEOAE.MilitaryFamilyDescriptorId = MilitaryFamilyDescriptor.DescriptorId
Left JOIN edfi.Descriptor GenderIdentityDescriptor
	ON SEOAE.GenderIdentityDescriptorId = GenderIdentityDescriptor.DescriptorId
LEFT JOIN nmped_rpt.vw_student_characteristic DisplacedHomemaker
	ON SEOA.StudentUSI = DisplacedHomemaker.StudentUSI
	AND SEOA.EducationOrganizationId = DisplacedHomemaker.EducationOrganizationId
	AND DisplacedHomemaker.Characteristic = 'Displaced Homemaker'
LEFT JOIN nmped_rpt.vw_student_characteristic ForeignExchange
	ON SEOA.StudentUSI = ForeignExchange.StudentUSI
	AND SEOA.EducationOrganizationId = ForeignExchange.EducationOrganizationId
	AND ForeignExchange.Characteristic = 'Foreign Exchange'
LEFT JOIN nmped_rpt.vw_student_characteristic Form506
	ON SEOA.StudentUSI = Form506.StudentUSI
	AND SEOA.EducationOrganizationId = Form506.EducationOrganizationId
	AND Form506.Characteristic = 'Form 506'
LEFT JOIN nmped_rpt.vw_student_characteristic Gifted 
	ON SEOA.StudentUSI = Gifted.StudentUSI
	AND SEOA.EducationOrganizationId = Gifted.EducationOrganizationId
	AND Gifted.Characteristic = 'Gifted'
LEFT JOIN nmped_rpt.vw_student_characteristic HomeSchooled
	ON SEOA.StudentUSI = HomeSchooled.StudentUSI
	AND SEOA.EducationOrganizationId = HomeSchooled.EducationOrganizationId
	AND HomeSchooled.Characteristic = 'Home Schooled'
LEFT JOIN nmped_rpt.vw_student_characteristic NP
	ON SEOA.StudentUSI = NP.StudentUSI
	AND SEOA.EducationOrganizationId = NP.EducationOrganizationId
	AND NP.Characteristic = 'NP'
LEFT JOIN nmped_rpt.vw_student_characteristic NS
	ON SEOA.StudentUSI = NS.StudentUSI
	AND SEOA.EducationOrganizationId = NS.EducationOrganizationId
	AND NS.Characteristic = 'NS'
LEFT JOIN nmped_rpt.vw_student_characteristic Pregnant
	ON SEOA.StudentUSI = Pregnant.StudentUSI
	AND SEOA.EducationOrganizationId = Pregnant.EducationOrganizationId
	AND Pregnant.Characteristic = 'Pregnant'
LEFT JOIN nmped_rpt.vw_student_characteristic SingleParent
	ON SEOA.StudentUSI = SingleParent.StudentUSI
	AND SEOA.EducationOrganizationId = SingleParent.EducationOrganizationId
	AND SingleParent.Characteristic = 'S'
LEFT JOIN nmped_rpt.vw_student_characteristic  Section504
	ON SEOA.StudentUSI = Section504.StudentUSI
	AND SEOA.EducationOrganizationId = Section504.EducationOrganizationId
	AND Section504.Characteristic = 'Section 504'
LEFT JOIN 
	(
	SELECT  ApartmentRoomSuiteNumber
		,StudentUSI
		,EducationOrganizationId
		,BuildingSiteNumber
		,City 
		,PostalCode
		 ,StateDescriptor.CodeValue StateCode
	FROM  edfi.StudentEducationOrganizationAssociationAddress
	JOIN edfi.Descriptor StateDescriptor
		ON StudentEducationOrganizationAssociationAddress.StateAbbreviationDescriptorId = StateDescriptor.DescriptorId
	JOIN edfi.Descriptor AddressTypeDescriptor
		ON AddressTypeDescriptorId = AddressTypeDescriptor.DescriptorId
		AND AddressTypeDescriptor.CodeValue = 'Home'
	  ) as SEOA_AD
	ON SEOA.StudentUSI = SEOA_AD.StudentUSI
	AND SEOA.EducationOrganizationId = SEOA_AD.EducationOrganizationId
LEFT JOIN nmped_rpt.vw_student_race race1
	ON SEOA.StudentUSI = race1.StudentUSI
	AND SEOA.EducationOrganizationId = race1.EducationOrganizationId
	AND race1.race_rank = 1
LEFT JOIN nmped_rpt.vw_student_race race2
	ON SEOA.StudentUSI = race2.StudentUSI
	AND SEOA.EducationOrganizationId = race2.EducationOrganizationId
	AND race2.race_rank = 2
LEFT JOIN nmped_rpt.vw_student_race race3
	ON SEOA.StudentUSI = race3.StudentUSI
	AND SEOA.EducationOrganizationId = race3.EducationOrganizationId
	AND race3.race_rank = 3
LEFT JOIN nmped_rpt.vw_student_race race4
	ON SEOA.StudentUSI = race4.StudentUSI
	AND SEOA.EducationOrganizationId = race4.EducationOrganizationId
	AND race4.race_rank = 4
LEFT JOIN nmped_rpt.vw_student_race race5
	ON SEOA.StudentUSI = race5.StudentUSI
	AND SEOA.EducationOrganizationId = race5.EducationOrganizationId
	AND race5.race_rank = 5
LEFT JOIN edfi.StudentEducationOrganizationAssociationTribalAffiliation SEOA_TRIBAL
	ON SEOA.StudentUSI  = SEOA_TRIBAL.StudentUSI
	AND SEOA.EducationOrganizationId = SEOA_TRIBAL.EducationOrganizationId
LEFT JOIN edfi.Descriptor TribalDescriptor
	ON SEOA_TRIBAL.TribalAffiliationDescriptorId = TribalDescriptor.DescriptorId



	/*



select * from edfi.Descriptor
where namespace like '%AddressTypeDescriptor%'




*/

