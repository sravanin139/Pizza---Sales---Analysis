## Pizza Sales Analysis SQL and Power BI Project
________________________________________
## Project Overview
Project Title: Pizza Sales Analysis
Level: Beginner to Intermediate
Database: pizza_sales_db
This project demonstrates SQL and Power BI skills commonly used by data analysts to analyze sales data for a pizza delivery business. It includes data exploration, cleaning, visualization, and answering business-related questions. This project is ideal for anyone looking to build a foundation in SQL and dashboarding using Power BI.
________________________________________
## Objectives
1.	**Database Setup:** Create and populate a database with pizza sales data.
2.	**Data Cleaning:** Identify and remove any missing or inconsistent records.
3.  **Exploratory Data Analysis (EDA):** Use SQL to analyze and derive meaningful insights.
4.	**Business Analysis:** Create Power BI dashboards to visualize sales trends and performance.
________________________________________
## Project Structure
**1. Database Setup**
**Database Creation:**
A database named pizza_sales_db is created, containing a table pizza_sales with the following structure:

```sql
-- SQL script to create the database and table
CREATE DATABASE pizza_sales_db;

CREATE TABLE pizza_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME,
    pizza_name VARCHAR(50),
    size VARCHAR(15),
    category VARCHAR(25),
    quantity INT,
    total_price FLOAT
);
'''
** 2. Data Exploration & Cleaning**
** SQL Queries for EDA and Cleaning:**
•	**Total Records:**
```sql
SELECT COUNT(*) FROM pizza_sales;
```
•	**Unique Pizzas:**
```sql
SELECT DISTINCT pizza_name FROM pizza_sales;
```
•	**Check for Missing Data:**
```sql
SELECT * FROM pizza_sales
WHERE order_date IS NULL OR order_time IS NULL OR pizza_name IS NULL 
OR size IS NULL OR category IS NULL OR quantity IS NULL OR total_price IS NULL;
```
•	**Remove Missing Data:**
```sql
DELETE FROM pizza_sales
WHERE order_date IS NULL OR order_time IS NULL OR pizza_name IS NULL 
OR size IS NULL OR category IS NULL OR quantity IS NULL OR total_price IS NULL;
```
________________________________________
3. Data Analysis & Findings
Here are the SQL queries and their findings:
•	Top 5 Best-Selling Pizzas:
sql
Copy code
SELECT pizza_name, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 5;
Finding: "Thai Chicken Pizza" was the best-seller.
•	Sales Contribution by Category:
sql
Copy code
SELECT category, 
       SUM(total_price) AS total_revenue, 
       COUNT(*) AS total_orders
FROM pizza_sales
GROUP BY category;
Finding: The "Classic" category generated the most revenue.
•	Monthly Sales Trends:
sql
Copy code
SELECT EXTRACT(MONTH FROM order_date) AS month,
       SUM(total_price) AS total_sales
FROM pizza_sales
GROUP BY month
ORDER BY month;
Finding: July and January were peak months for sales.
•	Average Pizzas per Order:
sql
Copy code
SELECT AVG(quantity) AS avg_pizzas_per_order
FROM pizza_sales;
Finding: On average, customers ordered 2.32 pizzas per order.
•	Shift-Wise Orders:
sql
Copy code
WITH shifts AS (
    SELECT *,
           CASE
               WHEN EXTRACT(HOUR FROM order_time) < 12 THEN 'Morning'
               WHEN EXTRACT(HOUR FROM order_time) BETWEEN 12 AND 17 THEN 'Afternoon'
               ELSE 'Evening'
           END AS shift
    FROM pizza_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM shifts
GROUP BY shift;
Finding: The evening shift saw the most orders.
________________________________________
4. Power BI Dashboards
Key Metrics Dashboard
•	Total Revenue: $817.86K
•	Total Orders: 21,350
•	Best-Selling Pizza: Thai Chicken Pizza
•	Top Category: Classic
•	Sales by Day and Month: Fridays and July were peak periods.
Trends and Visualizations
•	Monthly Sales Trends: Clear visualization of sales peaks and dips.
•	Category Contribution: Classic pizzas led in revenue and sales volume.
•	Size Preference: Large pizzas were most preferred.

________________________________________
Findings
1.	Revenue Insights: Total revenue generated was $817.86K.
2.	Customer Preferences:
o	Most preferred category: Classic.
o	Most preferred size: Large.
3.	Peak Periods:
o	Day: Friday.
o	Month: July and January.
________________________________________
Reports
1.	Key Metrics Report: Highlights top pizzas, sizes, and revenue.
2.	Trend Analysis: Monthly and daily trends to identify peak periods.
3.	Customer Insights: Identified top-spending customers and category performance.
________________________________________
Conclusion
This project showcases the application of SQL and Power BI for data analysis. By exploring sales data, generating insights, and creating dashboards, we gain a deeper understanding of customer preferences and sales trends. This project is a valuable addition to any aspiring data analyst's portfolio.
________________________________________
Author
Name: Sravani Nandyala
LinkedIn: https://www.linkedin.com/in/sravani-nandyala-884a9a171
Email: sravanin139@gmail.com



