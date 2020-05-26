-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TRIGGER [grandbend].[grandbend_Applicant_TR_UpdateChangeVersion] ON [grandbend].[Applicant] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [grandbend].[Applicant]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [grandbend].[Applicant] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

