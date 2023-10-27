-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DROP TRIGGER IF EXISTS [myextension].[myextension_PostSecondaryOrganization_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [myextension].[myextension_PostSecondaryOrganization_TR_UpdateChangeVersion] ON [myextension].[PostSecondaryOrganization] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [myextension].[PostSecondaryOrganization]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [myextension].[PostSecondaryOrganization] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

