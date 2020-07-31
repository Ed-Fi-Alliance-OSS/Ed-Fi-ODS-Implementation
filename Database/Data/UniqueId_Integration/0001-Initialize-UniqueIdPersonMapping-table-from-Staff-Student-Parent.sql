-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

--------------------------------------------------------------------------------------------------------------------------
-- NOTE: This migration step needs to be applied contextually to the database containing the UniqueIdPersonMapping table, 
--       and needs to be modified to use the name of the target Ed-Fi ODS database instance
--------------------------------------------------------------------------------------------------------------------------
-- Initialize the UniqueId table contents based on the tables in the EdFi_Ods database (if present)
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'EdFi_Ods_Populated_Template')
	INSERT INTO [uid].UniqueIdPersonMapping (Id, UniqueId)
	SELECT AllIds.Id, AllIds.UniqueId
	FROM (SELECT [Id], [StudentUniqueId] AS UniqueId FROM EdFi_Ods_Populated_Template.edfi.Student
		UNION SELECT [Id], [StaffUniqueId] AS UniqueId from EdFi_Ods_Populated_Template.edfi.Staff
		UNION SELECT [Id], [ParentUniqueId] AS UniqueId from EdFi_Ods_Populated_Template.edfi.Parent) AllIds;
