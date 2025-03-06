SELECT * FROM `e-commerce`.ecommerce_dataset;
![E - commerce analysis screenshot](https://1drv.ms/i/s!AoiBcCU-vjO4cJvQu1K8HDNX99U)

-- Basic structure of the dataset 

select *
from `e-commerce`.ecommerce_dataset
limit 15;

-- Category List

SELECT Category
FROM `e-commerce`.ecommerce_dataset
GROUP BY Category;

-- which products categories are most popular by purchase count

SELECT Category, count(*) AS Purchase_count
FROM ecommerce_dataset
GROUP BY Category
ORDER BY Category DESC;

-- What is the average spending per category (final price)

SELECT Category, AVG("Final_Price(Rs.)") AS Average_spending
FROM `e-commerce`.ecommerce_dataset
GROUP BY Category
ORDER BY Category;

-- which payment methods are most frequently used for different product purchase

SELECT 
Category,
Payment_Method,
COUNT(*) AS Purchase_Count
FROM `e-commerce`.ecommerce_dataset
GROUP BY Category
ORDER BY Purchase_Count DESC;

-- How do discount impact the final price of purchase

SELECT 
Category,
`Discount (%)` AS Discount_Amt,
`Price (Rs.)` AS Final_price,
(`Discount (%)` * `Price (Rs.)` / 100),
(`Price (Rs.)` - (`Discount (%)` * `Price (Rs.)` / 100))
FROM  `e-commerce`.ecommerce_dataset
WHERE `Discount (%)` = 10
GROUP BY Category
ORDER BY Final_price;

-- Total amount saved from customers due to discount.

SELECT User_ID, SUM(`Price (Rs.)` * `Discount (%)`) AS Total_Savings
FROM ecommerce_dataset
GROUP BY User_ID;

SELECT
User_ID,
SUM(`Final_Price(Rs.)`) AS Total_Spent, 
AVG(`Final_Price(Rs.)`) AS Avg_Purchase_Value,
`Discount (%)`, COUNT(*) AS Number_of_Purchase
FROM ecommerce_dataset
GROUP BY `Discount (%)`
ORDER BY `Discount (%)`;

-- Identify 5 top customer with the highest total price amount

SELECT 
User_ID, 
SUM(`Price (Rs.)`) AS Total_Price_Amount
FROM `e-commerce`.ecommerce_dataset
GROUP BY User_ID
ORDER BY Total_Price_Amount DESC
LIMIT 5;

-- Determine which category generated the most revenue

SELECT
Category, 
SUM(`Price (Rs.)`) AS Most_generated_revenue
FROM `e-commerce`.ecommerce_dataset
GROUP BY Category
ORDER BY Most_generated_revenue DESC
LIMIT 1;

  select
    extract(Month FROM Purchase_Date) as Month,
    count(Category) as Purchase_Count
from `e-commerce`.ecommerce_dataset
group by Month
order by Purchase_Count desc;


