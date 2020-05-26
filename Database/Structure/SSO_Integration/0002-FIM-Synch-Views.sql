-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE VIEW [dbo].[V_Updated_StateEducationAgencyUserIdentity]
AS
SELECT UserName, FirstName, MiddleInitial, LastSurname, EmailAddress, EmailAddressType, MobilePhoneNumber, ActiveBeginDate, ActiveEndDate, LastModifiedDate, 
           CASE WHEN ActiveBeginDate IS NOT NULL AND ActiveBeginDate < getdate() AND ActiveEndDate IS NULL OR ActiveEndDate > getdate() THEN 1 ELSE 0 END AS IsActive
FROM dbo.StateEducationAgencyUserIdentity

GO

CREATE VIEW [dbo].[V_Updated_StateEducationAgencyUserIdentity_Last24Hours]
AS
WITH Date(OneDayAgo, Now)
AS
(
  SELECT DATEADD(hour,-24,GETDATE()) as OneDayAgo, getdate() as Now
)
SELECT UserName, FirstName, MiddleInitial, LastSurname, EmailAddress, EmailAddressType, MobilePhoneNumber, ActiveBeginDate, ActiveEndDate, LastModifiedDate,IsActive
FROM [dbo].[V_Updated_StateEducationAgencyUserIdentity]
CROSS JOIN Date 
WHERE LastModifiedDate >= Date.OneDayAgo /*modified in the last 24 hours*/ OR 
	  (ActiveBeginDate BETWEEN Date.OneDayAgo AND Date.Now AND (ActiveEndDate IS NULL OR ActiveEndDate > Date.Now) ) /*has recently become active*/ OR
	  ActiveEndDate BETWEEN Date.OneDayAgo AND Date.Now/*has recently become inactive*/
	  
GO

CREATE VIEW [dbo].[V_Updated_LocalEducationAgencyUserIdentity]
AS
SELECT DISTINCT sea.UserName, FirstName, LastSurname, EmailAddress, MobilePhoneNumber,
	SUBSTRING (
		(
			SELECT ',' + CONVERT(NVARCHAR, LocalEducationAgencyId) 
				+ '=' + (CASE 
					WHEN ActiveBeginDate < getdate() AND (ActiveEndDate IS NULL OR ActiveEndDate > getdate()) 
						THEN '1' 
						ELSE '0' 
					END) 
				AS [text()]
			FROM	LocalEducationAgencyUserIdentityUsage lea2
			WHERE	lea2.UserName = lea.UserName
			ORDER BY lea2.UserName, lea2.LocalEducationAgencyId
			FOR XML PATH('')
		), 2, 1000) LocalEducationAgencies, 
		lea.ActiveBeginDate, lea.ActiveEndDate,	lea.LastModifiedDate 
FROM dbo.stateEducationAgencyUserIdentity sea 
LEFT JOIN dbo.LocalEducationAgencyUserIdentityUsage lea ON lea.UserName = sea.UserName

GO

CREATE VIEW [dbo].[V_Updated_LocalEducationAgencyUserIdentity_Last24Hours]
AS
WITH Date(OneDayAgo, Now)
AS
(
  SELECT DATEADD(hour,-24,GETDATE()) as OneDayAgo, getdate() as Now
)
SELECT sea.UserName, FirstName, LastSurname, EmailAddress, MobilePhoneNumber,LocalEducationAgencies
FROM [dbo].[V_Updated_LocalEducationAgencyUserIdentity] sea 
CROSS JOIN Date
WHERE LastModifiedDate >= Date.OneDayAgo /*modified in the last 24 hours*/ OR 
	  (ActiveBeginDate BETWEEN Date.OneDayAgo AND Date.Now AND (ActiveEndDate IS NULL OR ActiveEndDate > Date.Now) ) /*has recently become active*/ OR
	  ActiveEndDate BETWEEN Date.OneDayAgo AND Date.Now/*has recently become inactive*/
GO


