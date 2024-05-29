SELECT TOP (1000) [Date]
      ,[Price]
      ,[Transaction_count]
      ,[Unique_addresses]
      ,[Total_fees_USD]
  FROM [BtcData].[dbo].[PriceData]

 SELECT TOP (1000) [Address]
      ,[Type]
      ,[Date]
      ,[Tx_id]
      ,[Value]
  FROM [BtcData].[dbo].[WhaleTxData]
  -- If you need to refresh the table previews you can always come up here and execute these... Note they have been updated due to the cleaning steps.

  -- Cleaning the dataset, we have the following goals:
  -- 1) Align date format
  -- 2) Round float numbers to 2 decimal palces
  -- 3) Replace -1 with Sell and 1 with Buy in the WhaleTxData

  -- 1) Align date format for dbo.PriceData
  ALTER TABLE [BtcData].[dbo].PriceData
  ALTER COLUMN Date DATE

  -- 2a) Round float numbers to 2 decimal places for Price in dbo.PriceData
  ALTER TABLE [BtcData].[dbo].[PriceData] 
  ALTER COLUMN Price decimal(10,2)

  -- 2b) Round float numbers to 2 decimal places for Total_fees in dbo.PriceData
  ALTER TABLE [BtcData].[dbo].[PriceData]
  ALTER COLUMN Total_fees_USD decimal(10,2)

  -- *) Let's make sure we align the date for the WhaleTxData table
  ALTER TABLE [BtcData].[dbo].[WhaleTxData]
  ALTER COLUMN Time DATE

  --3) Replace -1 with Sell and 1 with Buy in the WhaleTxData
  --Firstly we have to change the datatype of Type from Float to String, NVARCHAR 10 makes sure that the string is max of 10 Characters
  ALTER TABLE [BtcData].[dbo].[WhaleTxData]
  Alter COLUMN Type NVARCHAR(10)

  --Next Update the column...
  UPDATE [BtcData].[dbo].[WhaleTxData]
  SET Type = REPLACE(Type,'-1','Sell')

  --Do same for other string
  UPDATE [BtcData].[dbo].[WhaleTxData]
  SET Type = REPLACE(Type,'1','Buy')

  -- Since we aligned the date in step *), the 'Time' column should be chenged to 'Date' in order to show relationship between the tables.
  EXEC sp_rename 'BtcData.dbo.WhaleTxData.Time',  'Date', 'COLUMN';
 
 