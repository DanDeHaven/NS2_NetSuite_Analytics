--Written on 2.1.2021
--By Dan DeHaven
--Returns the tables and columns in all the ODBC connected NetSuite Linked Server

USE NS2_VP_Prod_Stage
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

	IF Object_id('_NetSuite_TableColumns') > 0
		DROP TABLE _NetSuite_TableColumns;

	IF Object_id('Proc_Load_NetSuite_TableColumns') > 0
		DROP PROCEDURE Proc_Load_NetSuite_TableColumns;
GO

CREATE PROC Proc_Load_NetSuite_TableColumns
AS
BEGIN

	SET NOCOUNT ON;

	IF Object_id('_NetSuite_TableColumns') > 0
		DROP TABLE _NetSuite_TableColumns;

CREATE TABLE 
	dbo._NetSuite_TableColumns
	(
	TABLE_QUALIFIER nvarchar(256),
	TABLE_OWNER nvarchar(256),
	TABLE_NAME nvarchar(256) NOT NULL,
	COLUMN_NAME nvarchar(256) NOT NULL,
	DATA_TYPE INT NOT NULL,
	[TYPE_NAME] nvarchar(256) NOT NULL,
	OA_LENGTH INT,
	OA_PRECISION INT,
	OA_RADIX INT,
	OA_SCALE INT,
	OA_NULLABLE INT,
	OA_SCOPE INT,
	OA_USERDATA nvarchar(512),
	OA_SUPPORT nvarchar(256),
	PSEUDO_COLUMN INT,
	OA_COLUMNTYPE INT,
	REMARKS nvarchar(512)
	)
INSERT INTO
	_NetSuite_TableColumns
	(
	TABLE_QUALIFIER,
	TABLE_OWNER,
	TABLE_NAME,
	COLUMN_NAME,
	DATA_TYPE,
	[TYPE_NAME],
	OA_LENGTH,
	OA_PRECISION,
	OA_RADIX,
	OA_SCALE,
	OA_NULLABLE,
	OA_SCOPE,
	OA_USERDATA,
	OA_SUPPORT,
	PSEUDO_COLUMN,
	OA_COLUMNTYPE,
	REMARKS
	)
SELECT
	TABLE_QUALIFIER,
	TABLE_OWNER,
	TABLE_NAME,
	COLUMN_NAME,
	DATA_TYPE,
	[TYPE_NAME],
	OA_LENGTH,
	OA_PRECISION,
	OA_RADIX,
	OA_SCALE,
	OA_NULLABLE,
	OA_SCOPE,
	OA_USERDATA,
	OA_SUPPORT,
	PSEUDO_COLUMN,
	OA_COLUMNTYPE,
	REMARKS
FROM
	[NS2_VP_PROD].[SCHEMA].[SYSTEM].OA_COLUMNS
END