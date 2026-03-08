-- how many are fraud /leitimate
SELECT 
Class,
COUNT(*) AS TOTAL,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 4) AS percentage
FROM transactions
GROUP BY Class;