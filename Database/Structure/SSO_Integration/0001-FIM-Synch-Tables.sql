-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE [dbo].[UserNameUniqueIdMapping](
	[UserName] [nvarchar](100) NOT NULL,
	[UniqueId] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_UserIdentity] 
 PRIMARY KEY CLUSTERED ([UserName] ASC)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX UI_UserNameUniqueIdMapping_UniqueId 
	ON dbo.UserNameUniqueIdMapping (UniqueId)
GO

CREATE TABLE dbo.StateEducationAgencyUserIdentity
	(
	UserName nvarchar(100) NOT NULL,
	FirstName nvarchar(75) NOT NULL,
	MiddleInitial nvarchar(1) NULL,
	LastSurname nvarchar(75) NOT NULL,
	EmailAddress nvarchar(128) NULL,
	EmailAddressType nvarchar(75) NULL,
	MobilePhoneNumber nvarchar(24) NULL,
	ActiveBeginDate datetime NULL,
	ActiveEndDate datetime NULL,
	LastModifiedDate datetime NOT NULL
	)
GO

ALTER TABLE dbo.StateEducationAgencyUserIdentity ADD CONSTRAINT
	DF_StateEducationAgencyUserIdentity_LastModifiedDate DEFAULT getdate() FOR LastModifiedDate
GO

CREATE TRIGGER [dbo].[TRG_StateEducationAgencyUserIdentity_LastModifiedDate] ON [dbo].[StateEducationAgencyUserIdentity]
FOR UPDATE 
AS
UPDATE [StateEducationAgencyUserIdentity] SET [StateEducationAgencyUserIdentity].LastModifiedDate = getdate()
FROM [StateEducationAgencyUserIdentity] INNER JOIN Inserted ON [StateEducationAgencyUserIdentity].[UserName] = Inserted.[UserName]
GO

ALTER TABLE dbo.StateEducationAgencyUserIdentity 
	ADD CONSTRAINT PK_StateEducationAgencyUserIdentity 
		PRIMARY KEY CLUSTERED (UserName)
GO

ALTER TABLE dbo.StateEducationAgencyUserIdentity
	ADD CONSTRAINT FK_StateEducationAgencyUserIdentity_UserNameUniqueIdMapping_UserName 
		FOREIGN KEY (UserName) 
		REFERENCES dbo.UserNameUniqueIdMapping (UserName)
GO

CREATE NONCLUSTERED INDEX IX_StateEducationAgencyUserIdentity_ActiveBeginDate 
	ON dbo.StateEducationAgencyUserIdentity (ActiveBeginDate)
GO

CREATE NONCLUSTERED INDEX IX_StateEducationAgencyUserIdentity_ActiveEndDate 
	ON dbo.StateEducationAgencyUserIdentity (ActiveEndDate)
GO

CREATE NONCLUSTERED INDEX IX_StateEducationAgencyUserIdentity_LastModifiedDate 
	ON dbo.StateEducationAgencyUserIdentity (LastModifiedDate)
GO

CREATE TABLE dbo.LocalEducationAgencyUserIdentityUsage
	(
	UserName nvarchar(100) NOT NULL,
	LocalEducationAgencyId int NOT NULL,
	ActiveBeginDate datetime NULL,
	ActiveEndDate datetime NULL,
	LastModifiedDate datetime NOT NULL
	)
GO


ALTER TABLE dbo.LocalEducationAgencyUserIdentityUsage ADD CONSTRAINT
	DF_LocalEducationAgencyUserIdentityUsage_LastModifiedDate DEFAULT getdate() FOR LastModifiedDate
GO

CREATE TRIGGER [dbo].[TRG_LocalEducationAgencyUserIdentityUsage_LastModifiedDate] ON [dbo].[LocalEducationAgencyUserIdentityUsage]
FOR UPDATE 
AS
UPDATE [LocalEducationAgencyUserIdentityUsage] SET [LocalEducationAgencyUserIdentityUsage].LastModifiedDate = getdate()
FROM [LocalEducationAgencyUserIdentityUsage] INNER JOIN Inserted ON [LocalEducationAgencyUserIdentityUsage].[UserName] = Inserted.[UserName]

GO

ALTER TABLE dbo.LocalEducationAgencyUserIdentityUsage 
	ADD CONSTRAINT PK_LocalEducationAgencyUserIdentityUsage 
		PRIMARY KEY CLUSTERED (UserName, LocalEducationAgencyId)
GO

CREATE NONCLUSTERED INDEX IX_LocalEducationAgencyUserIdentityUsage_ActiveBeginDate 
	ON dbo.LocalEducationAgencyUserIdentityUsage (ActiveBeginDate)
GO

CREATE NONCLUSTERED INDEX IX_LocalEducationAgencyUserIdentityUsage_ActiveEndDate 
	ON dbo.LocalEducationAgencyUserIdentityUsage (ActiveEndDate)
GO

CREATE NONCLUSTERED INDEX IX_LocalEducationAgencyUserIdentityUsage_LastModifiedDate 
	ON dbo.LocalEducationAgencyUserIdentityUsage (LastModifiedDate)
GO

ALTER TABLE dbo.LocalEducationAgencyUserIdentityUsage 
	ADD CONSTRAINT FK_LocalEducationAgencyUserIdentityUsage_StateEducationAgencyUserIdentity 
	FOREIGN KEY (UserName) 
	REFERENCES dbo.StateEducationAgencyUserIdentity (UserName)
GO

