DECLARE @DescriptorId AS Integer;
/* SpecialEducationLevelOfIntegration */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SpecialEducationLevelOfIntegrationDescriptor','1','1 = Less than 10% of the day (minimum or "A")','1 = Less than 10% of the day (minimum or "A")');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SpecialEducationLevelOfIntegrationDescriptor','2','2 = 11% to 49% of the day (moderate or "B")','2 = 11% to 49% of the day (moderate or "B")');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SpecialEducationLevelOfIntegrationDescriptor','3','3 = 50% of the day or more, but not a full day (extensive or "C")','3 = 50% of the day or more, but not a full day (extensive or "C")');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SpecialEducationLevelOfIntegrationDescriptor','4','4 = Up to a full day or program 3Y/4Y (maximum or "D")','4 = Up to a full day or program 3Y/4Y (maximum or "D")');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId) values (@DescriptorId);

/* DirectCertificationStatus */

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/DirectCertificationStatusDescriptor','1','1=SNAP Direct Cert as identified & certified by the district.','1 = SNAP Direct Cert as identified in the direct certification report and certified by the district.');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/DirectCertificationStatusDescriptor','2','2=Other Direct Cert Eligible (Homeless,FDPIR,Foster,Migrant,and HeadStart)','2 = Other Direct Cert Eligible (Homeless, FDPIR, Foster, Migrant, and Head Start)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/DirectCertificationStatusDescriptor','3','3=Family Mems of SNAP identified stus that wereNotFound inthe DirCertReport','3 = Family Members of SNAP identified students that were not found in the Direct Certification report.');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@DescriptorId);

/* SpecialProgramCode */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SpecialProgramCodeDescriptor','D','D = Dual Credit Course','D = Dual Credit Course');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SpecialProgramCodeDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SpecialProgramCodeDescriptor','C','C = Concurrent Enrollment Course','C = Concurrent Enrollment Course');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SpecialProgramCodeDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);

/* Program Delivery Method Descriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ProgramDeliveryMethodDescriptor','CG','College Granted Certificate','CG = College Granted Certificate');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ProgramDeliveryMethodDescriptor (ProgramDeliveryMethodDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ProgramDeliveryMethodDescriptor','IS','Industry Standard Third Party Assessment','IS = Industry Standard Third Party Assessment');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ProgramDeliveryMethodDescriptor (ProgramDeliveryMethodDescriptorId) values (@DescriptorId);

/* IndustryCredentialDescriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','1','Autodesk Certification','Autodesk Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','4','Adobe Certified Professional','Adobe Certified Professional');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','6','Automotive Technician','Automotive Technician');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','7','C++ Certified Associate Programmer','C++ Certified Associate Programmer');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','9','Network Certification','Network Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','15','Microsoft Certification','Microsoft Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','16','Certified Landscape Technician (CLT)','Certified Landscape Technician (CLT)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','17','Medical Assistant','Medical Assistant');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','19','Novell Administrator','Novell Administrator');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','20','Certified Nurse Aide (CNA)','Certified Nurse Aide (CNA)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','26','Certified Veterinary Assistant','Certified Veterinary Assistant');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','27','Child Development Associate Certification','Child Development Associate Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','28','CMI Custodial Technician','CMI Custodial Technician');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','31','Corel Certifications','Corel Certifications');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','33','Cosmetology License','Cosmetology License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','36','Dental Assistant License','Dental Assistant License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','39','Educational Assistant/Paraprofessional','Educational Assistant/Paraprofessional');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','42','Emergency Medical Dispatcher (EMD)','Emergency Medical Dispatcher (EMD)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','43','Emergency Medical Technician (EMT)','Emergency Medical Technician (EMT)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','44','Environmental Technician','Environmental Technician');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','47','Internet Core Computing - IC3','Internet Core Computing - IC3');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','51','Licensed Vocational Nurse (LVN)','Licensed Vocational Nurse (LVN)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','53','Hotel & lodging certification','Hotel & lodging certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','57','Licensed Massage Therapist','Licensed Massage Therapist');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','74','Oracle Certification','Oracle Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','75','OSHA Certification','OSHA Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','77','Pesticide Applicators Certification','Pesticide Applicators Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','78','Pharmacy Technician (CPhT) License','Pharmacy Technician (CPhT) License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','79','Phlebotomy Technician (CPT) License','Phlebotomy Technician (CPT) License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','83','Real Estate License','Real Estate License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','84','EPA certification','EPA certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','87','SABRE System Certification','SABRE System Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','90','ServSafe Certification','ServSafe Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','97','NCCER Certifications','NCCER Certifications');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','100','CompTIA Certification','CompTIA Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','103','S/P2 Certification','S/P2 Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','105','First Aid/CPR','First Aid/CPR');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','107','A*S*K Business Institute Certifications','A*S*K Business Institute Certifications');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','108','ACT National Career Readiness Certificate','ACT National Career Readiness Certificate');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','109','NOCTI Certification','NOCTI Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','111','Food Handler Certification','Food Handler Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','112','Welding Certification','Welding Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','115','Career Readiness Certification','Career Readiness Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','116','DECA School Based Enterprise Individual Certification','DECA School Based Enterprise Individual Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','117','Detention Officer Certification','Detention Officer Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','119','Floriculture','Floriculture');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','129','Early Care Education and Family Support','Early Care Education and Family Support');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','132','Police Explorer Certification','Police Explorer Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','133','Prostart','Prostart');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','139','Sustainability for Biofuels','Sustainability for Biofuels');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','143','Wildland Firefighting','Wildland Firefighting');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','148','Precision Certification','Precision Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','174','NC3 Certification','NC3 Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','175','WordPress web certification','WordPress web certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','176','FEMA certification','FEMA certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','177','Automated External Defibrillator (AED) Certification','Automated External Defibrillator (AED) Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','178','Licensed Practical Nurse (LPN) License','Licensed Practical Nurse (LPN) License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','179','Python Certification','Python Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','180','Unity Certification','Unity Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','181','Automotive Career Exploration','Automotive Career Exploration');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','182','Plate Glass certification','Plate Glass certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','183','Pro-Cut Certification','Pro-Cut Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(IndustryCredentialDescriptorId) values (@DescriptorId);

/* LevelOfEducationInstitution */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','00','Non-Degree','Non-Degree');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','55','University of New Mexico','University of New Mexico');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','56','New Mexico State University','New Mexico State University');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','57','New Mexico Highlands University','New Mexico Highlands University');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','58','Western New Mexico University','Western New Mexico University');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','59','Eastern New Mexico University','Eastern New Mexico University');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','60','New Mexico Institute of Mining and Technology','New Mexico Institute of Mining and Technology');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','61','University of Albuquerque','University of Albuquerque');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','62','Santa Fe University of Art & Design (formerly College of Santa Fe) -Closed','Santa Fe University of Art & Design (formerly College of Santa Fe) -Closed');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','63','University of the Southwest (formerly College of the Southwest)-Hobbs','University of the Southwest (formerly College of the Southwest)-Hobbs');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','64','St. John''s College','St. John''s College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','65','New Mexico Military Institute','New Mexico Military Institute');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','66','College of Artesia','College of Artesia');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','67','Central New Mexico Community College','Central New Mexico Community College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','68','Institute of American Indian Art','Institute of American Indian Art');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','69','Luna Vocational-Technical Institute','Luna Vocational-Technical Institute');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','70','Navajo Community College','Navajo Community College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','71','New Mexico Junior College','New Mexico Junior College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','72','Northern New Mexico Community College','Northern New Mexico Community College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','73','San Juan College','San Juan College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','74','Santa Fe Community College','Santa Fe Community College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','75','Mesa Technical College','Mesa Technical College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','76','Clovis Community College','Clovis Community College');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','77','Southwestern College (Santa Fe)','Southwestern College (Santa Fe)');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','78','Wayland Baptist University','Wayland Baptist University');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','79','University of Phoenix','University of Phoenix');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','80','Western Governor’s University ','Western Governor’s University ');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','81','National American University','National American University');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','82','ITT Technical Institute','ITT Technical Institute');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','83','Webster University – Albuquerque','Webster University – Albuquerque');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','84','Navajo Technical University - Crownpoint','Navajo Technical University - Crownpoint');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','85','Cooperative Educational Services (CES)','Cooperative Educational Services (CES)');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','86','Fort Lewis College - Durango CO','Fort Lewis College - Durango CO');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AA','Armed Forces Americas - AA','Armed Forces Americas - AA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AE','Armed Forces Canada - AE','Armed Forces Canada - AE');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AK','Alaska - AK','Alaska - AK');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AL','Alabama - AL','Alabama - AL');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AP','Armed Forces Pacific - AP','Armed Forces Pacific - AP');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AR','Arkansas - AR','Arkansas - AR');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AS','American Samoa - AS','American Samoa - AS');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','AZ','Arizona - AZ','Arizona - AZ');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','CA','California - CA','California - CA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','CO','Colorado - CO','Colorado - CO');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','CT','Connecticut - CT','Connecticut - CT');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','DC','District of Columbia - DC','District of Columbia - DC');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','DE','Delaware - DE','Delaware - DE');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','FL','Florida - FL','Florida - FL');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','FM','Federated States of Micronesia - FM','Federated States of Micronesia - FM');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','GA','Georgia - GA','Georgia - GA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','GU','Guam - GU','Guam - GU');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','HI','Hawaii - HI','Hawaii - HI');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','IA','Iowa - IA','Iowa - IA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','ID','Idaho - ID','Idaho - ID');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','IL','Illinois - IL','Illinois - IL');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','IN','Indiana - IN','Indiana - IN');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','KS','Kansas - KS','Kansas - KS');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','KY','Kentucky - KY','Kentucky - KY');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','LA','Louisiana - LA','Louisiana - LA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MA','Massachusetts - MA','Massachusetts - MA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MD','Maryland - MD','Maryland - MD');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','ME','Maine - ME','Maine - ME');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MH','Marshall Islands - MH','Marshall Islands - MH');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MI','Michigan - MI','Michigan - MI');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MN','Minnesota - MN','Minnesota - MN');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MO','Missouri - MO','Missouri - MO');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MP','Northern Mariana Islands - MP','Northern Mariana Islands - MP');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MS','Mississippi - MS','Mississippi - MS');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','MT','Montana - MT','Montana - MT');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NC','North Carolina - NC','North Carolina - NC');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','ND','North Dakota - ND','North Dakota - ND');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NE','Nebraska - NE','Nebraska - NE');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NH','New Hampshire - NH','New Hampshire - NH');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NJ','New Jersey - NJ','New Jersey - NJ');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NM','New Mexico - NM','New Mexico - NM');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NV','Nevada - NV','Nevada - NV');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','NY','New York - NY','New York - NY');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','OH','Ohio - OH','Ohio - OH');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','OK','Oklahoma - OK','Oklahoma - OK');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','OR','Oregon - OR','Oregon - OR');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','PA','Pennsylvania - PA','Pennsylvania - PA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','PR','Puerto Rico - PR','Puerto Rico - PR');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','PW','Palau - PW','Palau - PW');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','RI','Rhode Island - RI','Rhode Island - RI');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','SC','South Carolina - SC','South Carolina - SC');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','SD','South Dakota - SD','South Dakota - SD');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','TN','Tennessee - TN','Tennessee - TN');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','TX','Texas - TX','Texas - TX');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','UT','Utah - UT','Utah - UT');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','VA','Virginia - VA','Virginia - VA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','VI','Virgin Islands - VI','Virgin Islands - VI');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','VT','Vermont - VT','Vermont - VT');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','WA','Washington - WA','Washington - WA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','WI','Wisconsin - WI','Wisconsin - WI');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','WV','West Virginia - WV','West Virginia - WV');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','WY','Wyoming - WY','Wyoming - WY');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/LevelOfEducationInstitutionDescriptor','51','Outside USA','Outside USA');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@DescriptorId);

/* ClassPeriodDescriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','AM','Morning Program for PreK ONLY','Morning Program for PreK ONLY');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','PM','Afternoon Program for PreK ONLY','Afternoon Program for PreK ONLY');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','FD','Full Day Program for PreK ONLY','Full Day Program for PreK ONLY');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','SEM','Semester','Semester');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','TRI','Trimester','Trimester');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','YR','Year-long','Year-long');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','BLK','Block Scheduling','Block Scheduling');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','QTR','Quarter','Quarter');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','SP','Self-paced','Self-paced');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ClassPeriodDescriptor','PO','Pull-out','Pull-out');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ClassPeriodDescriptor(ClassPeriodDescriptorId) values (@DescriptorId);

/* Service Provider Type Descriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','01','Community-Based Organization','Community-Based Organization');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','02','Community Recruit','Community Recruit');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','03','Educational Assistant','Educational Assistant');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','04','Faith-Based Organization','Faith-Based Organization');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','05','Parent','Parent');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','06','Teacher','Teacher');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ServiceProviderTypeDescriptor','07','Voluntee','Voluntee');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ServiceProviderTypeDescriptor(ServiceProviderTypeDescriptorId) values (@DescriptorId);


/*Service Setting*/
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SerivceSettingDescriptor','BEFORESCHOOL','BEFORESCHOOL','BEFORESCHOOL');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SerivceSettingDescriptor(SerivceSettingDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SerivceSettingDescriptor','AFTERSCHOOL','AFTERSCHOOL','AFTERSCHOOL');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SerivceSettingDescriptor(SerivceSettingDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SerivceSettingDescriptor','WEEKEND','WEEKEND','WEEKEND');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SerivceSettingDescriptor(SerivceSettingDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SerivceSettingDescriptor','SUMMER','SUMMER','SUMMER');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SerivceSettingDescriptor(SerivceSettingDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/SerivceSettingDescriptor','YEARROUND','YEARROUND','YEARROUND');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.SerivceSettingDescriptor(SerivceSettingDescriptorId) values (@DescriptorId);

/* Program Intensity Descriptor */
--DECLARE @DescriptorId AS Integer;
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ProgramIntensityDescriptor','1','1 program hour','1 program hour');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ProgramIntensityDescriptor','2','2 program hours','2 program hours');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ProgramIntensityDescriptor','3','3 program hours','3 program hours');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ProgramIntensityDescriptor(ProgramIntensityDescriptorId) values (@DescriptorId);

/*ParticipationInformationDescriptor*/
--DECLARE @DescriptorId AS Integer;
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','1','Dual Language Immersion','Dual Language Immersion');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','2','Developmental/Maintenance Bilingual','Developmental/Maintenance Bilingual');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','3','Enrichment','Enrichment');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','4','Transitional Bilingual','Transitional Bilingual');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','5','Heritage/Indigenous Language','Heritage/Indigenous Language');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','6','Parents Refusal - received in writing from parent (opt-out form)','Parents Refusal - received in writing from parent (opt-out form)');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','7','English Language Development (ELD) pull-out course','English Language Development (ELD) pull-out course and sheltered instruction in content areas - The student is pulled out for instruction in English Language Development based on the English language proficiency level of the student and provided sheltered instruction in content areas.');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','8','English Language Development (ELD) block and sheltered','English Language Development (ELD) block and sheltered instruction in content areas (elementary grades only) - The student receives instruction in English Language Development for a minimum of 45 minutes in a self-contained elementary setting based on the English language proficiency level of the student and provided sheltered instruction in content areas.');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','9','Integrated English Language Development (ELD)','Integrated English Language Development (ELD) - English Language Arts (ELA) course and sheltered instruction in content areas (secondary grades only) - The student that is nearing proficiency in English receives instruction in an integrated ELD-ELA course at the middle school and high school level and sheltered instruction in content areas.');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','13','Voluntary CEIS','Voluntary CEIS – LEAs self-elect to participate in CEIS and can reserve up to 15% of total IDEA B funds used for Voluntary CEIS');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','14','Mandatory CEIS','Mandatory CEIS – LEAs required to participate in CEIS if found to have disproportionality. LEAs must reserve 15% of their total IDEA B funds for Mandatory CEIS.15% CEIS is required if district had significant disproportionality.');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','450HR','NMPREK ½ day student','NMPREK ½ day student – funding based on 450 hours');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ParticipationInformationDescriptor','900HR','NMPREK Full-Day day student','NMPREK Full-Day day student – funding based on 900 hours');SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ParticipationInformationDescriptor(ParticipationInformationDescriptorId) values (@DescriptorId);
