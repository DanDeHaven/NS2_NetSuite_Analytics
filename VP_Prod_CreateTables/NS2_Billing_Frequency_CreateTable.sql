-- Written 3.25.22
-- By Dan DeHaven
-- Billing Frequency table

USE NS2_VP_Prod_Stage
GO

	IF Object_id('Billing_Frequency') > 0
		DROP TABLE Billing_Frequency

CREATE TABLE Billing_Frequency
	(
		externalid NVARCHAR(255),
		id BIGINT,
		isinactive CHAR(1),
		[name] NVARCHAR(999),
		recordid BIGINT,
		scriptid NVARCHAR(40)
	)

INSERT INTO Billing_Frequency

SELECT
	externalid,
	id,
	isinactive,
	[name],
	recordid,
	scriptid

FROM
	NS2_VP_PROD.[Virgin Pulse].[VP Data Warehouse Integration].[CUSTOMLIST_BILLING_FREQUENCY]

