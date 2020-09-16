-- Table [identification].[StudentIdentifier] --
CREATE TABLE [identification].[StudentIdentifier] (
    [Identifier] [NVARCHAR](50) NOT NULL,
    [Namespace] [NVARCHAR](255) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentIdentifier_PK] PRIMARY KEY CLUSTERED (
        [Identifier] ASC,
        [Namespace] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [identification].[StudentIdentifier] ADD CONSTRAINT [StudentIdentifier_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [identification].[StudentIdentifier] ADD CONSTRAINT [StudentIdentifier_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [identification].[StudentIdentifier] ADD CONSTRAINT [StudentIdentifier_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

