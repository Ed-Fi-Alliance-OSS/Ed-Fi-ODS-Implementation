-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.
do $$

declare grandBendEducationOrganizationId int;

begin

select EducationOrganizationId into grandBendEducationOrganizationId
    from edfi.EducationOrganization
    where EducationOrganizationId = 255901;

if (grandBendEducationOrganizationId is null) then 
   return;
end if;


insert into edfi.Survey
           (Namespace
           ,SurveyIdentifier
           ,EducationOrganizationId
           ,SurveyTitle
           ,SchoolYear
           ,SurveyCategoryDescriptorId
           ,Id)
     values
           ('uri://ed-fi.org/survey#Descriptor'
           ,'6d294bf81adc4e968e61567abecd3df8'
           ,255901
           ,'Testing Survey'
           ,2020
           ,2256
           ,'be0e2e8f-b3d2-4cdc-8b0c-18d95999b1a2');


insert into edfi.SurveyResponse
           (Namespace
           ,SurveyIdentifier
           ,SurveyResponseIdentifier
           ,ResponseDate
           ,Id)
     values
           ('uri://ed-fi.org/survey#Descriptor'
           ,'6d294bf81adc4e968e61567abecd3df8'
           ,'399ea8dc8c054fc9800622c130a67123'
           ,'2020/06/01'
           ,'a1b56de6-86cc-4369-80be-f64d3c50b833');



insert into tpdm.TeacherCandidate
           (TeacherCandidateIdentifier
           ,FirstName
           ,LastSurname
           ,SexDescriptorId
           ,BirthDate
           ,StudentUSI
           ,Id)
     values
           ('b731e59875db4bfa95d091559f0909e5'
           ,'Robert'
           ,'Smith'
           ,2084
           ,'1979/04/30'
           ,1
           ,'19858412-575a-4bb7-997b-c36cfeb93ae1');



insert into tpdm.SurveyResponseTeacherCandidateTargetAssociation
           (Namespace
           ,SurveyIdentifier
           ,SurveyResponseIdentifier
           ,TeacherCandidateIdentifier
           ,Id)
     values
           ('uri://ed-fi.org/survey#Descriptor'
           ,'6d294bf81adc4e968e61567abecd3df8'
           ,'399ea8dc8c054fc9800622c130a67123'
           ,'b731e59875db4bfa95d091559f0909e5'
           ,'20f9d9fc-aa51-4af5-923a-991043e9eafb');


insert into edfi.SurveySection
           (Namespace
           ,SurveyIdentifier
           ,SurveySectionTitle
           ,Id)
     values
           ('uri://ed-fi.org/survey#Descriptor'
           ,'6d294bf81adc4e968e61567abecd3df8'
           ,'Survey Section Test'
           ,'62ba004c-1905-4009-819b-ae7754a2c186');


insert into edfi.SurveySectionResponse
           (Namespace
           ,SurveyIdentifier
           ,SurveyResponseIdentifier
           ,SurveySectionTitle
           ,Id)
     values
           ('uri://ed-fi.org/survey#Descriptor'
           ,'6d294bf81adc4e968e61567abecd3df8'
           ,'399ea8dc8c054fc9800622c130a67123'
           ,'Survey Section Test'
           ,'67389559-6b50-4e80-a5ab-3fa71ca73563');


insert into tpdm.SurveySectionResponseTeacherCandidateTargetAssociation
           (Namespace
           ,SurveyIdentifier
           ,SurveyResponseIdentifier
           ,SurveySectionTitle
           ,TeacherCandidateIdentifier
           ,Id)
     values
           ('uri://ed-fi.org/survey#Descriptor'
           ,'6d294bf81adc4e968e61567abecd3df8'
           ,'399ea8dc8c054fc9800622c130a67123'
           ,'Survey Section Test'
           ,'b731e59875db4bfa95d091559f0909e5'
           ,'5f2ebb6d-aaa8-48b1-8116-777538516cd3');



end $$


