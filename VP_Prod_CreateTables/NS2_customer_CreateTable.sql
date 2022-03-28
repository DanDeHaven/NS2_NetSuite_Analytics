-- Written 3.25.22
-- By Dan DeHaven
-- customer table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('customer') > 0
		DROP TABLE customer

CREATE TABLE customer
	(
		companyname NVARCHAR(83),
		currency BIGINT,
		custentity_ava_exemptcertno NVARCHAR(4000),
		custentity_client_termination_date DATETIME2,
		custentity_collections_notes NVARCHAR(4000),
		custentity_customer_po_number NVARCHAR(4000),
		custentity_f5_cust_bank_details BIGINT,
		custentity_f5_custnumber NVARCHAR(4000),
		custentity_is_parent CHAR(1),
		custentity_market_segment BIGINT,
		custentity_pref_cons_inv CHAR(1),
		custentity_sponsor_id NVARCHAR(4000),
		custentity_vp_sf_18digit_account_id NVARCHAR(4000),
		custentity_vp_wt_ai_id NVARCHAR(4000),
		custentity_vp_wt_connect_partner CHAR(1),
		custentity_vp_wt_market_segment BIGINT,
		custentity_vp_wt_ns_id BIGINT,
		custentity_vp_wt_sf_account_id NVARCHAR(4000),
		custentity_vp_wt_smartreach_customer CHAR(1),
		custentity_vp_wt_sub_market_segment BIGINT,
		custentity_wt_address_book_id BIGINT,
		custentity_wt_address_id BIGINT,
		custentity_wt_sf_an_number NVARCHAR(4000),
		datecreated DATETIME2,
		defaultbillingaddress BIGINT,
		defaultshippingaddress BIGINT,
		entityid NVARCHAR(83),
		id BIGINT,
		parent BIGINT,
		[partner] BIGINT,
		receivablesaccount BIGINT,
		terms BIGINT

	)

INSERT INTO customer

SELECT
	companyname,
	currency,
	custentity_ava_exemptcertno,
	WFDW.dbo.fn_DateTime(custentity_client_termination_date) AS custentity_client_termination_date,
	custentity_collections_notes,
	custentity_customer_po_number,
	custentity_f5_cust_bank_details,
	custentity_f5_custnumber,
	custentity_is_parent,
	custentity_market_segment,
	custentity_pref_cons_inv,
	custentity_sponsor_id,
	custentity_vp_sf_18digit_account_id,
	custentity_vp_wt_ai_id,
	custentity_vp_wt_connect_partner,
	custentity_vp_wt_market_segment,
	custentity_vp_wt_ns_id,
	custentity_vp_wt_sf_account_id,
	custentity_vp_wt_smartreach_customer,
	custentity_vp_wt_sub_market_segment,
	custentity_wt_address_book_id,
	custentity_wt_address_id,
	custentity_wt_sf_an_number,
	WFDW.dbo.fn_DateTime(datecreated) AS datecreated,
	defaultbillingaddress,
	defaultshippingaddress,
	entityid,
	id,
	parent,
	[partner],
	receivablesaccount,
	terms

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[customer]