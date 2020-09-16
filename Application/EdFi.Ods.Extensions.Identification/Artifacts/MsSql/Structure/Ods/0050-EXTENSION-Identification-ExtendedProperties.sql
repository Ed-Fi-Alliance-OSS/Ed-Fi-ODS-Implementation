-- Extended Properties [identification].[StudentIdentifier] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'identification', @level1type=N'TABLE', @level1name=N'StudentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique identifier for the student within the specified namespace.', @level0type=N'SCHEMA', @level0name=N'identification', @level1type=N'TABLE', @level1name=N'StudentIdentifier', @level2type=N'COLUMN', @level2name=N'Identifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The context for the identification.', @level0type=N'SCHEMA', @level0name=N'identification', @level1type=N'TABLE', @level1name=N'StudentIdentifier', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'identification', @level1type=N'TABLE', @level1name=N'StudentIdentifier', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

