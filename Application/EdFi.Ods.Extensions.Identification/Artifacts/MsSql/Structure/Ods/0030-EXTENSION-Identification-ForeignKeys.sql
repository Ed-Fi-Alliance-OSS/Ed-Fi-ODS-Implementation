ALTER TABLE [identification].[StudentIdentifier] WITH CHECK ADD CONSTRAINT [FK_StudentIdentifier_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentIdentifier_Student]
ON [identification].[StudentIdentifier] ([StudentUSI] ASC)
GO

