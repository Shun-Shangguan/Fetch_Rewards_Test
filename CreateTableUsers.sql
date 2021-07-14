DECLARE @JSON VARCHAR(MAX)

SELECT @JSON = BulkColumn
FROM OPENROWSET
(BULK 'C:\Users\Alice\Downloads\users_valid.json', SINGLE_CLOB)
AS j

SELECT * FROM OPENJSON (@JSON, '$')
WITH (id VARCHAR(MAX) '$._id."$oid"',
		active BIT '$.active',
		createdDate VARCHAR(MAX) '$.createdDate."$date"',
		lastLogin VARCHAR(MAX) '$.lastLogin."$date"',
		[role] VARCHAR(MAX) '$.role',
		signUpSource VARCHAR(MAX) '$.signUpSource',
		[state] VARCHAR(MAX) '$.state'
		)

SELECT id, active, createdDate, lastLogin, [role], signUpSource, [state]
INTO Users
	FROM OPENJSON (@JSON, '$')
	WITH (id VARCHAR(MAX) '$._id."$oid"',
		active BIT '$.active',
		createdDate VARCHAR(MAX) '$.createdDate."$date"',
		lastLogin VARCHAR(MAX) '$.lastLogin."$date"',
		[role] VARCHAR(MAX) '$.role',
		signUpSource VARCHAR(MAX) '$.signUpSource',
		[state] VARCHAR(MAX) '$.state'
		)



