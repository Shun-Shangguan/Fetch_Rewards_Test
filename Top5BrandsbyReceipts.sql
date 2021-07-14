with receipts_purchase as (
     select id,barcode,dateScanned from receipts
	 left join purchasehistory on receipts.id = purchasehistory.receiptid)

 
select name,count(*) as number from receipts_purchase
left join brands on brands.barcode = receipts_purchase.barcode
where receipts_purchase.dateScanned > dateadd(month,datediff(month,0,getdate()),0)
group by name
order by number;
