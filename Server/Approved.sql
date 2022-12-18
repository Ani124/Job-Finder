set serveroutput on;
set verify off;


PROMPT ENTER COMPANY NAME
PROMPT ENTER COMPANY EMAIL ID
PROMPT ENTER 1 APPROVE
PROMPT ENTER 2 DISCARD

ACCEPT X PROMPT "ENTER COMPANY NAME: "
ACCEPT Y PROMPT "ENTER COMPANY EMAIL ID: "
ACCEPT Z PROMPT "ENTER VALUES FOR APPROVE OR DISCARD: "




declare 
	A VARCHAR2(20);
	B VARCHAR2(20);
	C INT;
	D VARCHAR2(20);

begin 
	A:='&X';
	B:='&Y';
	C:='&Z';
	--D:=SELECT address FROM Employer_approval WHERE nameEm=A ;
	DBMS_OUTPUT.PUT_LINE(D);
	IF C=1 THEN
		mypack.APPROVE(A);
	
	ELSIF C=2 THEN
		mypack.DISCARD(A);
	END IF;
	



end;
/
commit;
