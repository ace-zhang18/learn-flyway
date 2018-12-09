CREATE OR REPLACE PACKAGE emp_utility IS
	FUNCTION emp_fullname
		(emp_id IN NUMBER)
		RETURN VARCHAR;
END emp_utility;
/
SHOW ERROR



CREATE OR REPLACE PACKAGE BODY emp_utility IS
	FUNCTION emp_fullname
	(emp_id IN NUMBER)
	RETURN VARCHAR IS
		fullname VARCHAR(40);
		first_name VARCHAR(20);
		last_name VARCHAR(20);
	BEGIN
		SELECT first_name, last_name INTO first_name, last_name FROM employee WHERE employee.emp_id = emp_id;
		fullname := CONCAT(first_name, CONCAT(' ', last_name));
		RETURN fullname;
	END emp_fullname;
BEGIN
	NULL;
END emp_utility;
/
SHOW ERROR