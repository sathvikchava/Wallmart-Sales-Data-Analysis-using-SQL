# Wallmart-Sales-Data-Analysis-using-SQL
Explore sales data insights with this SQL data analysis project. Analyze sales performance, customer behavior, and financial metrics using SQL queries. Discover trends, uncover patterns, and gain valuable insights to inform business decisions
## Overview
This repository contains a data analysis project focused on exploring sales data using SQL queries. The project aims to analyze sales performance, customer behavior, and financial metrics to gain valuable insights that can inform business decisions. The dataset used in this analysis includes information on sales transactions, customer demographics, product details, and more.

# Data Analysis
## Data Preparation
In this phase, the dataset was prepared for analysis. This involved setting up the database, importing the dataset, and performing basic data cleaning tasks.
### Meta data 
| Column Name          | Data Type       | Description                        |
|----------------------|-----------------|------------------------------------|
| InvoiceID            | VARCHAR(50)     | Unique identifier for each invoice |
| Branch               | CHAR(1)         | Branch identifier                  |
| City                 | VARCHAR(50)     | City where the transaction occurred|
| CustomerType         | VARCHAR(50)     | Type of customer (e.g., new, returning) |
| Gender               | VARCHAR(50)     | Gender of the customer            |
| ProductLine          | VARCHAR(100)    | Type of product line              |
| UnitPrice            | DECIMAL(10, 2)  | Price per unit                    |
| Quantity             | INT             | Quantity sold                     |
| Tax5Percent          | DECIMAL(10, 2)  | Tax amount (5% of total)          |
| Total                | DECIMAL(10, 2)  | Total amount including tax        |
| Date                 | DATE            | Date of the transaction           |
| Time                 | TIME            | Time of the transaction           |
| Payment              | VARCHAR(50)     | Payment method used               |
| COGS                 | DECIMAL(10, 2)  | Cost of goods sold                |
| GrossMarginPercentage| DECIMAL(5, 2)   | Gross margin percentage           |
| GrossIncome          | DECIMAL(10, 2)  | Gross income                      |
| Rating               | DECIMAL(5, 2)   | Product rating given by customer  |


##  Analysis
The analysis phase involved querying the dataset using SQL to answer various questions and uncover insights. Here's an overview of the analyses conducted:

### Sales Performance Analysis:
Branch Performance: Total sales revenue and quantity sold for each branch.
City Analysis: City with the highest and lowest sales revenue.
Product Line Insights: Total sales revenue and quantity sold for each product line.
Customer Type Analysis: Distribution of sales revenue between different customer types.
### Time-Based Analysis:
Daily Sales Performance: Peak sales days of the week.
### Financial Analysis:
Tax Analysis: Total tax amount collected and its percentage of total revenue.
Profit Margin Calculation: Gross margin percentage for each product line.
### Customer Behavior:
Payment Method Preference: Most commonly used and highest revenue-generating payment method.
Rating Analysis: Correlation between product ratings and sales revenue.
## Conclusion and Lessons Learned
Through this analysis, several key findings were uncovered, including insights into sales performance, customer behavior, and financial metrics. Challenges faced during the project provided valuable learning opportunities, and the insights gained can be used to optimize business strategies and drive growth.

### Running the Project
To run this project locally, follow these steps:

Set up a MySQL database and connect to it using MySQL Workbench or any other SQL client.
Import the dataset file (sales_data.csv) into your MySQL database.
Navigate to the sql/ directory and execute the SQL scripts to perform data analysis.
License
This project is licensed under the MIT License.

### Acknowledgements
The dataset used in this project was obtained from Kaggle (Walmart Recruiting - Store Sales Forecasting).
