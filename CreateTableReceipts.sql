DECLARE @JSON VARCHAR(MAX)

SELECT @JSON = BulkColumn
FROM OPENROWSET
(BULK 'C:\Users\Alice\Downloads\receipts_valid.json', SINGLE_CLOB)
AS j

--SELECT ISJSON(@JSON)


SELECT * INTO Receipts 
FROM OPENJSON (@JSON, '$')
WITH (id VARCHAR(MAX) '$._id."$oid"',
		bonusPointsEarned INT '$.bonusPointsEarned',
		bonusPointsEarnedReason VARCHAR(MAX) '$.bonusPointsEarnedReason',
		createDate VARCHAR(MAX) '$.createDate."$date"',
		dateScanned VARCHAR(MAX) '$.dateScanned."$date"',
		finishedDate VARCHAR(MAX) '$.finishedDate."$date"',
		modifyDate VARCHAR(MAX) '$.modifyDate."$date"',
		pointsAwardedDate VARCHAR(MAX) '$.pointsAwardedDate."$date"',
		pointsEarned REAL '$.pointsEarned',
		purchaseDate VARCHAR(MAX) '$.purchaseDate."$date"',
		purchasedItemCount INT '$.purchasedItemCount',
		rewardsReceiptStatus VARCHAR(MAX) '$.rewardsReceiptStatus',
		totalSpent MONEY '$.totalSpent',
		userId VARCHAR(MAX) '$.userId'
		)

		


