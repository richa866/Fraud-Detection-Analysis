
SELECT 
FLOOR((Time % 86400)/3600 ) AS hourOfDay,
Class,
COUNT(*) AS fraudCount
From transactions
WHERE Class=1
GROUP BY hourOfDay
ORDER BY fraudCount DESC ;