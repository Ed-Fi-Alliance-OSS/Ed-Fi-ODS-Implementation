INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ProgramId]
           ,[CreateDate]
           ,[LastModifiedDate])

     VALUES

(
	    35001000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35001000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35002000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35002000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35003000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35003000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35004000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35004000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35005000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35005000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35006000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35006000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35007000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35007000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35008000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35008000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35009000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35009000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35010000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35010000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35011000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35011000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35012000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35012000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35013000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35013000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35014000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35014000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35015000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35015000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35016000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35016000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35017000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35017000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35018000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35018000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35019000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35019000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35020000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35020000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35021000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35021000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35022000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35022000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35023000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35023000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35024000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35024000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35025000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35025000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35026000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35026000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35027000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35027000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35028000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35028000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35029000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35029000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35030000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35030000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35031000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
);

INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ProgramId]
           ,[CreateDate]
           ,[LastModifiedDate])

     VALUES
           
--(          35031000,
--           'Charter school student participating in a district activity',
--           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
--           'CSDA',
--           GETDATE(),
--           GETDATE()
--),
           
(          35031000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35031000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35032000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35032000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35033000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35033000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35034000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35034000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35035000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35035000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35036000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35036000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35037000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35037000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35038000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35038000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35039000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35039000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35040000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35040000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35041000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35041000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35042000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35042000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35043000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35043000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35044000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35044000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35045000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35045000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35046000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35046000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35047000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35047000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35048000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35048000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35049000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35049000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35050000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35050000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35051000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35051000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35052000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35052000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35053000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35053000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35054000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35054000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35055000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35055000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35056000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35056000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35057000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35057000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35058000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35058000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35059000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35059000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35060000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35060000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35061000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35061000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35062000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35062000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35063000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35063000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35064000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35064000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35065000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35065000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35066000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35066000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35067000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35067000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35068000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
);

INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ProgramId]
           ,[CreateDate]
           ,[LastModifiedDate])

     VALUES
           
(          35068000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35068000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35069000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35069000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35070000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35070000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35071000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35071000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35072000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35072000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35073000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35073000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35074000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35074000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35075000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35075000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35076000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35076000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35077000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35077000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35078000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35078000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35079000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35079000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35080000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35080000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35081000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35081000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35082000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35082000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35083000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35083000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35084000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35084000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35085000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35085000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35086000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35086000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35087000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35087000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35088000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35088000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35089000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35089000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35501000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35501000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35503000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35503000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35504000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35504000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35505000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35505000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35509000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35509000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35510000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35510000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35511000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35511000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35512000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35512000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
);

INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ProgramId]
           ,[CreateDate]
           ,[LastModifiedDate])

     VALUES
(
	    35515000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35515000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35516000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35516000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35517000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35517000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35518000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35518000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35519000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35519000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35520000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35520000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35521000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35521000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35524000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35524000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35525000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35525000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35528000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35528000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35529000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
);

INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ProgramId]
           ,[CreateDate]
           ,[LastModifiedDate])

     VALUES
           
(          35529000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35529000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35530000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35530000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35531000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35531000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35532000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35532000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35535000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35535000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35536000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35536000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35539000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35539000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35542000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35542000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35544000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35544000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35546000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35546000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35547000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35547000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35549000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35549000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35550000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
);

INSERT INTO [edfi].[Program]
           ([EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ProgramId]
           ,[CreateDate]
           ,[LastModifiedDate])

     VALUES
           
(          35550000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35550000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35552000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35552000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35557000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35557000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35560000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35560000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35562000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35562000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35563000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35563000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35564000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35564000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35565000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35565000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35566000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35566000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35567000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35567000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35568000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35568000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35570000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35570000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35573000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35573000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35574000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35574000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35575000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35575000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35576000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35576000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
),
(
	    35577000,
           'Child participating in the Early Childhood 3Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='3Y'),
           '3Y',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Child participating in the Early Childhood 4Y Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='4Y'),
           '4Y',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Bilingual Multicultural Education Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BEP'),
           'BEP',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Bus Services'' Vocational Ed/Concurrent Enrollment',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BSCE'),
           'BSCE',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Bus Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUS'),
           'BUS',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Bus Services for Students with Disabilities K-12',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='BUSA'),
           'BUSA',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Coordinated Early Intervening Services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CEIS'),
           'CEIS',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Charter school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSDA'),
           'CSDA',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Community School Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='CSP'),
           'CSP',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Early College High School (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ECHS'),
           'ECHS',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Expanded and Enriched Learning Time and Opportunities',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='EELTO'),
           'EELTO',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'English Learner',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELL'),
           'ELL',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Extended Learning Time Program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='ELTP'),
           'ELTP',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Family and Children Education (for 3 and 4 year olds only)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='FACE'),
           'FACE',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Head Start Prek',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HEADST'),
           'HEADST',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Home school student participating in a district activity',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='HSDA'),
           'HSDA',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Student is participating in the NM PreK program',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='NMPREK'),
           'NMPREK',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title I Part A',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1A'),
           'T1A',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title I Part A Students in Neglected and Delinquent programs',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1AND'),
           'T1AND',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title I Part A funded preschool school students',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APK'),
           'T1APK',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title I Part A Private students receiving Title 1 services',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T1APR'),
           'T1APR',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title III',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T3'),
           'T3',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title VII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T7'),
           'T7',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Title VIII',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='T8'),
           'T8',
           GETDATE(),
           GETDATE()
),
           
(          35577000,
           'Workforce Readiness Program (used by CCRB bureau)',
           (SELECT TOP 1 descriptorid from edfi.descriptor WHERE Namespace like '%ProgramTypeDescriptor%' AND CodeValue='WRP'),
           'WRP',
           GETDATE(),
           GETDATE()
);