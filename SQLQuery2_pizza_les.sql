select * from pizza_sales;
select DATENAME(dw, order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(dw, order_date);
 

 --hourly trend

 select datepart(hour, order_time) as order_hours, count(distinct order_id) as total_orders from pizza_sales
 group by datepart(hour, order_time)
 order by datepart(hour, order_time);

 select pizza_category , sum(total_price)*100/(select sum(total_price) from pizza_sales) as percent_sale
 from pizza_sales
 group by pizza_category;


 select pizza_category , sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)=1) as percent_sale
 from pizza_sales
 where month(order_date)=1
 group by pizza_category;


 select pizza_size , cast(sum(total_price) as decimal(10,2)) as total_sales , cast(sum(total_price)*100/(select sum(total_price) from pizza_sales)as decimal(10,2)) as percent_sale
 from pizza_sales
 where datepart(quarter,order_date)=1
 group by pizza_size
 order by percent_sale desc


 select pizza_category, sum(quantity) as total_pizza_sold
 from pizza_sales
 group by pizza_category;


 select  top 5 pizza_name, sum(quantity) as total_pizza_sold
 from pizza_sales 
 group by pizza_name
 order by sum(quantity) desc
 
select sum(total_price)as total_revenue from pizza_sales;

select  sum(total_price) /count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;
select count(distinct order_id) as Total_orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2))/ 
cast (count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as pizza_per_orders from pizza_sales;