-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @grandBendElementarySchoolId INT;
SELECT @grandBendElementarySchoolId = SchoolId
FROM edfi.School
WHERE SchoolId = 255901107

DECLARE @student604854Usi INT;
SELECT @student604854Usi = StudentUSI
FROM edfi.Student
WHERE StudentUniqueId = '604854'

-- Sanity check to make sure some data exists, otherwise skip the script
IF (@grandBendElementarySchoolId IS NULL OR @student604854Usi IS NULL) RETURN

DECLARE @staffFirstName NVARCHAR(225) = 'StaffFirstName';
DECLARE @staffLastSurname NVARCHAR(225) = 'StaffLastSurname';
DECLARE @parentFirstName NVARCHAR(225) = 'ParentFirstName';
DECLARE @parentLastSurname NVARCHAR(225) = 'ParentLastSurname';
DECLARE @studentFirstName NVARCHAR(225) = 'StudentFirstName';
DECLARE @studentLastSurname NVARCHAR(225) = 'StudentLastSurname';
DECLARE @cityName NVARCHAR(225) = 'CityName';
DECLARE @schoolName NVARCHAR(225) = 'SchoolName';
DECLARE @schoolYear NVARCHAR(225) = 'SchoolYear';

INSERT INTO homograph.Name
    (FirstName, LastSurname)
VALUES
    (@staffFirstName, @staffLastSurname),
    (@parentFirstName, @parentLastSurname),
    (@studentFirstName, @studentLastSurname)

INSERT INTO homograph.SchoolYearType
    (SchoolYear)
VALUES
    (@schoolYear)

INSERT INTO homograph.School
    (SchoolName, SchoolYear)
VALUES
    (@schoolName, @schoolYear)

INSERT INTO homograph.SchoolAddress
    (SchoolName, City)
VALUES
    (@schoolName, @cityName)

INSERT INTO homograph.Student
    (StudentFirstName, StudentLastSurname, SchoolYear)
VALUES
    (@studentFirstName, @studentLastSurname, @schoolYear)

INSERT INTO homograph.StudentAddress
    (StudentFirstName, StudentLastSurname, City)
VALUES
    (@studentFirstName, @studentLastSurname, @cityName)

INSERT INTO homograph.StudentSchoolAssociation
    (StudentFirstName, StudentLastSurname, SchoolName)
VALUES
    (@studentFirstName, @studentLastSurname, @schoolName)

INSERT INTO homograph.Staff
    (StaffFirstName, StaffLastSurname)
VALUES
    (@staffFirstName, @staffLastSurname)

INSERT INTO homograph.StaffAddress
    (StaffFirstName, StaffLastSurname, City)
VALUES
    (@staffFirstName, @staffLastSurname, @cityName)

INSERT INTO homograph.StaffStudentSchoolAssociation
    (StaffFirstName, StaffLastSurname, SchoolName, StudentFirstName, StudentLastSurname)
VALUES
    (@staffFirstName, @staffLastSurname, @schoolName, @studentFirstName, @studentLastSurname)

INSERT INTO homograph.Parent
    (ParentFirstName, ParentLastSurname)
VALUES
    (@parentFirstName, @parentLastSurname)

INSERT INTO homograph.ParentAddress
    (ParentFirstName, ParentLastSurname, City)
VALUES
    (@parentFirstName, @parentLastSurname, @cityName)

INSERT INTO homograph.ParentStudentSchoolAssociation
    (ParentFirstName, ParentLastSurname, SchoolName, StudentFirstName, StudentLastSurname)
VALUES
    (@parentFirstName, @parentLastSurname, @schoolName, @studentFirstName, @studentLastSurname)
