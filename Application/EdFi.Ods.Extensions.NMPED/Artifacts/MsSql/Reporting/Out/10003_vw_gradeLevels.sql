/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/06/2023
* Desc: This view was written to simplify display and sorting of grade levels in the Descriptor table
* It was written to provide the CodeValue, Description, DescriptorId, and an Order column for sorting.
* The DescriptorId is necessary in this view as it may be joined with other tables that only use the DescriptorId.
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_gradeLevels]
AS
SELECT GL.CodeValue AS [GradeLevelCode]
	  ,GL.DescriptorId AS [GradeLevelDescriptorId]
	  ,GL.[Description] AS [GradeLevelDesecription]
	  ,CASE GL.CodeValue WHEN 'PK' THEN 0 WHEN 'KF' THEN 1 ELSE CONVERT(INT, GL.CodeValue) + 1 END AS [GradeLevelOrder]
FROM edfi.Descriptor GL WITH (NOLOCK)
WHERE GL.[Namespace] = 'uri://nmped.org/GradeLevelDescriptor'
AND GL.CodeValue IN ('PK','KF','01','02','03','04','05','06','07','08','09','10','11','12')

GO