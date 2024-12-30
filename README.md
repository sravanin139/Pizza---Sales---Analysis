## Pizza Sales Analysis SQL and Power BI Project
________________________________________
## Project Overview
Project Title: Pizza Sales Analysis
Level: Beginner to Intermediate
Database: pizza_sales_db
This project demonstrates SQL and Power BI skills commonly used by data analysts to analyze sales data for a pizza delivery business. It includes data exploration, cleaning, visualization, and answering business-related questions. This project is ideal for anyone looking to build a foundation in SQL and dashboarding using Power BI.
________________________________________
## Objectives
1.	**Database Setup: Create and populate a database with pizza sales data.
2.	**Data Cleaning: Identify and remove any missing or inconsistent records.
3.	**Exploratory Data Analysis (EDA): Use SQL to analyze and derive meaningful insights.
4.	**Business Analysis: Create Power BI dashboards to visualize sales trends and performance.
________________________________________
## Project Structure
1. **Database Setup
**Database Creation:
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

