-- ===========================================================
/* Author:		Cody Misplay
-- Create date: 06/20/2023
-- Description:	Seed script to populate edfi.Program table for each LEA. All 49 Program values are assigned to variables
--	This script contains the following sections
--    001: Dynamic SQL Declaration and Initialization
--    002: edfi.Program table load with join to edfi.School for DISTRICT CHARTERs
--
-- Updated 11/2/2023 by Cody Misplay to also load Program data for District Charters.
--
--	*NOTE - If any strings need an apostrophe make sure to use double apostrophe in the variable assignment AND 
--		make sure to use REPLACE(@VariableName,'''','''''') in the dynamic SQL statement for that variable.
*/
-- ===========================================================


-- ===========================================================
-- 001: Dynamic SQL: Declaration and Initialization - Copy this section if you need to run any subsection by itself
-- ===========================================================
DECLARE 
	-- Descriptor Namespace variables (CodeType and Repetitive Descriptions)
	 @CodeType1	NVARCHAR(255) = 'uri://nmped.org/ProgramTypeDescriptor'

	
	-- Dynamic SQL Variables
	,@DynSQL		NVARCHAR(MAX) = ''
	,@DynSQL_Sel	NVARCHAR(MAX) = '' -- For CodeList table
	,@Cnt			INT = 1
	
	-- Placeholder Variables for our Dynamic SQL
	,@EdOrgId		INT
	,@StringVal_1A	NVARCHAR(100)	=	'BEP - Participation Code 1'
	,@CodeValue_1	NVARCHAR(50)	=	'BEP'
	,@StringVal_1B	NVARCHAR(50)	=	'BEP-1'
	,@StringVal_2A	NVARCHAR(100)	=	'BEP - Participation Code 2'
	,@CodeValue_2	NVARCHAR(50)	=	'BEP'
	,@StringVal_2B	NVARCHAR(100)	=	'BEP-2'
	,@StringVal_3A	NVARCHAR(100)	=	'BEP - Participation Code 3'
	,@CodeValue_3	NVARCHAR(50)	=	'BEP'
	,@StringVal_3B	NVARCHAR(100)	=	'BEP-3'
	,@StringVal_4A	NVARCHAR(100)	=	'BEP - Participation Code 4'
	,@CodeValue_4	NVARCHAR(50)	=	'BEP'
	,@StringVal_4B	NVARCHAR(100)	=	'BEP-4'
	,@StringVal_5A	NVARCHAR(100)	=	'BEP - Participation Code 5'
	,@CodeValue_5	NVARCHAR(50)	=	'BEP'
	,@StringVal_5B	NVARCHAR(100)	=	'BEP-5'
	,@StringVal_6A	NVARCHAR(100)	=	'Bus Services'
	,@CodeValue_6	NVARCHAR(50)	=	'BUS'
	,@StringVal_6B	NVARCHAR(100)	=	'BUS'
	,@StringVal_7A	NVARCHAR(100)	=	'Bus Services for Students with Disabilities K-12'
	,@CodeValue_7	NVARCHAR(50)	=	'BUSA'
	,@StringVal_7B	NVARCHAR(100)	=	'BUSA'
	,@StringVal_8A	NVARCHAR(100)	=	'Bus Services'' Vocational Ed/Concurrent Enrollment'
	,@CodeValue_8	NVARCHAR(50)	=	'BSCE'
	,@StringVal_8B	NVARCHAR(100)	=	'BSCE'
	,@StringVal_9A	NVARCHAR(100)	=	'Career and Technical Education'
	,@CodeValue_9	NVARCHAR(50)	=	'Career and Technical Education'
	,@StringVal_9B	NVARCHAR(100)	=	'CTE'
	,@StringVal10A	NVARCHAR(100)	=	'CEIS - Participation Code 13'
	,@CodeValue10	NVARCHAR(50)	=	'CEIS'
	,@StringVal10B	NVARCHAR(100)	=	'CEIS-13'
	,@StringVal11A	NVARCHAR(100)	=	'CEIS - Participation Code 14'
	,@CodeValue11	NVARCHAR(50)	=	'CEIS'
	,@StringVal11B	NVARCHAR(100)	=	'CEIS-14'
	,@StringVal12A	NVARCHAR(100)	=	'Charter school student participating in a district activity'
	,@CodeValue12	NVARCHAR(50)	=	'CSDA'
	,@StringVal12B	NVARCHAR(100)	=	'CSDA'
	,@StringVal13A	NVARCHAR(100)	=	'Child participating in the Early Childhood 3Y Program'
	,@CodeValue13	NVARCHAR(50)	=	'3Y'
	,@StringVal13B	NVARCHAR(100)	=	'3Y'
	,@StringVal14A	NVARCHAR(100)	=	'Child participating in the Early Childhood 4Y Program'
	,@CodeValue14	NVARCHAR(50)	=	'4Y'
	,@StringVal14B	NVARCHAR(100)	=	'4Y'
	,@StringVal15A	NVARCHAR(100)	=	'Community School Program'
	,@CodeValue15	NVARCHAR(50)	=	'CSP'
	,@StringVal15B	NVARCHAR(100)	=	'CSP'
	,@StringVal16A	NVARCHAR(100)	=	'Early College High School (used by CCRB bureau)'
	,@CodeValue16	NVARCHAR(50)	=	'ECHS'
	,@StringVal16B	NVARCHAR(100)	=	'ECHS'
	,@StringVal17A	NVARCHAR(100)	=	'English Learner - Participation Code 6'
	,@CodeValue17	NVARCHAR(50)	=	'ELL'
	,@StringVal17B	NVARCHAR(100)	=	'ELL-6'
	,@StringVal18A	NVARCHAR(100)	=	'English Learner - Participation Code 7'
	,@CodeValue18	NVARCHAR(50)	=	'ELL'
	,@StringVal18B	NVARCHAR(100)	=	'ELL-7'
	,@StringVal19A	NVARCHAR(100)	=	'English Learner - Participation Code 8'
	,@CodeValue19	NVARCHAR(50)	=	'ELL'
	,@StringVal19B	NVARCHAR(100)	=	'ELL-8'
	,@StringVal20A	NVARCHAR(100)	=	'English Learner - Participation Code 9'
	,@CodeValue20	NVARCHAR(50)	=	'ELL'
	,@StringVal20B	NVARCHAR(100)	=	'ELL-9'
	,@StringVal21A	NVARCHAR(100)	=	'English Proficiency'
	,@CodeValue21	NVARCHAR(50)	=	'English Proficiency'
	,@StringVal21B	NVARCHAR(100)	=	'English Proficiency'
	,@StringVal22A	NVARCHAR(100)	=	'Expanded and Enriched Learning Time and Opportunities'
	,@CodeValue22	NVARCHAR(50)	=	'EELTO'
	,@StringVal22B	NVARCHAR(100)	=	'EELTO'
	,@StringVal23A	NVARCHAR(100)	=	'Extended Learning Time Program'
	,@CodeValue23	NVARCHAR(50)	=	'ELTP'
	,@StringVal23B	NVARCHAR(100)	=	'ELTP'
	,@StringVal24A	NVARCHAR(100)	=	'Family and Children Education (for 3 and 4 year olds only)'
	,@CodeValue24	NVARCHAR(50)	=	'FACE'
	,@StringVal24B	NVARCHAR(100)	=	'FACE'
	,@StringVal25A	NVARCHAR(100)	=	'Head Start Prek'
	,@CodeValue25	NVARCHAR(50)	=	'HEADST'
	,@StringVal25B	NVARCHAR(100)	=	'HEADST'
	,@StringVal26A	NVARCHAR(100)	=	'Home school student participating in a district activity'
	,@CodeValue26	NVARCHAR(50)	=	'HSDA'
	,@StringVal26B	NVARCHAR(100)	=	'HSDA'
	,@StringVal27A	NVARCHAR(100)	=	'Homeless'
	,@CodeValue27	NVARCHAR(50)	=	'Homeless'
	,@StringVal27B	NVARCHAR(100)	=	'Homeless'
	,@StringVal28A	NVARCHAR(100)	=	'Immigrant'
	,@CodeValue28	NVARCHAR(50)	=	'Immigrant'
	,@StringVal28B	NVARCHAR(100)	=	'Immigrant'
	,@StringVal29A	NVARCHAR(100)	=	'NM PreK program - Participation Code 450HR'
	,@CodeValue29	NVARCHAR(50)	=	'NMPREK'
	,@StringVal29B	NVARCHAR(100)	=	'NMPREK-450HR'
	,@StringVal30A	NVARCHAR(100)	=	'NM PreK program - Participation Code 900HR'
	,@CodeValue30	NVARCHAR(50)	=	'NMPREK'
	,@StringVal30B	NVARCHAR(100)	=	'NMPREK-900HR'
	,@StringVal31A	NVARCHAR(100)	=	'Special Education'
	,@CodeValue31	NVARCHAR(50)	=	'Special Education'
	,@StringVal31B	NVARCHAR(100)	=	'Special Education'
	,@StringVal32A	NVARCHAR(100)	=	'Student School Food Service'
	,@CodeValue32	NVARCHAR(50)	=	'Student School Food Service'
	,@StringVal32B	NVARCHAR(100)	=	'Food Service'
	,@StringVal33A	NVARCHAR(100)	=	'Title I Part A'
	,@CodeValue33	NVARCHAR(50)	=	'T1A'
	,@StringVal33B	NVARCHAR(100)	=	'T1A'
	,@StringVal34A	NVARCHAR(100)	=	'Title I Part A funded preschool school students'
	,@CodeValue34	NVARCHAR(50)	=	'T1APK'
	,@StringVal34B	NVARCHAR(100)	=	'T1APK'
	,@StringVal35A	NVARCHAR(100)	=	'Title I Part A Private students receiving Title 1 services'
	,@CodeValue35	NVARCHAR(50)	=	'T1APR'
	,@StringVal35B	NVARCHAR(100)	=	'T1APR'
	,@StringVal36A	NVARCHAR(100)	=	'Title I Part A Students in Neglected and Delinquent programs'
	,@CodeValue36	NVARCHAR(50)	=	'T1AND'
	,@StringVal36B	NVARCHAR(100)	=	'T1AND'
	,@StringVal37A	NVARCHAR(100)	=	'Title III - Participation Code 6'
	,@CodeValue37	NVARCHAR(50)	=	'T3'
	,@StringVal37B	NVARCHAR(100)	=	'T3-6'
	,@StringVal38A	NVARCHAR(100)	=	'Title III - Participation Code 7'
	,@CodeValue38	NVARCHAR(50)	=	'T3'
	,@StringVal38B	NVARCHAR(100)	=	'T3-7'
	,@StringVal39A	NVARCHAR(100)	=	'Title III - Participation Code 8'
	,@CodeValue39	NVARCHAR(50)	=	'T3'
	,@StringVal39B	NVARCHAR(100)	=	'T3-8'
	,@StringVal40A	NVARCHAR(100)	=	'Title III - Participation Code 9'
	,@CodeValue40	NVARCHAR(50)	=	'T3'
	,@StringVal40B	NVARCHAR(100)	=	'T3-9'
	,@StringVal41A	NVARCHAR(100)	=	'Title VII'
	,@CodeValue41	NVARCHAR(50)	=	'T7'
	,@StringVal41B	NVARCHAR(100)	=	'T7'
	,@StringVal42A	NVARCHAR(100)	=	'Title VIII'
	,@CodeValue42	NVARCHAR(50)	=	'T8'
	,@StringVal42B	NVARCHAR(100)	=	'T8'
	,@StringVal43A	NVARCHAR(100)	=	'MEP - 15 - Basic School Program'
	,@CodeValue43	NVARCHAR(50)	=	'MEP'
	,@StringVal43B	NVARCHAR(100)	=	'MEP15'
	,@StringVal44A	NVARCHAR(100)	=	'MEP - 16 - Regular Term MEP-Funded Project'
	,@CodeValue44	NVARCHAR(50)	=	'MEP'
	,@StringVal44B	NVARCHAR(100)	=	'MEP16'
	,@StringVal45A	NVARCHAR(100)	=	'MEP - 17 - Summer/Intersession MEP-Funded Project'
	,@CodeValue45	NVARCHAR(50)	=	'MEP'
	,@StringVal45B	NVARCHAR(100)	=	'MEP17'
	,@StringVal46A	NVARCHAR(100)	=	'MEP - 18 - Year Round MEP-Funded Project'
	,@CodeValue46	NVARCHAR(50)	=	'MEP'
	,@StringVal46B	NVARCHAR(100)	=	'MEP18'
	,@StringVal47A	NVARCHAR(100)	=	'MEP - 19 - Basic Program and Regular-Term MEP-Funded Project'
	,@CodeValue47	NVARCHAR(50)	=	'MEP'
	,@StringVal47B	NVARCHAR(100)	=	'MEP19'
	,@StringVal48A	NVARCHAR(100)	=	'MEP - 20 - Residency Only (none of the above)'
	,@CodeValue48	NVARCHAR(50)	=	'MEP'
	,@StringVal48B	NVARCHAR(100)	=	'MEP20'
	,@StringVal49A	NVARCHAR(100)	=	'MEP - 21 - Non-Migrant Enrollment'
	,@CodeValue49	NVARCHAR(50)	=	'MEP'
	,@StringVal49B	NVARCHAR(100)	=	'MEP21'

-- EdOrgId, ProgramName, ProgramTypeDescriptorId, ProgramId, CreateDate, LastModifiedDate

SET @DynSql_Sel = 
	'SELECT TOP 1 [DescriptorId] 
	 FROM [edfi].[Descriptor] WITH (NOLOCK) 
	 WHERE 1 = 1 ';

-- 001: End of Declaration and Initialization section

-- 002: edfi.Program table load Begin

DROP TABLE IF EXISTS #Temp_EdOrgDistrict_Val;

CREATE TABLE #Temp_EdOrgDistrict_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[DistrictId]			INT					NOT NULL	-- EdOrgId/DistrictId

);
-- Populate temp table with all LEAs from edfi.LocalEducationAgency
INSERT INTO #Temp_EdOrgDistrict_Val(
	 [DistrictId]
) 
SELECT [LocalEducationAgencyId] FROM edfi.LocalEducationAgency WITH (NOLOCK)
UNION
-- UNION here to add District Charters - CJM 11/2/2023
SELECT SchoolId 
FROM edfi.School 
WHERE CharterStatusDescriptorId = (SELECT DescriptorId FROM edfi.Descriptor 
									WHERE [Namespace] = 'uri://nmped.org/CharterStatusDescriptor'
									AND CodeValue = 'DISTRICT CHARTER')

-- Loop through each LEA and create their 42 inserts
WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrgDistrict_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [DistrictId]

	FROM #Temp_EdOrgDistrict_Val
	WHERE [AutoKey] = @Cnt;
	
	SET @DynSQL = 
		'INSERT INTO [edfi].[Program]( 
			  [EducationOrganizationId]
			 ,[ProgramName]
			 ,[ProgramTypeDescriptorId]
			 ,[ProgramId]
			 ,[CreateDate]
			 ,[LastModifiedDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_1A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_1 + ''')			
			, ''' + @StringVal_1B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_2A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_2 + ''')			
			, ''' + @StringVal_2B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_3A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_3 + ''')			
			, ''' + @StringVal_3B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_4A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_4 + ''')			
			, ''' + @StringVal_4B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_5A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_5 + ''')			
			, ''' + @StringVal_5B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_6A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_6 + ''')			
			, ''' + @StringVal_6B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_7A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_7 + ''')			
			, ''' + @StringVal_7B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + REPLACE(@StringVal_8A,'''','''''')  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_8 + ''')			
			, ''' + @StringVal_8B  + ''' 
			, GETDATE(), GETDATE()	
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal_9A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue_9 + ''')			
			, ''' + @StringVal_9B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal10A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue10 + ''')			
			, ''' + @StringVal10B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal11A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue11 + ''')			
			, ''' + @StringVal11B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal12A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue12 + ''')			
			, ''' + @StringVal12B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal13A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue13 + ''')			
			, ''' + @StringVal13B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal14A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue14 + ''')			
			, ''' + @StringVal14B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal15A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue15 + ''')			
			, ''' + @StringVal15B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal16A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue16 + ''')			
			, ''' + @StringVal16B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal17A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue17 + ''')			
			, ''' + @StringVal17B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal18A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue18 + ''')			
			, ''' + @StringVal18B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal19A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue19 + ''')			
			, ''' + @StringVal19B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal20A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue20 + ''')			
			, ''' + @StringVal20B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal21A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue21 + ''')			
			, ''' + @StringVal21B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal22A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue22 + ''')			
			, ''' + @StringVal22B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal23A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue23 + ''')			
			, ''' + @StringVal23B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal24A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue24 + ''')			
			, ''' + @StringVal24B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal25A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue25 + ''')			
			, ''' + @StringVal25B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal26A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue26 + ''')			
			, ''' + @StringVal26B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal27A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue27 + ''')			
			, ''' + @StringVal27B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal28A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue28 + ''')			
			, ''' + @StringVal28B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal29A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue29 + ''')			
			, ''' + @StringVal29B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal30A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue30 + ''')			
			, ''' + @StringVal30B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal31A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue31 + ''')			
			, ''' + @StringVal31B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal32A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue32 + ''')			
			, ''' + @StringVal32B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal33A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue33 + ''')			
			, ''' + @StringVal33B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal34A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue34 + ''')			
			, ''' + @StringVal34B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal35A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue35 + ''')			
			, ''' + @StringVal35B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal36A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue36 + ''')			
			, ''' + @StringVal36B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal37A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue37 + ''')			
			, ''' + @StringVal37B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal38A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue38 + ''')			
			, ''' + @StringVal38B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal39A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue39 + ''')			
			, ''' + @StringVal39B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal40A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue40 + ''')			
			, ''' + @StringVal40B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal41A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue41 + ''')			
			, ''' + @StringVal41B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal42A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue42 + ''')			
			, ''' + @StringVal42B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal43A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue43 + ''')			
			, ''' + @StringVal43B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal44A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue44 + ''')			
			, ''' + @StringVal44B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal45A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue45 + ''')			
			, ''' + @StringVal45B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal46A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue46 + ''')			
			, ''' + @StringVal46B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal47A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue47 + ''')			
			, ''' + @StringVal47B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal48A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue48 + ''')			
			, ''' + @StringVal48B  + ''' 
			, GETDATE(), GETDATE()
		),
			(' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal49A  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType1 + ''' AND [CodeValue] = ''' + @CodeValue49 + ''')			
			, ''' + @StringVal49B  + ''' 
			, GETDATE(), GETDATE()
		);'
		
		
	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_EdOrgDistrict_Val;

-- 002: edfi.Program table load End