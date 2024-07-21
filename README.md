# BITCOIN ANALYSIS

### Project Overview
This data analysis project aims to provide insights into the bitcoin open and close price data and the whale transaction from 1st January 2022 to 3rd March 2024. By comparing the bear and bull run and the trend analyses, we seek to identify the  Relative strength index (RSI), key active whale addresses, and total address volume. We gain a deeper understanding of the leading cause of bitcoin rise and fall. 
### Data Sources
**Price Data**: The dataset used for this analysis is the **'Price_data.csv'** file containing detailed information about each daily price, transaction count, and total USD made by unique addresses.

**Whale transaction**: The dataset used in this analysis is the **'Whale_transaction.csv'** file containing information about active whale addresses and their key players, transaction ID, and value. 
### Tools
- Python, Bash Script, Jq: Data scrapping 
- MYSQL - Data cleaning and Analysis
- PowerBI - Creating visualization
- Github - Documentation

### Data Cleaning/Preparation
  In the initial data preparation phase, we performed the following tasks:
  
    1. Data loading and inspection
    
    2. Align date format
    
    3. Check for outliers
    
    4. Replace -1 with Sent and 1 with received in the whale_transactions
    
    5. Change datatype from float to string
    
    6. Data cleaning and formatting
### Exploratory Data Analysis
EDA Involved exploring the price_data and whale_transaction to answer key questions, such as:
- What are the most active whale addresses by transaction volume?
- What is the total volume of whale transactions over a while?
- What are the whale transaction sizes?
- What is the relationship between transaction size and the total volume of transactions
- Show the cumulative volume of whale transactions over time
- Show the relationship between whale transaction volumes and BTC price data.
- What are the seasonal patterns in BTC prices, weekly and monthly?
- How does BTC price change over time?
- What are the moving price averages that smooth out price data and identify trends over different periods?
- What is the volume of BTC traded over different periods
- How to use time series forecasting techniques to predict future BTC prices.
- Using RSI to identify overbought or oversold conditions

### Data Analysis
```sql
SELECT * 
FROM Price_data

--1) Align Date Format
ALTER TABLE Price_data
Alter column Date DATE

Select *
From Price_data

Select *
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Price_data'

--2) For Table Whale_Transactions
ALTER TABLE Whale_transactions
Alter column Date DATE

Select *
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Whale_transactions'

--3) Replace -1 with Sent and 1 with received in the Whale_transactions
--FIrstly we have to change the datatype of Type from Float to String
ALTER TABLE Whale_transactions
Alter column Type NVARCHAR(10)

UPDATE [dbo].[Whale_transactions]
SET Type = REPLACE(Type,'-1','Sent')

UPDATE [dbo].[Whale_transactions]
SET Type = REPLACE(Type,'1','Received')
```

```sql


  


 
       
