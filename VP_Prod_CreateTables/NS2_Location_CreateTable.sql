-- Written 3.25.22
-- By Dan DeHaven
-- Location table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Location') > 0
		DROP TABLE Location

CREATE TABLE Location
	(
		fullname NVARCHAR(4000),
		id BIGINT,
		isinactive CHAR(1),
		lastmodifieddate DATETIME2,
		mainaddress BIGINT,
		makeinventoryavailable CHAR(1),
		makeinventoryavailablestore CHAR(1),
		[name] NVARCHAR(60),
		parent BIGINT,
		returnaddress BIGINT,
		subsidiary NVARCHAR(4000)
	)

INSERT INTO Location

SELECT
	fullname,
	id,
	isinactive,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	mainaddress,
	makeinventoryavailable,
	makeinventoryavailablestore,
	[name],
	parent,
	returnaddress,
	subsidiary

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[Location]

