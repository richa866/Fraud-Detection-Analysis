

SELECT 
Class,
MAX(AMOUNT)
FROM transactions
GROUP BY Class;

SELECT 
CASE
 WHEN AMOUNT < 10 THEN 'MICRO(UNDER $10)'
 WHEN AMOUNT < 100 THEN 'SMALL($10 to $100)'
 WHEN AMOUNT < 1000 THEN 'MEDIUM($100 to $1000)'
 ELSE 'LARGE($1000+)'
 END AS AMOUNT_CATEGORY,
 COUNT(*) AS fraud_count,
ROUND(
SUM(CASE WHEN Class = 1 THEN 1.0 ELSE 0 END)/COUNT(*)*100,4) AS FRAUD_RATE
FROM transactions
GROUP BY AMOUNT_CATEGORY
ORDER BY fraud_count DESC 


-- "Fraud rate increases with transaction size —
--  Large transactions ($1000+) have a 0.29% fraud 
--  rate, nearly 3x higher than Small transactions.
--  However, 84% of all fraud by volume occurs in
--  Small and Micro buckets, suggesting two distinct 
--  fraud patterns: high-frequency low-value structuring 
--  and low-frequency high-value card abuse .



