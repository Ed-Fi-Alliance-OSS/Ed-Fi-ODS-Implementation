/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	05-05-2023
 * Desc:	This script creates a StudentEdOrgAssoc
 *			view, to serve as the base report.
 * 
 */

WITH cte_Descriptors AS (
	SELECT 
		 DescriptorId
		,CodeValue
		,Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE
		DescriptorId IN (
			SELECT DescriptorId FROM edfi.LimitedEnglishProficiencyDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM edfi.SexDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM nmped.GenderIdentityDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM nmped.DentalExaminationVerificationCodeDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM nmped.MilitaryFamilyDescriptor WITH (NOLOCK) 
			UNION
			SELECT DescriptorId FROM nmped.GenderIdentityDescriptor WITH (NOLOCK) 
	)
)

SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName 
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName 

	,StudentUniqueId
	,FirstName
	,LastSurname
	,Sex.CodeValue								'Sex Code'
	,Sex.Description							'Sex Description'
	,HispanicLatinoEthnicity
	,LimitedEnglishProficiency.CodeValue		'LimitedEnglishProficiencyCode'
	,LimitedEnglishProficiency.Description		'LimitedEnglishProficiencyDescription'
	,GenderIdentity.CodeValue					'GenderIdentityCode'
	,GenderIdentity.Description					'GenderIdentityDescription'
	,MilitaryFamily.CodeValue					'MilitaryFamilyCode'
	,MilitaryFamily.Description					'MilitaryFamilyDescription'
	,DentalExaminationVerification.CodeValue	'DentalExaminationVerificationCode'
	,DentalExaminationVerification.Description	'DentalExaminationVerificationDescription'
	,Grade09Entry

FROM
	edfi.StudentEducationOrganizationAssociation SEOA WITH (NOLOCK)

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOA.EducationOrganizationId
	
	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SEOA.StudentUSI

	LEFT JOIN nmped.StudentEducationOrganizationAssociationExtension SEOAE WITH (NOLOCK)
		ON SEOAE.EducationOrganizationId = SEOA.EducationOrganizationId
		AND SEOAE.StudentUSI = SEOA.StudentUSI

	LEFT JOIN cte_Descriptors Sex
		ON Sex.DescriptorId = SEOA.SexDescriptorId

	LEFT JOIN cte_Descriptors LimitedEnglishProficiency
		ON LimitedEnglishProficiency.DescriptorId = SEOA.LimitedEnglishProficiencyDescriptorId

	LEFT JOIN cte_Descriptors GenderIdentity
		ON GenderIdentity.DescriptorId = SEOAE.GenderIdentityDescriptorId

	LEFT JOIN cte_Descriptors MilitaryFamily
		ON MilitaryFamily.DescriptorId = SEOAE.MilitaryFamilyDescriptorId

	LEFT JOIN cte_Descriptors DentalExaminationVerification
		ON DentalExaminationVerification.DescriptorId = SEOAE.DentalExaminationVerificationCodeDescriptorId
