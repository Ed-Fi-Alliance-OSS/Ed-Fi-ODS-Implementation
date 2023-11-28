/* LevelOfIntegration */
/*IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE [Namespace]='uri://nmped.org/LevelOfIntegrationDescriptor')
BEGIN*/
	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfIntegrationDescriptor','1','1 = Less than 10% of the day (minimum or "A")','1 = Less than 10% of the day (minimum or "A")');
	INSERT INTO nmped.LevelOfIntegrationDescriptor (LevelOfIntegrationDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfIntegrationDescriptor','2','2 = 11% to 49% of the day (moderate or "B")','2 = 11% to 49% of the day (moderate or "B")');
	INSERT INTO nmped.LevelOfIntegrationDescriptor (LevelOfIntegrationDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfIntegrationDescriptor','3','3 = 50% of the day or more, but not a full day (extensive or "C")','3 = 50% of the day or more, but not a full day (extensive or "C")');
	INSERT INTO nmped.LevelOfIntegrationDescriptor (LevelOfIntegrationDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/LevelOfIntegrationDescriptor','4','4 = Up to a full day or program 3Y/4Y (maximum or "D")','4 = Up to a full day or program 3Y/4Y (maximum or "D")');
	INSERT INTO nmped.LevelOfIntegrationDescriptor (LevelOfIntegrationDescriptorId) values (@@IDENTITY);
/*END;*/

/* SchoolTypeDescriptors */
-- Empty the descriptor table, we just want the new descriptors there
DELETE FROM edfi.SchoolTypeDescriptor

-- Insert new SchoolType Descriptors more in line with EdFacts and more informative
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/SchoolTypeDescriptor','1','Regular School','A regular school is a public elementary/secondary school that does not focus primarily on career and technical, special, or alternative education, although it may provide these programs in addition to a regular curriculum.')
INSERT INTO edfi.SchoolTypeDescriptor (SchoolTypeDescriptorId) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/SchoolTypeDescriptor','2','Special Education School','A special education school is a public elementary/secondary school that focuses primarily on serving the educational needs of students with disabilities (IDEA) and which adapts curriculum, materials, or instruction for these students.')
INSERT INTO edfi.SchoolTypeDescriptor (SchoolTypeDescriptorId) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/SchoolTypeDescriptor','3','Career and Technical Education School','A career and technical education school is a public elementary/secondary school that focuses primarily on providing secondary students with an occupationally relevant or career–related curriculum, including formal preparation for technical or professional occupations.')
INSERT INTO edfi.SchoolTypeDescriptor (SchoolTypeDescriptorId) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/SchoolTypeDescriptor','4','Alternative Education School','An alternative school is a public elementary or secondary school that addresses the needs of students that typically cannot be met in a regular school program and is designed to meet the needs of students with academic difficulties, students with discipline problems, or both students with academic difficulties and discipline problems.')
INSERT INTO edfi.SchoolTypeDescriptor (SchoolTypeDescriptorId) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/SchoolTypeDescriptor','5','Reportable Program','The permitted value “reportable program” is available for SEAs that have data to report to EDFacts at the school level that the SEA has determined does not meet the definition of a public elementary/secondary school.')
INSERT INTO edfi.SchoolTypeDescriptor (SchoolTypeDescriptorId) VALUES (@@IDENTITY);

/* END SchoolTypeDescriptors */

-- Charter Status descriptors
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CharterStatusDescriptor','NOT A CHARTER','NOT A CHARTER','Not a charter');
	INSERT INTO edfi.CharterStatusDescriptor (CharterStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CharterStatusDescriptor','STATE CHARTER','STATE CHARTER','School or District that has a charter with the state.');
	INSERT INTO edfi.CharterStatusDescriptor (CharterStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CharterStatusDescriptor','DISTRICT CHARTER','DISTRICT CHARTER','School that has a charter with a public district.');
	INSERT INTO edfi.CharterStatusDescriptor (CharterStatusDescriptorId) values (@@IDENTITY);

-- VirtualLocationStatus Descriptor Inserts
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
values 
('uri://nmped.org/VirtualLocationStatusDescriptor', 'FCV', 'FACEVIRTUAL', 'Primarily virtual. The school’s major purpose is to provide virtual instruction to students, but some traditional classroom instruction is also provided. Most students receive all instruction virtually. Prior to SY 2019–20, this value was labeled as “Virtual with face to face options.”'),
('uri://nmped.org/VirtualLocationStatusDescriptor', 'FLV', 'FULLVIRTUAL', 'Exclusively virtual. All instruction offered by the school is virtual. This does not exclude students and teachers meeting in person for field trips, school-sponsored social events, or assessment purposes. All students receive all instruction virtually. Prior to SY 2019–20, this value was labeled as “Fully virtual.”'),
('uri://nmped.org/VirtualLocationStatusDescriptor', 'SPV', 'SUPPVIRTUAL', 'Supplemental virtual. Instruction is directed by teachers in a traditional classroom setting; virtual instruction supplements face-to-face instruction by teachers. Students vary in the extent to which their instruction is virtual.')

-- LunchProgramType Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
values 
('uri://nmped.org/LunchProgramTypeDescriptor', 'CEP', 'Community Eligibility Provision', 'Community Eligibility Provision'),
('uri://nmped.org/LunchProgramTypeDescriptor', 'PROV2', 'Provision 2', 'Provision 2'),
('uri://nmped.org/LunchProgramTypeDescriptor', 'NONE', 'No Program', 'No Program'),
('uri://nmped.org/LunchProgramTypeDescriptor', 'STD', 'Standard', 'Standard')

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

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','Home School','Home School','Home School');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','BIA','BIA','BIA');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationOrganizationCategoryDescriptor','Private','Private','Private');
	INSERT INTO edfi.EducationOrganizationCategoryDescriptor (EducationOrganizationCategoryDescriptorId) values (@@IDENTITY);

/*END;*/

/* DirectCertificationStatus */

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','1','1=SNAP Direct Cert as identified & certified by the district.','1 = SNAP Direct Cert as identified in the direct certification report and certified by the district. - Free');
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','2','2=Other Direct Cert Eligible (Homeless,FDPIR,Foster,Migrant,and HeadStart)','2 = Other Direct Cert Eligible (Homeless, FDPIR, Foster, Migrant, and Head Start) - Free');
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','3','3=Family Mems of SNAP identified stus that wereNotFound inthe DirCertReport','3 = Family Members of SNAP identified students that were not found in the Direct Certification report. - Reduced');
INSERT INTO nmped.DirectCertificationStatusDescriptor(DirectCertificationStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/DirectCertificationStatusDescriptor','4','4=Medicaid Direct Cert as identified in the direct certification report','4 = Medicaid Direct Cert as identified in the direct certification report and certified by the district');
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

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/IndustryCredentialDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/IndustryCredentialDescriptor'
DELETE FROM nmped.IndustryCredentialDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '001', 'Autodesk Certification', 'Autodesk Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '004', 'Adobe Certified Professional', 'Adobe Certified Professional');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '006', 'Automotive Technician', 'Automotive Technician');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '007', 'C++ Certified Associate Programmer', 'C++ Certified Associate Programmer');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '009', 'Network Certification', 'Network Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '015', 'Microsoft Certification', 'Microsoft Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '016', 'Certified Landscape Technician (CLT)', 'Certified Landscape Technician (CLT)');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '017', 'Medical Assistant', 'Medical Assistant');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '019', 'Novell Administrator', 'Novell Administrator');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '020', 'Certified Nurse Aide (CNA)', 'Certified Nurse Aide (CNA)');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '026', 'Certified Veterinary Assistant', 'Certified Veterinary Assistant');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '027', 'Child Development Associate Certification', 'Child Development Associate Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '028', 'CMI Custodial Technician', 'CMI Custodial Technician');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '031', 'Corel Certifications', 'Corel Certifications');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '033', 'Cosmetology License', 'Cosmetology License');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '036', 'Dental Assistant License', 'Dental Assistant License');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '039', 'Educational Assistant/Paraprofessional', 'Educational Assistant/Paraprofessional');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '042', 'Emergency Medical Dispatcher (EMD)', 'Emergency Medical Dispatcher (EMD)');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '043', 'Emergency Medical Technician (EMT)', 'Emergency Medical Technician (EMT)');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '044', 'Environmental Technician', 'Environmental Technician');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '047', 'Internet Core Computing - IC3', 'Internet Core Computing - IC3');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '051', 'Licensed Vocational Nurse (LVN)', 'Licensed Vocational Nurse (LVN)');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '053', 'Hotel & lodging certification', 'Hotel & lodging certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '057', 'Licensed Massage Therapist', 'Licensed Massage Therapist');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '074', 'Oracle Certification', 'Oracle Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '075', 'OSHA Certification', 'OSHA Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '077', 'Pesticide Applicators Certification', 'Pesticide Applicators Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '078', 'Pharmacy Technician (CPhT) License', 'Pharmacy Technician (CPhT) License');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '079', 'Phlebotomy Technician (CPT) License', 'Phlebotomy Technician (CPT) License');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '083', 'Real Estate License', 'Real Estate License');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '084', 'EPA certification', 'EPA certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '087', 'SABRE System Certification', 'SABRE System Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '090', 'ServSafe Certification', 'ServSafe Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '097', 'NCCER Certifications', 'NCCER Certifications');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '100', 'CompTIA Certification', 'CompTIA Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '103', 'S/P2 Certification', 'S/P2 Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '105', 'First Aid/CPR', 'First Aid/CPR');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '107', 'A*S*K Business Institute Certifications', 'A*S*K Business Institute Certifications');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '108', 'ACT National Career Readiness Certificate', 'ACT National Career Readiness Certificate');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '109', 'NOCTI Certification', 'NOCTI Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '111', 'Food Handler Certification', 'Food Handler Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '112', 'Welding Certification', 'Welding Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '115', 'Career Readiness Certification', 'Career Readiness Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '116', 'DECA School Based Enterprise Individual Certification', 'DECA School Based Enterprise Individual Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '117', 'Detention Officer Certification', 'Detention Officer Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '119', 'Floriculture', 'Floriculture');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '129', 'Early Care Education and Family Support', 'Early Care Education and Family Support');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '132', 'Police Explorer Certification', 'Police Explorer Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '133', 'Prostart', 'Prostart');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '139', 'Sustainability for Biofuels', 'Sustainability for Biofuels');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '143', 'Wildland Firefighting', 'Wildland Firefighting');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '148', 'Precision Certification', 'Precision Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '174', 'MC3 Certification', 'MC3 Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '175', 'WordPress web certification', 'WordPress web certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '176', 'FEMA certification', 'FEMA certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '177', 'Automated External Defibrillator (AED) Certification', 'Automated External Defibrillator (AED) Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '178', 'Licensed Practical Nurse (LPN) License', 'Licensed Practical Nurse (LPN) License');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '179', 'Python Certification', 'Python Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '180', 'Unity Certification', 'Unity Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '181', 'Automotive Career Exploration', 'Automotive Career Exploration');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '182', 'Plate Glass certification', 'Plate Glass certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '183', 'Pro-Cut Certification', 'Pro-Cut Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

/* 22-23 Addition */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '184', 'FAA Remote Pilot Certification', 'FAA Remote Pilot Certification');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '185', 'Associate of Art Degree', 'Associate of Art Degree');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '186', 'Associate of Science Degree', 'Associate of Science Degree');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '187', 'Associate of Applied Art Degree', 'Associate of Applied Art Degree');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/IndustryCredentialDescriptor', '188', 'Associate of Applied Science Degree', 'Associate of Applied Science Degree');
        INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);
		
/* END 22-23 Addition */

/* BEGIN 23-24 Addition */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '189', 'AMSA Culinary Meat Selection & Cookery Certification', 'AMSA Culinary Meat Selection & Cookery Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '190', 'AMSA Food Safety & Science Certification', 'AMSA Food Safety & Science Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '191', 'AMSA Meat Evaluation Certification', 'AMSA Meat Evaluation Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '192', 'BASF Plant Science Certification', 'BASF Plant Science Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '193', 'Benz School of Floral Design Principles of Floral Design Certification', 'Benz School of Floral Design Principles of Floral Design Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '194', 'Center for Financial Responsibility Personal Financial Literacy Cert', 'Center for Financial Responsibility Personal Financial Literacy Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '195', 'Ducks Unlimited Ecology Conservation & Management Certification', 'Ducks Unlimited Ecology Conservation & Management Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '196', 'EETC Principles of Small Engine Technology Certification', 'EETC Principles of Small Engine Technology Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '197', 'Elanco Fundamentals of Animal Science Certification', 'Elanco Fundamentals of Animal Science Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '198', 'Elanco Veterinary Medical Applications Certification', 'Elanco Veterinary Medical Applications Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '199', 'Express Employment Professionals Business Office Technology Certification', 'Express Employment Professionals Business Office Technology Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '200', 'State Seal of Bilingualism-Biliteracy', 'State Seal of Bilingualism-Biliteracy');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '201', 'Express Employment Professionals Career Preparedness Certification', 'Express Employment Professionals Career Preparedness Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '202', 'HBAA Residential Construction Skills Certification', 'HBAA Residential Construction Skills Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '203', 'NHJTCA Equine Management & Evaluation Certification', 'NHJTCA Equine Management & Evaluation Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '204', 'NCLCA Principles of Livestock Selection & Evaluation Certification', 'NCLCA Principles of Livestock Selection & Evaluation Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '205', 'Southwest Airlines Professional Communications Certification', 'Southwest Airlines Professional Communications Certification');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '206', 'Oxyfuel Cutting Shielded Metal Arc Welding', 'Oxyfuel Cutting Shielded Metal Arc Welding');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '207', 'Millwright', 'Millwright');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/IndustryCredentialDescriptor', '208', 'Career Connections (Levels 1, 2, and 3 certificates)', 'Career Connections (Levels 1, 2, and 3 certificates)');
INSERT INTO nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorid) values (@@IDENTITY);

/* END 23-24 Addition */

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
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','80','Western Governor''s University','Western Governor''s University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','81','National American University','National American University');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','82','ITT Technical Institute','ITT Technical Institute');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','83','Webster University - Albuquerque','Webster University - Albuquerque');
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
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','01','Alabama - AL','Alabama - AL');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','02','Alaska - AK','Alaska - AK');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','03','Arizona - AZ','Arizona - AZ');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','04','Arkansas - AR','Arkansas - AR');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','05','California - CA','California - CA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','06','Colorado - CO','Colorado - CO');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','07','Connecticut - CT','Connecticut - CT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','08','Delaware - DE','Delaware - DE');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','09','District of Columbia - DC','District of Columbia - DC');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','10','Florida - FL','Florida - FL');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','11','Georgia - GA','Georgia - GA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','12','Hawaii - HI','Hawaii - HI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','13','Idaho - ID','Idaho - ID');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','14','Illinois - IL','Illinois - IL');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','15','Indiana - IN','Indiana - IN');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','16','Iowa - IA','Iowa - IA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','17','Kansas - KS','Kansas - KS');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','18','Kentucky - KY','Kentucky - KY');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','19','Louisiana - LA','Louisiana - LA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','20','Maine - ME','Maine - ME');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','21','Maryland - MD','Maryland - MD');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','22','Massachusetts - MA','Massachusetts - MA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','23','Michigan - MI','Michigan - MI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','24','Minnesota - MN','Minnesota - MN');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','25','Mississippi - MS','Mississippi - MS');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','26','Missouri - MO','Missouri - MO');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','27','Montana - MT','Montana - MT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','28','Nebraska - NE','Nebraska - NE');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','29','Nevada - NV','Nevada - NV');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','30','New Hampshire - NH','New Hampshire - NH');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','31','New Jersey - NJ','New Jersey - NJ');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','32','New York - NY','New York - NY');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','33','North Carolina - NC','North Carolina - NC');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','34','North Dakota - ND','North Dakota - ND');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','35','Ohio - OH','Ohio - OH');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','36','Oklahoma - OK','Oklahoma - OK');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','37','Oregon - OR','Oregon - OR');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','38','Pennsylvania - PA','Pennsylvania - PA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','39','Rhode Island - RI','Rhode Island - RI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','40','South Carolina - SC','South Carolina - SC');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','41','South Dakota - SD','South Dakota - SD');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','42','Tennessee - TN','Tennessee - TN');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','43','Texas - TX','Texas - TX');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','44','Utah - UT','Utah - UT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','45','Vermont - VT','Vermont - VT');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','46','Virginia - VA','Virginia - VA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','47','Washington - WA','Washington - WA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','48','West Virginia - WV','West Virginia - WV');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','49','Wisconsin - WI','Wisconsin - WI');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','50','Wyoming - WY','Wyoming - WY');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LevelOfEducationInstitutionDescriptor','51','Outside USA','Outside USA');
INSERT INTO nmped.LevelOfEducationInstitutionDescriptor(LevelOfEducationInstitutionDescriptorId) values (@@IDENTITY);


/* NMPEDClassPeriodDescriptor */
/*Changed from ClassPeriod, due to moving it from StaffSection to Section and section already having a ClassPeriod field being used in a different way*/


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
/* Removed 22-23
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
*/

/*Service Setting*/
/* Removed 22-23
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
*/

/* Calendar Event Descriptor */
--DECLARE @@IDENTITY AS Integer;
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/CalendarEventDescriptor','ELTP','ELTP Day/Hours','ELTP Day/Hours');
INSERT INTO edfi.CalendarEventDescriptor(CalendarEventDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/CalendarEventDescriptor','K5P','K5 Plus Day/Hours','K5 Plus Day/Hours');
INSERT INTO edfi.CalendarEventDescriptor(CalendarEventDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/CalendarEventDescriptor','ELTP+K5P','Both ELTP and K5P Day','Both ELTP and K5P Day');
INSERT INTO edfi.CalendarEventDescriptor(CalendarEventDescriptorId) values (@@IDENTITY);


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
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LocalEducationAgencyCategoryDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/LocalEducationAgencyCategoryDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','State Supported','State Supported','State Supported');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor(LocalEducationAgencyCategoryDescriptorID) values (@@IDENTITY);

--Descriptors for 'uri://nmped.org/LocalEducationAgencyCategoryDescriptor' - State District, BIA District, State, DOH FIT, State Charter
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','State District','State District','State District');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor (LocalEducationAgencyCategoryDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','BIA District','BIA District','BIA District');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor (LocalEducationAgencyCategoryDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','State','State','State');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor (LocalEducationAgencyCategoryDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','DOH FIT','DOH FIT','DOH FIT');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor (LocalEducationAgencyCategoryDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/LocalEducationAgencyCategoryDescriptor','State Charter','State Charter','State Charter');
INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor (LocalEducationAgencyCategoryDescriptorId) values (@@IDENTITY);



/*School Category Descriptors*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SchoolCategoryDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SchoolCategoryDescriptor'

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
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/ProgramTypeDescriptor'


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','Career and Technical Education','Career and Technical Education','Career and Technical Education');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','Student School Food Service','Student School Food Service','Child qualifying for Student School Food Service');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','English Proficiency','English Proficiency','Child qualifying for English Proficiency');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','Immigrant','Immigrant','Immigrant');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','Special Education','Special Education','Child qualifying for Special Education Services');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','Homeless','Homeless','An indication of whether a student is homeless as defined by McKinney Vento.');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','3Y','3Y','Child participating in the Early Childhood 3Y Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','4Y','4Y','Child participating in the Early Childhood 4Y Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BEP','BEP','Bilingual Multicultural Education Program');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

/*
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BEP-2','BEP Participation Code 2','Bilingual Multicultural Education Program - Participation Code 2');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BEP-3','BEP Participation Code 3','Bilingual Multicultural Education Program - Participation Code 3');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BEP-4','BEP Participation Code 4','Bilingual Multicultural Education Program - Participation Code 4');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','BEP-5','BEP Participation Code 5','Bilingual Multicultural Education Program - Participation Code 5');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);
*/

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

/*
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','CEIS-14','CEIS Participation Code 14','Coordinated Early Intervening Services - Participation Code 14');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);
*/

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

/*
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','ELL-7','ELL Participation Code 7','English Learner - Participation Code 7');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','ELL-8','ELL Participation Code 8','English Learner - Participation Code 8');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','ELL-9','ELL Participation Code 9','English Learner - Participation Code 9');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);
*/

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

/*
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','NMPREK-900HR','NMPREK Participation Code 900HR','Student is participating in the NM PreK program - Participation Code 900HR');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);
*/

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

/*
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T3-7','T3 Participation Code 7','Title III -  Participation Code 7');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T3-8','T3 Participation Code 8','Title III -  Participation Code 8');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T3-9','T3 Participation Code 9','Title III -  Participation Code 9');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T7','T7','Title VII');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','T8','T8','Title VIII');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

/* Removed 22-23
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','WRP','WRP','Workforce Readiness Program (used by CCRB bureau)');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);
*/

/* Added Program 23-24 */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/ProgramTypeDescriptor','MEP','MEP','Migrant');
INSERT INTO edfi.ProgramTypeDescriptor(ProgramTypeDescriptorID) values (@@IDENTITY);

/**/

/*Subject Area Descriptors*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/AcademicSubjectDescriptor'

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

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AcademicSubjectDescriptor','31','Education Training','Education Training');
INSERT INTO edfi.AcademicSubjectDescriptor(AcademicSubjectDescriptorID) values (@@IDENTITY); 

-- FOR SCHOOL SIZING 
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AdministrativeFundingControlDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/AdministrativeFundingControlDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AdministrativeFundingControlDescriptor','0','Not Sized','Not Sized');
INSERT INTO edfi.AdministrativeFundingControlDescriptor (AdministrativeFundingControlDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AdministrativeFundingControlDescriptor','1','Elementary / Jr. High','Elementary / Jr. High');
INSERT INTO edfi.AdministrativeFundingControlDescriptor (AdministrativeFundingControlDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/AdministrativeFundingControlDescriptor','2','High School','High School');
INSERT INTO edfi.AdministrativeFundingControlDescriptor (AdministrativeFundingControlDescriptorId) values (@@IDENTITY);

-- Operational Status Descriptors - NMPED
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/OperationalStatusDescriptor','Renumbered','Renumbered','Renumbered');
INSERT INTO edfi.OperationalStatusDescriptor (OperationalStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/OperationalStatusDescriptor','ClosedGT1Y','ClosedGT1Y','ClosedGT1Y');
INSERT INTO edfi.OperationalStatusDescriptor (OperationalStatusDescriptorId) values (@@IDENTITY);

-- Unique Id Descriptor - NMPED
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/StaffIdentificationSystemDescriptor','Unique Id','Unique Id','Unique Id');
INSERT INTO edfi.StaffIdentificationSystemDescriptor (StaffIdentificationSystemDescriptorId) values (@@IDENTITY);


------ Addition of NMPED values
/* 
  The state has an authorized catalog for Tribal Affiliation so we are cleaning up the Ed-Fi ones and inserting the NMPED descriptors.
  -- Note that Descriptor tables have Cascade on Delete so we only need to delete the parent edfi.Descriptor table.
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/TribalAffiliationDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/TribalAffiliationDescriptor'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '00', 'Not Applicable', 'Not Applicable');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '01', 'Acoma', 'Acoma');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '02', 'Cochiti', 'Cochiti');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '03', 'Isleta', 'Isleta');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '04', 'Jemez', 'Jemez');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '05', 'Jicarilla Apache', 'Jicarilla Apache');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '06', 'Laguna', 'Laguna');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '07', 'Mescalero Apache', 'Mescalero Apache');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '08', 'Nambe', 'Nambe');
        INSERT INTO edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/TribalAffiliationDescriptor', '09', 'Navajo', 'Navajo');
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

/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '102', 'gle', 'Irish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '103', 'wel (B) cym (T)', 'Welsh');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '104', 'uzb', 'Uzbek');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '105', 'nai-Lakota', 'Lakota');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);
/* END 22-23 Additions */

/* BEGIN 23-24 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '106', 'sna', 'Shona');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '107', 'nai-Hopi', 'Hopi');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

/* END 23-24 Additions */

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '00', 'eng', 'English');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '01', 'spa', 'Spanish');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '02', 'vie', 'Vietnamese');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '03', 'hmn', 'Hmong; Mong');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '04', 'chi (B) zho (T)', 'Chinese (Cantonese or Mandarin, also includes Chaozhou, Lahu, Taiwanese, Teochew, and Toishanese)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '05', 'khm', 'Cambodian - Khmer');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '06', 'kor', 'Korean');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '07', 'lao', 'Laotian (includes Khmu)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '08', 'nav', 'Navajo; Navaho (Diné)');
        INSERT INTO edfi.LanguageDescriptor (LanguageDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/LanguageDescriptor', '09', 'tgl', 'Tagalog');
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
        values ('uri://nmped.org/SeparationReasonDescriptor', '01', 'Left NM and teaching in other state', 'Left NM and teaching in other state');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '02', 'Left for reasons other than retirement', 'Left for reasons other than retirement');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '03', 'Left to teach in private school in NM', 'Left to teach in private school in NM');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '04', 'Went to other public/charter NM district', 'Went to other public/charter NM district');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '05', 'Took non-teaching position in district', 'Took non-teaching position in district');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '06', 'Died', 'Died');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '07', 'Retired', 'Retired');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '08', 'Personal Reasons', 'Personal Reasons');
        INSERT INTO edfi.SeparationReasonDescriptor (SeparationReasonDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SeparationReasonDescriptor', '09', 'Non-Renewal of Contract', 'Non-Renewal of Contract');
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
VALUES ('uri://nmped.org/StaffClassificationDescriptor','10','Superintendent','Administrators');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','11','Assistant Area Deputy of Associate Superintendent','Administrators');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','12','Director of Personnel','Administrators');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','13','Director of Instruction','Administrators');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','36','Athletic Director','Administrators');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','31','Instructional EA (Not Title 1, Part A program)','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','31I','Instructional EA Providing instructional duties in a Title1, Part A program','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','32','Library/Media EA (Not in a Title 1, Part A program)','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','32I','Library/Media EA Providing instructional duties in a Title1, Part A program','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','33','Other EA (Not providing instructional duties in a Title 1, Part A program)','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','33I','Other EA Providing instructional duties in a Title1, Part A program','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','34','SpEd EA (Instructional Assistant) for SpEd 6-21 (NOT Title 1, Part A).','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','34S','SpEd EA (Instructional Assistant) for SpEd 3-5 (NOT Title 1, Part A).','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','34I','SpEd EA (Instructional Assistant) inst duties - Title1, Part A SpEd 6-21.','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','34IS','SpEd EA (Instructional Assistant) inst duties -Title1, Part A  3-5.','Educational Assistant');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','01','Nurse (LPN)','Healthcare');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','03','Healthcare Assistant','Healthcare');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','07','Special Education Healthcare Asst.','Healthcare');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','70','Nurse (RN)','Healthcare');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','76','Secondary Media','Media Specialist');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','77','Junior/Mid High Media','Media Specialist');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','78','Elementary Media','Media Specialist');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','02','Generic Support Staff without a specific code','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','114','Maintenance','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','115','Custodian','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','116','Security','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','117','Cafeteria Worker','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','118','Bus Driver','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','144','Bus Assistant','All Other Non-Certified Support Staff – Maintenance, Transportation, Food Service, IT, Facilities');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','24','Generic non-certified Supervisors or Directors without a specific code','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','120','Supervisor or Director of Information Technology','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','121','Supervisor or Director of Facilities','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','122','Supervisor or Director of Food Service','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','123','Supervisor or Director of Transportation','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','124','Supervisor or Director of Grants','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','125','Supervisor or Director of Human Resources','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','126','Supervisor or Director/Coordinator of Visual & Performing Arts','Non-Certified Supervisors or Directors');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','29','Generic non-certified Admin Supp Staff - Typically District Office','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','127','Administrative Business Office Support','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','128','Administrative Clerk','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','129','Administrative Secretary','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','130','STARS/Data Coordinator','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','131','Information Technology/Data Staff','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','132','Facilitator','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','133','Administrative Grant Clerk','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','134','Administrative Grant Secretary','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','135','Human Resource Staff','Non-Certified Administrative Support Staff (typically working at a district office)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','68','Generic code for other non-certified School Admin Staff -Support Staff','Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','136','School Registrar','Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','137','School Clerk','Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','138','School Secretary','Non-Certified School Support Staff
(Activities concerned with the support of teaching and administrative duties of the office of the Principal or Department Chairperson)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','04','ROTC Instructor','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','05','Drivers Education','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','06','In School Suspension','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','08','Social Worker, General Education','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','09','Technology Coordinator','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','65','Business Official or Supervisor/Director of Business','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','79','Athletic Trainer','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','80','Music Therapist','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','81','Athletic Coach','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','83','Resource Coordinator','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','95','SLP or SLP Clinical Fellows Acting as a Case Manager for speech only 6-21 ','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','95S','SLP or SLP Clinical Fellows Acting as a Case Manager for speech only 3-5','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','102','Testing Coordinator','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','105','Academic Instructional Coach','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','108','Native American Lang & Culture Inst (req 520 Native Lang & Culture Cert)','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','109','Dean of Students','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','141','School Psychologist, General Education','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','142','Student Assistance Team (SAT) Chair','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','143','Student Success Advisor','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','146','Attendance Coach','Other Personnel');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','14','Principal, Secondary','Principals');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','15','Assistant Principal, Secondary','Principals');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','16','Principal, Jr./Mid High','Principals');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','17','Assistant Principal, Jr./Mid High','Principals');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','18','Principal, Elementary','Principals');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','19','Assistant Principal, Elementary','Principals');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','26','Speech/Language Apprentice (Not allowed to carry a caseload)','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','82','Social Worker','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','84','Physical Therapy Assistant (Not allowed to carry a caseload)','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','85','COTA (Not allowed to carry a caseload)','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','86','Audiologist','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','87','Diagnostician','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','88','Interpreter for the Deaf','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','89','Occupational Therapist','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','90','Orientation and Mobility Trainer','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','91','Physical Therapist','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','92','School Psychologist','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','93','Speech/Language Pathologist (SLP)','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','98','Recreation and Therapeutic Recreation Specialist','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','99','Rehabilitation Counselor','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','107','Medical/Nursing Services Provider for special education','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','111','SLP Clinical Fellows','Related Service Personnel For Special Education (6-21 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','26S','Spee/Lang Apprentice for special education 3-5 year (Not caseload allowed)','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','82S','Social Worker for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','84S','PTA for special education 3-5 year olds (Not allowed to carry a caseload)','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','85S','COTA for special education 3-5 year olds (Not allowed to carry a caseload)','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','86S','Audiologist for special education 3-5 years olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','87S','Diagnostician for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','88S','Interpreter for the Deaf for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','89S','Occupational Therapist for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','90S','Orientation and Mobility Trainer for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','91S','Physical Therapist for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','92S','School Psychologist for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','93S','Speech/Language Pathologist for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','98S','Recreation and Therapeutic Recreation Specialist 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','99S','Rehabilitation Counselor for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','107S','Medical/Nursing Services Provider for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','111S','SLP Clinical Fellows for special education 3-5 year olds','Related Service Personnel For Special Education (3-5 Year Olds)');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','66','Secondary School Counselor','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','67','Junior/Mid High School Counselor','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','69','Elementary School Counselor','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','71','Counseling Coordinator','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','72','Drug/Alcohol Abuse Counselor','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','112','Marriage & Family Therapist','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','113','Substance Abuse Associate','School Counselor');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','35','Activities Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','37','Attendance Officer Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','38','Instructional Resources Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','39','Pupil Personnel Services Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','40','Art Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','41','Bilingual Education Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','42','Research/Evaluation Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','43','Career Education Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','44','Curriculum Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','45','Social Studies Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','46','Elementary Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','47','Foreign Languages Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','48','Health Services Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','49','Indian Education Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','50','Junior/Mid High Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','51','Language Arts Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','52','Mathematics Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','53','Multi-cultural Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','54','Music Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','55','Special Services Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','56','Physical Education Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','57','Vocational Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','58','Science Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','59','Secondary Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','60','Federal Projects Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','61','Special Education Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','62','District Library/Media Coordinator Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','63','Media Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','64','Reading Supervisor','Supervisors, Directors or Managers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','00','Homebound Instructor (Regular Education)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','20','Kindergarten Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','21','Elementary Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','22','Junior High/Middle School Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','23','Head Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','25','Preschool Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','28','Elementary Bilingual Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','30','Secondary Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','73','Secondary Librarian','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','74','Junior/Mid High Librarian','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','75','Elementary Librarian','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','94','Gifted Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','96','Special Education Preschool Teacher (Preschool)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','97','General Special Education Teacher (K-12)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','101','Corrections Facility Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','103','Computer Lab Instructor','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','104','Home School/Alternative School Teacher (Includes Family Schools)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','106','Special Education – Alternative School Teacher (Includes Family Schools)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','110','Special Education – Adapted Physical Education Teacher (K-12)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','110S','Special Education – Adapted Physical Education Teacher (Preschool)','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','139','Junior High/Middle School Bilingual Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','140','Secondary Bilingual Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])
VALUES ('uri://nmped.org/StaffClassificationDescriptor','145','Deaf and Hard of Hearing Teacher','Teachers');
INSERT INTO edfi.StaffClassificationDescriptor (StaffClassificationDescriptorid) VALUES (@@IDENTITY);



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
        values ('uri://nmped.org/EntryTypeDescriptor', 'E1', 'E1', 'Initial enrollment in New Mexico Public Schools during the for current school year AND no prior enrollment outside of New Mexico Public Schools in the same school year.  Example: The student enrolls in the same school that they attended last year');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'E2', 'E2', 'Initial enrollment in New Mexico Public Schools during the current school year AND the student was previously enrolled in the same school year in one or more locations outside of New Mexico Public Schools other than Bureau of Indian Education (BIE) schools and Tribally Controlled Schools (TCS)');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'E3', 'E3', 'Initial enrollment in New Mexico Public Schools during the current school year AND the student was previously enrolled in the same school year in a Bureau of Indian Education (BIE) or Tribally Controlled School (TCS) school.');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'R1', 'R1', 'After an initial enrollment in New Mexico Public School during the current school year, use R1 to enroll the student who either transferred to a new location within the same NM Public School District (includes District Charters), or who was withdrawn from the District during the current school year and returns to the same District in the same school year without being enrolled in a different New Mexico Public School District including State Charters, or other school in between.');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'R2', 'R2', 'After an initial enrollment in New Mexico Public School during the current school year, use R2 to enroll a student who transfers into the district from another New Mexico Public School District (including State Charters) in the same school year or who transfers into the District from another school.');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

/* Removed 22-23
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'R3', 'R3', 'Previously dropped from enrollment - Student previously dropped from school for any reason other than transfer to another school or district and later returns to your school site without attending school elsewhere during this school year (student was previously an E1, R1 or R2). (An R3 must be preceded by a E code in the same location and then any W code except W1)');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);
*/

/* Added 23-24 */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/EntryTypeDescriptor', 'I', 'Secondary or Invalid Enrollment/Withdraw', 'This code can be used as an enrollment or a withdrawal code. The code should be used for students who should not be counted for primary SEG Membership funding but require data be submitted to STARS.');
        INSERT INTO edfi.EntryTypeDescriptor (EntryTypeDescriptorid) values (@@IDENTITY);

/**/

--SpecialEducationSettingDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SpecialEducationSettingDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationSettingDescriptor'

/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'LPPS', 'Private School', ' Private School – LEA Placed These are children who are enrolled by the LEA in regular parochial or other private schools and whose basic education is paid through private resources and who received special education and related services at public expense from a local educational agency or intermediate educational unit under a services plan.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'HB', 'Homebound (HB)', 'These are children who received programs in homebound environments.  This includes children receiving special education and related services in homebound programs.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'HL', 'Hospital (HL)', 'These are children who received programs in hospital environments.  This includes children receiving special education and related services in hospital programs.');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);
/* END 22-23 Additions */

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

/* Removed 22-23
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationSettingDescriptor', 'HH', 'HH', 'Homebound/Hospital (HH) – These are children whom received programs in homebound/hospital environments. This includes children receiving special education and related services in hospital programs or homebound programs. 
Note: This value can only be used for students that have the location code of 993 (Hospitalized) or 998 (Homebound).');
        INSERT INTO edfi.SpecialEducationSettingDescriptor (SpecialEducationSettingDescriptorid) values (@@IDENTITY);
*/

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

/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '13', '13', 'No Disciplinary Action  (This code to be used for incidents involving a firearm. FS086 - Students Involved with Firearms File Specification)');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/DisciplineDescriptor', '14', '14', 'Restorative Justice');
        INSERT INTO edfi.DisciplineDescriptor (DisciplineDescriptorid) values (@@IDENTITY);
/* END 22-23 Additions */

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

/* Removed 22-23
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
*/
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ServiceDescriptor', 'EELTO-ASPROGRAMS', 'EELTO-ASPROGRAMS', 'After-school programs for ELTP which consist of a variety of  Expanded and Enriched Learning Time and Opportunities such as: College and Career Readiness, Civic Leadership, Family Literacy, Fine Arts, Health wellness, Language Culture, Performing Arts, Social Emotion Services, STEM-STEAM, Tutoring, Youth Leadership, and Workforce.');
        INSERT INTO edfi.ServiceDescriptor (ServiceDescriptorid) values (@@IDENTITY);		


--ExitWithdrawTypeDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/ExitWithdrawTypeDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/ExitWithdrawTypeDescriptor'
DELETE FROM edfi.ExitWithdrawTypeDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W1', 'W1', 'Transfer out to a different New Mexico Public School District -  The student has transferred out to another New Mexico Public School District (includes State Charters).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W2', 'W2', 'Absent 10 days - A student that has been absent for ten (10) consecutive days must be dropped from the rolls. These may include truants and habitual truants provided the school district has intervened according to their retention and truancy policy as provided in Section 22-12-9 NMSA 1978 and the Attendance for Success Act.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W4', 'W4', 'GED - Student exits to a non-diploma granting education setting such as vocational or GED program.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W5', 'W5', 'Detained, Long-Term Suspension (out-of-school), or Expulsion  – Student is detained in a court-ordered facility, including jail, expulsion, or long-term out-of-school suspension.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W6', 'W6', 'Left U.S. – Student emigrated or moved outside of US or US territories; does not include temporary military assignment. Does not include studying abroad as a US exchange student or foreign exchange student (use W10).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W7', 'W7', 'Pregnancy - Student exited school due to pregnancy, which applies to female or male student).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W8', 'W8', 'Transfer out to a Bureau of Indian Education (BIE) school or other non-public school in New Mexico. - Student who withdraws to a diploma-granting, non-public school within New Mexico. This includes a private school or BIE school that grants a standard diploma recognized by the State of New Mexico. Does not include Registered Home School (use W81). Does not include a BIE school outside New Mexico (use W10).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W9', 'W9', 'Immunization - Student dis-enrolled due to failure to provide satisfactory evidence of 1) commencement of immunization OR 2) completion of immunization.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W10', 'W10', 'Moved out of state, foreign exchange study, or attend online learning in an out-of-state school.  The student moved out of New Mexico, is attending online schooling in another state, or is studying abroad as U.S. exchange student or studying in New Mexico Public Schools as a foreign exchange student and returning to their country.  Does not include Registered Home Schooled. (Use W81)');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W19', 'W19', 'Transfer out to a different location within the same Public School District  - Student withdrew from one location (public school) and enrolled in another PED location  to transfer out to a different location within the same New Mexico Public School District including District Charters.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W20', 'W20', 'Transfer out to a Tribally Controlled School (TCS) within New Mexico. - The student transferred out to a TCS that grants a standard diploma recognized by the State of New Mexico. Does not include TCS in another state (use W10). Does not include Registered Home School (use W81).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'W81', 'W81', 'Registered Home Schooled – Student withdraws to be home schooled in a registered home school. Does not include students enrolled in a school that provides remote instruction. Home School - Use this code for students withdrawing to be Home-Schooled');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WD', 'WD', 'Death – Student has died.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WDO', 'WDO', 'Drop-out – Student is known to have dropped out of school.  A drop out may include a family who disenrolled a student to keep them home because of illnesses or due to hospitalizations. Does not include students who just stop attending (see W2).');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'WG', 'WG', 'Graduation - Student graduated with a standard diploma (required for early graduates and optional for EOY graduates). Does not include certificates of completion. Diploma Type Code must equal 1.');
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
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'D3', 'D3', 'Disregard - Invalid Enrollment Record (E1) – related to Pre-Enrollment as part of a Rollover Process - The student was pre-enrolled as part of a pre-registration process and is known to have changed their mind in between school years and to have enrolled in a different location instead. Example: Student was preregistered in school for the current school year as part of the rollover process, and over the summer the family decided to enroll the student in a new school (or district) instead, and the new school contacted the school that pre-enrolled the student for their records. Note: Report the E1 record (pre-enrollment) and date (e.g., first day of class or first day of school) in this template AND a D3 record and date (e.g., first day of class or first day of school) in this template. Do not withdraw this student.');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'G', 'Graduated', 'Graduated');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);

/* Added 23-24 */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/ExitWithdrawTypeDescriptor', 'I', 'Secondary or Invalid Enrollment/Withdraw', 'This code can be used as an enrollment or a withdrawal code. The code should be used for students who should not be counted for primary SEG Membership funding but require data be submitted to STARS. ');
        INSERT INTO edfi.ExitWithdrawTypeDescriptor (ExitWithdrawTypeDescriptorid) values (@@IDENTITY);
/**/

---- Course Level Characteristics
/* 
	Removing complexity and following the state code values by merging Basic and General into one descriptor Basic/General.
*/
DELETE FROM Edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/CourseLevelCharacteristicDescriptor' AND CodeValue in ('Basic', 'General');

-- Additional NMPED course level characteristics
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

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])   
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor', 'Capstone','Capstone','Capstone');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])   
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor', 'Work Based Learning','Work Based Learning','Work Based Learning');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])   
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor', 'F','Non-Trad F','Non-Traditional Gender Female');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description])   
	values ('uri://nmped.org/CourseLevelCharacteristicDescriptor', 'M','Non-Trad M','Non-Traditional Gender Male');
	INSERT INTO edfi.CourseLevelCharacteristicDescriptor (CourseLevelCharacteristicDescriptorId) values (@@IDENTITY);

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
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EmploymentStatusDescriptor','S','Long Term Substitute','Long Term Substitute');
	INSERT INTO edfi.EmploymentStatusDescriptor (EmploymentStatusDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EmploymentStatusDescriptor','T','Short Term Substitute','Short Term Substitute');
	INSERT INTO edfi.EmploymentStatusDescriptor (EmploymentStatusDescriptorid) values (@@IDENTITY);

---- VisaDescriptor
Update edfi.descriptor Set namespace = 'uri://nmped.org/VisaDescriptor' WHERE namespace = 'uri://ed-fi.org/VisaDescriptor'

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
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','OTHER','OTHER','OTHER');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);

/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/EducationalEnvironmentDescriptor','NMCC','NMCC','New Mexico Course Consortium (NMVC2)');
	INSERT INTO edfi.EducationalEnvironmentDescriptor (EducationalEnvironmentDescriptorid) values (@@IDENTITY);
/* END 22-23 Additions */

---- AttendanceEventCategoryDescriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AttendanceEventCategoryDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/AttendanceEventCategoryDescriptor'

/* Removing These due to changing to using negative attendance and calendar entries
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
*/
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','Unexcused Absence','Unexcused Absence','Unexcused Absence');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);

/*
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','Tardy','Tardy','Tardy');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
VALUES ('uri://nmped.org/AttendanceEventCategoryDescriptor','Excused Half Day Absence','Excused Half Day Absence','Excused Half Day Absence');
INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
VALUES ('uri://nmped.org/AttendanceEventCategoryDescriptor','Unexcused Half Day Absence','Unexcused Half Day Absence','Unexcused Half Day Absence');
INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) VALUES (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','Excused Absence','Excused Absence','Excused Absence');
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

/* Added 23-24 */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','K12PATTD','Attended K12P','Attended K12P');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/AttendanceEventCategoryDescriptor','K12PABS','Absent K12P','Absent K12P');
	INSERT INTO edfi.AttendanceEventCategoryDescriptor(AttendanceEventCategoryDescriptorid) values (@@IDENTITY);
/**/


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

/* Modifed in 23-24 to remove Apple */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','04','Tablet','Tablet');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);
/* Removed for 23-24
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','05','Tablet - Windows','Tablet - Windows');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','06','Tablet - Android','Tablet - Android');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','07','Tablet - None of Above','Tablet - None of Above');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);
*/
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','08','Smartphone','Smartphone');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','09','None of the above','None of the above');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor','10','No Device','No Device');
	INSERT INTO edfi.PrimaryLearningDeviceAwayFromSchoolDescriptor (PrimaryLearningDeviceAwayFromSchoolDescriptorid) values (@@IDENTITY);

---- Primary Learning Device Access Descriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PrimaryLearningDeviceAccessDescriptor'
DELETE FROM edfi.PrimaryLearningDeviceAccessDescriptor

/* Modified in 23-24 from Dedicated to Not Shared */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAccessDescriptor','NOT SHARED','NOT SHARED','The student''s primary learning device is not shared with anyone else in the household.');
	INSERT INTO edfi.PrimaryLearningDeviceAccessDescriptor (PrimaryLearningDeviceAccessDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/PrimaryLearningDeviceAccessDescriptor','SHARED','SHARED','The student''s primary learning device is also used by others in the household.');
	INSERT INTO edfi.PrimaryLearningDeviceAccessDescriptor (PrimaryLearningDeviceAccessDescriptorid) values (@@IDENTITY);
	
--Internet Access Type in Residence Descriptor
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/InternetAccessTypeInResidenceDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/InternetAccessTypeInResidenceDescriptor'
DELETE FROM edfi.InternetAccessTypeInResidenceDescriptor

/* Removed 22-23
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','01','Fiber','Fiber');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','02','Cable','Cable');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','03','DSL','DSL');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','04','Microwave','Microwave');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','07','Personal Hotspot','Personal Hotspot');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','08','School Provided Hotspot','School Provided Hotspot');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);
*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','05','Satellite','Satellite');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','06','Dial-up','Dial-up');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','09','Unknown','Unknown');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor','10','None','None');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);

/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values  ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor', '11', 'Cellular','Cellular');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values  ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor', '12', 'Community Wi-Fi','Community Wi-Fi');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values  ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor', '13', 'Hotspot','Hotspot');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values  ('uri://nmped.org/InternetAccessTypeInResidenceDescriptor', '14', 'Residential Broadband','Residential Broadband');
	INSERT INTO edfi.InternetAccessTypeInResidenceDescriptor(InternetAccessTypeInResidenceDescriptorId) values (@@IDENTITY);
/* END 22-23 Additions */

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/InternetPerformanceInResidenceDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/InternetPerformanceInResidenceDescriptor'
DELETE FROM edfi.InternetPerformanceInResidenceDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetPerformanceInResidenceDescriptor','01','Yes','Yes, With No Issues (The student can reliably stream video on their primary learning device without interruption.)');
	INSERT INTO edfi.InternetPerformanceInResidenceDescriptor (InternetPerformanceInResidenceDescriptorId) values (@@IDENTITY);

/* Modified in 23-24 to Sometimes from Yes-But not Consistent */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetPerformanceInResidenceDescriptor','02','Sometimes','Sometimes, The student regularly experiences interruptions in learning activities caused by poor internet performance in their primary place of residence.');
	INSERT INTO edfi.InternetPerformanceInResidenceDescriptor (InternetPerformanceInResidenceDescriptorId) values (@@IDENTITY);

/* Modified to remove qualifier on No in long description */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/InternetPerformanceInResidenceDescriptor','03','No','No');
	INSERT INTO edfi.InternetPerformanceInResidenceDescriptor (InternetPerformanceInResidenceDescriptorId) values (@@IDENTITY);



----Grade Level Descriptor
/* 
	Removing complexity and following the state code values
*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/GradeLevelDescriptor'
DELETE FROM edfi.GradeLevelDescriptor

/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GradeLevelDescriptor','2U','0-2 Year Old','0-2 Year Old');
	INSERT INTO edfi.GradeLevelDescriptor (GradeLevelDescriptorid) values (@@IDENTITY);
/* END 22-23 Additions */

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

/*Food Service Participation Descriptors - Used in SchoolFoodServiceProgramService subcollection in SFSPA*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor'


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor','F','Free','Free');
	INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor','R','Reduced','Reduced');
	INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor','Not participating','Not participating','Not participating as Free or Reduced. (Students who pay full price for their school meals)');
	INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (SchoolFoodServiceProgramServiceDescriptorid) values (@@IDENTITY);

/*Food Service Eligibility Descriptors - Used in ParticipationStatus subcollection in SFSPA*/

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/ParticipationStatusDescriptor','F-Eligible','Eligible for Free','Eligible for Free');
	INSERT INTO edfi.ParticipationStatusDescriptor (ParticipationStatusDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/ParticipationStatusDescriptor','R-Eligible','Reduced','Reduced');
	INSERT INTO edfi.ParticipationStatusDescriptor (ParticipationStatusDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/ParticipationStatusDescriptor','Not participating-Eligibility','Not participating Eligibility','Not participating as Free or Reduced. This is for students that pay full price for their school meals.');
	INSERT INTO edfi.ParticipationStatusDescriptor (ParticipationStatusDescriptorid) values (@@IDENTITY);




----Limited English Proficiency Descriptor
/* 
	Removing complexity and following the state code values
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/LimitedEnglishProficiencyDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor'


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

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor'
DELETE FROM edfi.StudentCharacteristicDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'S', 'Student is a single parent','Student is a single parent');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'NS', 'Student is a parent, but not single','Student is a parent, but not single');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'NP', 'Student is not a parent','Student is not a parent');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Section 504', 'Individual under Section 504 of the Rehabilitation Act','Indication of a student who qualified as an individual under Section 504 of the Rehabilitation Act');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Foreign Exchange', 'Foreign Exchange','Foreign Exchange');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Gifted', 'Gifted','Gifted');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Pregnant', 'Pregnant','Pregnant');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Form 506', 'Form 506','Form 506');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Displaced Homemaker', 'Displaced Homemaker','Displaced Homemaker');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentCharacteristicDescriptor', 'Home Schooled', 'Home Schooled','Home Schooled');
        INSERT INTO edfi.StudentCharacteristicDescriptor(StudentCharacteristicDescriptorId) values (@@IDENTITY);


--DisabilityDeterminationSourceTypeDescriptor
/* CHANGED in 22/23 to be an Extension
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DisabilityDeterminationSourceTypeDescriptor'
DELETE FROM edfi.DisabilityDeterminationSourceTypeDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DisabilityDeterminationSourceTypeDescriptor','C','Child in Part C (Birth-3) and was referred to Pt B (3-21) for elig determ.','Child served in Part C (Birth-3) and was referred to Part B (Age 3-21) for eligibility determination.');
	INSERT INTO edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DisabilityDeterminationSourceTypeDescriptor','F','Child was referred thru Child Find (NOT Receiving Part C Services)','Child was referred thru Child Find (NOT Receiving Part C Services)');
	INSERT INTO edfi.DisabilityDeterminationSourceTypeDescriptor (DisabilityDeterminationSourceTypeDescriptorid) values (@@IDENTITY);
*/

--nmped.GenderIdentityDescriptor
/* 
	Adding values to match the state reporting method
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/GenderIdentityDescriptor'
DELETE FROM nmped.GenderIdentityDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GenderIdentityDescriptor','X','Non-Binary','Non-Binary');
	INSERT INTO nmped.GenderIdentityDescriptor (GenderIdentityDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GenderIdentityDescriptor','M','Male','Male');
	INSERT INTO nmped.GenderIdentityDescriptor (GenderIdentityDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/GenderIdentityDescriptor','F','Female','Female');
	INSERT INTO nmped.GenderIdentityDescriptor (GenderIdentityDescriptorid) values (@@IDENTITY);

--edfi.DiplomaTypeDescriptor
/* 
	Adding values to match the state reporting method
*/
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DiplomaTypeDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/DiplomaTypeDescriptor'
DELETE FROM edfi.DiplomaTypeDescriptor


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DiplomaTypeDescriptor','1','Diploma of Excellence without ADC.','Diploma of Excellence without an Alternate Demonstration of Competency (ADC).');
	INSERT INTO edfi.DiplomaTypeDescriptor (DiplomaTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DiplomaTypeDescriptor','2','Certificate of Course Work Completed.','Certificate of Course Work Completed (May include students in special education if they are on a continuing or transition IEP. Does NOT end student’s right to FAPE.)');
	INSERT INTO edfi.DiplomaTypeDescriptor (DiplomaTypeDescriptorid) values (@@IDENTITY);
	
/* Added 23-24 */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DiplomaTypeDescriptor','4','Diploma of Excellence on the Ability Option','Diploma of Excellence on the Ability Option');
	INSERT INTO edfi.DiplomaTypeDescriptor (DiplomaTypeDescriptorid) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DiplomaTypeDescriptor','6','Diploma of Excellence on the Modified Option','Diploma of Excellence on the Modified Option');
	INSERT INTO edfi.DiplomaTypeDescriptor (DiplomaTypeDescriptorid) values (@@IDENTITY);
/**/

--Special Education Event Type Descriptor
/* 
	Ensuring no values have found their way into this table and seeding with correct values.
*/
	
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationEventTypeDescriptor'
DELETE FROM nmped.SpecialEducationEventTypeDescriptor
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '1', '1', 'Special Education Exit or Known to be Continuing');
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
/* Removed due to modification in 23-24	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '13', '13', 'Returning senior who has a current IEP with written prior notice that will receive a conditional certificate of transition. CONTINUING IEP – MUST BE IN SCHOOL.');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '14', '14', 'Returning senior who has a current IEP with prior written notice that student will receive a conditional certificate of transition – TRANSITION MAY/MAY NOT BE IN SCHOOL');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
*/
	
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

/* Added/Modified for 23-24 */
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '13', '13', 'The student received a conditional certificate of conditional transition and plans to return for a Free and Appropriate Public Education (FAPE).');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);
	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '14', '14', 'To be used for students with disabilities that have been awarded a Modified Diploma or Ability Diploma and are continuing to work toward a Standard Diploma and/or IEP goals. Plans to return for a Free and Appropriate Public Education (FAPE).');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '15', '15', 'Graduation – Student with a disability graduated with a diploma on the ability or modified option and will not be returning for a Free and Appropriate Public Education (FAPE).');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventTypeDescriptor', '16', '16', 'Completion – Student with a disability earned a conditional certificate of transition and will not be returning for a Free and Appropriate Public Education (FAPE).');
        INSERT INTO nmped.SpecialEducationEventTypeDescriptor (SpecialEducationEventTypeDescriptorid) values (@@IDENTITY);

/**/		
		
--SpecialEducationNonComplianceReasonDescriptor
/* 
	Ensuring no values have found their way into this table and seeding with correct values.
*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor'
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/NonComplianceReasonDescriptor'
DELETE FROM nmped.SpecialEducationNonComplianceReasonDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '7', '7', 'Student Died WD');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '14', '14', 'Withdrawal from Part C by Parent prior to child’s third birthday. (Indicator 12 only)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '18', '18', 'Part C referred child less than 90 days before the child’s 3rd birthday');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '20', '20', 'Student moved out of the school district''s educational jurisdiction');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '21', '21', 'Student graduated before IEP corrected.');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '22', '22', 'Student dropped out of school before IEP corrected.');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '30', '30', 'No service provider available to complete evaluation (Use for Indicator 11)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '31', '31', 'Evaluation scheduling issues/ Difficulty scheduling IEP with parent/ Evaluation delays (Use for Indicator 11 or 12)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '32', '32', '60th day/3rd birthday on weekend, holiday or during other school closure (Use for Indicator 11 or 12)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '33', '33', 'Parent request delay in IEP meeting (Use for Indicator 12)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor', '34', '34', 'Parent request delay in completion of evaluation (Indicator 11 only)');
        INSERT INTO nmped.SpecialEducationNonComplianceReasonDescriptor (SpecialEducationNonComplianceReasonDescriptorId) values (@@IDENTITY);
		
--SpecialEducationEventReasonDescriptor
/* 
	Ensuring no values have found their way into this table and seeding with correct values.
*/

DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/SpecialEducationEventReasonDescriptor'
DELETE FROM nmped.SpecialEducationEventReasonDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '1', 'Returned to regular education (no longer receiving special education)', 'Returned to regular education (no longer receiving special education)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '4', 'Reached Maximum Age', 'Reached Maximum Age');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '5', 'Died WD', 'Died WD');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '6', 'Student has transferred out to another PED District or State Charter.', 'Student has transferred out to another PED District or State Charter. and known to be continuing.These students moved out of the catchment area or otherwise transferred to another district and are KNOWN to be continuing in an educational program. There does not need to be evidence that the students are continuing in special education only that the students are continuing in an educational program.  
This includes students who are in residential drug/alcohol rehabilitation centers, correctional facilities, or charter schools if those facilities operated as separate districts, excluding normal matriculation.');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '8', 'Dropped Out ', 'Dropped Out ');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '9', 'Graduated with Diploma on Standard Option (FAPE ends)', 'Graduated with Diploma on Standard Option (FAPE ends)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '10', 'Graduated with Diploma on Modified Option (FAPE ends)', 'Graduated with Diploma on Modified Option (FAPE ends)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '11', 'Graduated with Diploma on Ability Option (FAPE ends)', 'Graduated with Diploma on Ability Option (FAPE ends)');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

/* Added 23-24 */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', '12', 'The student received a conditional certificate of transition', 'The student received a conditional certificate of transition (Does not end FAPE).');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);
		
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/SpecialEducationEventReasonDescriptor', 'DNQ', 'Did not qualify', 'Did not qualify.');
        INSERT INTO nmped.SpecialEducationEventReasonDescriptor (SpecialEducationEventReasonDescriptorId) values (@@IDENTITY);

/**/

--Updating the J1Visa codevalue to match the state reporting code value
UPDATE edfi.Descriptor
SET CodeValue = 'J1Visa' WHERE Namespace = 'uri://nmped.org/VisaDescriptor' AND CodeValue = 'J1 - Exchange Scholar Visa'

--Updating the J1Visa description to match the state reporting description
UPDATE edfi.Descriptor
SET ShortDescription = 'J1Visa' WHERE Namespace = 'uri://nmped.org/VisaDescriptor' AND CodeValue = 'J1Visa'

-- *** TRANSPORTATION Descriptors***
-- Vehicle Fuel Type
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/VehicleFuelType'

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelTypeDescriptor', 'ALT', 'Alternative fuel', 'Alternative fuel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelTypeDescriptor', 'ULG', 'Unleaded gasoline', 'Unleaded gasoline');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelTypeDescriptor', 'DIE', 'Diesel', 'Diesel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleFuelTypeDescriptor', 'DYD', 'Dyed diesel', 'Dyed diesel');
        INSERT INTO nmped.VehicleFuelTypeDescriptor (VehicleFuelTypeDescriptorId) values (@@IDENTITY);

-- Vehicle Body Manufaturer
DELETE FROM edfi.Descriptor WHERE Namespace = 'uri://nmped.org/VehicleBodyManufacturerDescriptor'
DELETE FROM nmped.VehicleBodyManufacturerDescriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'AMT', 'Amtram', 'Amtram');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'BLU', 'Bluebird', 'Bluebird');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'CE3', 'CE300', 'CE300');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'CHV', 'Chevy', 'Chevy');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'COL', 'Collins', 'Collins');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'FOR', 'Ford', 'Ford');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'FRE', 'Freightliner', 'Freightliner');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'GEN', 'GENE', 'GENE');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'GMC', 'GMC', 'GMC');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'IC', 'IC', 'IC');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'INT', 'International', 'International');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'Mid', 'Mid Bus', 'Mid Bus');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'OTH', 'Other', 'Other');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'THO', 'Thomas', 'Thomas');
        INSERT INTO nmped.VehicleBodyManufacturerDescriptor (VehicleBodyManufacturerDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://nmped.org/VehicleBodyManufacturerDescriptor', 'VI', 'Vision', 'Vision');
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
 

--Dental Examination Verification Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DentalExaminationVerificationCodeDescriptor','EXAM','Exam Received','Exam Received');
	INSERT INTO nmped.DentalExaminationVerificationCodeDescriptor(DentalExaminationVerificationCodeDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/DentalExaminationVerificationCodeDescriptor','WAIVER','Signed Waiver','Signed Waiver');
	INSERT INTO nmped.DentalExaminationVerificationCodeDescriptor (DentalExaminationVerificationCodeDescriptorId) values (@@IDENTITY);



/* Removed 22-23
--Digital Equity Internet Access Type Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '01', 'Fiber','Fiber');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '02', 'Cable','Cable');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '03', 'DSL','DSL');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '04', 'Microwave','Microwave');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '07', 'Person Hotspot','Person Hotspot');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '08', 'School Provided Hotspot','School Provided Hotspot');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);	
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '05', 'Satellite','Satellite');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '06', 'Dial-up','Dial-up');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '09', 'Unknown','Unknown');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '10', 'None','None');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '11', 'None','None');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '12', 'None','None');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '13', 'None','None');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/DigitalEquityInternetAccessTypeDescriptor', '14', 'None','None');
        INSERT INTO nmped.DigitalEquityInternetAccessTypeDescriptor(DigitalEquityInternetAccessTypeDescriptorId) values (@@IDENTITY);
*/


----ExpectedDiplomaTypeDescriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/ExpectedDiplomaTypeDescriptor', '3', 'Modified Option','Modified Option');
        INSERT INTO nmped.ExpectedDiplomaTypeDescriptor(ExpectedDiplomaTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/ExpectedDiplomaTypeDescriptor', '4', 'Ability Option','Ability Option');
        INSERT INTO nmped.ExpectedDiplomaTypeDescriptor(ExpectedDiplomaTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/ExpectedDiplomaTypeDescriptor', '5', 'Standard Option','Standard Option');
        INSERT INTO nmped.ExpectedDiplomaTypeDescriptor(ExpectedDiplomaTypeDescriptorId) values (@@IDENTITY);


----Planned Post Graduate Activity Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PlannedPostGraduateActivityDescriptor', '01', 'Attend college/university','Attend college/university');
        INSERT INTO nmped.PlannedPostGraduateActivityDescriptor(PlannedPostGraduateActivityDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PlannedPostGraduateActivityDescriptor', '02', 'Attend junior college','Attend junior college');
        INSERT INTO nmped.PlannedPostGraduateActivityDescriptor(PlannedPostGraduateActivityDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PlannedPostGraduateActivityDescriptor', '03', 'Attend trade school.','Attend trade school.');
        INSERT INTO nmped.PlannedPostGraduateActivityDescriptor(PlannedPostGraduateActivityDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PlannedPostGraduateActivityDescriptor', '04', 'Work','Work');
        INSERT INTO nmped.PlannedPostGraduateActivityDescriptor(PlannedPostGraduateActivityDescriptorId) values (@@IDENTITY);

----Road Type Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/RoadTypeDescriptor', 'PAV', 'Paved','Paved');
        INSERT INTO nmped.RoadTypeDescriptor(RoadTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/RoadTypeDescriptor', 'UPV', 'Unpaved','Unpaved');
        INSERT INTO nmped.RoadTypeDescriptor(RoadTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/RoadTypeDescriptor', 'UIM', 'Unimproved','Unimproved');
        INSERT INTO nmped.RoadTypeDescriptor(RoadTypeDescriptorId) values (@@IDENTITY);

----Student Award Type Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentAwardTypeDescriptor', 'TLC', 'Tribal Language Proficiency Certification','Tribal Language Proficiency Certification');
        INSERT INTO nmped.StudentAwardTypeDescriptor(StudentAwardTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentAwardTypeDescriptor', 'CA', '4 units of Credit and an Assessment','4 units of Credit and an Assessment');
        INSERT INTO nmped.StudentAwardTypeDescriptor(StudentAwardTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentAwardTypeDescriptor', 'CPP', '4 Units of Credit and an Alternative Process Portfolio','4 Units of Credit and an Alternative Process Portfolio');
        INSERT INTO nmped.StudentAwardTypeDescriptor(StudentAwardTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StudentAwardTypeDescriptor', 'APP', 'Assessment and Alternative Process Portfolio','Assessment and Alternative Process Portfolio');
        INSERT INTO nmped.StudentAwardTypeDescriptor(StudentAwardTypeDescriptorId) values (@@IDENTITY);

----Vehicle Chassis Manufacturer Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'AMT', 'Amtram','Amtram');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'BLU', 'Bluebird','Bluebird');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'CE3', 'CE300','CE300');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'CHV', 'Chevy','Chevy');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'COL', 'Collins','Collins');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'FOR', 'Ford','Ford');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'FRE', 'Freightliner','Freightliner');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'GEN', 'GENE','GENE');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'GMC', 'GMC','GMC');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'IC', 'IC','IC');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'INT', 'International','International');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'MID', 'Mid Bus','Mid Bus');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'OTH', 'Other','Other');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'THO', 'Thomas','Thomas');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleChassisManufacturerDescriptor', 'VI', 'Vision','Vision');
        INSERT INTO nmped.VehicleChassisManufacturerDescriptor(VehicleChassisManufacturerDescriptorId) values (@@IDENTITY);

----Vehicle Route Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', 'RTF', 'Regular to and from','Regular to and from');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', 'COF', 'Contract feeder','Contract feeder');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', 'SEO', 'Special education only','Special education only');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', 'KGO', 'Kindergarten only','Kindergarten only');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', 'VCO', 'Vocational only','Vocational only');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', '34Y', '3-4 year old D.D. only','3-4 year old D.D. only');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleRouteDescriptor', 'ACT', 'Activity Bus','Activity Bus');
        INSERT INTO nmped.VehicleRouteDescriptor(VehicleRouteDescriptorId) values (@@IDENTITY);

---- Annual Review Delay Reason Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/AnnualReviewDelayReasonDescriptor', '01', 'Parent request IEP date after IEP due','Parent request IEP date after IEP due');
        INSERT INTO nmped.AnnualReviewDelayReasonDescriptor(AnnualReviewDelayReasonDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/AnnualReviewDelayReasonDescriptor', '02', 'Unable to schedule IEP meeting with parent(s).','Unable to schedule IEP meeting with parent(s).');
        INSERT INTO nmped.AnnualReviewDelayReasonDescriptor(AnnualReviewDelayReasonDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/AnnualReviewDelayReasonDescriptor', '03', 'Internal scheduling conflicts within LEA.','Internal scheduling conflicts within LEA.');
        INSERT INTO nmped.AnnualReviewDelayReasonDescriptor(AnnualReviewDelayReasonDescriptorId) values (@@IDENTITY);

---- Triennial Review Delay Reason Descriptor

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TriennialReviewDelayReasonDescriptor', '01', 'Additional data needs to be gathered.','Additional data needs to be gathered.');
        INSERT INTO nmped.TriennialReviewDelayReasonDescriptor(TriennialReviewDelayReasonDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TriennialReviewDelayReasonDescriptor', '02', 'Shortage of or no related service staff.','Shortage of or no related service staff available to conduct evaluation.');
        INSERT INTO nmped.TriennialReviewDelayReasonDescriptor(TriennialReviewDelayReasonDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TriennialReviewDelayReasonDescriptor', '03', 'Internal scheduling conflicts within LEA.','Internal scheduling conflicts within LEA.');
        INSERT INTO nmped.TriennialReviewDelayReasonDescriptor(TriennialReviewDelayReasonDescriptorId) values (@@IDENTITY);

---- Vehicle Type Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleTypeDescriptor', 'BUS', 'BUS','BUS');
        INSERT INTO nmped.VehicleTypeDescriptor(VehicleTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/VehicleTypeDescriptor', 'SUV', 'SUV','SUV');
        INSERT INTO nmped.VehicleTypeDescriptor(VehicleTypeDescriptorId) values (@@IDENTITY);

----Transportation Set Code Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'ELIGSTUDNOTSTARS', 'ELIGSTUDNOTSTARS','ELIGSTUDNOTSTARS');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'FEEDER', 'FEEDER','FEEDER');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'PROJSTUDENTS', 'PROJSTUDENTS','PROJSTUDENTS');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'K5PMILEAGE', 'K5PMILEAGE','K5PMILEAGE');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'ELTPMILEAGE', 'ELTPMILEAGE','ELTPMILEAGE');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
		
/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'MILEAGE', 'MILEAGE','MILEAGE');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationSetCodeDescriptor', 'K12PMILEAGE', 'K12PMILEAGE','K12PMILEAGE');
        INSERT INTO nmped.TransportationSetCodeDescriptor(TransportationSetCodeDescriptorId) values (@@IDENTITY);
/* END 22-23 Additions */

--Transportation Category Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'Bus Transportation', 'Bus Transportation','Bus Transportation');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'ELIGSTUDNOTSTARS', 'ELIGSTUDNOTSTARS','ELIGSTUDNOTSTARS');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'FEEDER', 'FEEDER','FEEDER');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'PROJSTUDENTS', 'PROJSTUDENTS','PROJSTUDENTS');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'K5PMILEAGE', 'K5PMILEAGE','K5PMILEAGE');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'ELTPMILEAGE', 'ELTPMILEAGE','ELTPMILEAGE');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
/* 22-23 Additions */ 
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'MILEAGE', 'MILEAGE','MILEAGE');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/TransportationCategoryDescriptor', 'K12PMILEAGE', 'K12PMILEAGE','K12PMILEAGE');
        INSERT INTO nmped.TransportationCategoryDescriptor(TransportationCategoryDescriptorId) values (@@IDENTITY);
/* END 22-23 Additions */

----Mileage Type Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MileageTypeDescriptor', 'LRT', 'Live Route','Live Route');
        INSERT INTO nmped.MileageTypeDescriptor(MileageTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MileageTypeDescriptor', 'EDH', 'Essential Dead Head','Essential Dead Head');
        INSERT INTO nmped.MileageTypeDescriptor(MileageTypeDescriptorId) values (@@IDENTITY);

----PreK Class Type Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PreKClassTypeDescriptor', 'AM', 'Morning Program for PreK ONLY','Morning Program for PreK ONLY');
        INSERT INTO nmped.PreKClassTypeDescriptor(PreKClassTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PreKClassTypeDescriptor', 'PM', 'Afternoon Program for PreK ONLY','Afternoon Program for PreK ONLY');
        INSERT INTO nmped.PreKClassTypeDescriptor(PreKClassTypeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PreKClassTypeDescriptor', 'FD', 'Full Day Program for PreK ONLY','Full Day Program for PreK ONLY');
        INSERT INTO nmped.PreKClassTypeDescriptor(PreKClassTypeDescriptorId) values (@@IDENTITY);

----Staff Development Activity Code Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentActivityCodeDescriptor', 'ELTP', 'Extended Learning Time Program','Extended Learning Time Program');
        INSERT INTO nmped.StaffDevelopmentActivityCodeDescriptor(StaffDevelopmentActivityCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentActivityCodeDescriptor', 'MENTOR', 'Mentor','Mentor');
        INSERT INTO nmped.StaffDevelopmentActivityCodeDescriptor(StaffDevelopmentActivityCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentActivityCodeDescriptor', 'MENTEE', 'Mentee','Mentee');
        INSERT INTO nmped.StaffDevelopmentActivityCodeDescriptor(StaffDevelopmentActivityCodeDescriptorId) values (@@IDENTITY);

----Staff Development Purpose Code Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '01', 'Left NM and teaching in other state','Left NM and teaching in other state');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '02', 'Left for reasons other than retirement','Left for reasons other than retirement');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '03', 'Left to teach in private school in NM','Left to teach in private school in NM');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '04', 'Went to other public/charter NM district','Went to other public/charter NM district');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '05', 'Took non-teaching position in district','Took non-teaching position in district');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '06', 'Died','Died');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '07', 'Retired','Retired');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '08', 'Personal Reasons','Personal Reasons');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '09', 'Non-Renewal of Contract','Non-Renewal of Contract');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '10', 'Non-Renewal of Teaching License','Non-Renewal of Teaching License');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '11', 'Discharged prior to end of contract','Discharged prior to end of contract');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '12', 'Resigned prior to completion of contract','Resigned prior to completion of contract');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '13', 'Reduction in force/staff','Reduction in force/staff');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '14', 'Leave of absence','Leave of absence (i.e. Permanent leave of absence due to illness or another reason)');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '15', 'Military Service','Military Service');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '16', 'Teaching in Another Country','Teaching in Another Country');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '17', 'Peace Corps/ACTION','Peace Corps/ACTION');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '18', 'Completion of Short Term Contract','Completion of Short Term Contract');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '19', 'Left to teach in BIE school in NM','Left to teach in BIE (Bureau of Indian Education) school in NM');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor', '99', 'Unknown Reason','Unknown Reason');
        INSERT INTO nmped.StaffDevelopmentPurposeCodeDescriptor(StaffDevelopmentPurposeCodeDescriptorId) values (@@IDENTITY);


----Primary Area of Exceptionality
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PrimaryAreaOfExceptionalityDescriptor', 'G', 'Gifted Only','Gifted Only or Gifted as primary and disability as secondary as indicated in the IEP.');
        INSERT INTO nmped.PrimaryAreaOfExceptionalityDescriptor(PrimaryAreaOfExceptionalityDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/PrimaryAreaOfExceptionalityDescriptor', 'SE', 'Disability Only','Disability Only or Disability as primary and Gifted as secondary as indicated in the IEP.');
        INSERT INTO nmped.PrimaryAreaOfExceptionalityDescriptor(PrimaryAreaOfExceptionalityDescriptorId) values (@@IDENTITY);
	
		
----Military Family Descriptor
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MilitaryFamilyDescriptor', 'Active', 'Active','Active');
        INSERT INTO nmped.MilitaryFamilyDescriptor(MilitaryFamilyDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MilitaryFamilyDescriptor', 'National Guard', 'National Guard','National Guard');
        INSERT INTO nmped.MilitaryFamilyDescriptor(MilitaryFamilyDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MilitaryFamilyDescriptor', 'Reserve', 'Reserve','Reserve');
        INSERT INTO nmped.MilitaryFamilyDescriptor(MilitaryFamilyDescriptorId) values (@@IDENTITY);
		
/* 22-23 Additions */
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MilitaryFamilyDescriptor', 'DoD Civilian', 'DoD Civilian','DoD Civilian');
        INSERT INTO nmped.MilitaryFamilyDescriptor(MilitaryFamilyDescriptorId) values (@@IDENTITY);


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values  ('uri://nmped.org/MilitaryFamilyDescriptor', 'Retired Military', 'Retired Military','Retired Military');
        INSERT INTO nmped.MilitaryFamilyDescriptor(MilitaryFamilyDescriptorId) values (@@IDENTITY);
/* END 22-23 Additions */


----Special Education Referral Code (22-23 Addition)
	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SpecialEducationReferralCodeDescriptor','C','C=Child served in Part C','C = Child served in Part C (Birth-3) and was referred to Part B (Age 3-21) for eligibility determination.');
	INSERT INTO nmped.SpecialEducationReferralCodeDescriptor (SpecialEducationReferralCodeDescriptorId) values (@@IDENTITY);

	INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/SpecialEducationReferralCodeDescriptor','F','F=Child was referred thru Child Find (NOT Receiving Part C Services)','Child was referred thru Child Find (NOT Receiving Part C Services)');
	INSERT INTO nmped.SpecialEducationReferralCodeDescriptor (SpecialEducationReferralCodeDescriptorId) values (@@IDENTITY);

----Mini Term Grading Period Addition (Being added to Ed-Fi Namespace to preserve consistency with other grading periods
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 1', 'Miniterm 1', 'Miniterm 1');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 2', 'Miniterm 2', 'Miniterm 2');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 3', 'Miniterm 3', 'Miniterm 3');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 4', 'Miniterm 4', 'Miniterm 4');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 5', 'Miniterm 5', 'Miniterm 5');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 6', 'Miniterm 6', 'Miniterm 6');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 7', 'Miniterm 7', 'Miniterm 7');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
        values ('uri://ed-fi.org/GradingPeriodDescriptor', 'Miniterm 8', 'Miniterm 8', 'Miniterm 8');
        INSERT INTO edfi.GradingPeriodDescriptor(GradingPeriodDescriptorId) values (@@IDENTITY);