
/*check brans table depulicates*/
select id,count(*) from Brands
group by id
having count(*) > 1;

/*check brands null value number*/
select count(id)-count(barcode) as barcodeNullNum, 
       count(id) - count(category) as categoryNullNum,
	   count(id) - count(categoryCode) as categoryCodeNullNum,
	   count(id)-count(cpg) as cpgNullNum, 
	   count(id) - count(topBrand) as topBrandNullNum, 
	   count(id) - count(name) as nameNullNum from Brands;


/*check receipts table depulicates*/
select id,count(*) from Receipts
group by id
having count(*) > 1;
select * from users;
/*check receipts null value number*/
select count(id)-count(bonusPointsEarned) as bounsPointEarnedNullNum,
       count(id)-count(bonusPointsEarnedReason) as bonusPointsEarnedReasonNullNum,
	   count(id)-count(createDate) AS createDateNullNum,
	   count(id)-count(dateScanned) as dataScannedNullNum,
	   count(id)-count(modifyDate) as modifyDateNullNum,
	   count(id)-count(pointsAwardedDate) as pointsAwardedDateNullNum,
	   count(id)-count(purchaseDate) as purchaseDateNullNum,
	   count(id)-count(rewardsReceiptStatus) as rewarReceiptStatusNullNum,
	   count(id)-count(totalSpent) as totalSpentNullNum,
	   count(id)-count(userId) as userIdNullNum
	   from Receipts;

/*check Users table depulicates*/
select id,active, createdDate, lastLogin, role, signUpSource, state, count(*) from Users
group by id,active, createdDate, lastLogin, role, signUpSource, state
having count(*) > 1;

/*check Users null value number*/
select count(id)-count(active) as activeNullNum,
       count(id)-count(createdDate) as createdDateNullNum,
	   count(id)-count(lastLogin) AS lastLoginNullNum,
	   count(id)-count(role) as roleNullNum,
	   count(id)-count(signUpSource) as signUpSourceNullNum,
	   count(id)-count(state) as stateNullNum from Users;