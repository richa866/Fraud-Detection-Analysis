WITH day_summary AS( 
SELECT
FLOOR(TIME /86400) AS day_num,
COUNT(*) AS num_of_transactions,
SUM(Amount) AS total_amt,
SUM(Class) AS frauds
FROM transactions
GROUP BY day_num
ORDER BY day_num
)
SELECT 
day_num,
num_of_transactions,
frauds,
LAG(frauds) OVER ( ORDER BY day_num) AS prevDay,
frauds- LAG(frauds) OVER ( ORDER BY day_num) AS fraud_change
FROM day_summary
ORDER BY day_num;
