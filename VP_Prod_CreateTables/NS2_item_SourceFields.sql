USE NS2_VP_Prod_Stage
GO
DROP TABLE #temp
CREATE TABLE #temp(Field nvarchar(256))
INSERT INTO #temp(Field)
EXEC Proc_NS_VP_Prod_Staging_Table_Fields @Tbl = 'item'
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
	TABLE_NAME = 'item'
	AND Tc.TYPE_NAME <> 'CLOB'
	--AND OA_PRECISION >= 4000
	AND COLUMN_NAME NOT IN
		(
'amortizationperiod',
'amortizationtemplate',
'averagecost',
'billexchratevarianceacct',
'billingschedule',
'billpricevarianceacct',
'billqtyvarianceacct',
'countryofmanufacture',
'custitem1',
'custitem_ava_udf1',
'custitem_ava_udf2',
'custitem_code_of_supply',
'custitem_commodity_code',
'custitem_cps_bdc_lastupdatedbyimport',
'custitem_itr_supplementary_unit',
'custitem_itr_supplementary_unit_abbrev',
'custitem_nature_of_transaction_codes',
'custitem_type_of_goods',
'custitem_vp_wt_arr_type',
'custitem_vp_wt_prod_grp_parent',
'custitem_vp_wt_product_family',
'custitem_vp_wt_product_group',
'custitem_vp_wt_recurrence_type',
'custitem_vp_wt_revenue_stream',
'custitem_vp_wt_revenue_type',
'custreturnvarianceaccount',
'deferralaccount',
'deferrevrec',
'dontshowprice',
'effectivebomcontrol',
'enforceminqtyinternally',
'excludefromsitemap',
'expenseaccount',
'expenseamortizationrule',
'fxcost',
'froogleproductfeed',
'handlingcost',
'intercodefrevaccount',
'intercoexpenseaccount',
'intercoincomeaccount',
'isdonationitem',
'isfulfillable',
'isonline',
'isserialitem',
'lastpurchaseprice',
'manufacturer',
'matchbilltoreceipt',
'matrixitemnametemplate',
'matrixtype',
'maxdonationamount',
'maximumquantity',
'minimumquantity',
'mpn',
'nextagcategory',
'nextagproductfeed',
'nopricemessage',
'overallquantitypricingtype',
'preferredlocation',
'pricinggroup',
'printitems',
'prodpricevarianceacct',
'prodqtyvarianceacct',
'purchasedescription',
'purchaseorderamount',
'purchaseorderquantity',
'purchaseorderquantitydiff',
'purchasepricevarianceacct',
'quantitypricingschedule',
'receiptamount',
'receiptquantity',
'receiptquantitydiff',
'relateditemsdescription',
'residual',
'revrecschedule',
'scrapacct',
'searchkeywords',
'shipindividually',
'shippackage',
'shippingcost',
'shoppingdotcomcategory',
'shoppingproductfeed',
'shopzillacategoryid',
'shopzillaproductfeed',
'showdefaultdonationamount',
'sitemappriority',
'stockdescription',
'storedescription',
'storedisplayimage',
'storedisplayname',
'storedisplaythumbnail',
'supplyreplenishmentmethod',
'totalquantityonhand',
'totalvalue',
'transferprice',
'unbuildvarianceaccount',
'upccode',
'usecomponentyield',
'usemarginalrates',
'vendorname',
'vendreturnvarianceaccount',
'weight',
'weightunit',
'wipacct',
'wipvarianceacct',
'yahooproductfeed'


		)
		--)
	--		AND
	--	COLUMN_NAME NOT IN
	--				(SELECT Field FROM #temp))
--DROP TABLE #temp;
