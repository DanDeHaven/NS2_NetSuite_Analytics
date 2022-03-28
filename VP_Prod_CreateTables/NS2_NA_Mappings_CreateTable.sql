-- Written 3.25.22
-- By Dan DeHaven
-- NA Mappings Custom list

USE NS2_VP_Prod_Stage
GO

	IF Object_id('NA_Mappings') > 0
		DROP TABLE NA_Mappings

CREATE TABLE NA_Mappings
	(
		externalid NVARCHAR(255),
		id BIGINT,
		isinactive CHAR(1),
		[name] NVARCHAR(999),
		recordid BIGINT,
		scriptid NVARCHAR(40)
	)

INSERT INTO NA_Mappings

SELECT
	externalid,
	id,
	isinactive,
	[name],
	recordid,
	scriptid

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[CUSTOMLIST_NA_MAPPINGS]

