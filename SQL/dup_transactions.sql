SELECT
FLOOR(Time / 60) AS MINUTES,
ROUND(AMOUNT , 2) AS AMT ,
COUNT(*) AS numOfTransactions,
SUM(Class) AS fraudPerGroup
FROM transactions
GROUP BY MINUTES , AMT
HAVING COUNT(*) > 1
ORDER BY  fraudPerGroup DESC, numOfTransactions DESC
