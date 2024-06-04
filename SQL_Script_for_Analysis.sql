--Cleaning the dataset.
--We have the following goals:
--1) Align Date Format
--2) Check for Outliers
--3) Replace -1 with Sent and 1 with received in the Whale_transactions

--Already I (Muna) have modified some of the column names while importing the csv as flat file (Column names such as Date, Value (for Whale_transactions) etc)

--1) Align Date Format
--For Table Price_data:

SELECT * 
FROM Price_data

--1) Align Date Format
ALTER TABLE Price_data
Alter column Date DATE
--This changes the Datatype from its original DATETIME2 to DATE. 
--For confirmation,

Select *
From Price_data

--This to get more info on the datatype of all columns
Select *
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Price_data'

--For Table Whale_Transactions
ALTER TABLE Whale_transactions
Alter column Date DATE

--To check:
Select *
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Whale_transactions'

--3) Replace -1 with Sent and 1 with received in the Whale_transactions
--FIrstly we have to change the datatype of Type from Float to String, NVARCHAR 10 makes sure that the string is max of 10 Characters
ALTER TABLE Whale_transactions
Alter column Type NVARCHAR(10)

--Next Update the column...
UPDATE [dbo].[Whale_transactions]
SET Type = REPLACE(Type,'-1','Sent')

--Do same for other string
UPDATE [dbo].[Whale_transactions]
SET Type = REPLACE(Type,'1','Received')

--To check
Select *
From Whale_transactions