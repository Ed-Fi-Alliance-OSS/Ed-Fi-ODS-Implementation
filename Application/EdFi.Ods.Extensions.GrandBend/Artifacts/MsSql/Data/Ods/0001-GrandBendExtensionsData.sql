-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

INSERT INTO grandbend.StaffExtension
    (StaffUSI
    , ProbationCompleteDate
    , Tenured)
SELECT
    StaffUSI
    , NULL
    , NULL
FROM edfi.Staff s
WHERE NOT EXISTS
    (SELECT StaffUSI
    FROM grandbend.StaffExtension
    WHERE StaffUSI = s.StaffUsi)
