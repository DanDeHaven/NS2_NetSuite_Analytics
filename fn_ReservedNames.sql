--Written 3.21.2021 by Dan DeHaven
--
--
USE WFDW
GO
	IF Object_id('fn_ReservedNames') > 0
		DROP FUNCTION fn_ReservedNames;
GO

CREATE FUNCTION dbo.fn_ReservedNames (@FieldName AS VARCHAR(120))

RETURNS VARCHAR(120)
AS
BEGIN
	DECLARE @DT VARCHAR(120)
	SET @DT = 
		CASE
			WHEN @FieldName 
				IN(
					'DESCRIPTION',
					'ENTITY_ID',
					'ENTITY',
					'MESSAGE',
					'NAME',
					'START_DATE',
					'END_DATE',
					'LANGUAGE',
					'LOCATION',
					'MONTH',
					'NAME',
					'PARTNER',
					'QUARTER',
					'SOURCE',
					'STATE',
					'STATUS',
					'TRANSACTION',
					'TYPE',
					'TYPE_ID',
					'TYPE_NAME',
					'URL',
					'WEIGHT',
					'YEAR'

					) THEN '[' + @FieldName + ']'
			ELSE @FieldName
		END
	RETURN @DT
END;
