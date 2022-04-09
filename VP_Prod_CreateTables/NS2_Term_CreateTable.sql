-- Written 3.25.22
-- By Dan DeHaven
-- Terms list

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Term') > 0
		DROP TABLE Term

CREATE TABLE Term
	(
		daydiscountexpires BIGINT,
		dayofmonthnetdue BIGINT,
		daysuntilexpiry BIGINT,
		daysuntilnetdue BIGINT,
		discountpercent BIGINT,
		discountpercentdatedriven BIGINT,
		duenextmonthifwithindays BIGINT,
		externalid NVARCHAR(255),
		id BIGINT,
		isinactive CHAR(1),
		lastmodifieddate DATETIME2,
		[name] NVARCHAR(31),
		preferred CHAR(1)
	)

INSERT INTO Term

SELECT
	daydiscountexpires,
	dayofmonthnetdue,
	daysuntilexpiry,
	daysuntilnetdue,
	discountpercent,
	discountpercentdatedriven,
	duenextmonthifwithindays,
	externalid,
	id,
	isinactive,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	[name],
	preferred

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[term]

