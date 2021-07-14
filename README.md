# Fetch_Rewards_Test

## ER Diagram
![ER](https://user-images.githubusercontent.com/56321534/125555694-7626b74f-4aee-4086-86b2-dd496790f6a3.png)


## Communication with Stakeholders
Hi product manager,

I received three tables(Receipts,Brands,Users) and I have been reviewing these tables in order to answer your business questions. After validation of the JSON files, I created four tables in SQL, including one called "PurchaseHistory" which is nested in Receipts table. Then I run SQL queries to check the quality of data, I found out some data quality issues: 

1. Duplicates in Users table
2. Date format should be specific like "DD/MM/YYYY" or "MM/DD/YYYY"

Could you check the Users table which also inclues "FETCH-STAFF" rather than only "CONSUMER" in "role" column, and the dataformat in date?

Let me know if you have any questions.

Best,
Shun
