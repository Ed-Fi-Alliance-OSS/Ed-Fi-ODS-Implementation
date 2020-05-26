-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE SYNONYM auth.LocalEducationAgencyIdToStudentUniqueId FOR auth.LocalEducationAgencyIdToStudent;
CREATE SYNONYM auth.LocalEducationAgencyIdToStudentGuid FOR auth.LocalEducationAgencyIdToStudent;
CREATE SYNONYM auth.LocalEducationAgencyIdToParentUniqueId FOR auth.LocalEducationAgencyIdToParent;
CREATE SYNONYM auth.LocalEducationAgencyIdToParentGuid FOR auth.LocalEducationAgencyIdToParent;
CREATE SYNONYM auth.LocalEducationAgencyIdToStaffUniqueId FOR auth.LocalEducationAgencyIdToStaff;
CREATE SYNONYM auth.LocalEducationAgencyIdToStaffGuid FOR auth.LocalEducationAgencyIdToStaff;
CREATE SYNONYM auth.ParentGuidToStudentGuid FOR auth.ParentToStudent;
CREATE SYNONYM auth.ParentGuidToStudentUniqueId FOR auth.ParentToStudent;
CREATE SYNONYM auth.ParentUniqueIdToStudentGuid FOR auth.ParentToStudent;
CREATE SYNONYM auth.ParentUniqueIdToStudentUniqueId FOR auth.ParentToStudent;
CREATE SYNONYM auth.SchoolIdToStudentGuid FOR auth.SchoolIdToStudent;
CREATE SYNONYM auth.SchoolIdToStudentUniqueId FOR auth.SchoolIdToStudent;
CREATE SYNONYM auth.SchoolIdToStaffGuid FOR auth.SchoolIdToStaff;
CREATE SYNONYM auth.SchoolIdToStaffUniqueId FOR auth.SchoolIdToStaff;
