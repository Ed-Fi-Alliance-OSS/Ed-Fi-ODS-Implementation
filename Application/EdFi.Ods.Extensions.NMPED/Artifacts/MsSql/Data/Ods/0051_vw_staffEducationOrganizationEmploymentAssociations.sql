/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a staffEducationOrganizationEmploymentAssociations view
 *			from the staffEducationOrganizationEmploymentAssociations Ed-Fi Resource
 */

CREATE OR ALTER VIEW nmped_rpt.vw_staffEducationOrganizationEmploymentAssociations AS 
SELECT 
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName

	--resource documentation starts
	,StaffUniqueId
	,FirstName
	,LastSurname
	,EmploymentStatus.CodeValue									[EmploymentStatusCode]
	,EmploymentStatus.Description								[EmploymentStatusDescription]
	,SEOEA.HireDate
	,SEOEA.Department
	,SEOEA.EndDate
	,SEOEA.FullTimeEquivalency
	,SEOEA.HourlyWage
	,SEOEA.OfferDate
	,Separation.CodeValue										[SeparationCode]
	,Separation.Description										[SeparationDescription]
	,SeparationReason.CodeValue									[SeparationReasonCode]
	,SeparationReason.Description								[SeparationReasonDescription]
	
	,HighestCompletedLevelOfEducationInstitution.CodeValue		[HighestCompletedLevelOfEducationInstitutionCode]
	,HighestCompletedLevelOfEducationInstitution.Description	[HighestCompletedLevelOfEducationInstitutionDescription]
	,BaccalaureateLevelOfEducationInstitution.CodeValue			[BaccalaureateLevelOfEducationInstitutionCode]
	,BaccalaureateLevelOfEducationInstitution.Description		[BaccalaureateLevelOfEducationInstitutionDescription]
	,NationalCertified
	,TeacherOrPrincipalYearsInDistrict
	,TeacherOrPrincipalYearsOverall

	--table CreateDate/LastModifiedDate
	,SEOEA.CreateDate										
	,SEOEA.LastModifiedDate
FROM
	edfi.StaffEducationOrganizationEmploymentAssociation SEOEA WITH (NOLOCK)

	JOIN edfi.Staff S WITH (NOLOCK)
		ON S.StaffUSI = SEOEA.StaffUSI

	LEFT JOIN nmped.StaffEducationOrganizationEmploymentAssociationExtension SEOEAE WITH (NOLOCK)
		ON SEOEAE.EducationOrganizationId = SEOEA.EducationOrganizationId
		AND SEOEAE.EmploymentStatusDescriptorId = SEOEA.EmploymentStatusDescriptorId
		AND SEOEAE.HireDate = SEOEA.HireDate
		AND SEOEAE.StaffUSI = SEOEA.StaffUSI

	LEFT JOIN edfi.Descriptor EmploymentStatus WITH (NOLOCK)
		ON EmploymentStatus.DescriptorId = SEOEA.EmploymentStatusDescriptorId

	LEFT JOIN edfi.Descriptor Separation WITH (NOLOCK)
		ON Separation.DescriptorId = SEOEA.SeparationDescriptorId
	
	LEFT JOIN edfi.Descriptor SeparationReason WITH (NOLOCK)
		ON SeparationReason.DescriptorId = SEOEA.SeparationReasonDescriptorId

	LEFT JOIN edfi.Descriptor HighestCompletedLevelOfEducationInstitution WITH (NOLOCK)
		ON HighestCompletedLevelOfEducationInstitution.DescriptorId = SEOEAE.HighestCompletedLevelOfEducationInstitutionDescriptorId

	LEFT JOIN edfi.Descriptor BaccalaureateLevelOfEducationInstitution WITH (NOLOCK)
		ON BaccalaureateLevelOfEducationInstitution.DescriptorId = SEOEAE.BaccalaureateLevelOfEducationInstitutionDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOEA.EducationOrganizationId
