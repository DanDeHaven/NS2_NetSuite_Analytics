USE NS2_VP_Prod_Stage
GO

CREATE PROCEDURE Proc_NS_VP_Prod_Staging_Table_Fields @Tbl nvarchar(256)

AS
BEGIN
	DECLARE @Field nvarchar(256);

	SELECT 
		COLUMN_NAME

	FROM 
		INFORMATION_SCHEMA.COLUMNS

	WHERE 
		TABLE_NAME = @Tbl

	ORDER BY ORDINAL_POSITION

	RETURN @Field
END;
GO