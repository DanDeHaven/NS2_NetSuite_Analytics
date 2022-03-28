USE NS2_VP_Prod_Stage
GO
DROP TABLE #temp
CREATE TABLE #temp(Field nvarchar(256))
INSERT INTO #temp(Field)
EXEC Proc_NS_VP_Prod_Staging_Table_Fields @Tbl = 'department'
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
	TABLE_NAME = 'department'
	AND Tc.TYPE_NAME <> 'CLOB'
	--AND OA_PRECISION >= 4000
	AND COLUMN_NAME NOT IN
		(
'custrecord_cps_bdc_lastupdatedbyimp_dep',
'externalid'


		)
		--)
	--		AND
	--	COLUMN_NAME NOT IN
	--				(SELECT Field FROM #temp))
--DROP TABLE #temp;
