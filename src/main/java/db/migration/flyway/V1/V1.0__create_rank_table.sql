CREATE TABLE rank(
	rank_number NUMBER(5) NOT NULL,
	description VARCHAR2(40) NOT NULL
	);

MERGE INTO rank R USING 
	(SELECT 1 AS rank_number, 'director' AS description FROM DUAL UNION
	SELECT 2, 'manager' FROM DUAL UNION
	SELECT 3, 'employee' FROM DUAL) N
	ON (R.rank_number = N.rank_number)
	WHEN MATCHED THEN UPDATE SET R.description = N.description
	WHEN NOT MATCHED THEN INSERT (R.rank_number, R.description)
		VALUES (N.rank_number, N.description);

	