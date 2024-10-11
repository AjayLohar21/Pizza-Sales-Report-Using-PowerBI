create database pizza_sales;

use pizza_sales;

SELECT 
    SUM(total_price) AS total_revenue
FROM
    pizza_sales;
-- ----------------------------------------------------------------

SELECT 
    SUM(total_price) / COUNT(DISTINCT (order_id)) AS avg_order_val
FROM
    pizza_sales;
-- -----------------------------------------------------------------

SELECT 
    SUM(quantity) AS pizzas_sold
FROM
    pizza_sales;
-- ------------------------------------------------------------------

SELECT 
    COUNT(DISTINCT (order_id)) AS total_order
FROM
    pizza_sales;
-- -------------------------------------------------------------------

SELECT 
    SUM(quantity) / COUNT(DISTINCT (order_id)) AS avg_pizzas_per_order
FROM
    pizza_sales;
-- -------------------------------------------------------------------

UPDATE pizza_sales 
SET 
    order_date = STR_TO_DATE(order_date, '%Y-%m-%d');
-- -------------------------------------------------------------------

ALTER TABLE pizza_sales MODIFY order_date DATE;
-- -------------------------------------------------------------------

SELECT 
    DAYNAME(order_date),
    COUNT(DISTINCT (order_id)) AS no_of_orders
FROM
    pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY no_of_orders DESC;
-- --------------------------------------------------------------------

SELECT 
    MONTHNAME(order_date),
    COUNT(DISTINCT (order_id)) AS no_of_orders
FROM
    pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY no_of_orders DESC;
-- --------------------------------------------------------------------

SELECT 
    pizza_category, sum(total_price) as total_sales,
    SUM(total_price) * 100 / (SELECT 
            SUM(total_price)
        FROM
            pizza_sales where month(order_date) = 2) AS sales_percentage_by_category
FROM
    pizza_sales where month(order_date) = 2
GROUP BY pizza_category;
-- --------------------------------------------------------------

SELECT 
    pizza_size, sum(total_price) as total_sales,
    SUM(total_price) * 100 / (SELECT 
            SUM(total_price)
        FROM
            pizza_sales) AS sales_percentage_by_size
FROM
    pizza_sales 
GROUP BY pizza_size;
-- ---------------------------------------------------------

SELECT 
    pizza_name,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_sale
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_sale DESC
LIMIT 5;  
-- --------------------------------------------------------------------

SELECT 
    pizza_name,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_sale
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_sale ASC
LIMIT 5;  
-- --------------------------------------------------------------------

SELECT 
    pizza_name,
    CAST(SUM(quantity) AS DECIMAL (10 , 2 )) AS total_quantity
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;  
-- --------------------------------------------------------------------------------

SELECT 
    pizza_name,
    CAST(SUM(quantity) AS DECIMAL (10 , 2 )) AS total_quantity
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;  
-- ----------------------------------------------------------------------------

SELECT 
    pizza_name,
    CAST(count(distinct(order_id)) AS DECIMAL (10 , 2 )) AS total_order
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_order DESC
LIMIT 5;  
-- ----------------------------------------------------------------------------

SELECT 
    pizza_name,
    CAST(count(distinct(order_id)) AS DECIMAL (10 , 2 )) AS total_order
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_order ASC
LIMIT 5;  
-- -------------------------------------------------------------------------

select * from pizza_sales;
