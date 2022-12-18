set serveroutput on;
set verify off;

DECLARE 



BEGIN
	DBMS_OUTPUT.PUT_LINE('PEDING LIST OF EMPLOYER:::');
	DBMS_OUTPUT.PUT_LINE('Company_Name'||'    '||'Address'||'   '||'EMAIL'||'   '||'CONTACT NUM'||'   '||'Requirements'||'   '||'SALARY'||'   '||'Available_Position');
	FOR R IN(SELECT * FROM Employer_approval) LOOP
		DBMS_OUTPUT.PUT_LINE(R.nameEM||'       '||R.address||'   '||R.email||'   '||R.num||'   '||R.requirement||'   '||R.Salary||'   '||R.availablePos);
	
	END LOOP;

END;
/
commit;
