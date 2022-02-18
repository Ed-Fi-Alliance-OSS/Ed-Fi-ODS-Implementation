/* SpecialEducationLevelOfIntegration TEST  */
/*IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE [Namespace]='uri://nmped.org/SpecialEducationLevelOfIntegrationDescriptor')
BEGIN*/
	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SpecialEducationLevelOfIntegrationDescriptor','1','1 = Less than 10% of the day (minimum or "A")','1 = Less than 10% of the day (minimum or "A")');
	INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SpecialEducationLevelOfIntegrationDescriptor','2','2 = 11% to 49% of the day (moderate or "B")','2 = 11% to 49% of the day (moderate or "B")');
	INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SpecialEducationLevelOfIntegrationDescriptor','3','3 = 50% of the day or more, but not a full day (extensive or "C")','3 = 50% of the day or more, but not a full day (extensive or "C")');
	INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SpecialEducationLevelOfIntegrationDescriptor','4','4 = Up to a full day or program 3Y/4Y (maximum or "D")','4 = Up to a full day or program 3Y/4Y (maximum or "D")');
	INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@@IDENTITY);
/*END;*/

/* EducationOrganizationCategoryDescriptor */
/*IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE [Namespace]='uri://nmped.org/SpecialEducationLevelOfIntegrationDescriptor')
BEGIN*/
	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','Central Office','Central Office','Central Office');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','Charter','Charter','Charter');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','Off-Site','Off-Site','Off-Site');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','Public','Public','Public');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','State Supported','State Supported','State Supported');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);


/*END;*/

/* DirectCertificationStatus */

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','1','1=SNAP Direct Cert as identified & certified by the district.','1 = SNAP Direct Cert as identified in the direct certification report and certified by the district.');
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','2','2=Other Direct Cert Eligible (Homeless,FDPIR,Foster,Migrant,and HeadStart)','2 = Other Direct Cert Eligible (Homeless, FDPIR, Foster, Migrant, and Head Start)');
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','3','3=Family Mems of SNAP identified stus that wereNotFound inthe DirCertReport','3 = Family Members of SNAP identified students that were not found in the Direct Certification report.');
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@@IDENTITY);

/* SpecialProgramCode */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SpecialProgramCodeDescriptor','D','D = Dual Credit Course','D = Dual Credit Course');
INSERT INTO nmped.SpecialProgramCodeDescriptor(SpecialProgramCodeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SpecialProgramCodeDescriptor','C','C = Concurrent Enrollment Course','C = Concurrent Enrollment Course');
INSERT INTO nmped.SpecialProgramCodeDescriptor(SpecialProgramCodeDescriptorId) values (@@IDENTITY);

/* Program Delivery Method Descriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramDeliveryMethodDescriptor','CG','College Granted Certificate','CG = College Granted Certificate');
INSERT INTO nmped.ProgramDeliveryMethodDescriptor (ProgramDeliveryMethodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramDeliveryMethodDescriptor','IS','Industry Standard Third Party Assessment','IS = Industry Standard Third Party Assessment');
INSERT INTO nmped.ProgramDeliveryMethodDescriptor (ProgramDeliveryMethodDescriptorId) values (@@IDENTITY);

/* IndustryCredentialDescriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','1','Autodesk Certification','Autodesk Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','4','Adobe Certified Professional','Adobe Certified Professional');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','6','Automotive Technician','Automotive Technician');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','7','C++ Certified Associate Programmer','C++ Certified Associate Programmer');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','9','Network Certification','Network Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','15','Microsoft Certification','Microsoft Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','16','Certified Landscape Technician (CLT)','Certified Landscape Technician (CLT)');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','17','Medical Assistant','Medical Assistant');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','19','Novell Administrator','Novell Administrator');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','20','Certified Nurse Aide (CNA)','Certified Nurse Aide (CNA)');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','26','Certified Veterinary Assistant','Certified Veterinary Assistant');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','27','Child Development Associate Certification','Child Development Associate Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','28','CMI Custodial Technician','CMI Custodial Technician');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','31','Corel Certifications','Corel Certifications');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','33','Cosmetology License','Cosmetology License');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','36','Dental Assistant License','Dental Assistant License');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','39','Educational Assistant/Paraprofessional','Educational Assistant/Paraprofessional');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','42','Emergency Medical Dispatcher (EMD)','Emergency Medical Dispatcher (EMD)');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','43','Emergency Medical Technician (EMT)','Emergency Medical Technician (EMT)');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','44','Environmental Technician','Environmental Technician');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','47','Internet Core Computing - IC3','Internet Core Computing - IC3');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','51','Licensed Vocational Nurse (LVN)','Licensed Vocational Nurse (LVN)');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','53','Hotel & lodging certification','Hotel & lodging certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','57','Licensed Massage Therapist','Licensed Massage Therapist');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','74','Oracle Certification','Oracle Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','75','OSHA Certification','OSHA Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','77','Pesticide Applicators Certification','Pesticide Applicators Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','78','Pharmacy Technician (CPhT) License','Pharmacy Technician (CPhT) License');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','79','Phlebotomy Technician (CPT) License','Phlebotomy Technician (CPT) License');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','83','Real Estate License','Real Estate License');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','84','EPA certification','EPA certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','87','SABRE System Certification','SABRE System Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','90','ServSafe Certification','ServSafe Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','97','NCCER Certifications','NCCER Certifications');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','100','CompTIA Certification','CompTIA Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','103','S/P2 Certification','S/P2 Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','105','First Aid/CPR','First Aid/CPR');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','107','A*S*K Business Institute Certifications','A*S*K Business Institute Certifications');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','108','ACT National Career Readiness Certificate','ACT National Career Readiness Certificate');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','109','NOCTI Certification','NOCTI Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','111','Food Handler Certification','Food Handler Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','112','Welding Certification','Welding Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','115','Career Readiness Certification','Career Readiness Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','116','DECA School Based Enterprise Individual Certification','DECA School Based Enterprise Individual Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','117','Detention Officer Certification','Detention Officer Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','119','Floriculture','Floriculture');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','129','Early Care Education and Family Support','Early Care Education and Family Support');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','132','Police Explorer Certification','Police Explorer Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','133','Prostart','Prostart');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','139','Sustainability for Biofuels','Sustainability for Biofuels');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','143','Wildland Firefighting','Wildland Firefighting');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','148','Precision Certification','Precision Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','174','NC3 Certification','NC3 Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','175','WordPress web certification','WordPress web certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','176','FEMA certification','FEMA certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','177','Automated External Defibrillator (AED) Certification','Automated External Defibrillator (AED) Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','178','Licensed Practical Nurse (LPN) License','Licensed Practical Nurse (LPN) License');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','179','Python Certification','Python Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','180','Unity Certification','Unity Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','181','Automotive Career Exploration','Automotive Career Exploration');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','182','Plate Glass certification','Plate Glass certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor','183','Pro-Cut Certification','Pro-Cut Certification');
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@@IDENTITY);

/* LevelOfEducationInstitution */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','00','Non-Degree','Non-Degree');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','55','University of New Mexico','University of New Mexico');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','56','New Mexico State University','New Mexico State University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','57','New Mexico Highlands University','New Mexico Highlands University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','58','Western New Mexico University','Western New Mexico University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','59','Eastern New Mexico University','Eastern New Mexico University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','60','New Mexico Institute of Mining and Technology','New Mexico Institute of Mining and Technology');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','61','University of Albuquerque','University of Albuquerque');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','62','Santa Fe University of Art & Design (formerly College of Santa Fe) -Closed','Santa Fe University of Art & Design (formerly College of Santa Fe) -Closed');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','63','University of the Southwest (formerly College of the Southwest)-Hobbs','University of the Southwest (formerly College of the Southwest)-Hobbs');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','64','St. John''s College','St. John''s College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','65','New Mexico Military Institute','New Mexico Military Institute');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','66','College of Artesia','College of Artesia');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','67','Central New Mexico Community College','Central New Mexico Community College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','68','Institute of American Indian Art','Institute of American Indian Art');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','69','Luna Vocational-Technical Institute','Luna Vocational-Technical Institute');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','70','Navajo Community College','Navajo Community College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','71','New Mexico Junior College','New Mexico Junior College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','72','Northern New Mexico Community College','Northern New Mexico Community College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','73','San Juan College','San Juan College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','74','Santa Fe Community College','Santa Fe Community College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','75','Mesa Technical College','Mesa Technical College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','76','Clovis Community College','Clovis Community College');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','77','Southwestern College (Santa Fe)','Southwestern College (Santa Fe)');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','78','Wayland Baptist University','Wayland Baptist University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','79','University of Phoenix','University of Phoenix');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','80','Western Governor�s University�','Western Governor�s University�');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','81','National American University','National American University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','82','ITT Technical Institute','ITT Technical Institute');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','83','Webster University � Albuquerque','Webster University � Albuquerque');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','84','Navajo Technical University - Crownpoint','Navajo Technical University - Crownpoint');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','85','Cooperative Educational Services (CES)','Cooperative Educational Services (CES)');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','86','Fort Lewis College - Durango CO','Fort Lewis College - Durango CO');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AA','Armed Forces Americas - AA','Armed Forces Americas - AA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AE','Armed Forces Canada - AE','Armed Forces Canada - AE');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AK','Alaska - AK','Alaska - AK');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AL','Alabama - AL','Alabama - AL');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AP','Armed Forces Pacific - AP','Armed Forces Pacific - AP');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AR','Arkansas - AR','Arkansas - AR');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AS','American Samoa - AS','American Samoa - AS');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','AZ','Arizona - AZ','Arizona - AZ');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','CA','California - CA','California - CA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','CO','Colorado - CO','Colorado - CO');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','CT','Connecticut - CT','Connecticut - CT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','DC','District of Columbia - DC','District of Columbia - DC');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','DE','Delaware - DE','Delaware - DE');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','FL','Florida - FL','Florida - FL');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','FM','Federated States of Micronesia - FM','Federated States of Micronesia - FM');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','GA','Georgia - GA','Georgia - GA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','GU','Guam - GU','Guam - GU');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','HI','Hawaii - HI','Hawaii - HI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','IA','Iowa - IA','Iowa - IA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','ID','Idaho - ID','Idaho - ID');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','IL','Illinois - IL','Illinois - IL');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','IN','Indiana - IN','Indiana - IN');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','KS','Kansas - KS','Kansas - KS');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','KY','Kentucky - KY','Kentucky - KY');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','LA','Louisiana - LA','Louisiana - LA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MA','Massachusetts - MA','Massachusetts - MA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MD','Maryland - MD','Maryland - MD');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','ME','Maine - ME','Maine - ME');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MH','Marshall Islands - MH','Marshall Islands - MH');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MI','Michigan - MI','Michigan - MI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MN','Minnesota - MN','Minnesota - MN');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MO','Missouri - MO','Missouri - MO');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MP','Northern Mariana Islands - MP','Northern Mariana Islands - MP');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MS','Mississippi - MS','Mississippi - MS');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','MT','Montana - MT','Montana - MT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NC','North Carolina - NC','North Carolina - NC');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','ND','North Dakota - ND','North Dakota - ND');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NE','Nebraska - NE','Nebraska - NE');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NH','New Hampshire - NH','New Hampshire - NH');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NJ','New Jersey - NJ','New Jersey - NJ');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NM','New Mexico - NM','New Mexico - NM');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NV','Nevada - NV','Nevada - NV');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','NY','New York - NY','New York - NY');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','OH','Ohio - OH','Ohio - OH');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','OK','Oklahoma - OK','Oklahoma - OK');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','OR','Oregon - OR','Oregon - OR');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','PA','Pennsylvania - PA','Pennsylvania - PA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','PR','Puerto Rico - PR','Puerto Rico - PR');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','PW','Palau - PW','Palau - PW');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','RI','Rhode Island - RI','Rhode Island - RI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','SC','South Carolina - SC','South Carolina - SC');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','SD','South Dakota - SD','South Dakota - SD');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','TN','Tennessee - TN','Tennessee - TN');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','TX','Texas - TX','Texas - TX');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','UT','Utah - UT','Utah - UT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','VA','Virginia - VA','Virginia - VA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','VI','Virgin Islands - VI','Virgin Islands - VI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','VT','Vermont - VT','Vermont - VT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','WA','Washington - WA','Washington - WA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','WI','Wisconsin - WI','Wisconsin - WI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','WV','West Virginia - WV','West Virginia - WV');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','WY','Wyoming - WY','Wyoming - WY');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','51','Outside USA','Outside USA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);


/* NMPEDClassPeriodDescriptor */
/*Changed from ClassPeriod, due to moving it from StaffSection to Section and section already having a ClassPeriod field being used in a different way*/

/* Removing these 3 for PreK and moving it to ProgramTypes
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','AM','Morning Program for PreK ONLY','Morning Program for PreK ONLY');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','PM','Afternoon Program for PreK ONLY','Afternoon Program for PreK ONLY');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','FD','Full Day Program for PreK ONLY','Full Day Program for PreK ONLY');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','SEM','Semester','Semester');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','TRI','Trimester','Trimester');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','YR','Year-long','Year-long');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','BLK','Block Scheduling','Block Scheduling');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','QTR','Quarter','Quarter');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','SP','Self-paced','Self-paced');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/NMPEDClassPeriodDescriptor','PO','Pull-out','Pull-out');
INSERT INTO nmped.NMPEDClassPeriodDescriptor(NMPEDClassPeriodDescriptorId) values (@@IDENTITY);


/* Service Provider Type Descriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','01','Community-Based Organization','Community-Based Organization');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','02','Community Recruit','Community Recruit');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','03','Educational Assistant','Educational Assistant');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','04','Faith-Based Organization','Faith-Based Organization');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','05','Parent','Parent');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','06','Teacher','Teacher');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceProviderTypeDescriptor','07','Voluntee','Voluntee');
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@@IDENTITY);


/*Service Setting*/
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceSettingDescriptor','BEFORESCHOOL','BEFORESCHOOL','BEFORESCHOOL');
INSERT INTO nmped.ServiceSettingDescriptor(ServiceSettingDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceSettingDescriptor','AFTERSCHOOL','AFTERSCHOOL','AFTERSCHOOL');
INSERT INTO nmped.ServiceSettingDescriptor(ServiceSettingDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceSettingDescriptor','WEEKEND','WEEKEND','WEEKEND');
INSERT INTO nmped.ServiceSettingDescriptor(ServiceSettingDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceSettingDescriptor','SUMMER','SUMMER','SUMMER');
INSERT INTO nmped.ServiceSettingDescriptor(ServiceSettingDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ServiceSettingDescriptor','YEARROUND','YEARROUND','YEARROUND');
INSERT INTO nmped.ServiceSettingDescriptor(ServiceSettingDescriptorId) values (@@IDENTITY);

/* Program Intensity Descriptor */
--DECLARE @@IDENTITY AS Integer;
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramIntensityDescriptor','1','1 program hour','1 program hour');
INSERT INTO nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramIntensityDescriptor','2','2 program hours','2 program hours');
INSERT INTO nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramIntensityDescriptor','3','3 program hours','3 program hours');
INSERT INTO nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId) values (@@IDENTITY);

/*ParticipationInformationDescriptor*/
--DECLARE @@IDENTITY AS Integer;
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','1','Dual Language Immersion','Dual Language Immersion');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','2','Developmental/Maintenance Bilingual','Developmental/Maintenance Bilingual');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','3','Enrichment','Enrichment');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','4','Transitional Bilingual','Transitional Bilingual');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','5','Heritage/Indigenous Language','Heritage/Indigenous Language');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','6','Parents Refusal - received in writing from parent (opt-out form)','Parents Refusal - received in writing from parent (opt-out form)');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','7','English Language Development (ELD) pull-out course','English Language Development (ELD) pull-out course and sheltered instruction in content areas - The student is pulled out for instruction in English Language Development based on the English language proficiency level of the student and provided sheltered instruction in content areas.');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','8','English Language Development (ELD) block and sheltered','English Language Development (ELD) block and sheltered instruction in content areas (elementary grades only) - The student receives instruction in English Language Development for a minimum of 45 minutes in a self-contained elementary setting based on the English language proficiency level of the student and provided sheltered instruction in content areas.');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','9','Integrated English Language Development (ELD)','Integrated English Language Development (ELD) - English Language Arts (ELA) course and sheltered instruction in content areas (secondary grades only) - The student that is nearing proficiency in English receives instruction in an integrated ELD-ELA course at the middle school and high school level and sheltered instruction in content areas.');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','13','Voluntary CEIS','Voluntary CEIS � LEAs self-elect to participate in CEIS and can reserve up to 15% of total IDEA B funds used for Voluntary CEIS');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','14','Mandatory CEIS','Mandatory CEIS � LEAs required to participate in CEIS if found to have disproportionality. LEAs must reserve 15% of their total IDEA B funds for Mandatory CEIS.15% CEIS is required if district had significant disproportionality.');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','450HR','NMPREK � day student','NMPREK � day student � funding based on 450 hours');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ParticipationInformationDescriptor','900HR','NMPREK Full-Day day student','NMPREK Full-Day day student � funding based on 900 hours');
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@@IDENTITY);

/*Local Ed Org Categories*/
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','Central Office','Central Office','Central Office');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor(LocalEducationAgencyCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','Off-Site','Off-Site','Off-Site');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor(LocalEducationAgencyCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','Charter','Charter','Charter');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor(LocalEducationAgencyCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','Public','Public','Public');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor(LocalEducationAgencyCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','State Supported','State Supported','State Supported');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor(LocalEducationAgencyCategoryDescriptorID) values (@@IDENTITY);


/*School Category Descriptors*/
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','AP','Accredited Private School','Accredited Private School');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','CO','Central Office','Central Office');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','ES','Elementary School','Elementary School');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','HS','High School','High School');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','JH','Junior High','Junior High');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','MS','Middle School','Middle School');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','NAPS','Non-Accredited Private School','Non-Accredited Private School');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','PREK','Prekindergarten','Prekindergarten');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','SED','Special Education','Special Education');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/SchoolCategoryDescriptor','SS','State Supported','State Supported');
INSERT INTO edfi.SchoolCategoryDescriptor(SchoolCategoryDescriptorID) values (@@IDENTITY);

/*Program Types*/


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','3Y','3Y','Child participating in the Early Childhood 3Y Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','4Y','4Y','Child participating in the Early Childhood 4Y Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BEP','BEP','Bilingual Multicultural Education Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BSCE','BSCE','Bus Services Vocational Ed/Concurrent Enrollment');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BUS','BUS','Bus Services');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BUSA','BUSA','Bus Services for Students with Disabilities K-12');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','CEIS','CEIS','Coordinated Early Intervening Services');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','CSDA','CSDA','Charter school student participating in a district activity');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','CSP','CSP','Community School Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','ECHS','ECHS','Early College High School (used by CCRB bureau)');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','EELTO','EELTO','Expanded and Enriched Learning Time and Opportunities');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','ELL','ELL','English Learner');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','ELTP','ELTP','Extended Learning Time Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','FACE','FACE','Family and Children Education (for 3 and 4 year olds only)');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','HEADST','HEADST','Head Start Prek');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','HSDA','HSDA','Home school student participating in a district activity');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','NMPREK','NMPREK','Student is participating in the NM PreK program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T1A','T1A','Title I Part A');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T1AND','T1AND','Title I Part A Students that are enrolled or reside in Neglected and Delinquent programs');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T1APK','T1APK','Title I Part A funded preschool school students');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T1APR','T1APR','Title I Part A Private school students receiving Title 1 services');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T3','T3','Title III');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T7','T7','Title VII');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T8','T8','Title VIII');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','WRP','WRP','Workforce Readiness Program (used by CCRB bureau)');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

/*Subject Area Descriptors*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','1','Agriculture','Agriculture');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','10','English Language and Literature','English Language and Literature');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','11','Family and Consumer Sciences','Family and Consumer Sciences');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','12','Fine and Performing Arts','Fine and Performing Arts');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','13','Foreign Language and Literature','Foreign Language and Literature');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY);
 
 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','14','Graphic and Printing Communications','Graphic and Printing Communications');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','15','Health Education','Health Education');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','16','Health Care Sciences','Health Care Sciences');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','17','Life and Physical Sciences','Life and Physical Sciences');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','18','Marketing','Marketing');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','19','Mass Communication','Mass Communication');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','2','Athletics','Athletics');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','20','Mathematics','Mathematics');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','21','Military Science','Military Science');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','22','Multi/Interdisciplinary Studies','Multi/Interdisciplinary Studies');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','23','Physical Education','Physical Education');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','24','Precision Metalwork','Precision Metalwork');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','25','Public Protective and Social Services','Public Protective and Social Services');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','26','Religious Education and Theology','Religious Education and Theology');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','27','Social Sciences and History','Social Sciences and History');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','28','Special Education','Special Education');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','29','Technology Education','Technology Education');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','3','Business','Business');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','30','Elementary Course','Elementary Course');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','4','Computer and Information Sciences','Computer and Information Sciences');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','5','Construction Trades','Construction Trades');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','6','Cosmetology','Cosmetology');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','7','Drafting','Drafting');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','8','Elective Activities','Elective Activities');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

 INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','9','Energy Power and Transportation Technologies','Energy Power and Transportation Technologies');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 






------ Addition of NMPED VALUES
/* 
  The state has an authorized catalog for Tribal Affiliation so we are cleaning up the Ed-Fi ones and inserting the NMPED descriptors.
  -- Note that Descriptor tables have Cascade on Delete so we only need to delete the parent edfi.Descriptor table.
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/TribalAffiliationDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/TribalAffiliationDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '0', 'Not Applicable', 'Not Applicable');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '1', 'Acoma', 'Acoma');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '2', 'Cochiti', 'Cochiti');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '3', 'Isleta', 'Isleta');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '4', 'Jemez', 'Jemez');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '5', 'Jicarilla Apache', 'Jicarilla Apache');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '6', 'Laguna', 'Laguna');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '7', 'Mescalero Apache', 'Mescalero Apache');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '8', 'Nambe', 'Nambe');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '9', 'Navajo', 'Navajo');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '10', 'Picuris', 'Picuris');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '11', 'Pojoaque', 'Pojoaque');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '12', 'San Felipe', 'San Felipe');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '13', 'San Ildefonso', 'San Ildefonso');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '14', 'Ohkay Owingeh (formerly San Juan)', 'Ohkay Owingeh (formerly San Juan)');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '15', 'Sandia', 'Sandia');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '16', 'Santa Ana', 'Santa Ana');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '17', 'Santa Clara', 'Santa Clara');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '18', 'Kewa (formerly Santo Domingo)', 'Kewa (formerly Santo Domingo)');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '19', 'Taos', 'Taos');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '20', 'Tesuque', 'Tesuque');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '21', 'Zia', 'Zia');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '22', 'Zuni', 'Zuni');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '23', 'Other', 'Other');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);


-- Language
/* 
  The state has an authorized catalog for language so we are cleaning up the Ed-Fi ones and inserting the NMPED language descriptors.
  -- Note that Descriptor tables have Cascade on Delete so we only need to delete the parent edfi.Descriptor table.
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/LanguageDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '0', 'eng', 'English');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '1', 'spa', 'Spanish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '2', 'vie', 'Vietnamese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '3', 'hmn', 'Hmong; Mong');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '4', 'chi (B) zho (T)', 'Chinese (Cantonese or Mandarin, also includes Chaozhou, Lahu, Taiwanese, Teochew, and Toishanese)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '5', 'khm', 'Cambodian - Khmer');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '6', 'kor', 'Korean');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '7', 'lao', 'Laotian (includes Khmu)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '8', 'nav', 'Navajo; Navaho (Diné)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '9', 'tgl', 'Tagalog');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '10', 'rus', 'Russian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '11', 'cpf', 'Creoles, French-based');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '12', 'ara', 'Arabic (spoken in numerous countries including Algeria, Egypt, Iran, Iraq, and Yemen)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '13', 'por', 'Portuguese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '14', 'jpn', 'Japanese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '16', 'nai', 'Tiwa');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '17', 'nai', 'Tewa');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '18', 'nai', 'Towa');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '19', 'nai', 'Keres');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '20', 'apa', 'Jicarilla Apache');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '21', 'apa', 'Mescalero Apache');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '22', 'zun', 'Zuni');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '24', 'sgn', 'Sign Languages - American');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '25', 'sgn', 'Sign Languages - English Based');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '26', 'alb (B) sqi (T)', 'Albanian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '27', 'arm (B) hye (T)', 'Armenian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '28', 'aze', 'Azerbaijani');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '29', 'bat', 'Baltic languages');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '30', 'baq (B) eus (T)', 'Basque');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '31', 'bos', 'Bosnian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '32', 'bul', 'Bulgarian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '33', 'bur (B)  mya (T)', 'Burmese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '34', 'che', 'Chechen');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '35', 'cpe', 'Creoles, English based');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '36', 'cpp', 'Creoles, Portuguese-based');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '37', 'hrv', 'Croatian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '38', 'cze (B) ces (T)', 'Czech');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '39', 'dan', 'Danish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '40', 'dut (B) nld (T)', 'Dutch; Flemish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '41', 'est', 'Estonian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '42', 'per (B) fas (T)', 'Farsi - Persian (includes Dari spoken in Afghanistan)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '43', 'fil', 'Filipino; Pilipino');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '44', 'fin', 'Finnish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '45', 'fre (B) fra (T)', 'French');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '46', 'ger (B) deu (T)', 'German');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '47', 'gre (B) ell (T)', 'Greek');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '48', 'hat', 'Haitian; Haitian Creole');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '49', 'haw', 'Hawaiian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '50', 'heb', 'Hebrew');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '51', 'hun', 'Hungarian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '52', 'ice (B) isl (T)', 'Icelandic');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '53', 'ben', 'India and Bangladesh - Bengali');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '54', 'guj', 'India - Gujarati');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '55', 'mar', 'India - Marathi');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '56', 'raj', 'India - Rajasthani');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '57', 'tel', 'India - Telugu');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '58', 'asm', 'India and Assam - Assamese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '59', 'hin', 'India and Pakistan - Hindi');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '60', 'urd', 'India and Pakistan - Urdu');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '61', 'pan', 'India or Pakistan Panjabi; Punjabi');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '62', 'tam', 'India, Malaysia, Sri Lanka - Tamil');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '63', 'ind', 'Indonesian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '64', 'ira', 'Iranian languages');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '65', 'ita', 'Italian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '66', 'nai', 'North American Indian languages Other');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '67', 'nor', 'Norwegian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '68', 'pol', 'Polish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '69', 'rum (B) ron (T)', 'Romanian; Moldavian; Moldovan');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '70', 'som', 'Somali ( also includes Tigrinya)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '71', 'srp', 'Serbian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '72', 'sla', 'Slavic languages');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '73', 'swe', 'Swedish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '74', 'tha', 'Thai');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '75', 'tib (B) bod (T)', 'Tibetan (B)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '76', 'ukr', 'Ukrainian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '77', 'NAI', 'Hocano');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '78', 'kur', 'Kurdish (includes any country where this is spoken such as Iraq and Afghanistan)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '79', 'syr', 'Syriac (includes Assyrian and Chaldean)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '80', 'ceb', 'Cebuano (Visayan)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '81', 'cha', 'Chamorro');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '82', 'kin', 'Kinyarwanda (includes Kirundi)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '83', 'lit', 'Lithuanian');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '84', 'mal', 'Malayalam');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '85', 'mah', 'Marshallese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '86', 'NAI', 'Mixteco');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '87', 'nep', 'Nepali');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '88', 'pus', 'Pashto (also includes Pushto)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '89', 'smo', 'Samoan');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '90', 'sin', 'Sinhalese (also includes Sinhala)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '91', 'swa', 'Swahili');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '92', 'rar', 'Tongan (also includes Raratongan)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '93', 'tur', 'Turkish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '94', 'wol', 'Wolof');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '95', 'yao', 'Yao (also includes Mien)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '96', 'fat', 'Fanti (spoken in Ghana)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '97', 'oro', 'Oromo');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '98', 'lat', 'Latin');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '99', 'amh', 'Amharic');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '100', 'ful', 'Fulah');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '101', 'lns', 'Lamnso');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);


--Behavior
/* 
  The state has an authorized catalog for behavior so we are cleaning up the Ed-Fi ones and inserting the NMPED language descriptors.
  -- Note that Descriptor tables have Cascade on Delete so we only need to delete the parent edfi.Descriptor table.
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/BehaviorDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/BehaviorDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '1', 'Assault/battery with firearm', 'Assault/battery with firearm');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '2', 'Assault/battery with knife or cutting object', 'Assault/battery with knife or cutting object');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '3', 'Assault/battery with other dangerous weapon', 'Assault/battery with other dangerous weapon');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '4', 'Assault/battery aggravated with hands, feet, fist', 'Assault/battery aggravated with hands, feet, fist');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '5', 'Assault/battery simple', 'Assault/battery simple');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '6', 'Other Violence - Sexual battery', 'Other Violence - Sexual battery');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '7', 'Other Violence – Homicide', 'Other Violence – Homicide');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '8', 'Other Violence – Kidnapping', 'Other Violence – Kidnapping');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '9', 'Other Violence - Robbery using force', 'Other Violence - Robbery using force');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '11', 'Other Violence – General (includes Threat or Intimidation)', 'Other Violence – General (includes Threat or Intimidation)');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '12', 'Sexual Harassment (includes bullying on the basis of sex)', 'Sexual Harassment (includes bullying on the basis of sex)');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '13', 'Disorderly Conduct', 'Disorderly Conduct');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '14', 'Bullying and or Harassment not based on demographic', 'Bullying and or Harassment not based on sex, race, color, national origin or disability.');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '15', 'Bullying or Harassment on the basis of race, color, or national origin', 'Bullying or Harassment on the basis of race, color, or national origin');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '16', 'Bullying or Harassment on the basis of disability', 'Bullying or Harassment on the basis of disability');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '40', 'Graffiti', 'Graffiti');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '41', 'Criminal Damage', 'Criminal Damage');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '42', 'Breaking/Entering/Larceny', 'Breaking/Entering/Larceny');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '43', 'Missing Property/Theft', 'Missing Property/Theft');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '44', 'Arson', 'Arson');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '45', 'Vandalism', 'Vandalism');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '46', 'Other Vandalism, Describe in Comment Field (Field #15)', 'Other Vandalism, Describe in Comment Field (Field #15)');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '51', 'Weapons Possession – Knife/Cutting', 'Weapons Possession – Knife/Cutting');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '52', 'Weapons Possession – Other', 'Weapons Possession – Other');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '53', 'Gang-Related Activity', 'Gang-Related Activity');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '54', 'Drug Violation', 'Drug Violation');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '55P', 'Alcohol Violation – Possession', 'Alcohol Violation – Possession');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '55U', 'Alcohol Violation – Use', 'Alcohol Violation – Use');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '55D', 'Alcohol Violation – Dealing', 'Alcohol Violation – Dealing');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '56', 'Tobacco Use', 'Tobacco Use');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '57', 'Other Weapons, Substance Abuse, Gang Activity', 'Other Weapons, Substance Abuse, Gang Activity – Describe in Comment Field (Field #15)');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '61', 'Handgun Possession', 'Handgun Possession');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '62', 'Rifle/Shotgun Possession', 'Rifle/Shotgun Possession');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '63', 'Other Firearms Possession - Describe in Comment Field', 'Other Firearms Possession - Describe in Comment Field');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '64', 'Multiple Firearms', 'Multiple Firearms');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/BehaviorDescriptor', '70', 'Referred to CYFD for Excessive Absenteeism (No Response Code Required)', 'Referred to CYFD for Excessive Absenteeism (No Response Code Required)');
        INSERT INTO edfi.BehaviorDescriptor (BehaviorDescriptorid) values (@@IDENTITY);


--SeparationReasonDescription
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SeparationReasonDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SeparationReasonDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '1', 'Left NM and teaching in other state', 'Left NM and teaching in other state');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '2', 'Left for reasons other than retirement', 'Left for reasons other than retirement');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '3', 'Left to teach in private school in NM', 'Left to teach in private school in NM');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '4', 'Went to other public/charter NM district', 'Went to other public/charter NM district');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '5', 'Took non-teaching position in district', 'Took non-teaching position in district');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '6', 'Died', 'Died');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '7', 'Retired', 'Retired');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '8', 'Personal Reasons', 'Personal Reasons');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '9', 'Non-Renewal of Contract', 'Non-Renewal of Contract');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '10', 'Non-Renewal of Teaching License', 'Non-Renewal of Teaching License');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '11', 'Discharged prior to end of contract', 'Discharged prior to end of contract');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '12', 'Resigned prior to completion of contract', 'Resigned prior to completion of contract');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '13', 'Reduction in force/staff', 'Reduction in force/staff');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '14', 'Permanent leave of absence due to illness or another reason', 'Leave of absence (i.e. Permanent leave of absence due to illness or another reason)');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '15', 'Military Service', 'Military Service');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '16', 'Teaching in Another Country', 'Teaching in Another Country');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '17', 'Peace Corps/ACTION', 'Peace Corps/ACTION');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '18', 'Completion of Short Term Contract', 'Completion of Short Term Contract');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '19', 'Left to teach in BIE (Bureau of Indian Education) school in NM', 'Left to teach in BIE (Bureau of Indian Education) school in NM');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '99', 'Unknown Reason', 'Unknown Reason');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);



--StaffClassificationDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/StaffClassificationDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/StaffClassificationDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '10', 'Superintendent', 'Superintendent - Administrators');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '11', 'Assistant Area Deputy of Associate Superintendent', 'Assistant Area Deputy of Associate Superintendent - Administrators');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '12', 'Director of Personnel', 'Director of Personnel - Administrators');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '13', 'Director of Instruction', 'Director of Instruction - Administrators');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '36', 'Athletic Director', 'Athletic Director - Administrators');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '31', 'Instructional EA (Not Title 1, Part A program)', 'Instructional EA (Not providing instructional duties in a Title 1, Part A program) - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '31I', 'Instructional EA Providing instructional duties in a Title1, Part A program', 'Instructional EA Providing instructional duties in a Title1, Part A program - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '32', 'Library/Media EA (Not in a Title 1, Part A program)', 'Library/Media EA (Not providing instructional duties in a Title 1, Part A program) - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '32I', 'Library/Media EA Providing instructional duties in a Title1, Part A program', 'Library/Media EA Providing instructional duties in a Title1, Part A program - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '33', 'Other EA (Not providing instructional duties in a Title 1, Part A program)', 'Other EA (Not providing instructional duties in a Title 1, Part A program) - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '33I', 'Other EA Providing instructional duties in a Title1, Part A program', 'Other EA Providing instructional duties in a Title1, Part A program - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '34', 'SpEd EA (Instructional Assistant) for SpEd 6-21 (NOT Title 1, Part A).', 'Special Education EA (Instructional Assistant) for Special Education students ages 6-21 (NOT providing instructional duties in a Title 1, Part A program). - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '34S', 'SpEd EA (Instructional Assistant) for SpEd 3-5 (NOT Title 1, Part A).', 'Special Education EA (Instructional Assistant) for Special Education students ages 3-5 (NOT providing instructional duties in a Title 1, Part A program). - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '34I', 'SpEd EA (Instructional Assistant) inst duties - Title1, Part A SpEd 6-21.', 'Special Education EA (Instructional Assistant) Providing instructional duties in a Title1, Part A program to Special Education students ages 6-21. - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '34IS', 'SpEd EA (Instructional Assistant) inst duties -Title1, Part A  3-5.', 'Special Education EA (Instructional Assistant) Providing instructional duties in a Title1, Part A program to Special Education students ages 3-5. - Educational Assistant');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '1', 'Nurse (LPN)', 'Nurse (LPN) - Healthcare');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '3', 'Healthcare Assistant', 'Healthcare Assistant - Healthcare');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '7', 'Special Education Healthcare Asst.', 'Special Education Healthcare Asst. - Healthcare');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '70', 'Nurse (RN)', 'Nurse (RN) - Healthcare');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '76', 'Secondary Media', 'Secondary Media - Media Specialist');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '77', 'Junior/Mid High Media', 'Junior/Mid High Media - Media Specialist');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '78', 'Elementary Media', 'Elementary Media - Media Specialist');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '2', 'Generic Support Staff without a specific code', 'Generic code for other Support Staff without a specific code in this category - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '114', 'Maintenance', 'Maintenance - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '115', 'Custodian', 'Custodian - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '116', 'Security', 'Security - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '117', 'Cafeteria Worker', 'Cafeteria Worker - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '118', 'Bus Driver', 'Bus Driver - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '144', 'Bus Assistant', 'Bus Assistant - All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '24', 'Generic non-certified Supervisors or Directors without a specific code', 'Generic code for other non-certified Supervisors or Directors without a specific code in this category - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '120', 'Supervisor or Director of Information Technology', 'Supervisor or Director of Information Technology - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '121', 'Supervisor or Director of Facilities', 'Supervisor or Director of Facilities - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '122', 'Supervisor or Director of Food Service', 'Supervisor or Director of Food Service - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '123', 'Supervisor or Director of Transportation', 'Supervisor or Director of Transportation - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '124', 'Supervisor or Director of Grants', 'Supervisor or Director of Grants - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '125', 'Supervisor or Director of Human Resources', 'Supervisor or Director of Human Resources - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '126', 'Supervisor or Director/Coordinator of Visual & Performing Arts', 'Supervisor or Director/Coordinator of Visual & Performing Arts - Non-Certified Supervisors or Directors');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '29', 'Generic non-certified Admin Supp Staff - Typically District Office', 'Generic code for other non-certified Administrative Support Staff without a specific code in this category - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '127', 'Administrative Business Office Support', 'Administrative Business Office Support - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '128', 'Administrative Clerk', 'Administrative Clerk - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '129', 'Administrative Secretary', 'Administrative Secretary - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '130', 'STARS/Data Coordinator', 'STARS/Data Coordinator - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '131', 'Information Technology/Data Staff', 'Information Technology/Data Staff - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '132', 'Facilitator', 'Facilitator - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '133', 'Administrative Grant Clerk', 'Administrative Grant Clerk - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '134', 'Administrative Grant Secretary', 'Administrative Grant Secretary - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '135', 'Human Resource Staff', 'Human Resource Staff - Non-Certified Administrative Support Staff (typically working at a district office)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '68', 'Generic code for other non-certified School Admin Staff -Support Staff', 'Generic code for other non-certified School Administrative Staff without a specific code in this category - Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '136', 'School Registrar', 'School Registrar - Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '137', 'School Clerk', 'School Clerk - Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '138', 'School Secretary', 'School Secretary - Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '4', 'ROTC Instructor', 'ROTC Instructor - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '5', 'Drivers Education', 'Drivers Education - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '6', 'In School Suspension', 'In School Suspension - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '8', 'Social Worker, General Education', 'Social Worker, General Education - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '9', 'Technology Coordinator', 'Technology Coordinator - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '65', 'Business Official or Supervisor/Director of Business', 'Business Official or Supervisor/Director of Business - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '79', 'Athletic Trainer', 'Athletic Trainer - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '80', 'Music Therapist', 'Music Therapist - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '81', 'Athletic Coach', 'Athletic Coach - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '83', 'Resource Coordinator', 'Resource Coordinator - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '95', 'SLP or SLP Clinical Fellows Acting as a Case Manager for speech only 6-21 ', 'Special Education Speech/Language Pathologist (SLP) or SLP Clinical Fellows Acting as a Caseload Manager for speech only 6-21 year olds - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '95S', 'SLP or SLP Clinical Fellows Acting as a Case Manager for speech only 3-5', 'Special Education Speech/Language Pathologist (SLP) or SLP Clinical Fellows Acting as a Caseload Manager for speech only 3-5 year olds - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '102', 'Testing Coordinator', 'Testing Coordinator - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '105', 'Academic Instructional Coach', 'Academic Instructional Coach - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '108', 'Native American Lang & Culture Inst (req 520 Native Lang & Culture Cert)', 'Native American Language & Culture Instructor (requires 520 Native Language & Culture Certificate) - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '109', 'Dean of Students', 'Dean of Students - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '141', 'School Psychologist, General Education', 'School Psychologist, General Education - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '142', 'Student Assistance Team (SAT) Chair', 'Student Assistance Team (SAT) Chair - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '143', 'Student Success Advisor', 'Student Success Advisor - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '146', 'Attendance Coach', 'Attendance Coach - Other Personnel');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '14', 'Principal, Secondary', 'Principal, Secondary - Principals');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '15', 'Assistant Principal, Secondary', 'Assistant Principal, Secondary - Principals');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '16', 'Principal, Jr./Mid High', 'Principal, Jr./Mid High - Principals');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '17', 'Assistant Principal, Jr./Mid High', 'Assistant Principal, Jr./Mid High - Principals');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '18', 'Principal, Elementary', 'Principal, Elementary - Principals');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '19', 'Assistant Principal, Elementary', 'Assistant Principal, Elementary - Principals');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '26', 'Speech/Language Apprentice (Not allowed to carry a caseload)', 'Speech/Language Apprentice (Not allowed to carry a caseload) - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '82', 'Social Worker', 'Social Worker - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '84', 'Physical Therapy Assistant (Not allowed to carry a caseload)', 'Physical Therapy Assistant (Not allowed to carry a caseload) - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '85', 'COTA (Not allowed to carry a caseload)', 'Certified Occupational Therapy Assistant (COTA) (Not allowed to carry a caseload) - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '86', 'Audiologist', 'Audiologist - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '87', 'Diagnostician', 'Diagnostician - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '88', 'Interpreter for the Deaf', 'Interpreter for the Deaf - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '89', 'Occupational Therapist', 'Occupational Therapist - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '90', 'Orientation and Mobility Trainer', 'Orientation and Mobility Trainer - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '91', 'Physical Therapist', 'Physical Therapist - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '92', 'School Psychologist', 'School Psychologist - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '93', 'Speech/Language Pathologist (SLP)', 'Speech/Language Pathologist (SLP) - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '98', 'Recreation and Therapeutic Recreation Specialist', 'Recreation and Therapeutic Recreation Specialist - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '99', 'Rehabilitation Counselor', 'Rehabilitation Counselor - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '107', 'Medical/Nursing Services Provider for special education', 'Medical/Nursing Services Provider for special education - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '111', 'SLP Clinical Fellows', 'SLP Clinical Fellows - Related Service Personnel For Special Education (6-21 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '26S', 'Spee/Lang Apprentice for special education 3-5 year (Not caseload allowed)', 'Speech/Language Apprentice for special education 3-5 year olds (Not allowed to carry a caseload) - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '82S', 'Social Worker for special education 3-5 year olds', 'Social Worker for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '84S', 'PTA for special education 3-5 year olds (Not allowed to carry a caseload)', 'Physical Therapy Assistant for special education 3-5 year olds (Not allowed to carry a caseload) - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '85S', 'COTA for special education 3-5 year olds (Not allowed to carry a caseload)', 'Certified Occupational Therapy Assistant (COTA) for special education 3-5 year olds (Not allowed to carry a caseload) - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '86S', 'Audiologist for special education 3-5 years olds', 'Audiologist for special education 3-5 years olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '87S', 'Diagnostician for special education 3-5 year olds', 'Diagnostician for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '88S', 'Interpreter for the Deaf for special education 3-5 year olds', 'Interpreter for the Deaf for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '89S', 'Occupational Therapist for special education 3-5 year olds', 'Occupational Therapist for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '90S', 'Orientation and Mobility Trainer for special education 3-5 year olds', 'Orientation and Mobility Trainer for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '91S', 'Physical Therapist for special education 3-5 year olds', 'Physical Therapist for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '92S', 'School Psychologist for special education 3-5 year olds', 'School Psychologist for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '93S', 'Speech/Language Pathologist for special education 3-5 year olds', 'Speech/Language Pathologist for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '98S', 'Recreation and Therapeutic Recreation Specialist 3-5 year olds', 'Recreation and Therapeutic Recreation Specialist 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '99S', 'Rehabilitation Counselor for special education 3-5 year olds', 'Rehabilitation Counselor for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '107S', 'Medical/Nursing Services Provider for special education 3-5 year olds', 'Medical/Nursing Services Provider for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '111S', 'SLP Clinical Fellows for special education 3-5 year olds', 'SLP Clinical Fellows for special education 3-5 year olds - Related Service Personnel For Special Education (3-5 Year Olds)');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '66', 'Secondary School Counselor', 'Secondary School Counselor - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '67', 'Junior/Mid High School Counselor', 'Junior/Mid High School Counselor - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '69', 'Elementary School Counselor', 'Elementary School Counselor - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '71', 'Counseling Coordinator', 'Counseling Coordinator - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '72', 'Drug/Alcohol Abuse Counselor', 'Drug/Alcohol Abuse Counselor - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '112', 'Marriage & Family Therapist', 'Marriage & Family Therapist - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '113', 'Substance Abuse Associate', 'Substance Abuse Associate - School Counselor');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '35', 'Activities Supervisor', 'Activities Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '37', 'Attendance Officer Supervisor', 'Attendance Officer Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '38', 'Instructional Resources Supervisor', 'Instructional Resources Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '39', 'Pupil Personnel Services Supervisor', 'Pupil Personnel Services Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '40', 'Art Supervisor', 'Art Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '41', 'Bilingual Education Supervisor', 'Bilingual Education Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '42', 'Research/Evaluation Supervisor', 'Research/Evaluation Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '43', 'Career Education Supervisor', 'Career Education Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '44', 'Curriculum Supervisor', 'Curriculum Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '45', 'Social Studies Supervisor', 'Social Studies Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '46', 'Elementary Supervisor', 'Elementary Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '47', 'Foreign Languages Supervisor', 'Foreign Languages Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '48', 'Health Services Supervisor', 'Health Services Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '49', 'Indian Education Supervisor', 'Indian Education Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '50', 'Junior/Mid High Supervisor', 'Junior/Mid High Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '51', 'Language Arts Supervisor', 'Language Arts Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '52', 'Mathematics Supervisor', 'Mathematics Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '53', 'Multi-cultural Supervisor', 'Multi-cultural Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '54', 'Music Supervisor', 'Music Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '55', 'Special Services Supervisor', 'Special Services Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '56', 'Physical Education Supervisor', 'Physical Education Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '57', 'Vocational Supervisor', 'Vocational Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '58', 'Science Supervisor', 'Science Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '59', 'Secondary Supervisor', 'Secondary Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '60', 'Federal Projects Supervisor', 'Federal Projects Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '61', 'Special Education Supervisor', 'Special Education Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '62', 'District Library/Media Coordinator Supervisor', 'District Library/Media Coordinator Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '63', 'Media Supervisor', 'Media Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '64', 'Reading Supervisor', 'Reading Supervisor - Supervisors, Directors or Managers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '0', 'Homebound Instructor (Regular Education)', 'Homebound Instructor (Regular Education) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '20', 'Kindergarten Teacher', 'Kindergarten Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '21', 'Elementary Teacher', 'Elementary Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '22', 'Junior High/Middle School Teacher', 'Junior High/Middle School Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '23', 'Head Teacher', 'Head Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '25', 'Preschool Teacher', 'Preschool Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '28', 'Elementary Bilingual Teacher', 'Elementary Bilingual Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '30', 'Secondary Teacher', 'Secondary Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '73', 'Secondary Librarian', 'Secondary Librarian - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '74', 'Junior/Mid High Librarian', 'Junior/Mid High Librarian - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '75', 'Elementary Librarian', 'Elementary Librarian - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '94', 'Gifted Teacher', 'Gifted Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '96', 'Special Education Preschool Teacher (Preschool)', 'Special Education Preschool Teacher (Preschool) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '97', 'General Special Education Teacher (K-12)', 'General Special Education Teacher (K-12) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '101', 'Corrections Facility Teacher', 'Corrections Facility Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '103', 'Computer Lab Instructor', 'Computer Lab Instructor - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '104', 'Home School/Alternative School Teacher (Includes Family Schools)', 'Home School/Alternative School Teacher (Includes Family Schools) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '106', 'Special Education – Alternative School Teacher (Includes Family Schools)', 'Special Education – Alternative School Teacher (Includes Family Schools) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '110', 'Special Education – Adapted Physical Education Teacher (K-12)', 'Special Education – Adapted Physical Education Teacher (K-12) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '110S', 'Special Education – Adapted Physical Education Teacher (Preschool)', 'Special Education – Adapted Physical Education Teacher (Preschool) - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '139', 'Junior High/Middle School Bilingual Teacher', 'Junior High/Middle School Bilingual Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '140', 'Secondary Bilingual Teacher', 'Secondary Bilingual Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/StaffClassificationDescriptor', '145', 'Deaf and Hard of Hearing Teacher', 'Deaf and Hard of Hearing Teacher - Teachers');
        INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) values (@@IDENTITY);


--Disability Descriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DisabilityDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DisabilityDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'AU', 'Autism', 'Autism');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'DB', 'Deaf-Blindness', 'Deaf-Blindness');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'DD', 'Developmental Delay', 'Developmental Delay');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'ED', 'Emotional Disturbance', 'Emotional Disturbance');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'HI', 'Hearing Impairment', 'Hearing Impairment');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'ID', 'Intellectual Disability (previously referred to as MR – Mental Retardation)', 'Intellectual Disability (previously referred to as MR – Mental Retardation)');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'MD', 'Multiple Disabilities', 'Multiple Disabilities');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'OHI', 'Other Health Impairment', 'Other Health Impairment');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'OI', 'Orthopedic Impairment', 'Orthopedic Impairment');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'SL', 'Speech or Language Impairment', 'Speech or Language Impairment');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'SLD', 'Specific Learning Disability', 'Specific Learning Disability');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'TBI', 'Traumatic Brain Injury', 'Traumatic Brain Injury');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisabilityDescriptor', 'VI', 'Visual Impairment', 'Visual Impairment');
        INSERT INTO edfi.DisabilityDescriptor (DisabilityDescriptorid) values (@@IDENTITY);

--EntryTypeDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/EntryTypeDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/EntryTypeDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'E1', 'E1', 'Initial enrollment for current school year any school - Student enrolled at this school for the first time during the current school year including a student who attended this same school the last school year and returns this school year.
Student who has NOT been enrolled anywhere else in the U.S. during the current school year. This student is in school for the first time during this school year regardless of start date. (Not for use for students entering from BIE schools use E3.)');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'E2', 'E2', 'Initial enrollment for current school year. Student who has been enrolled in school this current school year in another state, private school, home school or transfer in from a state-supported school. Registration for school can be at any time during the year. (Not for use for students entering from BIE schools. Use E3.)');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'E3', 'E3', 'Previously enrolled in BIE school - Student who enrolls in NM Public schools for the first time during the current school year from a BIE school. Registration for New Mexico public school can occur at any time during the school year.');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'R1', 'R1', 'Transfer within district - Student that transfers from one school to another school (including district charters) in same district during the current school year. (A R1 must be preceded by a W19)');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'R2', 'R2', 'Transfer from outside district - Student who moves from a school district or charter school in a different district in New Mexico into your district after school starts - does not include transfers to or from your district charter schools. (An R2 must be preceded by a W1');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'R3', 'R3', 'Previously dropped from enrollment - Student previously dropped from school for any reason other than transfer to another school or district and later returns to your school site without attending school elsewhere during this school year (student was previously an E1, R1 or R2). (An R3 must be preceded by a E code in the same location and then any W code except W1)');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);


--SpecialEducationSettingDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SpecialEducationSettingDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationSettingDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'RC80', 'RC80', 'Inside Regular Class 80% or more of day');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'RC79TO40', 'RC79TO40', 'Inside Regular Class 40% - 79% of day');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'RC39', 'RC39', 'Inside Regular Class less than 40% of day');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'PPPS', 'PPPS', 'Private School – Parentally Placed These are children who are enrolled by their parents or guardians in regular parochial or other private schools and whose basic education is paid through private resources and who received special education and related services at public expense from a local educational agency or intermediate educational unit under a services plan.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'REC10YSV', 'REC10YSV', 'Children attending a regular early childhood program at least 10 hours per week and receiving the majority of hours of special education and related services in the regular early childhood program.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'REC10YOT', 'REC10YOT', 'Children attending a regular early childhood program at least 10 hours per week and receiving the majority of hours of special education and related services in some other location.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'REC09YSV', 'REC09YSV', 'Children attending a regular early childhood program less than 10 hours per week and receiving the majority of hours of special education and related services in the regular early childhood program.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'REC09YOT', 'REC09YOT', 'Children attending a regular early childhood program less than 10 hours per week and receiving the majority of hours of special education and related services in other location.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'SC', 'SC', 'Children attending a special education program in a separate special education class.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'SPL', 'SPL', 'Service Provider Location - Children attending neither a regular early childhood program nor a special education program and receiving the majority of hours of special education and related services at the service provider’s location or some other location not in any other category.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'SH', 'SH', 'Receiving special education and related services in the home.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'SS', 'SS', 'Separate School - These are children whom received education programs in public or private separate day school facilities. This includes children with disabilities receiving special education and related services, at public expense, for greater than 50% of the school day in public or private separate schools. This may include children placed in:
public and private day schools for students with disabilities

public and private day schools for students with disabilities for a portion of the school day (greater than 50%) and in regular school buildings for the remainder of the school day

public and private residential facilities if the student does not live at the facility');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'HH', 'HH', 'Homebound/Hospital (HH) – These are children whom received programs in homebound/hospital environments. This includes children receiving special education and related services in hospital programs or homebound programs. 
Note: This value can only be used for students that have the location code of 993 (Hospitalized) or 998 (Homebound).');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'CF', 'CF', 'Correctional Facilities (CF) – These are children whom received special education in correctional facilities. These data are intended to be an unduplicated count of all children receiving special education in short-term detention facilities (community-based or residential) or correctional facilities');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'RF', 'RF', 'Residential Facility (RF) – These are children whom received education programs and lived in public or private residential facilities during the school week. This includes children with disabilities receiving special education and related services, at public expense, for greater than 50% of the school day in public or private residential facilities. This may include children placed in:
public and private residential schools for students with disabilities

public and private residential schools for students with disabilities for a portion of the school day (greater than 50%) and in separate day schools or regular school buildings for the remainder of the school day

Do not include students who received education programs at the facility, but do not live there.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);


--DisciplineDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DisciplineDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DisciplineDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '1', '1', 'Arrest/referral to justice system');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '2', '2', 'In school suspension (DO NOT include Lunch, Before/After School Detentions)');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '3', '3', 'Out of school suspension (DO NOT include Lunch, Before/After School Detentions)');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '4', '4', 'Expulsion - no educational services – REGULAR ED ONLY; NOT to be used for Special Ed students)');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '5', '5', 'Modified Expulsion (still receiving some educational services)');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '6', '6', 'Sent to alternate setting by school personnel');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '7', '7', 'Sent to alternate setting based on hearing officer determination of likely injury');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '8', '8', 'Other/Unknown (See below in regard to this code use for students with disabilities)');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '10', '10', 'Restraint');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '11', '11', 'Seclusion');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '12', '12', 'Called police instead of restraining or secluding student');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);


--SpecialEducationProgramServiceDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SpecialEducationProgramServiceDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationProgramServiceDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'AU', 'AU', 'Audiologist');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'IHP', 'IHP', 'Student''s IEP requires an individualized health plan NEW');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'IN', 'IN', 'Interpreter');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'LIFT', 'LIFT', 'Student''s IEP requires a wheelchair lift NEW');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'NMSBVI', 'NMSBVI', 'Receiving services at both the district and New Mexico School for the Blind and Visually Impaired');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'NMSD', 'NMSD', 'Receiving services at both the district and New Mexico School for the Deaf');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'NS', 'NS', 'Student''s IEP requires nursing services NEW');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'OR', 'OR', 'Orientation');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'OT', 'OT', 'Occupational Therapy');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'PS', 'PS', 'Psychological Services');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'PT', 'PT', 'Physical Therapy');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'RC', 'RC', 'Rehabilitation Counseling Services');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'RF', 'RF', 'Certified Residential Facility Services');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'RT', 'RT', 'Recreational Therapy');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'SECDEV', 'SECDEV', 'Student''s IEP requires a security device such as harness, tethers, braces, restraints, seatbelts, or vest NEW');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'SS', 'SS', 'Speech Services');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'SW', 'SW', 'Social Work Services');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationProgramServiceDescriptor', 'TRS', 'TRS', 'Student''s IEP requires transportation services NEW');
        INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (SpecialEducationProgramServiceDescriptorid) values (@@IDENTITY);

--ServiceDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ServiceDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/ServiceDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-CCR', 'CSP-CCR', 'Intentional addition to or expansion of College and Career Readiness opportunities supported by community school partners.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-CIVICLEADERSHIP', 'CSP-CIVICLEADERSHIP', 'Civic leadership or service learning activities encourage inquiry and examine the important social topics of students’ local government and community. Civic leadership activities prepare service-minded youth to experience the full impact of service learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-COMMUNITY', 'CSP-COMMUNITY', 'Intentional addition to or expansion of Community Service Learning opportunities supported by community school partners and guided by the site-based leadership team.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-COUNSELING', 'CSP-COUNSELING', 'School based or school linked counseling services that address non-academic barriers to learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-CREDITRECOVERY', 'CSP-CREDITRECOVERY', 'Data informed intentional outreach and system navigational support for students; guided by the site-based leadership team.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-DENTAL', 'CSP-DENTAL', 'School based or school linked health services designed to address non-academic barriers to learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-DROPOUTPREVENTION', 'CSP-DROPOUTPREVENTION', 'Data informed intentional outreach and system navigational support for students; guided by the site-based leadership team.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-ECE', 'CSP-ECE', 'Provide high-quality prekindergarten programs aligned to early childhood professional and curricular early learning standards.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-ELD', 'CSP-ELD', 'Intentional addition to or expansion of English Language Development opportunities supported by community school partners.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-ENRICHMENT', 'CSP-ENRICHMENT', 'Academic enrichment, designed to close the opportunity gap for low-income students, which expands upon and reinforces core curriculum; happens outside of the traditional classroom.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-FAMILYLITERACY', 'CSP-FAMILYLITERACY', 'Family-focused enrichment activities that provide students with the tools that they need to implement positive practices in their home to support their learning. These activities foster strong family ties, build literacy skills, and increase the confidence and the communication skills of students, allowing them to interact more effectively with family members, teachers, school staff members, and in the community.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-FINEARTS', 'CSP-FINEARTS', 'Arts activities that utilize various mediums of art (painting, drawing, photography, clay, digital, culinary, etc.).');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-HEALTHWELLNESS', 'CSP-HEALTHWELLNESS', 'Health and fitness activities designed to teach students knowledge, skills and basic competencies in wellness such as physical, mental and emotional foundations, self-reflective and meditation skills, nutrition, healthy eating and cooking.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-HERITAGELANGINST', 'CSP-HERITAGELANGINST', 'Intentional addition to or expansion of Heritage Language Instruction (dual language instruction) opportunities supported by community school partners.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-HIGHYIELDLEARNING', 'CSP-HIGHYIELDLEARNING', 'High-Yield Learning Activities provide youth with fun experiences that are hands-on, interactive, varied and intentional such as, Legos, Chess, Monopoly, Scrabble, Jeopardy, etc. Tutoring services (ideally project based and must meet the above criteria in approach).');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-HOMEVISIT', 'CSP-HOMEVISIT', 'School based or school linked home visit outreach designed to address non-academic barriers to learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-LANGUAGECULTURE', 'CSP-LANGUAGECULTURE', 'Language and Culture activities introduce students to the richness of international cultures and the basics of their languages, both spoken and written. Topics include history, calligraphy, cultural customs, geography, dance, and cuisine.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-MENTOR', 'CSP-MENTOR', 'Intentionally supportive relationships between students and a caring adult, which mitigates early warning indicators in students.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-PERFORMINGARTS', 'CSP-PERFORMINGARTS', 'Arts activities both utilizing and teaching various performance art techniques and that which goes into producing a performance, such as: dance, choir, drama, set design, costume design, spoken word, and music.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-POSITIVESCHCULTURE', 'CSP-POSITIVESCHCULTURE', 'Coordinated and intentional strategy designed to transform behavior, attitude and actions to improve school culture; guided by the site-based leadership team with an emphasis on student voice and community input.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-REMEDIAL', 'CSP-REMEDIAL', 'Data informed intentional outreach and system navigational support for students; guided by the site-based leadership team.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-SOCIALEMOTIONAL', 'CSP-SOCIALEMOTIONAL', 'Programs where adults model social and emotional skills and children have opportunities to practice using them in diverse situations in a safe, caring learning environment established organization-wide. SEL is defined according to the Collaborative for Academic, Social and Emotional Learning (CASEL) as “the process through which children and adults acquire and effectively apply the knowledge, attitudes, and skills necessary to understand and manage emotions, set and achieve positive goals, feel and show empathy for others, establish and maintain positive relationships, and make responsible decisions.” Counseling refers to a therapeutic approach to group activities.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-SOCIALWRK', 'CSP-SOCIALWRK', 'School based or school linked social work services that address non-academic barriers to learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-SPORTS', 'CSP-SPORTS', 'Activities designed to teach youth the fundamentals of a particular sport through basic technique and skills training. Students will study the rules, practices, and technical aspects, including strategies.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-STEM-STEAM', 'CSP-STEM-STEAM', 'Intentional Science, Technology, Engineering, Art and/or Math learning experiences designed to close the opportunity gap for low-income students, which expands upon and reinforces traditional STEAM core curriculum.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-TUTOR', 'CSP-TUTOR', 'Data informed intentional outreach and system navigational support for low-performing students; guided by the site-based leadership team.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-VISION-HEARING', 'CSP-VISION-HEARING', 'School based or school linked services designed to address non-academic barriers to learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-WRAP-AROUND', 'CSP-WRAP-AROUND', 'Coordinated and intentional integrated services, programs and supports designed to increase student access within the Integrated Student Supports, Expanded and Enriched Learning Time and Active Family and Community Engagement.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-YOUTHLEADERSHIP', 'CSP-YOUTHLEADERSHIP', 'Includes a range of opportunities for youth to take leadership roles. Programs can engage young people in community service or service learning projects that enhance the quality of life in their own communities. Youth can be active in the program by serving as tutors and mentors for younger children. Youth can serve on boards of directors, as well as advise on and become partners in curriculum and program development at your site, in addition to program evaluation.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'CSP-WORKFORCE', 'CSP-WORKFORCE', 'Build foundational skills such as teamwork, communication, and critical thinking skills that will help students in school, the workforce, and in life. Introduce students to new interests, opening their eyes to potential career pathways. Provide opportunities to gain real world work experience and practice skills that will help build their familiarity with and capabilities in the workforce.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-CCR', 'EELTO-CCR', 'Activities that develop knowledge and skills necessary to qualify for and succeed in entry-level, credit-bearing postsecondary coursework and/or the workforce.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-CIVICLEADERSHIP', 'EELTO-CIVICLEADERSHIP', 'Civic leadership or service learning activities encourage inquiry and examine the important social topics of students’ local government and community. Civic leadership activities prepare service-minded youth to experience the full impact of service learning.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-FAMILYLITERACY', 'EELTO-FAMILYLITERACY', 'Family-focused enrichment activities that provide students with the tools that they need to implement positive practices in their home to support their learning. These activities foster strong family ties, build literacy skills, and increase the confidence and the communication skills of students, allowing them to interact more effectively with family members, teachers, school staff members, and in the community.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-FINEARTS', 'EELTO-FINEARTS', 'Arts activities that utilize various mediums of art (painting, drawing, photography, clay, digital, culinary, etc.).');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-HEALTHWELLNESS', 'EELTO-HEALTHWELLNESS', 'Health and fitness activities designed to teach students knowledge, skills and basic competencies in wellness such as physical, mental and emotional foundations, self-reflective and meditation skills, nutrition, healthy eating and cooking.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-LANGUAGECULTURE', 'EELTO-LANGUAGECULTURE', 'Language and Culture activities introduce students to the richness of international cultures and the basics of their languages, both spoken and written. Topics include history, calligraphy, cultural customs, geography, dance, and cuisine.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-PERFORMINGARTS', 'EELTO-PERFORMINGARTS', 'Arts activities both utilizing and teaching various performance art techniques and that which goes into producing a performance, such as: dance, choir, drama, set design, costume design, spoken word, and music.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-SOCIALEMOTIONAL', 'EELTO-SOCIALEMOTIONAL', 'Programs where adults model social and emotional skills and children have opportunities to practice using them in diverse situations in a safe, caring learning environment established organization-wide. SEL is defined according to the Collaborative for Academic, Social and Emotional Learning (CASEL) as “the process through which children and adults acquire and effectively apply the knowledge, attitudes, and skills necessary to understand and manage emotions, set and achieve positive goals, feel and show empathy for others, establish and maintain positive relationships, and make responsible decisions.” Counseling refers to a therapeutic approach to group activities.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-STEM-STEAM', 'EELTO-STEM-STEAM', 'STEAM activities must include two or more standards from science, technology, engineering, arts or math.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-YOUTHLEADERSHIP', 'EELTO-YOUTHLEADERSHIP', 'Includes a range of opportunities for youth to take leadership roles. Programs can engage young people in community service or service learning projects that enhance the quality of life in their own communities. Youth can be active in the program by serving as tutors and mentors for younger children. Youth can serve on boards of directors, as well as advise on and become partners in curriculum and program development at your site, in addition to program evaluation.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-WORKFORCE', 'EELTO-WORKFORCE', 'Build foundational skills such as teamwork, communication, and critical thinking skills that will help students in school, the workforce, and in life. Introduce students to new interests, opening their eyes to potential career pathways. Provide opportunities to gain real world work experience and practice skills that will help build their familiarity with and capabilities in the workforce.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-TUTORING', 'EELTO-TUTORING', 'High-Yield Learning Activities provide youth with fun experiences that are hands-on, interactive, varied and intentional such as, Legos, Chess, Monopoly, Scrabble, Jeopardy, etc. Tutoring services (ideally project based and must meet the above criteria in approach).');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);



--ExitWithdrawTypeDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ExitWithdrawTypeDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/ExitWithdrawTypeDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W1', 'W1', 'Student has transferred out to another PED District or State Charter. (Do not use it if a student transfers within the district, please use W19 for transfers within the district.) For a list of authorized PED Charters please run the Schools from Location Snapshot report.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W2', 'W2', 'Absent 10 days - A student that has been absent for ten (10) consecutive days must be dropped from the rolls. These may include truants and habitual truants provided the school district has intervened according to their retention and truancy policy as provided in Section 22-12-9 NMSA 1978 and the Attendance for Success Act. If the student attends at least one day or one class period this code should be used.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W4', 'W4', 'GED - Student exits to a non-diploma granting education setting such as vocational or GED program.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W5', 'W5', 'Detained – Student is detained in a court-ordered facility, such as out-of-state jail, expulsion or out-of-school suspension greater than 6 months - does NOT include New Mexico Corrections.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W6', 'W6', 'Left U.S. – Student emigrated or moved outside of US or US territories; does not include temporary military assignment or studying abroad as a US exchange student.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W7', 'W7', 'Pregnancy - Student exited school due to pregnancy (applies to either female or male student).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W8', 'W8', 'Transfer within state of NM to a non-public or BIE school. - Student who withdraws to a diploma-granting, non-public school within New Mexico. This includes a private or BIE school that grants a standard diploma recognized by the State of New Mexico. Does not include Registered Home School or Moved out of state to BIE (use W81 or W10). See the List of BIE Schools below.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W9', 'W9', 'Immunization - Student dis-enrolled due to failure to provide satisfactory evidence of 1) commencement of immunization OR 2) completion of immunization.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W10', 'W10', 'Moved out of state or attend online learning in an out-of-state school. Use this code for students who moved out of New Mexico, attend online schooling out of state, or who are studying abroad as US exchange students. Does not include Home Schooled. (Use 81)');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W19', 'W19', 'Withdrawal - Student withdrew from one PED location (public school) and enrolled in another PED location (public school) within the same District including any local charter within the same District.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W20', 'W20', 'Transfer within state of NM to Tribally Controlled School (TCS). - This includes TCS that grants a standard diploma recognized by the State of New Mexico. Does not include Home School or Moved out of state to TCS (use W81 or W10). See the List of TCS Schools below.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W81', 'W81', 'Registered as Home Schooled – does not include students enrolled in a school that provides remote instruction. Home School - Use this code for students withdrawing to be Home-Schooled');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WD', 'WD', 'Death – Student has died.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WDO', 'WDO', 'Drop-out – Students are known to have dropped out of school.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WG', 'WG', 'Graduate - Graduated with a standard diploma (required for early graduates and optional for EOY graduates). Does not include certificates of completion. Diploma Type Code must equal 1.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WC', 'WC', 'Completion – Student in regular education only who completed coursework required to graduate but did not pass the HSCE. Required for early completers and optional for EOY completers. Diploma type code must equal 2. Includes regular education only, and not Special Education.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'D1', 'D1', 'Disregard: Submitted in error - Student Template record was submitted in error. Must be submitted prior to student’s inactivation.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'D2', 'D2', 'Disregard: Incorrect Student ID - Student is enrolled under a different STATE ID. Must be submitted prior to student’s inactivation.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'D3', 'D3', 'Disregard - “No shows” – Student who was enrolled but who did not attend school. If a student was enrolled (in any fashion), was not withdrawn, and does not attend the school, use this code with no E/W codes.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

---- Course Level Characteristics
/* 
	Removing complexity and following the state code values by merging Basic and General into one descriptor Basic/General.
*/
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/CourseLevelCharacteristicDescriptor' AND CodeValue in ('Basic', 'General');

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor','Special Education','Special Education','Special Education');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor','Elective','Elective','Elective');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor','Lab Component','Lab Component','Lab Component');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor','Basic/General','Basic/General','Basic/General');

	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);

----Program Type Descriptor
/* 
	Adding to more closely align with the state reporting manual.
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/ProgramTypeDescriptor','MENTOR','MENTOR','MENTOR');
	INSERT INTO edfi.ProgramTypeDescriptor (ProgramTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/ProgramTypeDescriptor','MENTEE','MENTEE','MENTEE');
	INSERT INTO edfi.ProgramTypeDescriptor (ProgramTypeDescriptorId) values (@@IDENTITY);

---- Race Descriptor
/* 
	Removing complexity and following the state code values
*/
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/RaceDescriptor'
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://nmped.org/RaceDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/RaceDescriptor','C','Caucasian','Caucasian');
	INSERT INTO edfi.RaceDescriptor (RaceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/RaceDescriptor','B','Black or African American','Black or African American');
	INSERT INTO edfi.RaceDescriptor (RaceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/RaceDescriptor','A','Asian','Asian');
	INSERT INTO edfi.RaceDescriptor (RaceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/RaceDescriptor','I','American Indian/Alaskan Native','American Indian/Alaskan Native');
	INSERT INTO edfi.RaceDescriptor (RaceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/RaceDescriptor','P','Native Hawaiian or Other Pacific Islander','Native Hawaiian or Other Pacific Islander');
	INSERT INTO edfi.RaceDescriptor (RaceDescriptorid) values (@@IDENTITY);


---- Level of Education
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LevelOfEducationDescriptor';
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://nmped.org/LevelOfEducationDescriptor';

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfEducationDescriptor','D','Doctorate','Doctorate');
	INSERT INTO edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfEducationDescriptor','E','Educational Specialist','Educational Specialist');
	INSERT INTO edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfEducationDescriptor','M','Masters','Masters');
	INSERT INTO edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfEducationDescriptor','B','Bachelors','Bachelors');
	INSERT INTO edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfEducationDescriptor','A','Associate','Associate');
	INSERT INTO edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfEducationDescriptor','N','Non-Degree','Non-Degree');
	INSERT INTO edfi.LevelOfEducationDescriptor (LevelOfEducationDescriptorid) values (@@IDENTITY);

---- EmploymentStatusDescriptor
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/EmploymentStatusDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EmploymentStatusDescriptor','C','Certified Personnel','Certified Personnel');
	INSERT INTO edfi.EmploymentStatusDescriptor (EmploymentStatusDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EmploymentStatusDescriptor','N','Non-certified Personnel','Non-certified Personnel');
	INSERT INTO edfi.EmploymentStatusDescriptor (EmploymentStatusDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EmploymentStatusDescriptor','R','Contracted Related Service Provider','Contracted Related Service Provider');
	INSERT INTO edfi.EmploymentStatusDescriptor (EmploymentStatusDescriptorid) values (@@IDENTITY);

---- VisaDescriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/VisaDescriptor','TEMPVISA','Temporary Work Visa','Temporary Work Visa');
	INSERT INTO edfi.VisaDescriptor (VisaDescriptorid) values (@@IDENTITY);

---- MediumOfInstructionDescriptor
DELETE FROM edfi.Descriptor WHERE namespace = 'uri://ed-fi.org/MediumOfInstructionDescriptor'
DELETE FROM edfi.Descriptor WHERE namespace = 'uri://nmped.org/MediumOfInstructionDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/MediumOfInstructionDescriptor','FF','Face-To-Face','Face-To-Face');
	INSERT INTO edfi.MediumOfInstructionDescriptor (MediumOfInstructionDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/MediumOfInstructionDescriptor','HY','Hybrid','Hybrid');
	INSERT INTO edfi.MediumOfInstructionDescriptor (MediumOfInstructionDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/MediumOfInstructionDescriptor','DL','Distance Learning','Distance Learning');
	INSERT INTO edfi.MediumOfInstructionDescriptor (MediumOfInstructionDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/MediumOfInstructionDescriptor','CB','Computer-based','Computer-based');
	INSERT INTO edfi.MediumOfInstructionDescriptor (MediumOfInstructionDescriptorid) values (@@IDENTITY);

---- EducationalEnvironmentDescriptor
DELETE FROM edfi.Descriptor WHERE namespace = 'uri://ed-fi.org/EducationalEnvironmentDescriptor'
DELETE FROM edfi.Descriptor WHERE namespace = 'uri://nmped.org/EducationalEnvironmentDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','APLUS','APlus','APlus');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','BYU','BYU','BYU');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','EDCONN','EDCONN','EdConnection');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','EDGENU','EDGENU','Edgenuity');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','EDMENT','EDMENT','Edmentum');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','FUELED','FUELED','Fuel Ed');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','K-12','K-12','K-12 (including A+ Instructional Material)');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','ODYSSE','ODYSSE','Odysseyware');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','PROXIM','PROXIM','PROXIM');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','NMVCC','NMVCC','New Mexico Virtual Course Consortium (NMVC2)');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','OTHER','OTHER','OTHER');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

---- AttendanceEventCategoryDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AttendanceEventCategoryDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/AttendanceEventCategoryDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','K5PATTD','Attended K5P','Attended K5P');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','K5PABS','Absent K5P','Absent K5P');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','ELTPATTD','Attended ETLP','Attended ETLP');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','ELTPABS','Absent ELTP','Absent ELTP');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','RMTEATTD','Attended Remote Learning','Attended Remote Learning');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','UNHDCO','Unexcused Half Day Absence Religious or Cultural Observance','Unexcused Half Day Absence Religious or Cultural Observance');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','UNFDCO','Unexcused Full Day Absence Religious or Cultural Observance','Unexcused Full Day Absence Religious or Cultural Observance');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','EHDCO','Excused Half Day Absence Religious or Cultural Observance','Excused Half Day Absence Religious or Cultural Observance');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','EFDCO','Excused Full Day Absence Religious or Cultural Observance','Excused Full Day Absence Religious or Cultural Observance');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

---- PrimaryLearningDeviceAwayFromSchoolDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PrimaryLearningDeviceAwayFromSchoolDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','01','Chromebook','Chromebook');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','02','Desktop Computer','Desktop Computer');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','03','Laptop Computer','Laptop Computer');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','04','Tablet - Apple','Tablet - Apple');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','05','Tablet - Windows','Tablet - Windows');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','06','Tablet - Android','Tablet - Android');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','07','Tablet - None of Above','Tablet - None of Above');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','08','Smartphone','Smartphone');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','09','None of the above','None of the above');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','10','No Device','No Device');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

---- DigitalEquityPrimaryLearningDeviceTypeDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DigitalEquityPrimaryLearningDeviceTypeDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DigitalEquityPrimaryLearningDeviceTypeDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DigitalEquityPrimaryLearningDeviceTypeDescriptor','Y','Yes','Yes, the student''s primary learning device is provided by their school.');
	INSERT INTO nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor (DigitalEquityPrimaryLearningDeviceTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DigitalEquityPrimaryLearningDeviceTypeDescriptor','N','No','No, the student''s primary learning device is a personal device.');
	INSERT INTO nmped.DigitalEquityPrimaryLearningDeviceTypeDescriptor (DigitalEquityPrimaryLearningDeviceTypeDescriptorid) values (@@IDENTITY);

---- DigitalEquityPrimaryLearningDeviceAccessDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DigitalEquityPrimaryLearningDeviceAccessDescriptor'
DELETE FROM nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DigitalEquityPrimaryLearningDeviceAccessDescriptor','DEDICATED','DEDICATED','The student''s primary learning device is not shared with anyone else in the household.');
	INSERT INTO nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor (DigitalEquityPrimaryLearningDeviceAccessDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DigitalEquityPrimaryLearningDeviceAccessDescriptor','SHARED','SHARED','The student''s primary learning device is also used by others in the household.');
	INSERT INTO nmped.DigitalEquityPrimaryLearningDeviceAccessDescriptor (DigitalEquityPrimaryLearningDeviceAccessDescriptorid) values (@@IDENTITY);
	
/* Note: Doug changed this to be a boolean value in the extension instead of a simple Yes|No Descriptor.
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/InternetAccessDescriptor'
DELETE FROM nmped.DigitalEquityInternetAccessTypeDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessDescriptor','Y','Yes','Yes');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (InternetAccessDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessDescriptor','N','No','No');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (InternetAccessDescriptorid) values (@@IDENTITY);
*/

--TODO: Look this over. Should these namespaces match the control tables?
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor'
DELETE FROM nmped.DigitalEquityInternetAccessTypeDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','01','Fiber','Fiber');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','02','Cable','Cable');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','03','DSL','DSL');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','04','Microwave','Microwave');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','05','Satellite','Satellite');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','06','Dial-up','Dial-up');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','07','Personal Hotspot','Personal Hotspot');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','08','School Provided Hotspot','School Provided Hotspot');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','09','Unknown','Unknown');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','10','None','None');
	INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor (DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);


--TODO: Look this over. Should these namespaces match the control tables?
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DigitalEquityInternetPerformanceCodeDescriptor'
DELETE FROM nmped.DigitalEquityInternetPerformanceCodeDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetPerformanceInResidenceDescriptor','01','Yes','Yes, With No Issues (The student can reliably stream video on their primary learning device without interruption.)');
	INSERT INTO nmped.DigitalEquityInternetPerformanceCodeDescriptor (DigitalEquityInternetPerformanceCodeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetPerformanceInResidenceDescriptor','02','Yes, But Not Consistent','Yes, But Not Consistent (The student can stream video on their primary learning device, but there are interruptions or issues with video quality.)');
	INSERT INTO nmped.DigitalEquityInternetPerformanceCodeDescriptor (DigitalEquityInternetPerformanceCodeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetPerformanceInResidenceDescriptor','03','No','No (The student cannot reliably stream video on their primary learning device.)');
	INSERT INTO nmped.DigitalEquityInternetPerformanceCodeDescriptor (DigitalEquityInternetPerformanceCodeDescriptorId) values (@@IDENTITY);



----Grade Level Descriptor
/* 
	Removing complexity and following the state code values
*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','PK','Pre-Kindergarten','Pre-Kindergarten');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','KN','Kindergarten, Half-Day','Kindergarten, Half-Day');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','KF','Kindergarten, Full-Day','Kindergarten, Full-Day');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','01','First Grade','First Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','02','Second Grade','Second Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','03','Third Grade','Third Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','04','Fourth Grade','Fourth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','05','Fifth Grade','Fifth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','06','Sixth Grade','Sixth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','07','Seventh Grade','Seventh Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','08','Eighth Grade','Eighth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','09','Ninth Grade','Ninth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','10','Tenth Grade','Tenth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','11','Eleventh Grade','Eleventh Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','12','Twelfth Grade','Twelfth Grade');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','OS','Out of School','Out of School');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SexDescriptor'


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SexDescriptor','M','Male','Male');
	INSERT INTO edfi.SexDescriptor (SexDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SexDescriptor','F','Female','Female');
	INSERT INTO edfi.SexDescriptor (SexDescriptorid) values (@@IDENTITY);


DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor'


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor','F','Free','Free');
	INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor','R','Reduced','Reduced');
	INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor','Not participating.','','Not participating as Free or Reduced. (Students who pay full price for their school meals)');
	INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorid) values (@@IDENTITY);



----Limited English Proficiency Descriptor
/* 
	Removing complexity and following the state code values
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/LimitedEnglishProficiencyDescriptor'


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','NT','Not Tested','Not tested. Only for PreK as they can’t be tested.');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','0','IFEP','IFEP Initially Fluent English Proficient Student was never EL');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','1','Current EL Student','Current EL Student');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','2','RFEP 1','RFEP 1 Reclassified Fluent English Proficient-exited Year 1');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','3','RFEP 2','RFEP 2 Reclassified Fluent English Proficient-exited Year 2');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','4','RFEP 3','RFEP 3 Reclassified Fluent English Proficient-exited Year 3');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','5','RFEP 4','RFEP 4 Reclassified Fluent English Proficient-exited Year 4');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LimitedEnglishProficiencyDescriptor','6','RFEP 5+','RFEP 5+ Reclassified Fluent English Proficient-exited Year 5+');
	INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (LimitedEnglishProficiencyDescriptorid) values (@@IDENTITY);


----Student Characteristic Descriptor
/* 
	Adding values to match the state reporting method
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/StudentCharacteristicDescriptor','NP','Parent','Student is a parent.');
	INSERT INTO edfi.StudentCharacteristicDescriptor (StudentCharacteristicDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/StudentCharacteristicDescriptor','Home Schooled','Home Schooled','Student is home schooled.');
	INSERT INTO edfi.StudentCharacteristicDescriptor (StudentCharacteristicDescriptorid) values (@@IDENTITY);

--DisabilityDeterminationSourceTypeDescriptor

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor'
DELETE FROM edfi.DisabilityDeterminationSourceTypeDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DisabilityDeterminationSourceTypeDescriptor','C','Child in Part C (Birth-3) and was referred to Pt B (3-21) for elig determ.','Child served in Part C (Birth-3) and was referred to Part B (Age 3-21) for eligibility determination.');
	INSERT INTO edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DisabilityDeterminationSourceTypeDescriptor','F','Child was referred thru Child Find (NOT Receiving Part C Services)','Child was referred thru Child Find (NOT Receiving Part C Services)');
	INSERT INTO edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorid) values (@@IDENTITY);


--tpdm.GenderDescriptor
/* 
	Adding values to match the state reporting method
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://tpdm.ed-fi.org/GenderDescriptor','X','Non-Binary','Non-Binary');
	INSERT INTO tpdm.GenderDescriptor (GenderDescriptorid) values (@@IDENTITY);

--edfi.DiplomaTypeDescriptor
/* 
	Adding values to match the state reporting method
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://ed-fi.org/DiplomaTypeDescriptor','1','Diploma of Excellence without ADC.','Diploma of Excellence without an Alternate Demonstration of Competency (ADC).');
	INSERT INTO tpdm.GenderDescriptor (GenderDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://ed-fi.org/DiplomaTypeDescriptor','2','Certificate of Course Work Completed.','Certificate of Course Work Completed (May include students in special education if they are on a continuing or transition IEP. Does NOT end student’s right to FAPE.)');
	INSERT INTO tpdm.GenderDescriptor (GenderDescriptorid) values (@@IDENTITY);

--Special Education Event Type Descriptor
/* 
	Ensuring no values have found their way into this table and seeding with correct values.
*/
	
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationEventTypeDescriptor'
DELETE FROM nmped.SpecialEducationEventTypeDescriptor
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '1', '1', 'Special Education Exit (Return to General Education)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '2', '2', 'Parental Notification of the transfer of rights has occurred');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '3', '3', 'Parental consent revoked for Special Education & Related Services (34 CFR §300.300 (b)(4))');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '4', '4', 'A Communication Needs Consideration Form was completed at the IEP for student who is deaf or hard of hearing, or Blind or Visually Impaired, regardless of the disability regardless of the disability.');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '5', '5', 'A Communication Needs Considered at the IEP for student who is. Note: When Developing IEPs for students who are blind or have a visual impairment the IEP team must consider instruction in Braille unless the team determines after an evaluation that Braille is not needed.');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '6', '6', 'CEIS - Date of referral for special education');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '9', '9', 'Parental consent revoked for Medicaid and/or Private Insurance (34 CFR §300.154 (d)(2)(v)(D))');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '10', '10', 'One-time Written Parental Consent for Medicaid and/or Private Insurance.');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '12', '12', 'Annual Written Notification to Parent/Guardian regarding Medicaid and/or Private Insurance');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '13', '13', 'Returning senior who has a current IEP with written prior notice that will receive a conditional certificate of transition. CONTINUING IEP – MUST BE IN SCHOOL.');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '14', '14', 'Returning senior who has a current IEP with prior written notice that student will receive a conditional certificate of transition – TRANSITION MAY/MAY NOT BE IN SCHOOL');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '18', '18', 'Part C to B (Indicator 12) - Date referral received from Part C (Item a of equation a-b-d-e ÷ c)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '20', '20', 'Part C to B (Indicator 12) - 90 day transition conference date');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '21', '21', 'Part C to B (Indicator 12)- Eligibility Determination- YES');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '22', '22', 'Part C to B (Indicator 12)- Initial Placement IEP date or date when IEP was developed prior to third birthday (Item c of equation a-b-d-e ÷ c)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '23', '23', 'Part C to B (Indicator 12)- IEP Implementation (when student started receiving special education services under Part B prior to third birthday) (Item c of equation a-b-d-e ÷ c)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '24', '24', 'Part C to B (Indicator 12)- Eligibility Determination – NO must be determined prior to third birthday. (Item b of equation a-b-d-e ÷ c)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '25', '25', 'Part C to B (Indicator 12) - Determined to be eligible for early intervention services under Part C less than 90 days before third birthday. (Item e of equation a-b-d-e ÷ c)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '26', '26', 'Part C to B (Indicator 12) - Parent refused to provide consent for evaluation or initial services. (Item d of equation a-b-d-e ÷ c)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '30', '30', 'Part B (Indicator 11) - Parental Consent Initial Evaluation Only');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '31', '31', 'Part B (Indicator 11) - Initial Evaluation Only');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '32', '32', 'Part B (Indicator 11) - Initial EDT Eligibility Determination - YES');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '33', '33', 'Part B (Indicator 11) - Initial EDT Eligibility Determination - NO');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '34', '34', 'Part B - Initial IEP Date');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '35', '35', 'Part B (Indicator 11) - A child enrolls in a school or another public agency after the timeframe for initial evaluations has begun, and prior to a determination by the child’s previous public agency as to whether the child is a child with a disability.');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '36', '36', 'Part B (Indicator 11) - Parent fails or refuses to produce the child for evaluation (at least three documented attempts)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '37', '37', 'LEA missed timeline (Indicators 11 and 12)');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '40', '40', 'The LEA assures that compliance has been met for the following Post-secondary Transition Goals. Now Required for 14 and older. ');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
		
		
--NonComplianceReasonDescriptor
/* 
	Ensuring no values have found their way into this table and seeding with correct values.
*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/NonComplianceReasonDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/NonComplianceReasonDescriptor'
DELETE FROM nmped.SpecialEducationNonComplianceReasonDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '7', '7', 'Student Died WD');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '14', '14', 'Withdrawal from Part C by Parent prior to child’s third birthday. (Indicator 12 only)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '18', '18', 'Part C referred child less than 90 days before the child’s 3rd birthday');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '20', '20', 'Student moved out of the school district''s educational jurisdiction');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '21', '21', 'Student graduated before IEP corrected.');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '22', '22', 'Student dropped out of school before IEP corrected.');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '30', '30', 'No service provider available to complete evaluation (Use for Indicator 11)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '31', '31', 'Evaluation scheduling issues/ Difficulty scheduling IEP with parent/ Evaluation delays (Use for Indicator 11 or 12)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '32', '32', '60th day/3rd birthday on weekend, holiday or during other school closure (Use for Indicator 11 or 12)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '33', '33', 'Parent request delay in IEP meeting (Use for Indicator 12)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/NonComplianceReasonDescriptor', '34', '34', 'Parent request delay in completion of evaluation (Indicator 11 only)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);
		
--EventReasonDescriptor
/* 
	Ensuring no values have found their way into this table and seeding with correct values.
*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationEventReasonDescription'
DELETE FROM nmped.SpecialEducationEventReasonDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '1', 'Returned to regular education (no longer receiving special education)', 'Returned to regular education (no longer receiving special education)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '4', 'Reached Maximum Age', 'Reached Maximum Age');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '5', 'Died WD', 'Died WD');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '6', 'Student has transferred out to another PED District or State Charter.', 'Student has transferred out to another PED District or State Charter.');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '8', 'Dropped Out ', 'Dropped Out ');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '9', 'Graduated with Diploma on Standard Option (FAPE ends)', 'Graduated with Diploma on Standard Option (FAPE ends)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '10', 'Graduated with Diploma on Modified Option (Does not end FAPE)', 'Graduated with Diploma on Modified Option (Does not end FAPE)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EventReasonCodeDescription', '11', 'Graduated with Diploma on Ability Option (Does not end FAPE)', 'Graduated with Diploma on Ability Option (Does not end FAPE)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);


--Updating the J1Visa codevalue to match the state reporting code value
UPDATE edfi.Descriptor
SET CodeValue = 'J1Visa' WHERE Namespace = 'uri://ed-fi.org/VisaDescriptor' AND CodeValue = 'J1 - Exchange Scholar Visa'

--Updating the J1Visa description to match the state reporting description
UPDATE edfi.Descriptor
SET ShortDescription = 'J1Visa' WHERE Namespace = 'uri://ed-fi.org/VisaDescriptor' AND CodeValue = 'J1Visa'

-- *** TRANSPORTATION Descriptors***
-- Vehicle Fuel Type
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/VehicleFuelType'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelType', 'ALT', 'Alternative fuel', 'Alternative fuel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelType', 'ULG', 'Unleaded gasoline', 'Unleaded gasoline');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelType', 'DIE', 'Diesel', 'Diesel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelType', 'DYD', 'Dyed diesel', 'Dyed diesel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

-- Vehicle Body Manufaturer
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/VehicleBodyManufacturer'
DELETE FROM nmped.VehicleBodyManufacturerDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'AMT', 'Amtram', 'Amtram');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'BLU', 'Bluebird', 'Bluebird');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'CE3', 'CE300', 'CE300');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'CHV', 'Chevy', 'Chevy');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'COL', 'Collins', 'Collins');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'FOR', 'Ford', 'Ford');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'FRE', 'Freightliner', 'Freightliner');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'GEN', 'GENE', 'GENE');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'GMC', 'GMC', 'GMC');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'IC', 'IC', 'IC');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'INT', 'International', 'International');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'Mid', 'Mid Bus', 'Mid Bus');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'OTH', 'Other', 'Other');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'THO', 'Thomas', 'Thomas');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturer', 'VI', 'Vision', 'Vision');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

/* 
Duplicate Inserts
-- Vehicle Fuel Type
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelType', 'ALT', 'Alternative fuel', 'Alternative fuel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY); 

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelType', 'ULG', 'Unleaded gasoline', 'Unleaded gasoline');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);
 */
 
