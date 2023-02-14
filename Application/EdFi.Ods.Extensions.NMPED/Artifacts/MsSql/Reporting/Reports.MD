# NMPED Reporting Infrastructure
This folder contains the source code that will create district-facing views on the EdFi Ods.
## Coding standards
The following standards should be used for all views.
 **- NO personally identifying information allowed in the SQL!!**
## Naming Standards
The schema and view naming that will be used for all views will follow the convention determined below.
 - The naming convention for the schema will be  **_[nmped_rpt]_**
 - The naming convention for the views will be the  **_[vw_(Resource_Name)]_**
Example: For the Student Resource we would name it  **_[vw_students]_**
 - The full naming convention would look like the example below.
    Example: For the Student Resource we would see it  **_[nmped_rpt].[vw_students]_**
- The column names will remain the same as the original table.
- The tables in a view can be aliased with the first letter of each word in the view name
Example1:  ``FROM StudentSchoolAssociation SSA ``
- Only if there are two columns with the same name with joining tables will the name change. In this situation the column should take the name of the  **_table/alias_column_name_**.
Example 1:  ```StudentSchoolAssociation_EducationOrganizationId and EducationOrganization_EducationOrganizationId ```
Example 2:  ```SSA_EducationOrganizationId and EO_EducationOrganizationId```
- When including tables in views please be sure to include the WITH (NOLOCK) clause. This is to prevent any possible locks from occurring on the database as there reports on the databases.
Example: ```FROM [edfi].[Student] S  WITH (NOLOCK)
INNER JOIN [edfi].[StudentSchoolAssociation] SSA  WITH (NOLOCK) on_ S.StudentUSI = SSA.StudentUSI```
- Use CAPITALS for all SQL reserved words like SELECT FROM INNER JOIN WHERE etc
- All joins should be explicitly INNER JOIN or OUTER JOIN
- All joins to edfi.descriptor should be aliased with the name of the descriptor
Example ```INNER JOIN edfi.descriptor SexDescriptor
	ON SEOA.SexDescriptorId = SexDescriptor.DescriptorId```
## Required columns
- All views will be required to include a districtCode. This can be derived from the LocalEducationAgencyId or the SchoolId as follows.
Example1: ```SELECT SUBSTRING(cast(EducationOrganizationId AS VARCHAR(10),3,3) DistrictCode
Example1: ```SELECT SUBSTRING(cast(SchoolId AS VARCHAR(10),3,3) DistrictCode
## File Structure
SQL Files should be laid out as follows.
- Each view will get its own file that is named after the view with a 4 digit id  example 0002_vw_student.sql
- Views can reference other views, as long as they are referencing another view with a lower number
- Each view should start with an if statement that will drop the view if it exists so that it can be run both in a clean install or in an environment where the view already exists.  
