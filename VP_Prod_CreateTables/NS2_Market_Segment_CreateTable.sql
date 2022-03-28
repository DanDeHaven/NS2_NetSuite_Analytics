-- Written 3.25.22
-- By Dan DeHaven
-- Market Segment table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Market_Segment') > 0
		DROP TABLE Market_Segment

CREATE TABLE Market_Segment
	(
		externalid NVARCHAR(255),
		id BIGINT,
		isinactive CHAR(1),
		[name] NVARCHAR(999),
		recordid BIGINT,
		scriptid NVARCHAR(40)
	)

INSERT INTO Market_Segment

SELECT
	externalid,
	id,
	isinactive,
	[name],
	recordid,
	scriptid

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[CUSTOMLIST_VP_CUSTOMER_SEGMENTS]

