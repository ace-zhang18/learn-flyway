CREATE TABLE rank(
	rank_number INTEGER NOT NULL,
	desc VARCHAR(40) NOT NULL
	);

MERGE INTO rank R USING 
	(SELECT 1 AS rank_number, 'director' AS desc FROM DUAL UNION
	SELECT 2, 'manager' FROM DUAL UNION
	SELECT 3, 'employee' FROM DUAL) N
	ON (R.rank_number = N.rank_number)
	WHEN MATCHED THEN UPDATE SET R.desc = N.desc
	WHEN NOT MATCHED THEN INSERT (R.rank_number, R.desc)
		VALUES (N.rank_number, N.desc);

	