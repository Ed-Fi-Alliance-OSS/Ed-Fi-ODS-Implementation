-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @LocalEducationAgency int; 
SET @LocalEducationAgency = '255901'; 
 
  --LEAId, LEAName, Enrollment Count
 select EO.educationorganizationid, EO.Nameofinstitution, eocat.educationorganizationid,count(csa.studentusi) as TotalEnrolled
from edfi.EducationOrganization EO
inner join edfi.EducationOrganizationCategory EOcat
on EO.educationorganizationid = eocat.educationorganizationid
inner join edfi.School sch
on eo.educationorganizationid = sch.localeducationagencyid
inner join edfi.CurrentStudentSchoolAssociation CSA
on csa.schoolid = sch.schoolid
where EO.educationorganizationid = @LocalEducationAgency
and eocat.educationorganizationcategorytypeid = 2 -- LEA TypeId
group by EO.educationorganizationid,  EO.Nameofinstitution, eocat.educationorganizationid

--School Id, School Name, enrollment count
select EO.educationorganizationid, eo.nameofinstitution, count(csa.studentusi) 
from edfi.CurrentStudentSchoolAssociation CSA
inner join edfi.EducationOrganization EO
on CSA.schoolid = EO.educationorganizationid
inner join edfi.School SCH
on SCH.localeducationagencyid = @LocalEducationAgency
where csa.schoolid = SCH.schoolid
group by EO.educationorganizationid, eo.nameofinstitution


--School Id, School Name, hispanic %, male %, female %, race %
select result.schoolid, result.nameofinstitution, sum(result.total) as TotalEnrolled, 
cast((cast(sum(result.male) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as PercentMale, 
cast((cast(sum(result.female) as decimal(7,3))  /  cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as PercentFemale, 
cast((cast(sum(result.hispanic) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as PercentHispanic, 
cast((cast(sum(result.AmericanIndianAlaskanNative) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as 

PercentAmericanIndianAlaskanNative, 
cast((cast(sum(result.Asian) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as PercentAsian, 
cast((cast(sum(result.BlackAfricanAmerican) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as PercentBlackAfricanAmerican, 
cast((cast(sum(result.NativeHawaiianPacificIslander) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as 

PercentNativeHawaiianPacificIslander, 
cast((cast(sum(result.white) as decimal (7,3)) / cast(sum(result.total) as decimal (7,3)) * 100) as decimal (5,2)) as PercentWhite
from
(select q.schoolid, q.nameofinstitution, count(q.studentusi) as total,
sum(case when q.gender = 'Male' then 1 else 0 end) as 'Male', 
sum(case when q.gender = 'Female' then 1 else 0 end) as 'Female',
sum(case when q.hispanic = 1 then 1 else 0 end) as 'Hispanic', 0 as AmericanIndianAlaskanNative, 
0 as Asian, 0 as BlackAfricanAmerican, 0 as NativeHawaiianPacificIslander, 0 as white
from
(select CSA.studentusi, csa.schoolid, EO.Nameofinstitution, eocat.educationorganizationid, stu.hispaniclatinoethnicity as hispanic, stusex.description as gender 
from edfi.CurrentStudentSchoolAssociation CSA
inner join edfi.EducationOrganization EO
on CSA.schoolid = EO.educationorganizationid
inner join edfi.EducationOrganizationCategory EOcat
on EO.educationorganizationid = eocat.educationorganizationid
inner join edfi.School SCH
on SCH.localeducationagencyid = @LocalEducationAgency
inner join edfi.Student STU
on CSA.studentusi = stu.studentusi
inner join edfi.Sextype STUSex
on stu.sextypeid = stusex.sextypeid
) as q 
group by q.schoolid, q.nameofinstitution

union

select q.schoolid, q.nameofinstitution,0 as total, 0 as male, 0 as female, 0 as hispanic, 
sum(case when q.race = 'American Indian - Alaskan Native' then 1 else 0 end) as 'AmericanIndianAlaskanNative', 
sum(case when q.race = 'Asian' then 1 else 0 end) as 'Asian',
sum(case when q.race = 'Black - African American' then 1 else 0 end) as 'BlackAfricanAmerican',
sum(case when q.race = 'Native Hawaiian - Pacific Islander' then 1 else 0 end) as 'NativeHawaiianPacificIslander',
sum(case when q.race = 'White' then 1 else 0 end) as 'White'
from
(select CSA.studentusi, csa.schoolid, EO.Nameofinstitution, eocat.educationorganizationid, racetype.description as race 
from edfi.CurrentStudentSchoolAssociation CSA
inner join edfi.EducationOrganization EO
on CSA.schoolid = EO.educationorganizationid
inner join edfi.EducationOrganizationCategory EOcat
on EO.educationorganizationid = eocat.educationorganizationid
inner join edfi.School SCH
on SCH.localeducationagencyid = @LocalEducationAgency
 inner join edfi.StudentRace STURace
on csa.studentusi = sturace.studentusi
inner join edfi.RaceType RaceType
on sturace.racetypeid = racetype.racetypeid
) as Q
group by q.schoolid, q.nameofinstitution) as result
group by result.schoolid, result.nameofinstitution




--School Id, School Name, Section Keys, Enrollment count
select distinct SSA.schoolid, eo.nameofinstitution, ssa.classperiodname, ssa.classroomidentificationcode,
ssa.localcoursecode, term.description, ssa.schoolyear, count(csa.studentusi) as TotalEnrolled  
from edfi.StudentSectionAssociation SSA
inner join edfi.CurrentStudentSchoolAssociation CSA
on csa.studentusi = ssa.studentusi
and csa.schoolid = ssa.schoolid
inner join edfi.EducationOrganization EO
on SSA.schoolid = EO.educationorganizationid
inner join edfi.School SCH
on SCH.localeducationagencyid = @LocalEducationAgency
inner join edfi.TermType Term
on ssa.termtypeid = term.termtypeid
where (ssa.enddate is null) or
 (ssa.enddate >= 
   (SELECT  MAX(Date) AS Expr1
       FROM edfi.CalendarDate AS CD
        WHERE (SSA.SchoolId = eo.EducationOrganizationId) AND (CalendarEventTypeId = 1))) 
group by SSA.schoolid, eo.nameofinstitution, ssa.classperiodname, ssa.classroomidentificationcode,
ssa.localcoursecode, term.description, ssa.schoolyear