DECLARE @JSON VARCHAR(MAX)

SELECT @JSON = BulkColumn
FROM OPENROWSET
(BULK 'C:\Users\Alice\Downloads\brands_vaild.json', SINGLE_CLOB)
AS j

Select * into Brands
FROM OPENJSON (@JSON) 
WITH ( id VARCHAR(MAX) '$._id."$oid"', 
       barcode VARCHAR(MAX) '$.barcode',
	   category VARCHAR(MAX) '$.category',
	   categoryCode VARCHAR(MAX) '$.categoryCode',
	   cpg VARCHAR(MAX) '$.cpg."$ref"',
	   topBrand BIT '$.topBrand',
	   [name] VARCHAR(MAX) '$.name'
)


