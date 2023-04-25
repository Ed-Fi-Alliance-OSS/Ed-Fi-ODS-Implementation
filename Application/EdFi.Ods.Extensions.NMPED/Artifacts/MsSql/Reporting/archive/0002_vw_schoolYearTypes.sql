/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	02-23-2023
 * Desc:	This script creates a schoolYearTypes view from the 
 *			schoolYearTypes resource
 *
 */

CREATE OR ALTER VIEW nmped_rpt.vw_schoolYearTypes AS 
SELECT
	 SchoolYear
	,SchoolYearDescription
	,CurrentSchoolYear
	,CreateDate
	,LastModifiedDate
FROM 
	edfi.SchoolYearType SYT WITH (NOLOCK)
