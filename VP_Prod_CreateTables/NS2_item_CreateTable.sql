-- Written 3.25.22
-- By Dan DeHaven
-- Item table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Item') > 0
		DROP TABLE Item

CREATE TABLE Item
	(
		assetaccount BIGINT,
		atpmethod NVARCHAR(30),
		class BIGINT,
		cost BIGINT,
		costingmethod NVARCHAR(16),
		costingmethoddisplay NVARCHAR(4000),
		createddate DATETIME2,
		createexpenseplanson BIGINT,
		custitem_ava_taxcode NVARCHAR(4000),
		custitem_vp_wt_department NVARCHAR(4000),
		custitem_vp_wt_ns_id BIGINT,
		deferredrevenueaccount BIGINT,
		department BIGINT,
		[description] NVARCHAR(4000),
		displayname NVARCHAR(4000),
		externalid NVARCHAR(255),
		fullname NVARCHAR(550),
		gainlossaccount BIGINT,
		generateaccruals CHAR(1),
		id BIGINT,
		includechildren NVARCHAR(1),
		incomeaccount BIGINT,
		isinactive CHAR(1),
		islotitem CHAR(1),
		itemid NVARCHAR(250),
		itemtype NVARCHAR(11),
		lastmodifieddate DATETIME2,
		[location] BIGINT,
		parent BIGINT,
		subsidiary NVARCHAR(4000),
		subtype NVARCHAR(10)
	)

INSERT INTO Item

SELECT
	assetaccount,
	atpmethod,
	class,
	cost,
	costingmethod,
	costingmethoddisplay,
	WFDW.dbo.fn_DateTime(createddate) AS createddate,
	createexpenseplanson,
	custitem_ava_taxcode,
	custitem_vp_wt_department,
	custitem_vp_wt_ns_id,
	deferredrevenueaccount,
	department,
	[description],
	displayname,
	externalid,
	fullname,
	gainlossaccount,
	generateaccruals,
	id,
	includechildren,
	incomeaccount,
	isinactive,
	islotitem,
	itemid,
	itemtype,
	WFDW.dbo.fn_DateTime(lastmodifieddate) AS lastmodifieddate,
	[location],
	parent,
	subsidiary,
	subtype

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[item]