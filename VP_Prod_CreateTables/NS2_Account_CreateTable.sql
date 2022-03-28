-- Written 3.24/22
-- By Dan DeHaven
-- Accounts 

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Account') > 0
		DROP TABLE Account


CREATE TABLE Account
	(
	accountsearchdisplayname NVARCHAR(154),
	accountsearchdisplaynamecopy NVARCHAR(93),
	acctnumber NVARCHAR(60),
	accttype NVARCHAR(12),
	billableexpensesacct BIGINT,
	cashflowrate NVARCHAR(10),
	category1099misc BIGINT,
	class BIGINT,
	currency BIGINT,
	custrecord_cps_bdc_lastupdatedbyimp_acc CHAR(1),
	custrecord_ef_fld_cash_flow_rep_category BIGINT,
	custrecord_na_mapping BIGINT,
	custrecord_revenue_mapping BIGINT,
	deferralacct BIGINT,
	department BIGINT,
	[description] NVARCHAR(60),
	displaynamewithhierarchy NVARCHAR(4000),
	eliminate CHAR(1),
	externalid NVARCHAR(255),
	fullname NVARCHAR(4000),
	generalrate NVARCHAR(10),
	id BIGINT,
	includechildren NVARCHAR(1),
	inventory CHAR(1),
	isinactive CHAR(1),
	issummary CHAR(1),
	lastmodifieddate DATETIME2,
	location BIGINT,
	parent BIGINT,
	reconcilewithmatching CHAR(1),
	revalue CHAR(1),
	sbankname NVARCHAR(31),
	sbankroutingnumber NVARCHAR(25),
	sspecacct NVARCHAR(16),
	subsidiary NVARCHAR(4000),
	unit BIGINT,
	unitstype BIGINT

	)

INSERT INTO Account

SELECT
	accountsearchdisplayname,
	accountsearchdisplaynamecopy,
	acctnumber,
	accttype,
	billableexpensesacct,
	cashflowrate,
	category1099misc,
	class,
	currency,
	custrecord_cps_bdc_lastupdatedbyimp_acc,
	custrecord_ef_fld_cash_flow_rep_category,
	custrecord_na_mapping,
	custrecord_revenue_mapping,
	deferralacct,
	department,
	[description],
	displaynamewithhierarchy,
	eliminate,
	externalid,
	fullname,
	generalrate,
	id,
	includechildren,
	inventory,
	isinactive,
	issummary,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	location,
	parent,
	reconcilewithmatching,
	revalue,
	sbankname,
	sbankroutingnumber,
	sspecacct,
	subsidiary,
	unit,
	unitstype

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].Account

