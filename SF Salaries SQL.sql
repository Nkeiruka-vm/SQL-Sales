-- Exploring the San Francisco city employee salary data
-- display the columns and rows of the table

SELECT * FROM sf_salaries.`sf-salaries`;

-- display the number of employees in the table

SELECT COUNT(*) FROM sf_salaries.`sf-salaries`;

-- How many unique JobTitle in the table

SELECT COUNT(DISTINCT JobTitle)
FROM sf_salaries.`sf-salaries`;

-- find the jobtitle and overtime pay for all employees with overtime pay greater than 50,000.

SELECT JobTitle, OvertimePay
FROM sf_salaries.`sf-salaries`
WHERE OvertimePay > 50000;

-- Find the average Base pay for all employees

SELECT AVG(BasePay) AS 'AvgBasePay'
FROM sf_salaries.`sf-salaries`;

-- what is the highest amount Overtime pay in the dataset 

SELECT MAX(OvertimePay) AS 'HighestOvertimepay'
FROM sf_salaries.`sf-salaries`;

-- What is the name of the highest paid employee (including benefits)

SELECT EmployeeName, MAX(TotalPayBenefits) AS 'HighestPaidEmployee'
FROM sf_salaries.`sf-salaries`;

-- What is the name of the lowest paid employee (including benefits)

SELECT EmployeeName, MIN(TotalPayBenefits) AS 'LowestPaidEmployee'
FROM sf_salaries.`sf-salaries`
ORDER BY TotalPayBenefits;

-- Show EmployeeName and Jobtitle

SELECT DISTINCT EmployeeName,  JobTitle
FROM sf_salaries.`sf-salaries`;

-- Find the top 10 highest paid employee

SELECT EmployeeName, TotalPay
FROM sf_salaries.`sf-salaries`
ORDER BY TotalPay DESC
LIMIT 10;

-- What is the average of Base Pay, Overtime Pay, and other pay  for each employee

SELECT AVG( BasePay + OvertimePay + OtherPay)/3 AS Avg_bp_otp_op
FROM sf_salaries.`sf-salaries`;

-- What is the average mean Base Pay of all employees per year 

SELECT Year, AVG(BasePay) AS 'AvgBasePay'
FROM sf_salaries.`sf-salaries`
GROUP BY Year
ORDER BY Year;

-- How many employee have the word 'chief' in their jobtitle

SELECT EmployeeName, JobTitle
FROM sf_salaries.`sf-salaries`
WHERE JobTitle LIKE '%Chief%';

-- How many employee with a jobtitle not equal to 'manager'

SELECT EmployeeName, JobTitle
FROM sf_salaries.`sf-salaries`
WHERE JobTitle <> 'Manager';

-- Show all employee with a total pay between 50,000 and 85,000

SELECT EmployeeName, TotalPay
FROM sf_salaries.`sf-salaries`
WHERE TotalPay BETWEEN 50000 AND 85000;

-- Show all employee with Base Pay less than 50,000 or total pay greater than 100,000

SELECT EmployeeName, TotalPay
FROM sf_salaries.`sf-salaries` 
WHERE TotalPay < 50000 OR  TotalPay > 100000;

-- Show all employees ordered by their totalpay benefits in descending order

SELECT * FROM sf_salaries.`sf-salaries` 
ORDER BY TotalPayBenefits DESC;

-- Show all employee with totalpay benefits value between 125,000 and
-- 150,000 and a jobtitle containing the word 'Director'

SELECT JobTitle, TotalPayBenefits
FROM sf_salaries.`sf-salaries` 
WHERE TotalPayBenefits BETWEEN 125000 AND 150000
AND JobTitle LIKE '%Director%';

-- Show all jobtitles with an average basepay of at least 100000 and order 
-- them by the average base pay in descending order

SELECT JobTitle, AVG(BasePay) AS 'AvgBasePay'
FROM sf_salaries.`sf-salaries`
GROUP BY JobTitle
HAVING AVG(BasePay) > 100000 
ORDER BY AvgBasePay DESC;
