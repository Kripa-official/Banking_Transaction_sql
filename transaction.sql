USE fintech_transactions
select * FROM Banking_data;

-- Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM Banking_data;
-------------------------------------------------

-- Total Fraud Transactions
SELECT COUNT(*) AS Fraud_Transactions
FROM Banking_data
WHERE is_fraud = 1;

SELECT TOP 5 *
FROM Banking_data;
-------------------------------------------------

-- Fraud Percentage
SELECT
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END)*100.0/COUNT(*),
2
) AS Fraud_Percentage
FROM Banking_data;

-------------------------------------------------

-- Total Transaction Amount
SELECT
SUM(amount) AS Total_Amount
FROM Banking_data;

-------------------------------------------------

-- Average Transaction Amount
SELECT
AVG(amount) AS Average_Amount
FROM Banking_data;;

-------------------------------------------------

-- Highest Transaction
SELECT TOP 1 *
FROM Banking_data
ORDER BY amount DESC;

-------------------------------------------------

-- Lowest Transaction
SELECT TOP 1 *
FROM Banking_data
ORDER BY amount;

-------------------------------------------------

-- Top 10 Customers by Spending
SELECT TOP 10
customer_id,
SUM(amount) AS Total_Spent
FROM Banking_data
GROUP BY customer_id
ORDER BY Total_Spent DESC;

-------------------------------------------------

-- Customers with Highest Transactions
SELECT TOP 10
customer_id,
COUNT(*) AS Total_Transactions
FROM Banking_data
GROUP BY customer_id
ORDER BY Total_Transactions DESC;

-------------------------------------------------

-- Merchant Category Wise Transactions
SELECT
merchant_category,
COUNT(*) AS Transactions
FROM Banking_data
GROUP BY merchant_category
ORDER BY Transactions DESC;

-------------------------------------------------

-- Fraud by Merchant Category
SELECT
merchant_category,
COUNT(*) AS Fraud_Count
FROM Banking_data
WHERE is_fraud=1
GROUP BY merchant_category
ORDER BY Fraud_Count DESC;

-------------------------------------------------

-- Fraud by Payment Method
SELECT
payment_method,
COUNT(*) AS Fraud_Count
FROM Banking_data
WHERE is_fraud=1
GROUP BY payment_method
ORDER BY Fraud_Count DESC;

-------------------------------------------------

-- Fraud by Device Type
SELECT
device_type,
COUNT(*) AS Fraud_Count
FROM Banking_data
WHERE is_fraud=1
GROUP BY device_type
ORDER BY Fraud_Count DESC;

-------------------------------------------------

-- Risk Level Distribution
SELECT
risk_level,
COUNT(*) AS Total
FROM Banking_data
GROUP BY risk_level;

-------------------------------------------------

-- Fraud by City
SELECT
customer_city,
COUNT(*) AS Fraud_Count
FROM Banking_data
WHERE is_fraud=1
GROUP BY customer_city
ORDER BY Fraud_Count DESC;

-------------------------------------------------

-- Average Credit Score by Risk Level
SELECT
risk_level,
AVG(credit_score) AS Avg_Credit_Score
FROM Banking_data
GROUP BY risk_level;

-------------------------------------------------

-- Transaction Status
SELECT
    transaction_status,
    COUNT(*) AS Total
FROM Banking_data
GROUP BY transaction_status;

-------------------------------------------------

-- Average Velocity Score
SELECT
risk_level,
AVG(velocity_score) AS Avg_Velocity
FROM Banking_data
GROUP BY risk_level;

-------------------------------------------------

-- Geo Match Analysis
SELECT
    geo_match,
    COUNT(*) AS Fraud_Count
FROM Banking_data
WHERE is_fraud = 1
GROUP BY geo_match;
-------------------------------------------------

-- Cashback Usage
SELECT
cashback_used,
COUNT(*) AS Transactions
FROM Banking_data
GROUP BY cashback_used;

-------------------------------------------------

-- Monthly Trend
SELECT
YEAR(transaction_datetime) AS Year,
MONTH(transaction_datetime) AS Month,
COUNT(*) AS Total_Transactions,
SUM(amount) AS Total_Amount
FROM Banking_data
GROUP BY
YEAR(transaction_datetime),
MONTH(transaction_datetime)
ORDER BY
Year,
Month;

-------------------------------------------------

-- Payment Method Usage
SELECT
payment_method,
COUNT(*) AS Total_Transactions,
SUM(amount) AS Total_Amount
FROM Banking_data
GROUP BY payment_method
ORDER BY Total_Transactions DESC;

-------------------------------------------------

-- Device Type Usage
SELECT
device_type,
COUNT(*) AS Total_Transactions,
SUM(amount) AS Total_Amount
FROM Banking_data
GROUP BY device_type
ORDER BY Total_Transactions DESC;

-------------------------------------------------

-- Currency Wise Transactions
SELECT
currency,
COUNT(*) AS Total_Transactions,
SUM(amount) AS Total_Amount
FROM Banking_data
GROUP BY currency;

-------------------------------------------------

-- Top 10 Highest Balance Customers
SELECT TOP 10
customer_id,
MAX(account_balance) AS Account_Balance
FROM Banking_data
GROUP BY customer_id
ORDER BY Account_Balance DESC;

-------------------------------------------------

-- Dashboard Summary
SELECT
COUNT(*) AS Total_Transactions,
SUM(amount) AS Total_Amount,
AVG(amount) AS Average_Amount,
SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) AS Fraud_Cases,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END)*100.0/COUNT(*),
2
) AS Fraud_Percentage
FROM Banking_data;