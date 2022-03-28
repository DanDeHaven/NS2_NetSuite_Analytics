-- Written 3.25.22
-- By Dan DeHaven
-- Contract Type table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Contract_Type') > 0
		DROP TABLE Contract_Type

CREATE TABLE Contract_Type
	(
		externalid NVARCHAR(255),
		id BIGINT,
		isinactive CHAR(1),
		[name] NVARCHAR(999),
		recordid BIGINT,
		scriptid NVARCHAR(40)
	)

INSERT INTO Contract_Type

SELECT
	externalid,
	id,
	isinactive,
	[name],
	recordid,
	scriptid

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[CUSTOMLIST_CONTRACT_TYPE]

