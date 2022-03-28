-- Written 3.25.22
-- By Dan DeHaven
-- Department table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Department') > 0
		DROP TABLE Department

CREATE TABLE Department
	(
		fullname NVARCHAR(4000),
		id BIGINT,
		includechildren NVARCHAR(1),
		isinactive CHAR(1),
		lastmodifieddate DATETIME2,
		[name] NVARCHAR(60),
		parent BIGINT,
		subsidiary NVARCHAR(4000),
	)

INSERT INTO Department

SELECT
	fullname,
	id,
	includechildren,
	isinactive,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	[name],
	parent,
	subsidiary

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[department]