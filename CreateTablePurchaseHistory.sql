DECLARE @JSON VARCHAR(MAX)

SELECT @JSON = BulkColumn
FROM OPENROWSET
(BULK 'C:\Users\Alice\Downloads\receipts_valid.json', SINGLE_CLOB)
AS j

--SELECT ISJSON(@JSON)

SELECT receiptId, barcode, [description], finalPrice, itemPrice, 
	needsFetchReview, partnerItemId, preventTargetGapPoints, quantityPurchased, 
	userFlaggedBarcode, userFlaggedNewItem, userFlaggedPrice, userFlaggedQuantity
INTO PurchaseHistory
FROM OPENJSON (@JSON, '$')
WITH (receiptId VARCHAR(MAX) '$._id."$oid"',
		rewardsReceiptItemList NVARCHAR(MAX) '$.rewardsReceiptItemList' AS JSON
)
CROSS APPLY OPENJSON (rewardsReceiptItemList, '$')
WITH (barcode VARCHAR(MAX) '$.barcode',
		[description] VARCHAR(MAX) '$.description',
		finalPrice MONEY '$.finalPrice',
		itemPrice MONEY '$.itemPrice',
		needsFetchReview BIT '$.needsFetchReview',
		partnerItemId VARCHAR(MAX) '$.partnerItemId',
		preventTargetGapPoints BIT '$.preventTargetGapPoints',
		quantityPurchased INT '$.quantityPurchased',
		userFlaggedBarcode VARCHAR(MAX) '$.userFlaggedBarcode',
		userFlaggedNewItem BIT '$.userFlaggedNewItem',
		userFlaggedPrice MONEY '$.userFlaggedPrice',
		userFlaggedQuantity INT '$.userFlaggedQuantity'
		)