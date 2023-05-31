begin transaction;

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CharterStatusDescriptor','NOT A CHARTER','NOT A CHARTER','Not a charter');
	INSERT INTO edfi.CharterStatusDescriptor (CharterStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CharterStatusDescriptor','STATE CHARTER','STATE CHARTER','School or District that has a charter with the state.');
	INSERT INTO edfi.CharterStatusDescriptor (CharterStatusDescriptorId) values (@@IDENTITY);

INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
	values ('uri://nmped.org/CharterStatusDescriptor','DISTRICT CHARTER','DISTRICT CHARTER','School that has a charter with a public district.');
	INSERT INTO edfi.CharterStatusDescriptor (CharterStatusDescriptorId) values (@@IDENTITY);



-- district name updates (remove 'District office','DO', 'dist office')

UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALBUQUERQUE' where EducationOrganizationId = '35001000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RESERVE' where EducationOrganizationId = '35002000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'QUEMADO' where EducationOrganizationId = '35003000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ROSWELL' where EducationOrganizationId = '35004000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HAGERMAN' where EducationOrganizationId = '35005000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'DEXTER' where EducationOrganizationId = '35006000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LAKE ARTHUR' where EducationOrganizationId = '35007000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CIMARRON' where EducationOrganizationId = '35008000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RATON' where EducationOrganizationId = '35009000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SPRINGER' where EducationOrganizationId = '35010000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MAXWELL' where EducationOrganizationId = '35011000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CLOVIS' where EducationOrganizationId = '35012000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TEXICO' where EducationOrganizationId = '35013000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MELROSE' where EducationOrganizationId = '35014000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'GRADY' where EducationOrganizationId = '35015000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'FORT SUMNER' where EducationOrganizationId = '35016000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LAS CRUCES' where EducationOrganizationId = '35017000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HATCH VALLEY ' where EducationOrganizationId = '35018000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'GADSDEN' where EducationOrganizationId = '35019000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CARLSBAD' where EducationOrganizationId = '35020000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LOVING' where EducationOrganizationId = '35021000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ARTESIA' where EducationOrganizationId = '35022000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SILVER CITY' where EducationOrganizationId = '35023000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'COBRE' where EducationOrganizationId = '35024000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SANTA ROSA' where EducationOrganizationId = '35025000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'VAUGHN' where EducationOrganizationId = '35026000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ROY' where EducationOrganizationId = '35027000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MOSQUERO' where EducationOrganizationId = '35028000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LORDSBURG' where EducationOrganizationId = '35029000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ANIMAS' where EducationOrganizationId = '35030000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LOVINGTON' where EducationOrganizationId = '35031000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'EUNICE' where EducationOrganizationId = '35032000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HOBBS' where EducationOrganizationId = '35033000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'JAL' where EducationOrganizationId = '35034000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TATUM' where EducationOrganizationId = '35035000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RUIDOSO' where EducationOrganizationId = '35036000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CARRIZOZO' where EducationOrganizationId = '35037000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CORONA' where EducationOrganizationId = '35038000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HONDO VALLEY' where EducationOrganizationId = '35039000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CAPITAN' where EducationOrganizationId = '35040000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LOS ALAMOS' where EducationOrganizationId = '35041000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'DEMING' where EducationOrganizationId = '35042000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'GALLUP' where EducationOrganizationId = '35043000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MORA' where EducationOrganizationId = '35044000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'WAGON MOUND' where EducationOrganizationId = '35045000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALAMOGORDO' where EducationOrganizationId = '35046000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TULAROSA' where EducationOrganizationId = '35047000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CLOUDCROFT' where EducationOrganizationId = '35048000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TUCUMCARI' where EducationOrganizationId = '35049000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HOUSE' where EducationOrganizationId = '35050000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LOGAN' where EducationOrganizationId = '35051000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SAN JON' where EducationOrganizationId = '35052000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CHAMA VALLEY' where EducationOrganizationId = '35053000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'DULCE' where EducationOrganizationId = '35054000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ESPANOLA' where EducationOrganizationId = '35055000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'JEMEZ MTN' where EducationOrganizationId = '35056000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'PORTALES' where EducationOrganizationId = '35057000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ELIDA' where EducationOrganizationId = '35058000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'FLOYD' where EducationOrganizationId = '35059000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'DORA' where EducationOrganizationId = '35060000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'BERNALILLO' where EducationOrganizationId = '35061000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CUBA' where EducationOrganizationId = '35062000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'JEMEZ VALLEY ' where EducationOrganizationId = '35063000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'AZTEC' where EducationOrganizationId = '35064000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'FARMINGTON' where EducationOrganizationId = '35065000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'BLOOMFIELD' where EducationOrganizationId = '35066000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CENTRAL' where EducationOrganizationId = '35067000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'WEST LAS VEGAS ' where EducationOrganizationId = '35068000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LAS VEGAS CITY ' where EducationOrganizationId = '35069000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'PECOS' where EducationOrganizationId = '35070000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SANTA FE' where EducationOrganizationId = '35071000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'POJOAQUE' where EducationOrganizationId = '35072000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'T OR C' where EducationOrganizationId = '35073000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SOCORRO' where EducationOrganizationId = '35074000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MAGDALENA' where EducationOrganizationId = '35075000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TAOS' where EducationOrganizationId = '35076000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'PENASCO' where EducationOrganizationId = '35077000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MESA VISTA' where EducationOrganizationId = '35078000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'QUESTA' where EducationOrganizationId = '35079000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ESTANCIA' where EducationOrganizationId = '35080000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MORIARTY-EDGEWOOD' where EducationOrganizationId = '35081000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MOUNTAINAIR' where EducationOrganizationId = '35082000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RIO RANCHO' where EducationOrganizationId = '35083000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CLAYTON' where EducationOrganizationId = '35084000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'DES MOINES' where EducationOrganizationId = '35085000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LOS LUNAS' where EducationOrganizationId = '35086000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'BELEN' where EducationOrganizationId = '35087000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'GRANTS' where EducationOrganizationId = '35088000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ZUNI' where EducationOrganizationId = '35089000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'STATE SUPPORTED CORRECTION' where EducationOrganizationId = '35091000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'NM SCH FOR THE DEAF' where EducationOrganizationId = '35093000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'NMSBVI' where EducationOrganizationId = '35094000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'UNM MIMBRES SCHOOL' where EducationOrganizationId = '35095000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SEQUOYAH' where EducationOrganizationId = '35097000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'JUVENILE JUSTICE' where EducationOrganizationId = '35099000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MEDIA ARTS COLLABORATIVE CHARTER' where EducationOrganizationId = '35501000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HORIZON ACADEMY WEST' where EducationOrganizationId = '35503000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'NORTH VALLEY ACADEMY' where EducationOrganizationId = '35504000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SCHOOL OF DREAMS ACADEMY' where EducationOrganizationId = '35505000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'NM SCHOOL FOR THE ARTS' where EducationOrganizationId = '35509000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TAOS ACADEMY' where EducationOrganizationId = '35510000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALMA D''ARTE CHARTER' where EducationOrganizationId = '35511000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'CESAR CHAVEZ COMMUNITY  SCHOOL' where EducationOrganizationId = '35512000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SOUTH VALLEY PREP' where EducationOrganizationId = '35515000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ABQ SCHOOL OF EXCELLENCE' where EducationOrganizationId = '35516000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ABQ SIGN LANGUAGE ACADEMY' where EducationOrganizationId = '35517000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TIERRA ADENTRO' where EducationOrganizationId = '35518000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'THE MASTERS PROGRAM' where EducationOrganizationId = '35519000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'THE ASK ACADEMY' where EducationOrganizationId = '35520000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TAOS INTEGRATED SCHOOL OF ARTS' where EducationOrganizationId = '35521000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALBUQUERQUE INSTITUTE OF MATH & SCIEN' where EducationOrganizationId = '35524000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'AMY BIEHL CHARTER HIGH SCHOOL' where EducationOrganizationId = '35525000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALBUQUERQUE BILINGUAL ACADEMY' where EducationOrganizationId = '35528000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MONTESSORI ELEMENTARY SCHOOL' where EducationOrganizationId = '35529000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SOUTHWEST PREPARATORY LEARNING CENTER' where EducationOrganizationId = '35530000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SOUTHWEST SECONDARY LEARNING CENTER' where EducationOrganizationId = '35531000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALDO LEOPOLD CHARTER' where EducationOrganizationId = '35532000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'J PAUL TAYLOR ACADEMY' where EducationOrganizationId = '35535000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'THE GREAT ACADEMY' where EducationOrganizationId = '35536000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RED RIVER VALLEY CHARTER SCHOOL' where EducationOrganizationId = '35539000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MISSION ACHIEVEMENT AND SUCCESS' where EducationOrganizationId = '35542000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SW AERONAUTICS MATHEMATICS AND SCIENC' where EducationOrganizationId = '35544000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LA TIERRA MONTESSORI SCHOOL' where EducationOrganizationId = '35546000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MCCURDY CHARTER SCHOOL' where EducationOrganizationId = '35547000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'NEW AMERICA SCHOOL - LAS CRUCES' where EducationOrganizationId = '35549000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ESTANCIA VALLEY CLASSICAL ACADEMY' where EducationOrganizationId = '35550000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'WALATOWA CHARTER HIGH' where EducationOrganizationId = '35552000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'EXPLORE ACADEMY' where EducationOrganizationId = '35557000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LA ACADEMIA DOLORES HUERTA' where EducationOrganizationId = '35560000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'DEAP' where EducationOrganizationId = '35562000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SANDOVAL ACADEMY OF BILINGUAL EDUC' where EducationOrganizationId = '35563000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MONTE DEL SOL CHARTER' where EducationOrganizationId = '35564000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TIERRA ENCANTADA CHARTER SCHOOL' where EducationOrganizationId = '35565000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'TURQUOISE TRAIL CHARTER SCHOOL' where EducationOrganizationId = '35566000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'LAS MONTANAS CHARTER' where EducationOrganizationId = '35567000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SIX DIRECTIONS INDIGENOUS SCHOOL' where EducationOrganizationId = '35568000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ROOTS & WINGS COMMUNITY' where EducationOrganizationId = '35570000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'HOZHO ACADEMY' where EducationOrganizationId = '35573000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALBUQUERQUE COLLEGIATE CHARTER SCHOOL' where EducationOrganizationId = '35574000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ALTURA PREPARATORY SCHOOL' where EducationOrganizationId = '35575000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'SOLARE COLLEGIATE CHARTER SCHOOL' where EducationOrganizationId = '35576000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RAICES DEL SABER XINACHTLI COMMUNITY' where EducationOrganizationId = '35577000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'MIDDLE COLLEGE HIGH SCHOOL CHARTER - GALLUP' where EducationOrganizationId = '35578000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'ACES TECHNICAL HIGH SCHOOL' where EducationOrganizationId = '35579000'
UPDATE edfi.EducationOrganization set NameOfInstitution = '21ST CENTURY PUBLIC ACADEMY' where EducationOrganizationId = '35580000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'EXPLORE ACADEMY LAS CRUCES' where EducationOrganizationId = '35581000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'THRIVE COMMUNITY SCHOOL' where EducationOrganizationId = '35582000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'RIO GRANDE ACADEMY OF FINE ARTS' where EducationOrganizationId = '35583000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'PECOS CONNECTIONS ACADEMY' where EducationOrganizationId = '35584000'
UPDATE edfi.EducationOrganization set NameOfInstitution = 'VISTA GRANDE HIGH SCHOOL' where EducationOrganizationId = '35585000'
UPDATE edfi.EducationOrganization SET NameOfInstitution = 'NEW MEXICO CONNECTIONS ACADEMY' WHERE EducationOrganizationId = '35554000'
UPDATE edfi.EducationOrganization SET NameOfInstitution = 'TAOS INTERNATIONAL SCHOOL' WHERE EducationOrganizationId = '35555000'

-- NMPED Insert as State Education Agency and two missing EdOrgs
INSERT INTO [edfi].[EducationOrganizationCategory]
           (EducationOrganizationId,
		    EducationOrganizationCategoryDescriptorId
		   )
VALUES
(35000000, (SELECT TOP 1 DescriptorID FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://ed-fi.org/EducationOrganizationCategoryDescriptor' AND CodeValue ='State Education Agency')),
(35554000, (SELECT TOP 1 DescriptorID FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://nmped.org/EducationOrganizationCategoryDescriptor' AND CodeValue ='Central Office')),
(35555000, (SELECT TOP 1 DescriptorID FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://nmped.org/EducationOrganizationCategoryDescriptor' AND CodeValue ='Central Office'))

-- HOME SCHOOL
INSERT INTO [edfi].[EducationOrganizationCategory]
           (EducationOrganizationId,
		    EducationOrganizationCategoryDescriptorId
		   )
SELECT EducationOrganizationId, (SELECT TOP 1 DescriptorId FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://nmped.org/EducationOrganizationCategoryDescriptor' AND CodeValue = 'Home School') AS EducationOrganizationCategoryDescriptorId
FROM edfi.EducationOrganization WITH (NOLOCK)
WHERE NameOfInstitution = 'HOME SCHOOL' AND EducationOrganizationId NOT IN (SELECT EducationOrganizationId FROM edfi.EducationOrganizationCategory)

-- MISC PRESCHOOL PROGRAM
INSERT INTO [edfi].[EducationOrganizationCategory]
           (EducationOrganizationId,
		    EducationOrganizationCategoryDescriptorId
		   )
SELECT EducationOrganizationId, (SELECT TOP 1 DescriptorId FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://nmped.org/EducationOrganizationCategoryDescriptor' AND CodeValue = 'Off-Site') AS EducationOrganizationCategoryDescriptorId
FROM edfi.EducationOrganization WITH (NOLOCK)
WHERE NameOfInstitution = 'MISC PRESCHOOL PROGRAM' AND EducationOrganizationId NOT IN (SELECT EducationOrganizationId FROM edfi.EducationOrganizationCategory)

-- MISC PRIVATE
INSERT INTO [edfi].[EducationOrganizationCategory]
           (EducationOrganizationId,
		    EducationOrganizationCategoryDescriptorId
		   )
SELECT EducationOrganizationId, (SELECT TOP 1 DescriptorId FROM edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://nmped.org/EducationOrganizationCategoryDescriptor' AND CodeValue = 'Private') AS EducationOrganizationCategoryDescriptorId
FROM edfi.EducationOrganization WITH (NOLOCK)
WHERE NameOfInstitution = 'MISC PRIVATE' AND EducationOrganizationId NOT IN (SELECT EducationOrganizationId FROM edfi.EducationOrganizationCategory)

-- Operational Status updates
-- start by setting all EdOrgs to Active
UPDATE edfi.EducationOrganization SET OperationalStatusDescriptorId = 
	(SELECT DescriptorId
	 FROM edfi.Descriptor WITH (NOLOCK)
	 WHERE [Namespace] = 'uri://ed-fi.org/OperationalStatusDescriptor'
	 AND CodeValue = 'Active');
	 
-- Update specific EdOrgs to New 
UPDATE edfi.EducationOrganization SET OperationalStatusDescriptorId = 
	(SELECT DescriptorId
	 FROM edfi.Descriptor WITH (NOLOCK)
	 WHERE [Namespace] = 'uri://ed-fi.org/OperationalStatusDescriptor'
	 AND CodeValue = 'New')
WHERE EducationOrganizationId IN (35582000,35582001,35583000,35583001,35584000,35585000)

-- Update specific EdOrgs to Changed 
UPDATE edfi.EducationOrganization SET OperationalStatusDescriptorId = 
	(SELECT DescriptorId
	 FROM edfi.Descriptor WITH (NOLOCK)
	 WHERE [Namespace] = 'uri://ed-fi.org/OperationalStatusDescriptor'
	 AND CodeValue = 'Changed')
WHERE EducationOrganizationId IN (35584001,35585001)

-- Update specific EdOrgs to Closed 
UPDATE edfi.EducationOrganization SET OperationalStatusDescriptorId = 
	(SELECT DescriptorId
	 FROM edfi.Descriptor WITH (NOLOCK)
	 WHERE [Namespace] = 'uri://ed-fi.org/OperationalStatusDescriptor'
	 AND CodeValue = 'Closed')
WHERE EducationOrganizationId IN (35080185,35502992,35502997,35502999,35506992,35506997,35506999,35507992,
					35507997,35507999,35508992,35508997,35508999,35513992,35513997,35513999,35514992,35514997,
					35514999,35522992,35522997,35522999,35523992,35523997,35523999,35526992,35526997,35526999,
					35527992,35527997,35527999,35533992,35533997,35533999,35534992,35534997,35534999,35537992,
					35537997,35537999,35538992,35538997,35538999,35540992,35540997,35540999,35541992,35541997,
					35541999,35543992,35543997,35543999,35545992,35545997,35545999,35548992,35548997,35548999,
					35551992,35551997,35551999,35553992,35553997,35553999,35556992,35556997,35556999,35558992,
					35558997,35558999,35559992,35559997,35559999,35572992,35572997,35572999)

--update district charter type

-- start by setting them all to not a charter
UPDATE edfi.LocalEducationAgency set CharterStatusDescriptorId = 
	(select descriptorId
	FROM edfi.Descriptor
	join edfi.CharterStatusDescriptor
		ON DescriptorId = CharterStatusDescriptorId
	where namespace = 'uri://nmped.org/CharterStatusDescriptor'
	and CodeValue = 'Not a charter');

--then change the charters to state charter
UPDATE edfi.LocalEducationAgency set CharterStatusDescriptorId = 
	(select descriptorId
	FROM edfi.Descriptor
	join edfi.CharterStatusDescriptor
		ON DescriptorId = CharterStatusDescriptorId
	where namespace = 'uri://nmped.org/CharterStatusDescriptor'
	and CodeValue = 'STATE CHARTER')
	where LocalEducationAgencyId IN (35501000,35503000,35504000,35505000,35509000,35510000,35511000,35512000,35515000,35516000,
				35517000,35518000,35519000,35520000,35521000,35524000,35525000,35528000,35529000,35530000,35531000,35532000,35535000,
				35536000,35539000,35542000,35544000,35546000,35547000,35549000,35550000,35552000,35557000,35560000,35562000,35563000,
				35564000,35565000,35566000,35567000,35568000,35570000,35573000,35574000,35575000,35576000,35577000,35578000,35579000,
				35580000,35581000,35582000,35583000,35584000,35585000, 35554000, 35555000);

-- set charter for schools

--start with whatever the district setting is
UPDATE  dest 
	set dest.CharterStatusDescriptorId = LEA.CharterStatusDescriptorId
FROM edfi.School dest
JOIN edfi.LocalEducationAgency LEA
	ON dest.LocalEducationAgencyId = dest.LocalEducationAgencyId;

-- then set the school charters
UPDATE edfi.school
	set CharterStatusDescriptorId = 
	(select descriptorId
	FROM edfi.Descriptor
	join edfi.CharterStatusDescriptor
		ON DescriptorId = CharterStatusDescriptorId
	where namespace = 'uri://nmped.org/CharterStatusDescriptor'
	and CodeValue = 'DISTRICT CHARTER')
	where schoolId in (35001006,35001016,35001017,35001024,35001025,35001028,35001782,35001752,35001753,35001768,35001769,
					35001780,35001781,35001706,35001707,35001708,35001709,35001749,35001750,35001098,35001116,35001118,
					35001051,35001061,35001063,35001069,35001090,35001095,35001030,35001039,35001047,35004009,
					35008003,35020001,35042006,35063004,35064001,35067109,35068004,35071024,35074003,35076005,35076006)
					
-- then set the school charters for State Charters
UPDATE edfi.school
	SET CharterStatusDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/CharterStatusDescriptor'
	AND CodeValue = 'STATE CHARTER')
	WHERE schoolId IN (35501001,35503022,35504001,35505001,35509001,35510001,35511001,35512001,35515001,35516001,
		35517001,35518001,35519001,35520001,35521001,35524001,35525001,35528001,35529001,35530001,35531001,35532001,
		35535001,35536001,35539001,35542001,35542002,35544001,35546001,35547001,35549001,35550001,35552001,35554001,
		35555001,35557001,35560001,35562001,35563001,35564001,35565001,35566001,35567001,35568001,35570001,35573001,
		35574001,35575001,35576001,35577001,35578001,35579001,35580001,35581001,35582001,35583001,35584001,35585001)
	
-- LocalEducationAgency changes for category
UPDATE edfi.LocalEducationAgency
	SET LocalEducationAgencyCategoryDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/LocalEducationAgencyCategoryDescriptor'
	AND CodeValue = 'State District')
	WHERE LocalEducationAgencyId IN (35001000, 35002000, 35003000, 35004000, 35005000, 35006000, 35007000, 35008000, 35009000, 35010000, 35011000, 
									 35012000, 35013000, 35014000, 35015000, 35016000, 35017000, 35018000, 35019000, 35020000, 35021000, 35022000,
									 35023000, 35024000, 35025000, 35026000, 35027000, 35028000, 35029000, 35030000, 35031000, 35032000, 35033000,
									 35034000, 35035000, 35036000, 35037000, 35038000, 35039000, 35040000, 35041000, 35042000, 35043000, 35044000,
									 35045000, 35046000, 35047000, 35048000, 35049000, 35050000, 35051000, 35052000, 35053000, 35054000, 35055000,
									 35056000, 35057000, 35058000, 35059000, 35060000, 35061000, 35062000, 35063000, 35064000, 35065000, 35066000,
									 35067000, 35068000, 35069000, 35070000, 35071000, 35072000, 35073000, 35074000, 35075000, 35076000, 35077000,
									 35078000, 35079000, 35080000, 35081000, 35082000, 35083000, 35084000, 35085000, 35086000, 35087000, 35088000,
									 35089000);
UPDATE edfi.LocalEducationAgency
	SET LocalEducationAgencyCategoryDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/LocalEducationAgencyCategoryDescriptor'
	AND CodeValue = 'State Supported')
	WHERE LocalEducationAgencyId IN (35091000, 35093000, 35094000, 35095000, 35097000, 35099000);

UPDATE edfi.LocalEducationAgency
	SET LocalEducationAgencyCategoryDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/LocalEducationAgencyCategoryDescriptor'
	AND CodeValue = 'State Charter')
	WHERE LocalEducationAgencyId IN (35501000, 35503000, 35504000, 35505000, 35509000, 35510000, 35511000, 35512000, 
									 35515000, 35516000, 35517000, 35518000, 35519000, 35520000, 35521000, 35524000,
									 35525000, 35528000, 35529000, 35530000, 35531000, 35532000, 35535000, 35536000,
									 35539000, 35542000, 35544000, 35546000, 35547000, 35549000, 35550000, 35552000,
									 35554000, 35555000, 35557000, 35560000, 35562000, 35563000, 35564000, 35565000,
									 35566000, 35567000, 35568000, 35570000, 35573000, 35574000, 35575000, 35576000,
									 35577000, 35578000, 35579000, 35580000, 35581000, 35582000, 35583000, 35584000,
									 35585000);
									 
-- Update School AdministrativeFundingControlDescriptor for Sizing elements
-- Start by setting all to zero ('Not Sized')
UPDATE edfi.school
	SET AdministrativeFundingControlDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/AdministrativeFundingControlDescriptor'
	AND CodeValue = '0')
	
-- Set Sizing to 1 for Elementary/Jr High Schools
UPDATE edfi.school
	SET AdministrativeFundingControlDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/AdministrativeFundingControlDescriptor'
	AND CodeValue = '1')
	WHERE schoolId IN (35001095,35001098,35001116,35001118,35001203,35001206,35001207,35001210,35001213,35001214,
35001215,35001216,35001217,35001219,35001221,35001222,35001225,35001227,35001228,35001229,
35001230,35001231,35001234,35001236,35001237,35001240,35001241,35001243,35001244,35001249,
35001250,35001252,35001255,35001258,35001260,35001261,35001262,35001264,35001265,35001267,
35001268,35001270,35001273,35001275,35001276,35001279,35001280,35001282,35001285,35001288,
35001291,35001295,35001297,35001300,35001303,35001305,35001307,35001309,35001310,35001312,
35001315,35001317,35001321,35001324,35001327,35001328,35001329,35001330,35001332,35001333,
35001336,35001339,35001345,35001348,35001350,35001351,35001356,35001357,35001360,35001363,
35001364,35001365,35001370,35001373,35001376,35001379,35001385,35001388,35001389,35001392,
35001393,35001395,35001405,35001407,35001410,35001413,35001415,35001416,35001418,35001420,
35001425,35001427,35001430,35001435,35001440,35001445,35001448,35001450,35001452,35001455,
35001457,35001460,35001465,35001470,35001475,35001480,35001485,35001490,35001492,35001496,
35001497,35001498,35001706,35001709,35001768,35001780,35001782,35002135,35003045,35003129,
35004009,35004024,35004025,35004036,35004041,35004042,35004044,35004050,35004052,35004095,
35004100,35004105,35004120,35004125,35004126,35004161,35004175,35005054,35005056,35006043,
35006048,35007073,35007077,35008033,35008036,35008047,35008048,35009080,35009135,35010056,
35010058,35011100,35011108,35012040,35012042,35012058,35012066,35012068,35012072,35012084,
35012091,35012095,35012098,35012122,35012145,35012155,35012156,35013161,35013163,35014093,
35014094,35015055,35015056,35016051,35016060,35017002,35017006,35017007,35017009,35017010,
35017014,35017015,35017034,35017035,35017036,35017044,35017045,35017048,35017051,35017053,
35017055,35017059,35017061,35017065,35017086,35017093,35017097,35017110,35017140,35017144,
35017145,35017150,35017166,35017170,35017172,35017177,35017184,35018001,35018050,35018053,
35018057,35019001,35019008,35019009,35019013,35019016,35019017,35019020,35019025,35019030,
35019032,35019035,35019040,35019052,35019076,35019086,35019104,35019120,35019140,35019175,
35020018,35020032,35020047,35020100,35020158,35020160,35020161,35020162,35020163,35021085,
35021088,35022001,35022032,35022054,35022056,35022128,35022139,35022183,35022187,35022189,
35023037,35023115,35023123,35023145,35023155,35023157,35024023,35024033,35024059,35024132,
35024143,35025015,35025020,35025144,35025150,35026168,35027135,35028100,35029034,35029060,
35029174,35030016,35030020,35031068,35031076,35031078,35031080,35031082,35031123,35031181,
35032048,35032049,35033008,35033028,35033030,35033032,35033046,35033057,35033059,35033066,
35033072,35033075,35033144,35033156,35033164,35033172,35033176,35033177,35034060,35034064,
35035090,35035162,35036130,35036145,35036160,35037035,35037157,35038038,35039059,35040033,
35040036,35041017,35041021,35041040,35041101,35041124,35041127,35042005,35042007,35042008,
35042024,35042025,35042028,35042036,35042096,35043003,35043030,35043034,35043038,35043054,
35043062,35043066,35043077,35043079,35043088,35043091,35043100,35043120,35043132,35043134,
35043152,35043155,35043160,35043162,35043164,35043170,35043174,35043190,35044001,35044059,
35044104,35045172,35046003,35046028,35046033,35046037,35046056,35046057,35046058,35046072,
35046114,35046144,35046150,35046181,35047160,35047163,35047164,35048038,35048042,35049053,
35049163,35050058,35050059,35051080,35051082,35052001,35052144,35053036,35053042,35053064,
35054044,35054050,35055005,35055015,35055019,35055039,35055042,35055048,35055053,35055059,
35055142,35055144,35055145,35055169,35056054,35056060,35056087,35057028,35057032,35057123,
35057155,35057160,35058047,35059001,35059053,35060044,35061016,35061020,35061024,35061026,
35061028,35061127,35061136,35061140,35061151,35062037,35062075,35063004,35063145,35063170,
35064001,35064017,35064099,35064123,35064136,35065015,35065017,35065019,35065037,35065038,
35065058,35065059,35065073,35065095,35065100,35065106,35065108,35065118,35065162,35066025,
35066030,35066033,35066095,35066125,35067026,35067034,35067038,35067060,35067075,35067109,
35067110,35067114,35067116,35067126,35067152,35067160,35068004,35068012,35068050,35068068,
35068112,35068125,35068157,35068172,35069003,35069031,35069037,35069054,35069150,35070150,
35070173,35071005,35071008,35071011,35071022,35071023,35071033,35071054,35071057,35071070,
35071099,35071100,35071110,35071130,35071135,35071141,35071143,35071145,35071146,35071160,
35071170,35071176,35071189,35072123,35072125,35072128,35072132,35073016,35073060,35073063,
35073162,35074001,35074003,35074079,35074144,35074155,35075100,35075133,35076004,35076005,
35076006,35076133,35076164,35076175,35077121,35077128,35078047,35078118,35078125,35079001,
35079003,35079130,35080001,35080169,35080172,35080185,35081001,35081003,35081100,35081102,
35081120,35082105,35082106,35083001,35083012,35083015,35083016,35083020,35083021,35083025,
35083050,35083100,35083105,35083110,35083319,35083340,35083372,35083375,35083481,35084037,
35084038,35084045,35085044,35086002,35086003,35086025,35086028,35086080,35086082,35086083,
35086084,35086122,35086150,35086160,35086180,35087003,35087025,35087034,35087038,35087045,
35087066,35087080,35088038,35088056,35088058,35088099,35088104,35088106,35088152,35088155,
35088915,35089166,35089195,35503022,35504001,35515001,35521001,35528001,35529001,35530001,
35535001,35539001,35546001,35555001,35560001,35563001,35566001,35570001,35573001,35574001,
35575001,35576001,35577001,35579001,35580001,35581001,35582001,35583001)
	
-- Set Sizing to 2 for High Schools
UPDATE edfi.school
	SET AdministrativeFundingControlDescriptorId = 
	(SELECT DescriptorId
	FROM edfi.Descriptor WITH (NOLOCK)
	WHERE [Namespace] = 'uri://nmped.org/AdministrativeFundingControlDescriptor'
	AND CodeValue = '2')
	WHERE schoolId IN (35001006,35001016,35001017,35001024,35001025,35001028,35001030,35001039,35001047,35001051,
35001061,35001063,35001069,35001090,35001514,35001515,35001516,35001517,35001520,35001525,
35001530,35001540,35001550,35001560,35001570,35001575,35001576,35001580,35001590,35001591,
35001593,35001707,35001708,35001749,35001750,35001752,35001753,35001769,35001781,35002136,
35003130,35004130,35004133,35004135,35005055,35006045,35007075,35008003,35008034,35009136,
35010150,35011105,35012036,35012056,35012081,35013162,35014095,35015057,35016052,35017016,
35017018,35017019,35017075,35017100,35017130,35018058,35019003,35019018,35019054,35019200,
35020001,35020034,35020035,35021086,35022014,35023034,35023152,35024036,35025146,35026169,
35027136,35028101,35029082,35030017,35031081,35031083,35032050,35033055,35033058,35034066,
35035163,35036139,35037036,35038039,35039060,35040034,35041079,35041080,35042006,35042010,
35042044,35042045,35043039,35043055,35043064,35043073,35043075,35043089,35043130,35043145,
35044105,35045173,35046015,35047165,35048039,35049164,35050060,35051081,35052145,35053165,
35054045,35055050,35056038,35057124,35058048,35059054,35060045,35061027,35062038,35063166,
35064018,35065006,35065053,35065180,35066026,35067035,35067039,35067130,35068173,35069136,
35070124,35071020,35071024,35071165,35071166,35071169,35071173,35072124,35073058,35074160,
35075095,35076165,35077123,35078119,35079129,35080050,35081101,35082107,35083006,35083011,
35084039,35085045,35086017,35086085,35087026,35088055,35088057,35088060,35089190,35089192,
35501001,35505001,35509001,35510001,35511001,35512001,35516001,35517001,35518001,35519001,
35520001,35524001,35525001,35531001,35532001,35536001,35544001,35547001,35549001,35550001,
35552001,35554001,35557001,35562001,35564001,35565001,35567001,35568001,35578001,35584001,35585001)
	
commit;

