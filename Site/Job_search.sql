SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE jobSearch
IS
a number;
BEGIN

	DBMS_OUTPUT.PUT_LINE('Company_Name'||'    '||'Address'||'   '||'Requirements'||'   '||'Available_Position');
	FOR R IN (SELECT * FROM Employer UNION ALL SELECT * FROM Employer@server1) LOOP
		if (R.availablePos!=0) then
			
			DBMS_OUTPUT.PUT_LINE(R.nameEm||'   '||R.address||'   '||R.requirement||'   '||R.availablePos);
		end if;
		
	END LOOP;
END jobSearch;
/
commit;