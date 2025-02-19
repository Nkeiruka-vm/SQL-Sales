-- Preview of the customer table
SELECT * 
FROM projectwork.customer_tbl;

-- CUSTOMER INSIGHT
-- On customer demorgrahics and purchasing trends
-- And identification of top customers based on spending and fregquency of purchase
-- To count the number of customers in each subscription status (Yes/No)

SELECT `subscription status`, COUNT(*) as total_customers
FROM customer_tbl
GROUP BY `subscription status`;


-- Find the average age of customers grouped by gender

SELECT Gender, AVG(Age) as Avg_age
FROM customer_tbl
group by Gender;


-- To identify the top 5 customers with highest total purchase amount

SELECT `Customer ID`, 
     SUM(`Purchase Amount (USD)`) AS Total_Highest_Purchase
FROM trans_tbl
GROUP BY `Customer ID`
ORDER BY Total_Highest_Purchase DESC
LIMIT 5;


-- SALES PERFORMANCE
-- Insights into sales by category, location, and season
-- Recommendations for optimizing discount and promo code strategies

-- Preview of the product table
SELECT * FROM projectworK.trans_tbl;

-- Calculate the total sales revenue for each product category
SELECT
		product.Product_ID, 
		product.Category,
		SUM(trans.`Purchase Amount (USD)`) as Total_Sales_Revenue 
FROM product_tbl as product
INNER JOIN trans_tbl as trans
ON product.Product_ID = trans.Product_ID
GROUP BY product.Category
ORDER BY Total_Sales_Revenue;

-- To find the total number of transactions made using each payment method

SELECT 
     `Payment Method`, SUM(`Purchase Amount (USD)`) AS Total_Transaction
FROM trans_tbl
GROUP BY `Payment Method`
ORDER BY Total_Transaction;

-- Determine which location generated the most revenue

SELECT Location, SUM(`Purchase Amount (USD)`) AS Most_Generated_Loc_Revenue
FROM trans_tbl
GROUP BY Location
ORDER BY Most_Generated_Loc_Revenue DESC;

-- Operational Bottlnecks
-- Recommendations for improving shipping strategies based on customer preferences
-- A ranked of best-performing product sizes, colors, and categories

-- Find the most popular shipping type based on transaction count

SELECT `Shipping Type`, count(*) AS Transaction_Count
FROM trans_tbl
GROUP BY `Shipping Type` 
ORDER BY Transaction_count DESC
LIMIT 1;

-- List the top (3) seasons that generated the highest sales revenue
SELECT 
    product.Product_ID,
    product.Season,
    SUM(trans.`Purchase Amount (USD)`) AS Highest_Sales_Revenue
FROM product_tbl as product
INNER JOIN trans_tbl as trans
ON product.Product_ID = trans.Product_ID
GROUP BY Season
ORDER BY Highest_Sales_Revenue DESC
LIMIT 3;

-- INTERMEDIATE QUESTIONS 

-- To identify customers who made more than (5) purchase but have low review

SELECT 
    customer.`Review Rating`,
    customer.`Customer ID`,
COUNT(customer.Product_ID) AS Product_Purchase
FROM customer_tbl as customer
JOIN trans_tbl as trans
ON customer.`Customer ID` = trans.`Customer ID`
WHERE `Review Rating` <3
GROUP BY `Customer ID`
HAVING COUNT(customer.Product_ID) >=5
ORDER BY Product_Purchase;

-- Determine the frequency of purchase for customers grouped by their preferred payment method

SELECT 
     trans.`Preferred Payment Method`,
     product.`Frequency of Purchases`,
     COUNT(product.Product_ID) AS Customer_Count
	FROM product_tbl AS product
    JOIN trans_tbl AS trans
    ON product.Product_ID = trans.Product_ID
    GROUP BY trans.`Preferred Payment Method`;
    
 -- Analyze how much revenue was generated from transactions where a discount was applied
 -- compared to those without discount
 
SELECT 
    SUM(CASE WHEN `Discount Applied` = 'Yes' THEN `Purchase Amount (USD)` ELSE 0 END ) AS Revenue_With_discount,
    SUM(CASE WHEN `Discount Applied` = 'No' THEN `Purchase Amount (USD)` ELSE 0 END ) AS Revenue_Without_discount
FROM trans_tbl;

-- Find the total sales and average purchase amount (round to 2decimal places) for each promo code used

SELECT
   `Promo Code Used`,
   ROUND(AVG(`Purchase Amount (USD)`), 2) AS Avg_purchase_amount,
   ROUND(SUM(`Purchase Amount (USD)`), 2) AS Total_sales
FROM trans_tbl
GROUP BY `Promo Code Used`;

-- To find the top (3) products, sizes, and color in demand based on total sales

SELECT 
  product.Product_ID,
  product.Size,
  product.Color,
  COUNT(product.Category) AS Product,
  SUM(trans.`Purchase Amount (USD)`) AS Total_sales
FROM product_tbl AS product
JOIN trans_tbl AS trans
ON product.Product_ID = trans.Product_ID
GROUP BY Product_ID
ORDER BY Total_sales DESC
LIMIT 3;


-- Identify the correlation between item purchased, shipping type and review rating
-- by calculating the average review rating for each shipping type. round the average 
-- rating to 2 decimal places. (write a report to back your observation on this question)
SELECT 
     customer.Product_ID,
	 trans.`Shipping Type`,
     product.`Item Purchased`,
	 ROUND(AVG(customer.`Review Rating`), 2) AS Avg_rating
FROM customer_tbl AS customer 
JOIN trans_tbl AS trans  
ON customer.Product_ID = trans.Product_ID
JOIN product_tbl AS product
ON customer.Product_ID = product.Product_ID
GROUP BY `Shipping Type`;

-- I observe a potential correlation between shipping type and review rating. Customers
-- who choose 'Express' shipping tended to give higher average rating of (3.78) compared
-- to those who choose 'Storepick' or 2-Day shipping. This suggest that customers who received 
-- their item faster through Express shipping were more satisfied with their purchase experience.


-- To determine which location has the most loyal customers based on their frequency of purchase

SELECT 
     trans.Location,
     product.Product_ID,
     COUNT(product.`Frequency of Purchases`) AS Total_purchase
FROM product_tbl AS product
JOIN trans_tbl AS trans
ON product.Product_ID = trans.Product_ID
GROUP BY trans.Location
ORDER BY Total_purchase DESC
LIMIT 1;

-- Rank all products by the total revenue generated and provide the top 5 product for each season












	




















































