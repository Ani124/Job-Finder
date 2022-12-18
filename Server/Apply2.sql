SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT X CHAR PROMPT "Enter Desired Position = "
ACCEPT Y CHAR PROMPT "ENTER Area = "


DECLARE
	A VARCHAR2(20);
	B VARCHAR2(20);
	No_service_zone EXCEPTION;
	C int;
	h1 int;
	h2 int;
BEGIN 

A:='&X';
B:='&Y';
C:=0;
h1:=0;
h2:=0;
	
	
	
		DBMS_OUTPUT.PUT_LINE('Company_Name'||'    '||'Address'||'    '||'Email'||'   '||'Requirements'||'   '||'Available_Position');
		SELECT count(id) into h1 FROM Employer where Employer.availablePos!=0 and lower(A)= lower(Employer.requirement) and address = B ;
		SELECT count(id) into h2 FROM Employer@site where availablePos!=0 and lower(A)= lower(requirement) and address = B;
		if (h1>0) THEN
			FOR R IN (SELECT * FROM Employer where availablePos!=0 and lower(A)= lower(requirement)) LOOP
		
				DBMS_OUTPUT.PUT_LINE(R.nameEm||'   '||R.address||'   '||R.email||'   '||R.requirement||'   '||R.availablePos);
			END LOOP;
			
		
		ELSIF (h2>0) THEN
		
		
			outSideCurrentHost(A);
			
		else 
			RAISE no_service_zone;
		end if;
	
EXCEPTION
	WHEN No_service_zone THEN
		DBMS_OUTPUT.PUT_LINE('No Site There');
		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('Many rows detected');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Other errors');


END;
/

commit;