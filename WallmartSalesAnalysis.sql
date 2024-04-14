-- creating data base --
CREATE DATABASE IF NOT EXISTS salesanalysis;
USE salesanalysis;
-- creating table --
CREATE TABLE SalesData (
    InvoiceID VARCHAR(50),
    Branch CHAR(1),
    City VARCHAR(50),
    CustomerType VARCHAR(50),
    Gender VARCHAR(50),
    ProductLine VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Tax5Percent DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Date DATE,
    Time TIME,
    Payment VARCHAR(50),
    COGS DECIMAL(10, 2),
    GrossMarginPercentage DECIMAL(5, 2),
    GrossIncome DECIMAL(10, 2),
    Rating DECIMAL(5, 2)
);

SELECT * FROM SalesData LIMIT 10;
-- --------------Listing Unique Values for Categorical Columns-------------------------  --
SELECT DISTINCT Branch FROM SalesData; -- A B C 
SELECT DISTINCT City FROM SalesData; -- Yangon , Naypyitaw , Mandalay
SELECT DISTINCT CustomerType FROM SalesData; -- Member , Normal
SELECT DISTINCT Gender FROM SalesData; -- female , male
SELECT DISTINCT ProductLine FROM SalesData; -- Health and beauty,Electronic accessories,Home and lifestyle,Sports and travel,Food and beverages,Fashion accessories
SELECT DISTINCT Payment FROM SalesData; -- Ewallet, cash , credit card

-- ----- chechking for any missing values --------------
SELECT COUNT(*) AS MissingInvoiceID
FROM SalesData
WHERE InvoiceID IS NULL;

SELECT COUNT(*) AS MissingTime
FROM SalesData
WHERE Time IS NULL;

-- examine data range ( time ) -----------------------------
SELECT MIN(Date) AS EarliestDate, MAX(Date) AS LatestDate
FROM SalesData;
-- 2019-01-01 to 2019-03-30

-- Summary Statistics for Numeric Columns --------------------
SELECT
    MIN(UnitPrice) AS MinUnitPrice,
    MAX(UnitPrice) AS MaxUnitPrice,
    AVG(UnitPrice) AS AvgUnitPrice,
    MIN(Quantity) AS MinQuantity,
    MAX(Quantity) AS MaxQuantity,
    AVG(Quantity) AS AvgQuantity,
    MIN(Total) AS MinTotal,
    MAX(Total) AS MaxTotal,
    AVG(Total) AS AvgTotal
FROM SalesData;

-- ---------------------- DATA ANLYSIS ------------------------

-- 1 Sales Performance Analysis ---------------------
-- 1.1 Branch Performance: Total sales revenue and quantity sold for each branch
SELECT 
    Branch,
    SUM(Total) AS TotalSalesRevenue,
    SUM(Quantity) AS TotalQuantitySold
FROM SalesData
GROUP BY Branch
order by TotalSalesRevenue ;

-- 1.2 City Analysis: City with the highest and lowest sales revenue --------
SELECT 
    City,
    SUM(Total) AS TotalSalesRevenue
FROM SalesData
GROUP BY City
ORDER BY TotalSalesRevenue DESC
LIMIT 1; -- City with the highest sales revenue

SELECT 
    City,
    SUM(Total) AS TotalSalesRevenue
FROM SalesData
GROUP BY City
ORDER BY TotalSalesRevenue ASC
LIMIT 1; -- City with the lowest sales revenue

-- 1.3 Product Line Insights: Total sales revenue and quantity sold for each product line
SELECT 
    ProductLine,
    SUM(Total) AS TotalSalesRevenue,
    SUM(Quantity) AS TotalQuantitySold
FROM SalesData
GROUP BY ProductLine
order by TotalSalesRevenue desc ;




-- 2 Daily Sales Performance: What are the peak sales days of the week? -----------
SELECT 
    DAYNAME(Date) AS DayOfWeek,
    SUM(Total) AS DailySalesRevenue
FROM SalesData
GROUP BY DayOfWeek
ORDER BY DailySalesRevenue DESC;



-- 3 Financial Analysis -------------------------------------------------
-- 3.1 Tax Analysis: Total tax amount collected and its percentage of total revenue
SELECT 
    SUM(Tax5Percent) AS TotalTaxCollected,
    SUM(Total) AS TotalRevenue,
    SUM(Tax5Percent) / SUM(Total) * 100 AS TaxPercentage
FROM SalesData;
-- 3.2 Profit Margin Calculation: Gross margin percentage for each product line
 SELECT 
    ProductLine,
    AVG(GrossMarginPercentage) AS AvgGrossMarginPercentage
FROM SalesData
GROUP BY ProductLine;



-- 4 Customer Behavior --------------------------------------------
-- 4.1 Payment Method Preference: Most commonly used and highest revenue-generating payment method
SELECT 
    Payment,
    COUNT(*) AS NumTransactions,
    SUM(Total) AS TotalRevenue
FROM SalesData
GROUP BY Payment
ORDER BY NumTransactions DESC, TotalRevenue DESC;
-- 4.2 	Rating Analysis: Correlation between product ratings and sales revenue
SELECT 
    ROUND(Rating, 1) AS ProductRating,
    COUNT(*) AS NumTransactions,
    SUM(Total) AS TotalRevenue
FROM SalesData
GROUP BY ProductRating
ORDER BY ProductRating;




