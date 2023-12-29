IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[LocalEducationAgencyTransportation]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StaffDevelopment]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StaffDevelopment] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentCTEProgramAssociationCredential]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentEducationOrganizationAward]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentSpecialEducationAssociationEvent]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[VehicleMileage]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[VehicleMileage] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[VehicleSnapshot]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[VehicleSnapshot] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

