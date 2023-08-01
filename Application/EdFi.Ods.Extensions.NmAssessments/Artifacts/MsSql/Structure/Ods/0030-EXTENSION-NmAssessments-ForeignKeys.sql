ALTER TABLE [nmassessments].[ItemDescriptionCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ItemDescriptionCodeDescriptor_Descriptor] FOREIGN KEY ([ItemDescriptionCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_NmStudentAssessment_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_NmStudentAssessment_EducationOrganization]
ON [nmassessments].[NmStudentAssessment] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_NmStudentAssessment_ItemDescriptionCodeDescriptor] FOREIGN KEY ([ItemDescriptionCodeDescriptorId])
REFERENCES [nmassessments].[ItemDescriptionCodeDescriptor] ([ItemDescriptionCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NmStudentAssessment_ItemDescriptionCodeDescriptor]
ON [nmassessments].[NmStudentAssessment] ([ItemDescriptionCodeDescriptorId] ASC)
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_NmStudentAssessment_ScoringModelCodeDescriptor] FOREIGN KEY ([ScoringModelCodeDescriptorId])
REFERENCES [nmassessments].[ScoringModelCodeDescriptor] ([ScoringModelCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NmStudentAssessment_ScoringModelCodeDescriptor]
ON [nmassessments].[NmStudentAssessment] ([ScoringModelCodeDescriptorId] ASC)
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_NmStudentAssessment_StandardAchievedCodeDescriptor] FOREIGN KEY ([StandardAchievedCodeDescriptorId])
REFERENCES [nmassessments].[StandardAchievedCodeDescriptor] ([StandardAchievedCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NmStudentAssessment_StandardAchievedCodeDescriptor]
ON [nmassessments].[NmStudentAssessment] ([StandardAchievedCodeDescriptorId] ASC)
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_NmStudentAssessment_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_NmStudentAssessment_Student]
ON [nmassessments].[NmStudentAssessment] ([StudentUSI] ASC)
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] WITH CHECK ADD CONSTRAINT [FK_NmStudentAssessment_TestDescriptionDescriptor] FOREIGN KEY ([TestDescriptionDescriptorId])
REFERENCES [nmassessments].[TestDescriptionDescriptor] ([TestDescriptionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NmStudentAssessment_TestDescriptionDescriptor]
ON [nmassessments].[NmStudentAssessment] ([TestDescriptionDescriptorId] ASC)
GO

ALTER TABLE [nmassessments].[ScoringModelCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ScoringModelCodeDescriptor_Descriptor] FOREIGN KEY ([ScoringModelCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmassessments].[StandardAchievedCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_StandardAchievedCodeDescriptor_Descriptor] FOREIGN KEY ([StandardAchievedCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [nmassessments].[TestDescriptionDescriptor] WITH CHECK ADD CONSTRAINT [FK_TestDescriptionDescriptor_Descriptor] FOREIGN KEY ([TestDescriptionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

