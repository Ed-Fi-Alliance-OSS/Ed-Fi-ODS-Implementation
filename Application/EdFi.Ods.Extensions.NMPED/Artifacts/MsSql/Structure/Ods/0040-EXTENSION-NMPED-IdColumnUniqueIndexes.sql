BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.NMPEDService') AND name = N'UX_NMPEDService_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_NMPEDService_Id ON [nmped].[NMPEDService]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'nmped.StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent') AND name = N'UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent_Id ON [nmped].[StudentSpecialEducationProgramAssociationSpecialEducationProgramEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

