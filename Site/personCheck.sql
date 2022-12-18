SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION personCheck(A in varchar2 default null)
RETURN number
IS

B int;
C int;

BEGIN
	B:=0;
	C:=0;
	
	select id into B from person where name=A;
	select id into C from person@server1 where name=A;
	
	if (B>0)or(C>0) THEN
		return 1;
		
	else 
		return 0;
	end if;
END personCheck;
/
commit;