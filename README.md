# Pizza Sales Analysis SQL and Power BI Project
________________________________________
## Project Overview
Project Title: Pizza Sales Analysis
Level: Beginner to Intermediate
Database: pizza_sales_db
This project demonstrates SQL and Power BI skills commonly used by data analysts to analyze sales data for a pizza delivery business. It includes data exploration, cleaning, visualization, and answering business-related questions. This project is ideal for anyone looking to build a foundation in SQL and dashboarding using Power BI.
## Objectives
1.	Database Setup: Create and populate a database with pizza sales data.
2.	Data Cleaning: Identify and remove any missing or inconsistent records.
3.	Exploratory Data Analysis (EDA): Use SQL to analyze and derive meaningful insights.
4.	Business Analysis: Create Power BI dashboards to visualize sales trends and performance.

## Project Structure
1. **Database Setup
**Database Creation:
A database named pizza_sales_db is created, containing a table pizza_sales with the following structure:

‘’’sql
Copy code
CREATE DATABASE pizza_sales_db;

CREATE TABLE pizza_sales
 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME,
    pizza_name VARCHAR(50),
    size VARCHAR(15),
    category VARCHAR(25),
    quantity INT,
    total_price FLOAT
);
‘’’
2. **Data Exploration & Cleaning
SQL Queries for EDA and Cleaning:
•	Total Records:
‘’’sql
Copy code
SELECT COUNT(*) FROM pizza_sales;
‘’’
•	Unique Pizzas:
‘’’sql
Copy code
SELECT DISTINCT pizza_name FROM pizza_sales;
‘’’
•	Check for Missing Data:
‘’’sql
Copy code
SELECT * FROM pizza_sales
‘’’
WHERE order_date IS NULL OR order_time IS NULL OR pizza_name IS NULL 
OR size IS NULL OR category IS NULL OR quantity IS NULL OR total_price IS NULL;
•	Remove Missing Data:
‘’’sql
Copy code
DELETE FROM pizza_sales;
‘’’
WHERE order_date IS NULL OR order_time IS NULL OR pizza_name IS NULL 
OR size IS NULL OR category IS NULL OR quantity IS NULL OR total_price IS NULL;

''' 


