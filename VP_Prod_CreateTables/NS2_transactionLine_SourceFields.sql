USE NS2_VP_Prod_Stage
GO
DROP TABLE #temp
CREATE TABLE #temp(Field nvarchar(256))
INSERT INTO #temp(Field)
EXEC Proc_NS_VP_Prod_Staging_Table_Fields @Tbl = 'transactionLine'
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
	TABLE_NAME = 'transactionLine'
	AND Tc.TYPE_NAME <> 'CLOB'
	--AND OA_PRECISION >= 4000
	AND COLUMN_NAME NOT IN
		(
'actualshipdate',
'catchupperiod',
'commitinventory',
'commitmentfirm',
'custcol_5892_eutriangulation',
'custcol_adjustment_field',
'custcol_adjustment_tax_code',
'custcol_ava_cgstamt',
'custcol_ava_cgstrate',
'custcol_ava_compensationcessamt',
'custcol_ava_compensationcessrate',
'custcol_ava_compulsorycessamt',
'custcol_ava_compulsorycessrate',
'custcol_ava_customdutyrate',
'custcol_ava_customergstin',
'custcol_ava_gross_amount',
'custcol_ava_gross_amount1',
'custcol_ava_handlingamount',
'custcol_ava_handlingamount1',
'custcol_ava_hsncode',
'custcol_ava_igstamt',
'custcol_ava_igstrate',
'custcol_ava_pickup',
'custcol_ava_sgstamt',
'custcol_ava_sgstrate',
'custcol_ava_shippingamount',
'custcol_ava_shippingamount1',
'custcol_ava_shipto_latitude',
'custcol_ava_shipto_longitude',
'custcol_ava_shiptousecode',
'custcol_ava_udf1',
'custcol_ava_udf2',
'custcol_ava_utgstamt',
'custcol_ava_utgstrate',
'custcol_counterparty_vat',
'custcol_country_of_origin_code',
'custcol_country_of_origin_name',
'custcol_emirate',
'custcol_expense_code_of_supply',
'custcol_nature_of_transaction_codes',
'custcol_nondeductible_account',
'custcol_po_line_id',
'custcol_statistical_procedure_purc',
'custcol_statistical_procedure_sale',
'custcol_statistical_value',
'custcol_statistical_value_base_curr',
'documentnumber',
'estimatedamount',
'expectedreceiptdate',
'fulfillable',
'fxamountlinked',
'hasfulfillableitems',
'isfullyshipped',
'isfxvariance',
'isinventoryaffecting',
'kitcomponent',
'mainline',
'oldcommitmentfirm',
'orderpriority',
'price',
'processedbyrevcommit',
'quantitybackordered',
'quantitybilled',
'quantitycommitted',
'quantitypacked',
'quantitypicked',
'quantityrejected',
'quantityshiprecv',
'requestnote',
'revenueelement',
'revrecschedule',
'transactiondiscount',
'transactionlinetype',
'transferorderitemlineid',
'vsoeisestimate'


		)
		--)
	--		AND
	--	COLUMN_NAME NOT IN
	--				(SELECT Field FROM #temp))
--DROP TABLE #temp;
