SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE outSideCurrentHost(A IN Employer.requirement%TYPE)
IS
--a VARCHAR2(20);
BEGIN

	--DBMS_OUTPUT.PUT_LINE('Company_Name'||'    '||'Address'||'   '||'Requirements'||'   '||'Available_Position');
	FOR R IN (SELECT * FROM  Employer@server1 where availablePos>0 and lower(requirement)=lower(A)) LOOP
			
		DBMS_OUTPUT.PUT_LINE(R.nameEm||'   '||R.address||'   '||R.email||'   '||R.requirement||'   '||R.availablePos);
		
	END LOOP;
	
EXCEPTION

	
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('Many rows detected');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Other errors');
	
	
	

END outSideCurrentHost;
/
commit;
