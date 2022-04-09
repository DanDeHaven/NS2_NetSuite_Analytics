-- Written 3.25.22
-- By Dan DeHaven
-- Subsidiary table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Subsidiary') > 0
		DROP TABLE Subsidiary

CREATE TABLE Subsidiary
	(
		country NVARCHAR(2),
		currency BIGINT,
		dropdownstate NVARCHAR(20),
		edition NVARCHAR(20),
		email NVARCHAR(64),
		federalidnumber NVARCHAR(40),
		fiscalcalendar BIGINT,
		fullname NVARCHAR(4000),
		id BIGINT,
		iselimination CHAR(1),
		isinactive CHAR(1),
		lastmodifieddate DATETIME2,
		legalname NVARCHAR(83),
		mainaddress BIGINT,
		[name] NVARCHAR(83),
		parent BIGINT,
		ssnortin NVARCHAR(40),
		[state] NVARCHAR(20),
		[url] NVARCHAR(64)
	)

INSERT INTO Subsidiary

SELECT
	country,
	currency,
	dropdownstate,
	edition,
	email,
	federalidnumber,
	fiscalcalendar,
	fullname,
	id,
	iselimination,
	isinactive,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	legalname,
	mainaddress,
	[name],
	parent,
	ssnortin,
	[state],
	[url]

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[Subsidiary]

