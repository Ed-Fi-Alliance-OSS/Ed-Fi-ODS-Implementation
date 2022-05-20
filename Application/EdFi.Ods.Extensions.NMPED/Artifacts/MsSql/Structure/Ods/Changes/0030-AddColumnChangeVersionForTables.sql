IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[LocalEducationAgencyTransportation]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StaffDevelopment]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StaffDevelopment] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StaffEducationOrganizationDigitalEquity]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StaffEducationOrganizationDigitalEquity] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentEducationOrganizationAward]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentSchoolAggregateSectionAttendance]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StudentSchoolAggregateSectionAttendance] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[VehicleMileage]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[VehicleMileage] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[VehicleSnapshot]') AND name = 'ChangeVersion')
ALTER TABLE [nmped].[VehicleSnapshot] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

