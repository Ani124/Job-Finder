SET SERVEROUTPUT ON;


CREATE OR REPLACE TRIGGER Company_position
AFTER UPDATE 
OF availablePos
ON Employer
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Database Updated');
END;
/



CREATE OR REPLACE TRIGGER  insertInEm
AFTER INSERT 
ON Employer
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A new Data has been Inserted into Employer Table');
END;
/

CREATE OR REPLACE TRIGGER  insertInAPP
AFTER INSERT 
ON applied
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A new user application has been inserted');
END;
/



commit;