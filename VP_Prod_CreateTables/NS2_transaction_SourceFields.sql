USE NS2_VP_Prod_Stage
GO
DROP TABLE #temp
CREATE TABLE #temp(Field nvarchar(256))
INSERT INTO #temp(Field)
EXEC Proc_NS_VP_Prod_Staging_Table_Fields @Tbl = 'transaction'
SELECT
	WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ',' AS FieldNames,
	CASE
		WHEN Tc.TYPE_NAME = 'TIMESTAMP' THEN 'WFDW.dbo.fn_DateTime(' + WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ') AS ' +  WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) +','
		ELSE WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ','
	END AS ColumnText,
	'''' + WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + '''' + ',' AS ColumnSELECTText,
	WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ' ' +
	CASE
		WHEN Tc.TYPE_NAME = 'INTEGER' THEN 'INT'
		WHEN Tc.TYPE_NAME = 'NUMBER' AND Tc.OA_SCALE <> 0 THEN 'FLOAT'
		WHEN Tc.TYPE_NAME = 'SMALLINT' THEN 'SMALLINT'
		WHEN Tc.TYPE_NAME = 'BIGINT' THEN 'BIGINT'
		WHEN Tc.TYPE_NAME = 'DOUBLE' THEN 'BIGINT'
		WHEN Tc.TYPE_NAME = 'CLOB' THEN 'CLOB'
		WHEN Tc.TYPE_NAME = 'TIMESTAMP' THEN 'DATETIME2'
		WHEN Tc.TYPE_NAME = 'CHAR' THEN 'CHAR(' + CAST(Tc.OA_PRECISION AS nvarchar) + ')'
		WHEN Tc.TYPE_NAME = 'VARCHAR2' THEN 'NVARCHAR(' + CAST(Tc.OA_PRECISION AS nvarchar) + ')'
		ELSE 'Unknown'
	END + ',' AS TableText,
	'TARGET.' + WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ' = ' +'SOURCE.' + WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ',' AS [UpdateText],
	'SOURCE.' + WFDW.dbo.fn_ReservedNames(Tc.COLUMN_NAME) + ',' AS [InsertText]

FROM
	NS2_VP_Prod_Stage.dbo._NetSuite_TableColumns Tc
WHERE
	TABLE_NAME = 'transaction'
	AND Tc.TYPE_NAME <> 'CLOB'
	--AND OA_PRECISION >= 4000
	AND COLUMN_NAME NOT IN
		(
'accountbasednumber',
'actionitem',
'actualshipdate',
'altsalestotal',
'approvalstatus',
'balsegstatus',
'bulkprocsubmission',
'buyingreason',
'buyingtimeframe',
'custbody_11187_pref_entity_bank',
'custbody_11724_bank_fee',
'custbody_11724_pay_bank_fees',
'custbody_2663_reference_num',
'custbody_4110_customregnum',
'custbody_9997_autocash_assertion_field',
'custbody_9997_is_for_ep_dd',
'custbody_9997_is_for_ep_eft',
'custbody_9997_pfa_record',
'custbody_adjustment_journal',
'custbody_approved_date_stamp',
'custbody_approved_to_be_paid',
'custbody_ava_billto_latitude',
'custbody_ava_billto_longitude',
'custbody_ava_billtousecode',
'custbody_ava_customduty',
'custbody_ava_customergstin',
'custbody_ava_discountamount',
'custbody_ava_discountmapping',
'custbody_ava_handlingamount',
'custbody_ava_handlingamount1',
'custbody_ava_is_sellerimporter',
'custbody_ava_pickup',
'custbody_ava_scis_trans_flag',
'custbody_ava_shippingamount',
'custbody_ava_shippingamount1',
'custbody_ava_shippingtaxinclude',
'custbody_ava_shipto_latitude',
'custbody_ava_shipto_longitude',
'custbody_ava_shiptousecode',
'custbody_ava_suspendtaxcall',
'custbody_ava_taxcredit',
'custbody_ava_taxdateoverride',
'custbody_ava_taxinclude',
'custbody_ava_taxoverride',
'custbody_ava_taxoverridedate',
'custbody_avalara_status',
'custbody_avashippingcode',
'custbody_bank_information',
'custbody_cash_register',
'custbody_consolidated_parent',
'custbody_counterparty_vat',
'custbody_country_of_origin',
'custbody_cps_bdc_amount',
'custbody_cps_bdc_bank_account',
'custbody_cps_bdc_is_created_from_bdc',
'custbody_cps_bdc_lastupdatedbyimport',
'custbody_cps_bdc_mm_type',
'custbody_cps_bdc_online_sentpay_info',
'custbody_cps_bdc_paid_via_bdc',
'custbody_cps_bdc_paidbillupdated',
'custbody_cps_bdc_payment_account',
'custbody_cps_bdc_payment_method',
'custbody_current_usgae_quantity',
'custbody_date_lsa',
'custbody_date_of_taxable_supply',
'custbody_delivery_terms',
'custbody_esc_campaign_category',
'custbody_f5_cms_orderid',
'custbody_internal_comment',
'custbody_invoice_exported',
'custbody_itr_doc_number',
'custbody_itr_nexus',
'custbody_link_lsa',
'custbody_link_name_lsa',
'custbody_marked_approved_by',
'custbody_marked_ready_by',
'custbody_mode_of_transport',
'custbody_nexus_notc',
'custbody_nondeductible_processed',
'custbody_nondeductible_ref_genjrnl',
'custbody_nondeductible_ref_tran',
'custbody_notc',
'custbody_parent_contract',
'custbody_parent_level_minimum',
'custbody_payment_method',
'custbody_ready_for_payment',
'custbody_ready_for_payment_date',
'custbody_refno_originvoice',
'custbody_regime_code',
'custbody_regime_code_of_supply',
'custbody_report_timestamp',
'custbody_transaction_region',
'custbody_vp_company_vat',
'email',
'employee',
'entitystatus',
'estimatedbudget',
'expectedclosedate',
'fax',
'firmed',
'forecasttype',
'fulfillmenttype',
'incoterm',
'intercostatus',
'intercotransaction',
'isbudgetapproved',
'isfinchrg',
'journaltype',
'linkedtrackingnumberlist',
'memdoc',
'message',
'nextapprover',
'nextbilldate',
'opportunity',
'ordpicked',
'ordreceived',
'paymenthold',
'printedpickingticket',
'probability',
'projectedtotal',
'rangehigh',
'rangelow',
'revision',
'revrecenddate',
'revrecstartdate',
'salesreadiness',
'shipcarrier',
'shipcomplete',
'shipdate',
'sourcetransaction',
'title',
'tosubsidiary',
'trackingnumberlist',
'transferlocation',
'typebaseddocumentnumber',
'useitemcostastransfercost',
'userevenuearrangement',
'visibletocustomer',
'void',
'voided',
'website',
'weightedtotal',
'winlossreason'

		)
		
			AND
		COLUMN_NAME NOT IN
					(SELECT Field FROM #temp)
--DROP TABLE #temp;
