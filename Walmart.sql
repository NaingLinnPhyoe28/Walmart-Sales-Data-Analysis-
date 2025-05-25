
--Dataset--
Select * From walmart.dbo.[WalmartSalesData.csv]


--Find out Total Sales By City --
Select 
SUM (total) as Total_Sales,
City,
Customer_type
From walmart.dbo.[WalmartSalesData.csv]
Group By
City,
Customer_type
Order By Total_Sales desc


--Count Product Line --
Select 
Distinct (Product_line) As ProductNo From walmart.dbo.[WalmartSalesData.csv]

--Giving Time Date  Range --

Select 
Time ,( CASE 
			WHEN time BETWEEN '00:00:00.00' AND '12:00:00.00' THEN 'Morning'
			WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
			ElSE 'Evening' END) AS Time_Date	
From walmart.dbo.[WalmartSalesData.csv]

--Insert New Time _Date_ Columns --
USE Walmart
Alter Table dbo.[WalmartSalesData.csv] add Shift_Name VARCHAR(20)


--Make the Time _Date active in addcolumn--

Update Walmart.dbo.[WalmartSalesData.csv] 
Set Shift_Name =( CASE 
			WHEN time BETWEEN '00:00:00.00' AND '12:00:00.00' THEN 'Morning'
			WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
			ElSE 'Evening' END) 

--Getting Dayname--

Select Date, DATENAME (WEEKDAY,DATE)  AS Day_Name From walmart.dbo.[WalmartSalesData.csv]

--Addcolumn--

Alter table walmart.dbo.[WalmartSalesData.csv] add Day_Name  Varchar(20)

--Make the Day_Name active in addcolumn--

Update walmart.dbo.[WalmartSalesData.csv]
Set Day_Name = DATENAME (WEEKDAY,DATE);

--Getting MonthName --
Select Date, DateName (MONTH,Date)As Month_Name From walmart.dbo.[WalmartSalesData.csv]

Alter Table walmart.dbo.[WalmartSalesData.csv] add Month_Name Varchar(20)

Update walmart.dbo.[WalmartSalesData.csv]
Set Month_Name =DateName (MONTH,Date);

--Getting Year--

Select Date , DATENAME(YEAR,Date) As Year From Walmart.dbo.[WalmartSalesData.csv]

Alter Table Walmart.dbo.[WalmartSalesData.csv] add Year Varchar(20)

Update Walmart.dbo.[WalmartSalesData.csv] 
Set Year =  DATENAME(YEAR,Date);