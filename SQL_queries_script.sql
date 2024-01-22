create database if not EXISTS SalesDataWalmart;

CREATE TABLE IF NOT EXISTS sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10 , 2 ) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6 , 4 ) NOT NULL,
    total DECIMAL(12 , 4 ) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL NOT NULL,
    grosss_margin_pct FLOAT(11 , 9 ),
    gross_income DECIMAL(12 , 4 ) NOT NULL,
    rating FLOAT(2 , 1 )
);
        
        
        
        -- ----------------------------------------------------------------------------------
        -- ------------===>   Time of Day   <===-------------
SELECT 
    time,
    (CASE
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM
    sales;
        
        ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales 
SET 
    time_of_day = (CASE
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);
        
-- ------------===>   Day name   <===-------------
SELECT 
    time, DAYNAME(date) AS day_name
FROM
    sales;
        
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales 
SET 
    day_name = DAYNAME(date);

        
-- ------------===>   Month name   <===-------------
SELECT 
    date, MONTHNAME(date)
FROM
    sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales 
SET 
    month_name = monthname(date);

-- --------------------------------------------------------------------------------------
-- ------------===>   Generic   <===-------------
-- How many unique cities are present in the data?
SELECT DISTINCT
    (city)
FROM
    sales;
    
-- How many unique branch are present in the data? 
SELECT DISTINCT
    (branch)
FROM
    sales;
   
-- in which city the branches are located?
SELECT 
	DISTINCT city, branch
FROM
    sales;
    
    
-- --------------------------------------------------------------------------------------
-- ------------===>   Product   <===-------------
-- How many unique product line does the data contain?
select count(DISTINCT product_line) as total_num_of_product_line
from sales ;

-- Most common payment method
SELECT 
    payment_method, COUNT(payment_method) AS count
FROM
    sales
GROUP BY payment_method
ORDER BY count DESC;

-- What is the most selling product line?
SELECT 
    product_line, COUNT(product_line) AS count
FROM
    sales
GROUP BY product_line
ORDER BY count DESC;

-- What is the total revenue by month?
SELECT 
    month_name AS month, SUM(total) AS total_revenue
FROM
    sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- What month had the largest COGS?
SELECT 
    month_name AS month, SUM(cogs) AS total_cogs
FROM
    sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- What product line had the largest revenue?
SELECT 
    product_line, SUM(total) AS total_revenue
FROM
    sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT 
    city, SUM(total) AS total_revenue
FROM
    sales
GROUP BY city
ORDER BY total_revenue DESC;

-- What product line had the largest VAT?
SELECT 
    product_line, MAX(VAT) AS largest_vat
FROM
    sales
GROUP BY product_line
ORDER BY largest_vat DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT 
    AVG(quantity)
FROM
    sales;

SELECT 
    product_line,
    CASE
        WHEN AVG(quantity) > 6 THEN 'Good'
        ELSE 'Bad'
    END as remark
FROM
    sales
GROUP BY product_line;


-- Which branch sold more products than average product sold?
SELECT 
    branch, SUM(quantity) AS quantity_sold
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales);
        
-- What is the most common product line by gender?
SELECT 
    product_line, gender, COUNT(gender) AS gender_count
FROM
    sales
GROUP BY product_line , gender
ORDER BY product_line , gender_count DESC;

-- What is the average rating of each product line?
SELECT 
    product_line, ROUND(AVG(rating), 2) AS average_rating
FROM
    sales
GROUP BY product_line
ORDER BY average_rating DESC;

-- --------------------------------------------------------------------------------------
-- ------------===>   Sales   <===-------------
-- Number of sales made in each time of the day per week
SELECT 
   day_name, time_of_day, COUNT(*) AS total_sales
FROM
    sales
GROUP BY day_name, time_of_day
ORDER BY day_name, total_sales DESC;

-- Which of the customer types brings the most revenue?
SELECT 
    customer_type, SUM(total) AS revenue
FROM
    sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT 
    city, AVG(VAT) AS VAT
FROM
    sales
GROUP BY city
ORDER BY VAT DESC;

-- Which customer type pays the most in VAT?
SELECT 
    customer_type, AVG(VAT) AS VAT
FROM
    sales
GROUP BY customer_type
ORDER BY VAT DESC;


-- --------------------------------------------------------------------------------------
-- ------------===>   Customer   <===-------------
-- How many unique customer types does the data have?
SELECT DISTINCT
    customer_type
FROM
    sales;

-- How many unique payment methods does the data have?
SELECT DISTINCT
    payment_method
FROM
    sales;

-- What is the most common customer type?
SELECT 
    customer_type, COUNT(*) AS no_of_count
FROM
    sales
GROUP BY customer_type
ORDER BY no_of_count desc;

-- Which customer type buys the most?
SELECT 
    customer_type, COUNT(*) AS customer_count
FROM
    sales
GROUP BY customer_type
ORDER BY customer_count DESC;

-- What is the gender of most of the customers?
SELECT 
    gender, COUNT(*) AS gender_count
FROM
    sales
GROUP BY gender
ORDER BY gender_count DESC;

-- What is the gender distribution per branch?
SELECT 
    branch, gender, COUNT(gender) AS gender_count
FROM
    sales
GROUP BY branch, gender
ORDER BY branch;

-- Which time of the day do customers give most ratings?
SELECT 
    time_of_day, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?
SELECT 
    branch, time_of_day, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY branch, time_of_day
ORDER BY branch, avg_rating DESC;

-- Which day of the week has the best avg ratings?
SELECT 
    day_name, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY day_name
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT 
    branch, day_name, AVG(rating) AS avg_rating
FROM
    sales
GROUP BY branch, day_name

ORDER BY branch , avg_rating DESC;


-- What payment method is used most weekends(Friday, Saturday and Sunday)
select day_name, payment_method, count(*) as no_of_time
from sales
group by day_name, payment_method
order by day_name, no_of_tie desc;


