-- Written 3.25.22
-- By Dan DeHaven
-- transaction table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('[transaction]') > 0
		DROP TABLE [transaction]

CREATE TABLE [transaction]
	(
		abbrevtype NVARCHAR(192),
		billingaddress BIGINT,
		billingstatus NVARCHAR(1),
		closedate DATETIME2,
		createdby BIGINT,
		createddate DATETIME2,
		currency BIGINT,
		custbody1 BIGINT,
		custbody_billing_frequency BIGINT,
		custbody_contract_type BIGINT,
		custbody_estimated_usage BIGINT,
		custbody_invoice_type BIGINT,
		custbody_legacy_trans_number NVARCHAR(4000),
		custbody_legacy_trans_type NVARCHAR(4000),
		custbody_maximum_usage BIGINT,
		custbody_member_usage_record BIGINT,
		custbody_minimum_usage BIGINT,
		custbody_number_of_periods BIGINT,
		custbody_sf_opp_18digit_id NVARCHAR(4000),
		custbody_sf_opp_number BIGINT,
		custbody_vp_are_spouces_free BIGINT,
		custbody_vp_legal_date DATETIME2,
		custbody_vp_replaced_by BIGINT,
		custbody_vp_wt_sf_opp_num BIGINT,
		custbody_vp_wt_so_sub_id BIGINT,
		custbody_vp_wt_so_sub_name NVARCHAR(4000),
		custbody_wt_ns_id BIGINT,
		daysopen BIGINT,
		daysoverduesearch BIGINT,
		deferredrevenue BIGINT,
		duedate DATETIME2,
		enddate DATETIME2,
		[entity] BIGINT,
		exchangerate BIGINT,
		externalid NVARCHAR(255),
		foreignamountpaid BIGINT,
		foreignamountunpaid BIGINT,
		foreignpaymentamountunused BIGINT,
		foreignpaymentamountused BIGINT,
		foreigntotal BIGINT,
		id BIGINT,
		isreversal NVARCHAR(1),
		lastmodifiedby BIGINT,
		lastmodifieddate DATETIME2,
		memo NVARCHAR(4000),
		nexus BIGINT,
		number BIGINT,
		otherrefnum NVARCHAR(138),
		[partner] BIGINT,
		paymentmethod BIGINT,
		paymentoption BIGINT,
		posting NVARCHAR(1),
		postingperiod BIGINT,
		recognizedrevenue BIGINT,
		recordtype NVARCHAR(40),
		revenuestatusdescr NVARCHAR(480),
		reversal BIGINT,
		reversaldate DATETIME2,
		revrecschedule BIGINT,
		shippingaddress BIGINT,
		[source] NVARCHAR(40),
		startdate DATETIME2,
		[status] CHAR(1),
		terms BIGINT,
		trandate DATETIME2,
		trandisplayname NVARCHAR(1139),
		tranid NVARCHAR(138),
		transactionnumber NVARCHAR(138),
		[type] NVARCHAR(8)

	)

INSERT INTO [transaction]

SELECT
	abbrevtype,
	billingaddress,
	billingstatus,
	WFDW.dbo.fn_DateTime(closedate) AS closedate,
	createdby,
	WFDW.dbo.fn_DateTime(createddate) AS createddate,
	currency,
	custbody1,
	custbody_billing_frequency,
	custbody_contract_type,
	custbody_estimated_usage,
	custbody_invoice_type,
	custbody_legacy_trans_number,
	custbody_legacy_trans_type,
	custbody_maximum_usage,
	custbody_member_usage_record,
	custbody_minimum_usage,
	custbody_number_of_periods,
	custbody_sf_opp_18digit_id,
	custbody_sf_opp_number,
	custbody_vp_are_spouces_free,
	WFDW.dbo.fn_DateTime(custbody_vp_legal_date) AS custbody_vp_legal_date,
	custbody_vp_replaced_by,
	custbody_vp_wt_sf_opp_num,
	custbody_vp_wt_so_sub_id,
	custbody_vp_wt_so_sub_name,
	custbody_wt_ns_id,
	daysopen,
	daysoverduesearch,
	deferredrevenue,
	WFDW.dbo.fn_DateTime(duedate) AS duedate,
	WFDW.dbo.fn_DateTime(enddate) AS enddate,
	[entity],
	exchangerate,
	externalid,
	foreignamountpaid,
	foreignamountunpaid,
	foreignpaymentamountunused,
	foreignpaymentamountused,
	foreigntotal,
	id,
	isreversal,
	lastmodifiedby,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	memo,
	nexus,
	number,
	otherrefnum,
	[partner],
	paymentmethod,
	paymentoption,
	posting,
	postingperiod,
	recognizedrevenue,
	recordtype,
	revenuestatusdescr,
	reversal,
	WFDW.dbo.fn_DateTime(reversaldate) AS reversaldate,
	revrecschedule,
	shippingaddress,
	[source],
	WFDW.dbo.fn_DateTime(startdate) AS startdate,
	[status],
	terms,
	WFDW.dbo.fn_DateTime(trandate) AS trandate,
	trandisplayname,
	tranid,
	transactionnumber,
	[type]


FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[transaction]

