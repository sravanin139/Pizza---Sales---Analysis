create table pizza_sales(
	pizza_id int,
	order_id int,
	pizza_name_id varchar(30),
	quantity int,
	order_date date,
	order_time time,
	unit_price	float,
	total_price	float,
	pizza_size varchar(50),
	pizza_category varchar(50),
	pizza_ingredients varchar(250),
	pizza_name varchar(50)
);
select * from pizza_sales;
--drop table pizza_sales
--Questions:
-- 1.Total Revenue:the sum of the total price of all pizza orders.
select 
	sum(total_price) as total_revenue
from pizza_sales;

-- 2.Average order value:the avg amount spent per order,calculated by dividing the total revenue by the total number of orders.
select 
	sum(total_price)/count(distinct order_id) as avg_order_value
from pizza_sales;

-- 3.total pizzas sold:the sum of the quantities of all pizzas sold
select
	sum(quantity) as total_pizzas_sold
from pizza_sales;

-- 4. total orders:the total number of orders placed.
select
	count(distinct order_id) as total_orders
from pizza_sales;

-- 5.avg pizzas per order:the avg no.of pizzas sold per order,calculated by dividing the total no.of pizzas sold by the total no.of orders.
select 
	sum(quantity)/count(distinct order_id) as avg_pizzas_per_order
from pizza_sales;

-- 6.daily trend for total orders.
select
	to_char(order_date,'day') as order_day,
	count(distinct order_id) as total_orders
from pizza_sales
group by 1;
-- 7.monthly trend for total_orders.
select
	to_char(order_date,'mon') as month_name,
	count(distinct order_id) as total_orders
from pizza_sales
group by 1
order by 2 desc;

-- 8.percentage of sales by pizza category.
select
	pizza_category,
	sum(total_price) as total_sales,
	sum(total_price)*100/(select sum(total_price) from pizza_sales where to_char(order_date,'mon') ='jan') as pct
from pizza_sales
where to_char(order_date,'mon') ='jan'
group by 1;

-- 8.percentage of sales by pizza_size in jan.
select
	pizza_size,
	cast(sum(total_price) as decimal(10,2)) as total_sales,
	cast(sum(total_price)*100/(select sum(total_price) from pizza_sales where to_char(order_date,'mon') ='jan') as decimal(10,2)) as pct
from pizza_sales
where to_char(order_date,'mon') ='jan'
--where extract(quarter from order_date) =1
group by 1
order by pct desc;

-- 9.top 5 best sellers by revenue.
select
	pizza_name,
	sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by 2 desc
limit 5;

-- 10.bottom 5 best sellers by revenue.
select
	pizza_name,
	sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by 2 
limit 5;

-- 11.bottom 5 best sellers by total quantity .
select
	pizza_name,
	sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by 2 
limit 5;

-- 12.top 5 best sellers by total orders .
select
	pizza_name,
	count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by 2 desc
limit 5;
























































































