--Generic Question--

--How many unique City does the data have?--

Select Distinct (City) As Unique_City From Walmart.Dbo.[WalmartSalesData.csv]

--In which city each branch--

Select
Branch,Count(Branch) As No_Branch,
City From Walmart.Dbo.[WalmartSalesData.csv]
Group By 
City,
Branch
Order By Count(Branch) desc

--ProductQuestion--


--What is the most common payment method--
Select 
Payment,
Count(Payment) as Cnt
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Payment
Order by Count(Payment) desc


--What is the most selling Product Line---

Select 
Product_line,
Count(Product_Line) As Cnt 
From Walmart.Dbo.[WalmartSalesData.csv]
Group By 
Product_line
Order By 
Count(Product_Line) Desc


-- Total Revenue By Month --

Select 
Month_Name,
Round(SUM(Total),1) As Revenue
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Month_Name

--Month has largest COGS --

Select 
Month_Name,
Round(sum(cogs),2)as COGS_AMT
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Month_Name
Order By Round(sum(cogs),2) desc;

--Produt has largets Revenue--

Select 
Product_line,
Round(sum(Total),2)as Revenue 
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Product_line
Order By Round(sum(Total),2) Desc;

--City has largest Revenue--
Select
City,
Round(sum(Total),2)as VAT 
From Walmart.Dbo.[WalmartSalesData.csv]
Group By City
Order By Round(sum(Total),2)Desc;

--City has largest VAT--

--Which branch sold more products than avg product sold ?

Select branch,
SUM (Quantity) as sold_qty
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Branch
Having SUM (Quantity) > (Select AVG(Quantity)From Walmart.Dbo.[WalmartSalesData.csv]);

--What is the most product_line by gender?--

Select 
Product_line ,
Gender,
count(Gender) as Gender_Cnt
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Product_line,Gender
Order By count(Gender) desc

--Average Rating of each product?--

Select product_line,
(ROUND(Avg(Rating),1)) as Avg_rating 
From Walmart.Dbo.[WalmartSalesData.csv]
Group By product_line
Order By (ROUND(Avg(Rating),2)) Desc


--Sales Questions---


--Numbers of Sales made in each time of the day per weekday--

Select
Shift_Name,
Count(Invoice_ID) As Sales_Count
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By Shift_Name
Order By Count(Invoice_ID)  desc

--Which customer types bring the most revenue ?--

select
Customer_type,
(Round(Sum(Total),2)) As Revenue
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By 
Customer_type
Order By 
(Round(Sum(Total),2)) desc

--Which Cities has the largest % of tax (VAT)?--

Select City ,
(ROUND(avg(Tax_5),2)) As Total_Tax
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By City
Order By Total_Tax desc


--Which Customer_Type pays the most VAT?--

Select Customer_type,
(ROUND(avg(Tax_5),2))as VAT
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By 
Customer_type
Order By 
VAT Desc

---Customers Questions--

--How many unqiue customerntype does the have data have?--

Select
Distinct(Customer_Type) From Walmart.Dbo.[WalmartSalesData.csv] 

--How many unique payment menthod data have?--

Select 
Distinct(Payment) From Walmart.Dbo.[WalmartSalesData.csv] 

--What are the most common customer_Type--

Select Customer_type ,
Count (Customer_type) As Customer_Cnt
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By Customer_type
Order By Customer_Cnt Desc

--What is the most gender of customer?--

Select
Gender, 
Count(Invoice_ID) As Cust_Cnt
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By Gender
Order By Cust_Cnt Desc

--Customer's Gender by branch --

Select Branch,
Gender,
Count(Invoice_ID) As Cust_Cnt
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By Branch,Gender
Order By Cust_Cnt Desc

--Which time of the day customer give the most rating?--

Select Top 5
Customer_type,
Shift_Name,(Round(avg(Rating),2)) As AVg_rating
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By Customer_type,Shift_Name
Order By AVg_rating desc

----Which time of the day customer give the most rating by branch ?--

Select 
Customer_type,
Branch,
Shift_Name,(Round(avg(Rating),2)) As AVg_rating
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By Customer_type,Shift_Name,Branch
Order By AVg_rating desc

--Which day of the week has the most avg rating--

Select 
day_name, 
(Round (Avg(Rating),2)) as Avg_Rating
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By 
day_name
Order By Avg_Rating desc

--Which day of the week has the most avg rating by branch?--

Select 
day_name, 
Branch,
(Round (Avg(Rating),2)) as Avg_Rating
From Walmart.Dbo.[WalmartSalesData.csv] 
Group By 
day_name,
Branch
Order By Avg_Rating desc

--Calassify the product line's average sales against the overall average sales--

SELECT 
    Product_Line,
    ROUND(AVG(Total), 2) AS Avg_Sales,
    CASE 
        WHEN ROUND(AVG(Total), 2) > 
             (SELECT (ROUND(AVG(Total), 2)) FROM Walmart.Dbo.[WalmartSalesData.csv]) 
        THEN 'Good'  
        ELSE 'Bad' 
    END AS Product_Type
FROM Walmart.Dbo.[WalmartSalesData.csv]
GROUP BY Product_Line
ORDER BY Avg_Sales;

--Which day of the week has the best avg.rating --

Select
Day_Name,
(Round(Avg(Rating),2)) As Avg_Rating
From Walmart.Dbo.[WalmartSalesData.csv]
Group By Day_Name
Order By Avg_Rating desc

--Which Customer Type buy the most --

Select Customer_Type,
sum(Total) As Sales
From Walmart.Dbo.[WalmartSalesData.csv]
Group By 
Customer_type
Order By Sales desc
