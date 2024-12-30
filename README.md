# Pizza Sales Analysis SQL and Power BI Project

## Project Overview

**Project Title**: Pizza Sales Analysis

**Level**: Beginner to Intermediate

**Database**: pizza_sales_db
`

This project demonstrates SQL and Power BI skills commonly used by data analysts to analyze sales data for a pizza delivery business. It includes data exploration, cleaning, visualization, and answering business-related questions. This project is ideal for anyone looking to build a foundation in SQL and dashboarding using Power BI.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.
## Project Structure
## Objectives
1.	**Database Setup**: Create and populate a database with pizza sales data.
2.	**Data Cleaning**: Identify and remove any missing or inconsistent records.
3.	**Exploratory Data Analysis (EDA)**: Use SQL to analyze and derive meaningful insights.
4.	**Business Analysis**: Create Power BI dashboards to visualize sales trends and performance.

```sql
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
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique pizzas are in the dataset.
- **Category Count**: Check for missing data in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM pizza_sales;

SELECT DISTINCT pizza_name FROM pizza_sales;

SELECT * FROM pizza_sales
WHERE order_date IS NULL OR order_time IS NULL OR pizza_name IS NULL 
OR size IS NULL OR category IS NULL OR quantity IS NULL OR total_price IS NULL

DELETE FROM pizza_sales
WHERE order_date IS NULL OR order_time IS NULL OR pizza_name IS NULL 
OR size IS NULL OR category IS NULL OR quantity IS NULL OR total_price IS NULL;

```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Total Revenue:the sum of the total price of all pizza orders**:
```sql
SELECT
sum(total_price) as total_revenue
from pizza_sales;
```

2. **Average order value:the avg amount spent per order,calculated by dividing the total revenue by the total number of orders**:
```sql
select 
	sum(total_price)/count(distinct order_id) as avg_order_value
from pizza_sales;
```

3. **Total pizzas sold:the sum of the quantities of all pizzas sold.**:
```sql
select
	sum(quantity) as total_pizzas_sold
from pizza_sales;
```

4. **Total orders:the total number of orders placed**:
```sql
select
	count(distinct order_id) as total_orders
from pizza_sales;
```

5. **Avg pizzas per order:the avg no.of pizzas sold per order,calculated by dividing the total no.of pizzas sold by the total no.of orders**:
```sql
select 
	sum(quantity)/count(distinct order_id) as avg_pizzas_per_order
from pizza_sales;
```

6. **Daily trend for total orders**:
```sql
select
	to_char(order_date,'day') as order_day,
	count(distinct order_id) as total_orders
from pizza_sales
group by 1;
```

7. **Monthly trend for total_orders**:
```sql
select
	to_char(order_date,'mon') as month_name,
	count(distinct order_id) as total_orders
from pizza_sales
group by 1
order by 2 desc;
```

8. **Percentage of sales by pizza category**:
```sql
select
	pizza_category,
	sum(total_price) as total_sales,
	sum(total_price)*100/(select sum(total_price) from pizza_sales where to_char(order_date,'mon') ='jan') as pct
from pizza_sales
where to_char(order_date,'mon') ='jan'
group by 1;
```

9. **Percentage of sales by pizza_size in jan.**:
```sql
select
	pizza_size,
	cast(sum(total_price) as decimal(10,2)) as total_sales,
	cast(sum(total_price)*100/(select sum(total_price) from pizza_sales where to_char(order_date,'mon') ='jan') as decimal(10,2)) as pct
from pizza_sales
where to_char(order_date,'mon') ='jan'
--where extract(quarter from order_date) =1
group by 1
order by pct desc;

```

10. **Top 5 best sellers by revenue**:
```sql
select
	pizza_name,
	sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by 2 desc
limit 5;
```

11. **Bottom 5 best sellers by revenue**:
```sql
select
	pizza_name,
	sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by 2 
limit 5;
```

12. **Bottom 5 best sellers by total quantity**:
group by pizza_name
order by 2 
limit 5;
```

13. **Top 5 best sellers by total orders**:
```sql
select
	pizza_name,
	count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by 2 desc
limit 5;
```

## Findings

- **The evening shift saw the most orders.**

## Power BI Dashboards
![s1](https://github.com/user-attachments/assets/0514003c-5676-48c3-880a-e54327b54bde)
![s2](https://github.com/user-attachments/assets/a300370b-8665-4d2b-90b1-26a00df6a55f)

## Key Metrics Dashboard
•	**Total Revenue**: $817.86K
•	**Total Orders**: 21,350
•	**Best-Selling Pizza**: Thai Chicken Pizza
•	**Top Category**: Classic
•	**Sales by Day and Month**: Fridays and July were peak periods.
## Trends and Visualizations
•	**Monthly Sales Trends**: Clear visualization of sales peaks and dips.
•	**Category Contribution**: Classic pizzas led in revenue and sales volume.
•	**Size Preference**: Large pizzas were most preferred.

## Findings
1.	**Revenue Insights**: Total revenue generated was $817.86K.
2.	**Customer Preferences**:
o	**Most preferred category**: Classic.
o	**Most preferred size**: Large.
3.	**Peak Periods**:
o	**Day**: Friday.
o	**Month**: July and January.

## Reports
1.	**Key Metrics Report**: Highlights top pizzas, sizes, and revenue.
2.	**Trend Analysis**: Monthly and daily trends to identify peak periods.
3.	**Customer Insights**: Identified top-spending customers and category performance.


## Conclusion

This project showcases the application of SQL and Power BI for data analysis. By exploring sales data, generating insights, and creating dashboards, we gain a deeper understanding of customer preferences and sales trends. This project is a valuable addition to any aspiring data analyst's portfolio.

## Author - Sravani Nandyala

This project is part of my portfolio, showcasing the SQL and Power bi skills essential for data analyst role.

My LinkedIn Profile AND Email Address
LinkedIn: [https://www.linkedin.com/in/sravani-nandyala-884a9a171]
Email : sravanin139@gmail.com
