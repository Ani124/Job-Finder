SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X CHAR PROMPT "Enter UserName = "
ACCEPT Y CHAR PROMPT "ENTER Password = "




DECLARE
	A VARCHAR2(20);
	B VARCHAR2(20);
	C VARCHAR2(20);
	D VARCHAR2(20);
	E int;
	HH int;
	userStat varchar2(20);
	apply int;
	search_app int;

BEGIN
	A:='&X';
	B:='&Y';
	E:=0;
	C:= null;
	D:=null;
--	C := 0;

	FOR R IN (SELECT * FROM verifyLogin where userName=A and password=B) LOOP
		C := R.userName;
		D := R.password;
		E := R.id;	
		userStat:=R.userStat;
	END LOOP;

	if (E=0) THEN
		FOR R IN (SELECT * FROM verifyLogin@server1 where userName=A and password=B) LOOP
			C := R.userName;
			D := R.password;
			E := R.id;		
			userStat:=R.userStat;			
		END LOOP;
		if (E!=0) THEN
			DBMS_OUTPUT.PUT_LINE('Login Successful');
			DBMS_OUTPUT.PUT_LINE('JOBS till now Applied : ');
			mypack.site_logged(C);		
		else 
			
			DBMS_OUTPUT.PUT_LINE('Login Failed');
			
		end if;	
	ELSE
		DBMS_OUTPUT.PUT_LINE('Login Successful');
		DBMS_OUTPUT.PUT_LINE('JOBS till now Applied : ');
		mypack.logged(C);	
		--jobSearch;
	
	
	end if;
	
EXCEPTION

	
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