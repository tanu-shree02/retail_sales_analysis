CREATE DATABASE retail_project;
USE retail_project;
CREATE TABLE retail_sales ( 
    order_id INT, 
    order_date DATE, 
    customer_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT, 
    unit_price DECIMAL(10,2), 
    sales DECIMAL(10,2),
    payment_method VARCHAR(50) );
    
SELECT COUNT(*) FROM retail_sales;

-- =========================================
-- RETAIL SALES SQL ANALYSIS
-- =========================================


-- Q1: What is the total revenue?
SELECT ROUND(SUM(sales), 2) AS total_revenue
   FROM retail_sales;


-- Q2: How many total orders were placed?
SELECT COUNT(DISTINCT order_id) AS total_orders
   FROM retail_sales;


-- Q3: What is the total quantity of products sold?
SELECT SUM(quantity) AS total_quantity_sold
   FROM retail_sales;


-- Q4: What is the average order value?
SELECT ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
   FROM retail_sales;


-- Q5: Which product categories generate the most revenue?
SELECT category,
	ROUND(SUM(sales), 2) AS revenue
	FROM retail_sales
	GROUP BY category
	ORDER BY revenue DESC;


-- Q6: Who are the top 5 customers by spending?
SELECT customer_name,
    ROUND(SUM(sales), 2) AS total_spent
    FROM retail_sales
    GROUP BY customer_name
    ORDER BY total_spent DESC
    LIMIT 5;


-- Q7: How does revenue change month by month?
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
ROUND(SUM(sales), 2) AS revenue
FROM retail_sales
GROUP BY month
ORDER BY month;


-- Q8: Which payment method generates the highest revenue?
SELECT payment_method,
ROUND(SUM(sales), 2) AS revenue
FROM retail_sales
GROUP BY payment_method
ORDER BY revenue DESC;


-- Q9: Which category has the highest quantity sold?
SELECT category,
       SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY category
ORDER BY total_quantity DESC
LIMIT 1;


-- Q10: Which order generated the highest revenue?
SELECT *
FROM retail_sales
ORDER BY sales DESC
LIMIT 1;


-- Q11: What is the average sales amount for each category?
SELECT category,
       ROUND(AVG(sales), 2) AS avg_sales
FROM retail_sales
GROUP BY category
ORDER BY avg_sales DESC;


-- Q12: How many unique customers are present in each category?
SELECT category,
       COUNT(DISTINCT customer_name) AS unique_customers
FROM retail_sales
GROUP BY category
ORDER BY unique_customers DESC;