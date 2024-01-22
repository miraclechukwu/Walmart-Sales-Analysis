# Walmart Sales Data Analysis

## Introduction

The Walmart Sales Data Analysis project aims to explore historical sales data from Walmart stores, providing insights into top-performing branches, product lines, and customer behavior. The dataset, obtained from the Kaggle Walmart Sales Forecasting Competition, includes transactions from 45 stores, each with multiple departments. The primary goal is to optimize sales strategies and identify areas for improvement.

## Problem Statement

Walmart seeks to enhance its sales strategies by understanding factors influencing branch-specific sales, product performance, and customer preferences. The challenge lies in analyzing vast datasets, identifying trends, and translating findings into actionable insights for strategic decision-making.

## About Data

The dataset was sourced from the Kaggle Walmart Sales Forecasting Competition. It encompasses transactions from 45 Walmart stores located in different regions. Each store houses multiple departments, and historical sales data is provided for predicting departmental sales. The dataset includes information on invoice details, branches, customer types, genders, product lines, pricing, quantities, taxes, dates, times, payment methods, costs of goods sold, gross margins, and ratings.

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |

# Data Transformation and Approach Used

1. **Data Wrangling:** This is the first step where inspection of data is done to make sure **NULL** values and missing values are detected and data replacement methods are used to replace, missing or **NULL** values.

> 1. Build a database
> 2. Create table and insert the data.
> 3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set **NOT NULL** for each field, hence null values are filtered out.

2. **Feature Engineering:** This will help use generate some new columns from existing ones.

> 1. Add a new column named `time_of_day` to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

> 2. Add a new column named `day_name` that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

> 3. Add a new column named `month_name` that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.


### Analytical Insights

## Business Questions To Answer

### Generic Question

1. How many unique cities does the data have?
2. In which city is each branch?

### Product

1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
5. What is the city with the largest revenue?
6. What product line had the largest VAT?
7. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
8. Which branch sold more products than average product sold?
9. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
4. Which customer type pays the most in VAT?

### Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?
## Conclusion

The analysis provided valuable insights into product performance, sales trends, and customer behavior across Walmart branches. Understanding these patterns enables Walmart to make informed decisions for optimizing sales strategies.

## Recommendation

1. **Product Strategy:**
   - Focus on promoting top-performing product lines.
   - Explore strategies to enhance underperforming product lines.

2. **Sales Optimization:**
   - Adjust sales strategies based on time-of-day trends.
   - Tailor promotions and marketing campaigns to target customer preferences.

3. **Customer Engagement:**
   - Personalize marketing efforts based on customer types.
   - Enhance customer experience by considering gender-specific preferences.

4. **Branch-specific Tactics:**
   - Implement branch-specific strategies based on unique sales patterns.
   - Utilize insights to address specific challenges in different cities.

5. **Continuous Monitoring:**
   - Regularly update analyses to adapt to changing market dynamics.
   - Incorporate feedback and performance metrics for ongoing improvement.
