-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Extended Properties [grandbend].[Applicant] --
COMMENT ON TABLE grandbend.Applicant IS 'This entity represents an individual who has applied for a position with any public or private education institution or agency.';
COMMENT ON COLUMN grandbend.Applicant.ApplicantIdentifier IS 'A unique alphanumeric code assigned to an applicant.';
COMMENT ON COLUMN grandbend.Applicant.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN grandbend.Applicant.PersonalTitlePrefix IS 'A prefix used to denote the title, degree, position, or seniority of the person.';
COMMENT ON COLUMN grandbend.Applicant.FirstName IS 'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.';
COMMENT ON COLUMN grandbend.Applicant.MiddleName IS 'A secondary name given to an individual at birth, baptism, or during another naming ceremony.';
COMMENT ON COLUMN grandbend.Applicant.LastSurname IS 'The name borne in common by members of a family.';
COMMENT ON COLUMN grandbend.Applicant.GenerationCodeSuffix IS 'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).';
COMMENT ON COLUMN grandbend.Applicant.MaidenName IS 'The person''s maiden name.';
COMMENT ON COLUMN grandbend.Applicant.SexDescriptorId IS 'A person''s gender.';
COMMENT ON COLUMN grandbend.Applicant.BirthDate IS 'The month, day, and year on which an individual was born.';
COMMENT ON COLUMN grandbend.Applicant.HispanicLatinoEthnicity IS 'An indication that the individual traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central, and South America, and other Spanish cultures, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."';
COMMENT ON COLUMN grandbend.Applicant.CitizenshipStatusDescriptorId IS 'An indicator of whether or not the person is a U.S. citizen.';
COMMENT ON COLUMN grandbend.Applicant.HighestCompletedLevelOfEducationDescriptorId IS 'The extent of formal instruction an individual has received (e.g., the highest grade in school completed or its equivalent or the highest degree received).';
COMMENT ON COLUMN grandbend.Applicant.YearsOfPriorProfessionalExperience IS 'The total number of years that an individual has previously held a similar professional position in one or more education institutions.';
COMMENT ON COLUMN grandbend.Applicant.YearsOfPriorTeachingExperience IS 'The total number of years that an individual has previously held a teaching position in one or more education institutions.';
COMMENT ON COLUMN grandbend.Applicant.LoginId IS 'The login ID for the user; used for security access control interface.';
COMMENT ON COLUMN grandbend.Applicant.HighlyQualifiedTeacher IS 'An indication of whether a teacher applicant is classified as highly qualified for his/her prospective assignment according to state definition. This attribute indicates the teacher is highly qualified for ALL Sections to be taught.';
COMMENT ON COLUMN grandbend.Applicant.HighlyQualifiedAcademicSubjectDescriptorId IS 'An applicant subject in which a teacher applicant is classified as highly qualified.';

-- Extended Properties [grandbend].[ApplicantAddress] --
COMMENT ON TABLE grandbend.ApplicantAddress IS 'The set of elements that describes an address, including the street address, city, state, and ZIP code.';
COMMENT ON COLUMN grandbend.ApplicantAddress.AddressTypeDescriptorId IS 'The type of address listed for an individual or organization.    For example:  Physical Address, Mailing Address, Home Address, etc.)';
COMMENT ON COLUMN grandbend.ApplicantAddress.ApplicantIdentifier IS 'A unique alphanumeric code assigned to an applicant.';
COMMENT ON COLUMN grandbend.ApplicantAddress.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN grandbend.ApplicantAddress.StreetNumberName IS 'The street number and street name or post office box number of an address.';
COMMENT ON COLUMN grandbend.ApplicantAddress.ApartmentRoomSuiteNumber IS 'The apartment, room, or suite number of an address.';
COMMENT ON COLUMN grandbend.ApplicantAddress.BuildingSiteNumber IS 'The number of the building on the site, if more than one building shares the same address.';
COMMENT ON COLUMN grandbend.ApplicantAddress.City IS 'The name of the city in which an address is located.';
COMMENT ON COLUMN grandbend.ApplicantAddress.StateAbbreviationDescriptorId IS 'The abbreviation for the state (within the United States) or outlying area in which an address is located.';
COMMENT ON COLUMN grandbend.ApplicantAddress.PostalCode IS 'The five or nine digit zip code or overseas postal code portion of an address.';
COMMENT ON COLUMN grandbend.ApplicantAddress.NameOfCounty IS 'The name of the county, parish, borough, or comparable unit (within a state) in
                      ''which an address is located.';
COMMENT ON COLUMN grandbend.ApplicantAddress.CountyFIPSCode IS 'The Federal Information Processing Standards (FIPS) numeric code for the county issued by the National Institute of Standards and Technology (NIST). Counties are considered to be the "first-order subdivisions" of each State and statistically equivalent entity, regardless of their local designations (county, parish, borough, etc.) Counties in different States will have the same code. A unique county number is created when combined with the 2-digit FIPS State Code.';
COMMENT ON COLUMN grandbend.ApplicantAddress.Latitude IS 'The geographic latitude of the physical address.';
COMMENT ON COLUMN grandbend.ApplicantAddress.Longitude IS 'The geographic longitude of the physical address.';
COMMENT ON COLUMN grandbend.ApplicantAddress.BeginDate IS 'The month, day, and year the address became effective.';
COMMENT ON COLUMN grandbend.ApplicantAddress.EndDate IS 'The month, day, and year the address ceased to be in effect.';

-- Extended Properties [grandbend].[StaffExtension] --
COMMENT ON TABLE grandbend.StaffExtension IS '';
COMMENT ON COLUMN grandbend.StaffExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN grandbend.StaffExtension.ProbationCompleteDate IS 'The date that the staff member''s new hire probationary period was completed.';
COMMENT ON COLUMN grandbend.StaffExtension.Tenured IS 'An indication as to whether the staff member is tenured.';

