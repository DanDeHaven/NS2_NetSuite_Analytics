-- Written 3.25.22
-- By Dan DeHaven
-- accountingPeriod Dimension

USE NS2_VP_Prod_Stage
GO

CREATE TABLE accountingPeriod
	(
	alllocked CHAR(1),
	allownonglchanges CHAR(1),
	aplocked CHAR(1),
	arlocked CHAR(1),
	closed CHAR(1),
	closedondate DATETIME2,
	enddate DATETIME2,
	id BIGINT,
	isadjust CHAR(1),
	isinactive CHAR(1),
	isposting CHAR(1),
	isquarter CHAR(1),
	isyear CHAR(1),
	lastmodifieddate DATETIME2,
	parent BIGINT,
	periodname NVARCHAR(64),
	startdate DATETIME2
	)

INSERT INTO accountingPeriod

SELECT
	alllocked,
	allownonglchanges,
	aplocked,
	arlocked,
	closed,
	WFDW.dbo.fn_DateTime(closedondate) AS closedondate,
	WFDW.dbo.fn_DateTime(enddate) AS enddate,
	id,
	isadjust,
	isinactive,
	isposting,
	isquarter,
	isyear,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	parent,
	periodname,
	WFDW.dbo.fn_DateTime(startdate) AS startdate

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].accountingPeriod

