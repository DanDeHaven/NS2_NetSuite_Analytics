-- Written 3.25.22
-- By Dan DeHaven
-- VP Events Custom list

USE NS2_VP_Prod_Stage
GO

	IF Object_id('VP_Events') > 0
		DROP TABLE VP_Events

CREATE TABLE VP_Events
	(
		externalid NVARCHAR(255),
		id BIGINT,
		isinactive CHAR(1),
		[name] NVARCHAR(999),
		recordid BIGINT,
		scriptid NVARCHAR(40)
	)

INSERT INTO VP_Events

SELECT
	externalid,
	id,
	isinactive,
	[name],
	recordid,
	scriptid

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[CUSTOMLIST_EVENTS]

