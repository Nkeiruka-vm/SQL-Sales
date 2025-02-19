-- Since the two tables have the same structure but different dteday values, I combined them using a UNION
-- Operation to create a single table containing all the unique records from both sources.  
-- Duplicate rows were then removed to ensure data integrity using UNION 

SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1;

-- Using Common Table Expressions (CTEs), I left-joined the cost table (containing price and COGS) with the appended table.

WITH Ctes AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1
)
SELECT * FROM Ctes AS  A
LEFT JOIN cost_table AS b
ON a.yr = b.yr;

-- For Power BI visualization, I selected only the necessary columns.

WITH Ctes AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1
)
SELECT
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders * price AS revenue,
riders * price - COGS * riders AS profit
FROM Ctes AS a
LEFT JOIN cost_table AS b
ON a.yr = b.yr;

-- I'm now porting this query to Power BI.




