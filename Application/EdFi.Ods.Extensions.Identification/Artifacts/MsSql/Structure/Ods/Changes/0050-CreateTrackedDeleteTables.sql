CREATE TABLE [tracked_deletes_identification].[StudentIdentifier]
(
       Identifier [NVARCHAR](50) NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentIdentifier PRIMARY KEY CLUSTERED (ChangeVersion)
)

