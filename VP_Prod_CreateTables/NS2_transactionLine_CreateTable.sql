-- Written 3.25.22
-- By Dan DeHaven
-- transactionLine table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('transactionLine') > 0
		DROP TABLE transactionLine

CREATE TABLE transactionLine
	(
		amortizationenddate DATETIME2,
		amortizationresidual NVARCHAR(41),
		amortizationsched BIGINT,
		amortizstartdate DATETIME2,
		amountlinked BIGINT,
		billeddate DATETIME2,
		billingschedule BIGINT,
		billvariancestatus NVARCHAR(25),
		category BIGINT,
		class BIGINT,
		cleared CHAR(1),
		cleareddate DATETIME2,
		createdfrom BIGINT,
		creditforeignamount BIGINT,
		custcol1 BIGINT,
		custcol_legacy_classification BIGINT,
		custcol_legacy_trx_number NVARCHAR(4000),
		custcol_legacy_trx_type NVARCHAR(4000),
		custcol_line_wt_ns_id BIGINT,
		custcol_sale_item BIGINT,
		custcol_sf_opp_id NVARCHAR(4000),
		custcol_sf_opp_num BIGINT,
		custcol_vp_vendor BIGINT,
		custcol_vp_wt_so_sub_line_id BIGINT,
		debitforeignamount BIGINT,
		deferrevrec CHAR(1),
		department BIGINT,
		donotdisplayline CHAR(1),
		eliminate NVARCHAR(1),
		[entity] BIGINT,
		expenseaccount BIGINT,
		foreignamount BIGINT,
		foreignamountpaid BIGINT,
		foreignamountunpaid BIGINT,
		foreignpaymentamountunused BIGINT,
		foreignpaymentamountused BIGINT,
		id BIGINT,
		isbillable CHAR(1),
		isclosed CHAR(1),
		iscogs CHAR(1),
		isrevrectransaction CHAR(1),
		item BIGINT,
		itemtype NVARCHAR(11),
		linelastmodifieddate DATETIME2,
		linesequencenumber BIGINT,
		[location] BIGINT,
		matchbilltoreceipt CHAR(1),
		memo NVARCHAR(4000),
		netamount BIGINT,
		paymentmethod BIGINT,
		quantity BIGINT,
		rate BIGINT,
		rateamount BIGINT,
		ratepercent BIGINT,
		revrecenddate DATETIME2,
		revrecstartdate DATETIME2,
		revrecterminmonths BIGINT,
		subsidiary BIGINT,
		taxline NVARCHAR(1),
		[transaction] BIGINT,
		uniquekey BIGINT
	)

INSERT INTO transactionLine

SELECT
	WFDW.dbo.fn_DateTime(amortizationenddate) AS amortizationenddate,
	amortizationresidual,
	amortizationsched,
	WFDW.dbo.fn_DateTime(amortizstartdate) AS amortizstartdate,
	amountlinked,
	WFDW.dbo.fn_DateTime(billeddate) AS billeddate,
	billingschedule,
	billvariancestatus,
	category,
	class,
	cleared,
	WFDW.dbo.fn_DateTime(cleareddate) AS cleareddate,
	createdfrom,
	creditforeignamount,
	custcol1,
	custcol_legacy_classification,
	custcol_legacy_trx_number,
	custcol_legacy_trx_type,
	custcol_line_wt_ns_id,
	custcol_sale_item,
	custcol_sf_opp_id,
	custcol_sf_opp_num,
	custcol_vp_vendor,
	custcol_vp_wt_so_sub_line_id,
	debitforeignamount,
	deferrevrec,
	department,
	donotdisplayline,
	eliminate,
	[entity],
	expenseaccount,
	foreignamount,
	foreignamountpaid,
	foreignamountunpaid,
	foreignpaymentamountunused,
	foreignpaymentamountused,
	id,
	isbillable,
	isclosed,
	iscogs,
	isrevrectransaction,
	item,
	itemtype,
	WFDW.dbo.fn_DateTime(linelastmodifieddate) AS linelastmodifieddate,
	linesequencenumber,
	[location],
	matchbilltoreceipt,
	memo,
	netamount,
	paymentmethod,
	quantity,
	rate,
	rateamount,
	ratepercent,
	WFDW.dbo.fn_DateTime(revrecenddate) AS revrecenddate,
	WFDW.dbo.fn_DateTime(revrecstartdate) AS revrecstartdate,
	revrecterminmonths,
	subsidiary,
	taxline,
	[transaction],
	uniquekey

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[transactionLine]
