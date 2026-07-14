-- =========================================================
-- Reducing Product Returns Through Data Analytics
-- Week 1: Exploration & Return Rate Queries
-- =========================================================

-- 1. Overall return rate
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(100.0 * SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_pct
FROM orders;


-- 2. Return rate AND total return cost by product category
--    (rate tells you WHERE returns happen most often;
--     total cost tells you WHERE they hurt the most financially —
--     these don't always point to the same category)
SELECT
    Product_Category,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(100.0 * SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_pct,
    SUM(CASE WHEN Return_Status = 'Returned' THEN Return_Cost ELSE 0 END) AS total_return_cost
FROM orders
GROUP BY Product_Category
ORDER BY total_return_cost DESC;


-- 3. Return reason breakdown (excluding non-returns), overall
SELECT
    Return_Reason,
    COUNT(*) AS num_returns,
    ROUND(100.0 * COUNT(*) / (SELECT SUM(CASE WHEN Return_Status='Returned' THEN 1 ELSE 0 END) FROM orders), 2) AS pct_of_all_returns
FROM orders
WHERE Return_Status = 'Returned'
GROUP BY Return_Reason
ORDER BY num_returns DESC;


-- 4. Return reason breakdown BY category
--    (this is the key diagnostic query -- different categories likely
--     fail for different reasons, which points to different fixes)
SELECT
    Product_Category,
    Return_Reason,
    COUNT(*) AS num_returns
FROM orders
WHERE Return_Status = 'Returned'
GROUP BY Product_Category, Return_Reason
ORDER BY Product_Category, num_returns DESC;


-- 5. Top 10 individual products ranked by financial impact
--    (total return cost, not just return rate --
--     a product with a lower rate but higher order volume can cost more overall)
SELECT
    Product_ID,
    Product_Category,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(100.0 * SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_pct,
    SUM(CASE WHEN Return_Status = 'Returned' THEN Return_Cost ELSE 0 END) AS total_return_cost
FROM orders
GROUP BY Product_ID, Product_Category
HAVING total_returns > 0
ORDER BY total_return_cost DESC
LIMIT 10;


-- 6. Days-to-return pattern (diagnostic signal):
--    fast returns often = expectation/listing mismatch
--    slow returns often = durability/quality issues
SELECT
    CASE
        WHEN Days_to_Return <= 7  THEN '0-7 days (fast)'
        WHEN Days_to_Return <= 21 THEN '8-21 days (medium)'
        ELSE '22+ days (slow)'
    END AS return_speed_bucket,
    Return_Reason,
    COUNT(*) AS num_returns
FROM orders
WHERE Return_Status = 'Returned'
GROUP BY return_speed_bucket, Return_Reason
ORDER BY return_speed_bucket, num_returns DESC;


-- 7. Monthly return trend (are returns getting better or worse over time?)
SELECT
    strftime('%Y-%m', Order_Date) AS order_month,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(100.0 * SUM(CASE WHEN Return_Status = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_pct
FROM orders
GROUP BY order_month
ORDER BY order_month;
