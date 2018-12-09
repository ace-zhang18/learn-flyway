MERGE INTO rank R USING
	(SELECT 4 AS rank_number, 'VP' as description FROM DUAL) N
	ON (R.rank_number = N.rank_number)
	WHEN MATCHED THEN UPDATE SET R.description = N.description
	WHEN NOT MATCHED THEN INSERT (R.rank_number, R.description)
		VALUES (N.rank_number, N.description);
