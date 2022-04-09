-- Written 3.25.22
-- By Dan DeHaven
-- Currency list

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Currency') > 0
		DROP TABLE Currency

CREATE TABLE Currency
	(
		currencyprecision BIGINT,
		displaysymbol NVARCHAR(10),
		exchangerate BIGINT,
		externalid NVARCHAR(255),
		fxrateupdatetimezone BIGINT,
		id BIGINT,
		includeinfxrateupdates CHAR(1),
		isbasecurrency NVARCHAR(1),
		isinactive CHAR(1),
		lastmodifieddate DATETIME2,
		[name] NVARCHAR(105),
		overridecurrencyformat CHAR(1),
		symbol NVARCHAR(4),
		symbolplacement BIGINT
	)

INSERT INTO Currency

SELECT
	currencyprecision,
	displaysymbol,
	exchangerate,
	externalid,
	fxrateupdatetimezone,
	id,
	includeinfxrateupdates,
	isbasecurrency,
	isinactive,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	[name],
	overridecurrencyformat,
	symbol,
	symbolplacement

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[currency]

