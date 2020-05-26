-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Extended Properties [grandbend].[Applicant] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents an individual who has applied for a position with any public or private education institution or agency.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to an applicant.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'ApplicantIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A prefix used to denote the title, degree, position, or seniority of the person.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'PersonalTitlePrefix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'MiddleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name borne in common by members of a family.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'LastSurname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'GenerationCodeSuffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The person''s maiden name.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'MaidenName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A person''s gender.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'SexDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual was born.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the individual traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central, and South America, and other Spanish cultures, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'HispanicLatinoEthnicity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator of whether or not the person is a U.S. citizen.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'CitizenshipStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The extent of formal instruction an individual has received (e.g., the highest grade in school completed or its equivalent or the highest degree received).', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'HighestCompletedLevelOfEducationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of years that an individual has previously held a similar professional position in one or more education institutions.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'YearsOfPriorProfessionalExperience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of years that an individual has previously held a teaching position in one or more education institutions.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'YearsOfPriorTeachingExperience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The login ID for the user; used for security access control interface.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'LoginId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a teacher applicant is classified as highly qualified for his/her prospective assignment according to state definition. This attribute indicates the teacher is highly qualified for ALL Sections to be taught.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'HighlyQualifiedTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An applicant subject in which a teacher applicant is classified as highly qualified.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'Applicant', @level2type=N'COLUMN', @level2name=N'HighlyQualifiedAcademicSubjectDescriptorId'
GO

-- Extended Properties [grandbend].[ApplicantAddress] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The set of elements that describes an address, including the street address, city, state, and ZIP code.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of address listed for an individual or organization.    For example:  Physical Address, Mailing Address, Home Address, etc.)', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'AddressTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to an applicant.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'ApplicantIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The street number and street name or post office box number of an address.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'StreetNumberName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The apartment, room, or suite number of an address.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'ApartmentRoomSuiteNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of the building on the site, if more than one building shares the same address.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'BuildingSiteNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the city in which an address is located.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'StateAbbreviationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The five or nine digit zip code or overseas postal code portion of an address.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the county, parish, borough, or comparable unit (within a state) in
                      ''which an address is located.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'NameOfCounty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Federal Information Processing Standards (FIPS) numeric code for the county issued by the National Institute of Standards and Technology (NIST). Counties are considered to be the "first-order subdivisions" of each State and statistically equivalent entity, regardless of their local designations (county, parish, borough, etc.) Counties in different States will have the same code. A unique county number is created when combined with the 2-digit FIPS State Code.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'CountyFIPSCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The geographic latitude of the physical address.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The geographic longitude of the physical address.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year the address became effective.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year the address ceased to be in effect.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'ApplicantAddress', @level2type=N'COLUMN', @level2name=N'EndDate'
GO

-- Extended Properties [grandbend].[StaffExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'StaffExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date that the staff member''s new hire probationary period was completed.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'ProbationCompleteDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication as to whether the staff member is tenured.', @level0type=N'SCHEMA', @level0name=N'grandbend', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'Tenured'
GO

