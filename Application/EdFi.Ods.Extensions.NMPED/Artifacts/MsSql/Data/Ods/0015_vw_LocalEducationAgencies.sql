SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: 'Johnathon Garcia' | 'Data Warehouse Support Engineer'
* Email: 'johnathon.garcia@ped.nm.gov'
* Date: '2023-01-24'
* Desc: Based on 'Procedure for Getting District List using Security'
*
* Alt Id: 001 (Increment value each change)
* By: Cody Misplay | System Integrations Engineer
* Email: cody.misplay@ped.nm.gov
* Date: 05/17/2023
* Alt Desc: Created a new procedure in the nmped_rpt schema which joins
*           two views (EducationOrganizations and LocalEducationAgencies)
*           to return LEACategoryCodes using security access (State District, State Charter, or Both)
*/
CREATE OR ALTER   PROCEDURE [nmped_rpt].[sp_GetLEACategory]
	 --parameters for the stored procedure
	@Security varchar(MAX),
	@DB nvarchar(100),
	@LocalCharterOption BIT = 0

AS
BEGIN

  /* Check to see if table exist, if so delete it */
  IF OBJECT_ID('tempdb..#tmpDistrict') IS NOT NULL DROP TABLE #tmpDistrict;

  /* declare the delimeter */
  DECLARE @Delimeter char(1)
  SET @Delimeter = ','

  /* declare the ALL Variable */
  DECLARE @ALLCode varchar(6)
  SET @ALLCode = '000000'
  DECLARE @UserID varchar(50)
  SET @UserID = @Security
  

  /* Parse out just AD account name */
  SET @UserID = SUBSTRING(@UserID,CHARINDEX('\',@UserID)+1,LEN(@UserID) - CHARINDEX('/',@UserID)-1)
  
  /* Get Security from spUsers */
  SELECT @Security = StarsREP.[Security] FROM [10.15.22.115].[spUsers].[dbo].tbl_UserInfo AS UserInfo WITH (NOLOCK) INNER JOIN [10.15.22.115].[spUsers].[dbo].tbl_UserInfoStarsREP AS StarsREP WITH (NOLOCK) ON UserInfo.id = StarsREP.id  WHERE (UserInfo.ADLoginID =  @UserID or AlternateID = @UserID)

  /* Create Temp Tables*/
  CREATE TABLE #tmpDistrict
  (
    DistrictCode varchar(20) COLLATE SQL_Latin1_General_CP850_BIN
  )

  /* Declare all variable used in process */
  DECLARE @DistrictCode varchar(8)
  DECLARE @StartPOS int
  DECLARE @Length int
  DECLARE @Exists int

  /* Get Districts */
  WHILE LEN(@Security) > 0
   BEGIN
     SET @StartPOS = CHARINDEX(@Delimeter, @Security)
     IF @StartPOS < 0 SET @StartPOS = 0

     SET @Length = LEN(@Security) - @StartPOS -1
     IF @Length < 0 SET @Length = 0

     IF @StartPOS > 0 
      BEGIN
        SET @DistrictCode = '35' + SUBSTRING(@Security,1,@StartPOS -1) + '000'
        SET @Security = SUBSTRING(@Security, @StartPOS + 1, LEN(@Security) - @StartPOS)
      END  
     ELSE
      BEGIN
        SET @DistrictCode = @Security
        SET @Security = ''
      END
  
     /* Check to see if already exist */
     SELECT @Exists = COUNT(*) FROM #tmpDistrict WITH (NOLOCK) WHERE DistrictCode = LEFT(@DistrictCode,3)
	 
     IF @Exists = 0
      BEGIN
        INSERT #tmpDistrict (DistrictCode) VALUES (@DistrictCode)
      END
  END
  
   /* Debug stuff*/
  --SELECT * FROM #tmpDistrict
  --order by DistrictCode
  
  Update #tmpDistrict set DistrictCode = (CASE WHEN DistrictCode = '000000' THEN DistrictCode 
												WHEN LEN(DistrictCode) = 6 THEN '35' + DistrictCode 
												ELSE DistrictCode END)

  Update #tmpDistrict set DistrictCode = (CASE WHEN DistrictCode = '000000' THEN DistrictCode 
												WHEN SUBSTRING(DistrictCode,6,3) > 0 THEN SUBSTRING(DistrictCode,1,5) + '000' 
												ELSE DistrictCode END)

 

--DECLARE @DBNAMEVAR nvarchar(100); SET @DBNAMEVAR = 'MYBASE_01';
DECLARE @sql nvarchar(max);



  /* Give user results */ -- 001 -- Updated Dynamic SQL to use joined views and specify returned fields
  IF (SELECT 'Y' FROM #tmpDistrict WITH (NOLOCK) WHERE DistrictCode = @AllCode) = 'Y'
   SET @sql = 'BEGIN
     /* Security includes ALL */
    WITH cte_Categories AS (
	SELECT DISTINCT LEA.LEACategoryCode, LEA.LocalCharterIndicator
	FROM [@DB].[nmped_rpt].[vw_LocalEducationAgencies] LEA)'
  ELSE
   SET @sql = 'BEGIN
     /* Security does not include ALL */
    WITH cte_Categories AS (
	SELECT DISTINCT LEA.LEACategoryCode, LEA.LocalCharterIndicator
	FROM [@DB].[nmped_rpt].[vw_LocalEducationAgencies] LEA
	WHERE LEA.LocalEducationAgencyId IN (SELECT DistrictCode FROM #tmpDistrict))'
 
  IF (@LocalCharterOption = 1)
	SET @sql = @sql + 
		'SELECT LEACategoryCode + CASE WHEN LocalCharterIndicator = ''Y'' THEN '' - Local Charters Only'' ELSE '''' END AS [LEACategoryCode]
		FROM cte_Categories
		END'
  ELSE
	SET @sql = @sql + 
		'SELECT DISTINCT LEACategoryCode FROM cte_Categories
		END'

	SET @sql = REPLACE(@sql,'@DB',@DB);

	EXEC(@sql)

  /* Drop Tmp tables */
  DROP TABLE #tmpDistrict


END
GO

