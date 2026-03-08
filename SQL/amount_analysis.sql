-- Does Transaction Amount Signal Fraud?
SELECT
Class,
MAX(Amount) AS MaxTransactionMade,
MIN(Amount) AS MinTransactionMade,
AVG(Amount) AS AvgTransactions,
COUNT(*) AS NumOfTransactionsMade
From transactions
GROUP BY Class;
