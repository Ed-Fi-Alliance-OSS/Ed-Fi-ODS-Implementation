DECLARE @ApplicationId INT
 
SELECT @ApplicationId = ApplicationId
FROM [dbo].[Applications]
WHERE ApplicationName = 'Ed-Fi ODS API'
  
DECLARE @ParentResourceClaimId INT
SELECT @ParentResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE ResourceName = 'relationshipBasedData'
 
INSERT INTO [dbo].[ResourceClaims] ( [DisplayName]
                                     ,[ResourceName]
                                     ,[ClaimName]     
                                     ,[ParentResourceClaimId]
                                     ,[Application_ApplicationId]
                                     )
VALUES ('studentTransportation'
        ,'studentTransportation'
        ,'http://ed-fi.org/ods/identity/claims/sample-student-transportation/studentTransportation'
        ,@ParentResourceClaimId
        ,@ApplicationId
        )