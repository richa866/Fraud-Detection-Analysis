WITH hour_summary AS (
	SELECT
    FLOOR((Time MOD 86400) / 3600) AS hour_num,
    COUNT(*) AS total_transactions,
    SUM(Class) total_frauds
    FROM transactions
    GROUP BY hour_num
    ORDER BY hour_num
    )
SELECT 
total_frauds,
hour_num,	
total_transactions,
ROUND( (total_frauds/ total_transactions)*100 , 2 ) AS fraud_rate,
RANK() OVER(ORDER BY ROUND( (total_frauds/ total_transactions) , 2 ) DESC ) rank_by_fraudRate,
RANK() OVER(ORDER BY total_frauds DESC)  AS rank_by_fraudCount


FROM hour_summary
