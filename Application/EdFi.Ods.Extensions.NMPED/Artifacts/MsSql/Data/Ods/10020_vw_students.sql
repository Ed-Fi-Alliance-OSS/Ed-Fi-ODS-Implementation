/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-17-2023
 * Desc:	This script creates a Student view from the Students Ed-Fi Resource
 *
 * Alt Id:	001 (Increment value each change)
 * By:		Collin Neville | App Dev I
 * Email:	collin.neville@ped.nm.gov
 * Date:	04/19/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 *
 *
 * Alt Id:	002 (Increment value each change)
 * By:		Collin Neville | App Dev I
 * Email:	collin.neville@ped.nm.gov
 * Date:	07/12/2023
 * Alt Desc: Removed all of the extra columns that PED did not collect.
 */

CREATE OR ALTER VIEW nmped_rpt.vw_students AS 

SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,[S].StudentUniqueId
	,[S].BirthDate
	,[S].DateEnteredUS
	,[S].FirstName	
	,[S].MiddleName		
	,[S].LastSurname																						
	--table CreateDate/LastModifiedDate
	,[S].CreateDate										
	,[S].LastModifiedDate
FROM 
	edfi.Student S WITH (NOLOCK)

	JOIN edfi.StudentSchoolAssociation SSA WITH (NOLOCK)
		ON SSA.StudentUSI = S.StudentUSI

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId