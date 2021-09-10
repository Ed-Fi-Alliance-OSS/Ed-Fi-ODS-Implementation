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
INSERT INTO nmped.ProgramDeliveryMethodDescriptor (SpecialProgramCodeDescriptorId) values (@DescriptorId);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/ProgramDeliveryMethodDescriptor','IS','Industry Standard Third Party Assessment','IS = Industry Standard Third Party Assessment');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.ProgramDeliveryMethodDescriptor (SpecialProgramCodeDescriptorId) values (@DescriptorId);

/* IndustryCredentialDescriptor */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','1','Autodesk Certification','Autodesk Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','4','Adobe Certified Professional','Adobe Certified Professional');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','6','Automotive Technician','Automotive Technician');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','7','C++ Certified Associate Programmer','C++ Certified Associate Programmer');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','9','Network Certification','Network Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','15','Microsoft Certification','Microsoft Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','16','Certified Landscape Technician (CLT)','Certified Landscape Technician (CLT)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','17','Medical Assistant','Medical Assistant');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','19','Novell Administrator','Novell Administrator');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','20','Certified Nurse Aide (CNA)','Certified Nurse Aide (CNA)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','26','Certified Veterinary Assistant','Certified Veterinary Assistant');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','27','Child Development Associate Certification','Child Development Associate Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','28','CMI Custodial Technician','CMI Custodial Technician');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','31','Corel Certifications','Corel Certifications');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','33','Cosmetology License','Cosmetology License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','36','Dental Assistant License','Dental Assistant License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','39','Educational Assistant/Paraprofessional','Educational Assistant/Paraprofessional');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','42','Emergency Medical Dispatcher (EMD)','Emergency Medical Dispatcher (EMD)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','43','Emergency Medical Technician (EMT)','Emergency Medical Technician (EMT)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','44','Environmental Technician','Environmental Technician');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','47','Internet Core Computing - IC3','Internet Core Computing - IC3');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','51','Licensed Vocational Nurse (LVN)','Licensed Vocational Nurse (LVN)');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','53','Hotel & lodging certification','Hotel & lodging certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','57','Licensed Massage Therapist','Licensed Massage Therapist');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','74','Oracle Certification','Oracle Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','75','OSHA Certification','OSHA Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','77','Pesticide Applicators Certification','Pesticide Applicators Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','78','Pharmacy Technician (CPhT) License','Pharmacy Technician (CPhT) License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','79','Phlebotomy Technician (CPT) License','Phlebotomy Technician (CPT) License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','83','Real Estate License','Real Estate License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','84','EPA certification','EPA certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','87','SABRE System Certification','SABRE System Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','90','ServSafe Certification','ServSafe Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','97','NCCER Certifications','NCCER Certifications');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','100','CompTIA Certification','CompTIA Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','103','S/P2 Certification','S/P2 Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','105','First Aid/CPR','First Aid/CPR');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','107','A*S*K Business Institute Certifications','A*S*K Business Institute Certifications');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','108','ACT National Career Readiness Certificate','ACT National Career Readiness Certificate');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','109','NOCTI Certification','NOCTI Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','111','Food Handler Certification','Food Handler Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','112','Welding Certification','Welding Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','115','Career Readiness Certification','Career Readiness Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','116','DECA School Based Enterprise Individual Certification','DECA School Based Enterprise Individual Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','117','Detention Officer Certification','Detention Officer Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','119','Floriculture','Floriculture');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','129','Early Care Education and Family Support','Early Care Education and Family Support');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','132','Police Explorer Certification','Police Explorer Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','133','Prostart','Prostart');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','139','Sustainability for Biofuels','Sustainability for Biofuels');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','143','Wildland Firefighting','Wildland Firefighting');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','148','Precision Certification','Precision Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','174','NC3 Certification','NC3 Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','175','WordPress web certification','WordPress web certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','176','FEMA certification','FEMA certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','177','Automated External Defibrillator (AED) Certification','Automated External Defibrillator (AED) Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','178','Licensed Practical Nurse (LPN) License','Licensed Practical Nurse (LPN) License');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','179','Python Certification','Python Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','180','Unity Certification','Unity Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','181','Automotive Career Exploration','Automotive Career Exploration');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','182','Plate Glass certification','Plate Glass certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://ed-fi.org/IndustryCredentialDescriptor','183','Pro-Cut Certification','Pro-Cut Certification');
SELECT @DescriptorId=SCOPE_IDENTITY();
INSERT INTO nmped.IndustryCredentialDescriptor(SpecialProgramCodeDescriptorId) values (@DescriptorId);