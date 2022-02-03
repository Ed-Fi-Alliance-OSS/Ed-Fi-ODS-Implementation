ALTER TABLE [nmped].[NMPEDService] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

