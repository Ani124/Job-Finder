SET SERVEROUTPUT ON;
SET VERIFY OFF;


prompt Enter 1 for apply to look Job inside Khulna  
prompt Enter 2 for apply to look Job inside Dhaka 
prompt Enter 3 for apply to look Job inside overall all jobs 
ACCEPT X number PROMPT "Your Choice: "

DECLARE 

	a int;

BEGIN 
	a :='&x';
	if a=1 THEN
		DBMS_OUTPUT.PUT_LINE('Company_Name'||'    '||'Address'||'   '||'Requirements'||'   '||'Available_Position');
		FOR R IN (SELECT * FROM Employer where availablePos!=0) LOOP
			DBMS_OUTPUT.PUT_LINE(R.nameEm||'   '||R.address||'   '||R.requirement||'   '||R.availablePos);		
		END LOOP;	
	ELSIF a=2 THEN
		DBMS_OUTPUT.PUT_LINE('Company_Name'||'    '||'Address'||'   '||'Requirements'||'   '||'Available_Position');
		FOR R IN (SELECT * FROM Employer@server1 where availablePos!=0) LOOP
			DBMS_OUTPUT.PUT_LINE(R.nameEm||'   '||R.address||'   '||R.requirement||'   '||R.availablePos);		
		END LOOP;	
		
	ELSIF a=3 THEN
		jobSearch;
	end if;
	

END;
/

commit;