SELECT *
FROM clean_cafe_sales;

-- Total Sales
SELECT SUM(`Total Spent`) AS Total_sales
FROM clean_cafe_sales;

-- Total Transactions
SELECT COUNT(`Transaction ID`) AS Total_transactions
FROM clean_cafe_sales;

-- Average Order Value
SELECT AVG(`Total Spent`) AS Average_order_value
FROM clean_cafe_sales;

-- Highest Sale
SELECT Item, MAX(`Total Spent`) Highest_sale
FROM clean_cafe_sales
GROUP BY Item
ORDER BY Highest_sale DESC
LIMIT 1;

-- Lowest Sale
SELECT Item, MIN(`Total Spent`) lowest_sale
FROM clean_cafe_sales
GROUP BY Item
ORDER BY lowest_sale
LIMIT 1;

-- Top-selling Products
SELECT Item, SUM(`Total Spent`) AS Total_sales
FROM clean_cafe_sales
GROUP BY Item
ORDER BY Total_sales DESC
LIMIT 5;

-- Lowest-performing products
SELECT Item, SUM(`Total Spent`) AS Total_sales
FROM clean_cafe_sales
GROUP BY Item
ORDER BY Total_sales ASC
LIMIT 5;

-- Monthly Sales
SELECT MONTH(`Transaction Date`) AS `Month`, SUM(`Total Spent`) AS Mnthly_sales
FROM clean_cafe_sales
GROUP BY `Month`
HAVING `MONTH` != "NULL"
ORDER BY `Month` ASC
;

-- Quarterly Sales
SELECT QUARTER(`Transaction Date`) AS `Quarter`,
SUM(`Total Spent`) AS Mnthly_sales
FROM clean_cafe_sales
GROUP BY `Quarter`
HAVING `Quarter` != "NULL"
ORDER BY `Quarter` ASC
;

-- Sales by Weekday
SELECT WEEKDAY(`Transaction Date`) AS `Weekday`, SUM(`Transaction Date`) AS Weekday_sales
FROM clean_cafe_sales
GROUP BY `Weekday`
HAVING `Weekday` != "NULL"
ORDER BY `Weekday`;

-- Highest revenue month
SELECT MONTH(`Transaction Date`) AS `Month`, SUM(`Total Spent`) AS Monthly_sales
FROM clean_cafe_sales
GROUP BY `Month`
HAVING `MONTH` != "NULL"
ORDER BY Monthly_sales DESC
LIMIT 1
;

-- Most used payment method
SELECT `Payment Method`, COUNT(`Total Spent`) AS Payment_method_sales
FROM clean_cafe_sales
GROUP BY `Payment Method`
ORDER BY Payment_method_sales DESC;

-- Revenue by payment method
SELECT `Payment Method`, SUM(`Total Spent`) AS Payment_method_revenue
FROM clean_cafe_sales
GROUP BY `Payment Method`
ORDER BY Payment_method_revenue DESC;

-- Revenue by location
SELECT Location, SUM(`Total Spent`) AS Location_revenue
FROM clean_cafe_sales
GROUP BY Location
ORDER BY Location_revenue DESC;

-- Transactions by location
SELECT Location, COUNT(Location) AS Location_transactions
FROM clean_cafe_sales
GROUP BY Location
ORDER BY Location_transactions DESC;

-- Monthly Growth Rate
WITH monthy_sales AS
(SELECT 
YEAR(`Transaction Date`) AS Sales_year,
MONTH(`Transaction Date`) AS Sales_month,
SUM(`Total Spent`) AS Total_sales
FROM clean_cafe_sales
GROUP BY Sales_year, Sales_month
ORDER BY Total_sales
)
SELECT Sales_year,
Sales_month,
Total_sales,
LAG(Total_sales) OVER(ORDER BY Sales_year, Sales_month) AS Previous_month_sales,
(
	(
	Total_sales - 
    LAG(Total_sales) OVER(ORDER BY Sales_year, Sales_month)
	) / LAG(Total_sales) OVER(ORDER BY Sales_year, Sales_month)
) * 100 AS mom_growth_percentage
FROM monthy_sales;


-- Running Total Revenue
WITH Monthly_sales AS
(
	SELECT
		MONTH(`Transaction Date`) AS `Month`,
		SUM(`Total Spent`) AS Total_sales
	FROM clean_cafe_sales
	GROUP BY `Month`
	HAVING `Month` != "NULL"
)
SELECT 
	`Month`,
	Total_sales,
	SUM(Total_sales) OVER(ORDER BY `Month` ASC) AS Rolling_total
FROM Monthly_sales;

-- Rank Products by Revenue
SELECT Item, 
SUM(`Total Spent`) AS Total_revenue,
RANK() OVER(ORDER BY SUM(`Total Spent`) DESC) AS `Rank`
FROM clean_cafe_sales
GROUP BY Item;

-- Rank Customers by Spending
SELECT `Transaction ID` AS Customer, 
SUM(`Total Spent`) AS Total_revenue,
RANK() OVER(ORDER BY SUM(`Total Spent`) DESC) AS `Rank`
FROM clean_cafe_sales
GROUP BY Customer;

-- Moving Average (3 months)
WITH Monthly_sales AS
(
	SELECT
		MONTH(`Transaction Date`) AS `Month`,
		SUM(`Total Spent`) AS Total_sales
	FROM clean_cafe_sales
	GROUP BY `Month`
	HAVING `Month` != "NULL"
)
SELECT 
	`Month`,
    Total_sales,
    AVG(Total_sales) OVER(
		ORDER BY `Month` ASC
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	)AS Rolling_avg_3_months
FROM Monthly_sales;

-- Percentage Contribution of each Category
WITH Product_sales AS
(
	SELECT
		Item,
		SUM(`Total Spent`) AS Total_revenue
	FROM clean_cafe_sales
	GROUP BY Item
)
SELECT 
	Item,
	Total_revenue,
    (Total_revenue / 
    (SELECT SUM(`Total Spent`) FROM clean_cafe_sales)) * 100 AS Percentage_contribution
FROM Product_sales;

-- Cumulative Monthly Revenue
SELECT MONTH(`Transaction Date`) AS `Month`,
SUM(`Total Spent`) AS Monthly_revenue
FROM clean_cafe_sales
GROUP BY `Month`
HAVING `Month` != "NULL"
ORDER BY `Month`;











