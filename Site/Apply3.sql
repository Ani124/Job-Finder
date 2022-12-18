SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT X CHAR PROMPT "Enter Company Name = "
ACCEPT Y CHAR PROMPT "ENTER Desired Position= "
ACCEPT Z CHAR PROMPT "ENTER Area= "
ACCEPT X1 CHAR PROMPT "Enter Company mail = "
ACCEPT Y1 CHAR PROMPT "ENTER Your Name= "
ACCEPT Z1 CHAR PROMPT "ENTER Your Mail Id= "
--ACCEPT Z2 CHAR PROMPT "call "






DECLARE
	A VARCHAR2(20);
	B VARCHAR2(20);
	C VARCHAR2(20);
	D VARCHAR2(20);
	E VARCHAR2(20);
	F VARCHAR2(20);
	HH int;
	HH2 int ;
	HH3 int;
	No_service_zone EXCEPTION;
	
BEGIN 

A:='&X';
B:='&Y';

C:='&Z';
D:='&X1';

E:='&Y1';
F:='&Z1';
HH:= 0;
HH2:=0;
HH3:=0;
	
	if (C='Khulna') THEN
		select availablePos into HH from Employer where nameEm=A and email=D and address=C and lower(requirement)=lower(B);
		HH3:=personCheck(E);
		if HH>0 and HH3=1 THEN
			UPDATE Employer SET availablePos = HH-1 WHERE nameEm=A and email=D and address=C and lower(requirement)=lower(B);
			insert into applied values(HH2,A,B,D,E,F);
			HH2:=HH2+1;
			
		end if;
		
		
	ELSIF (C='Dhaka') THEN
		select availablePos into HH from Employer@server1 where lower(nameEm)=lower(A) and email=D and address=C and lower(requirement)=lower(B);
		HH3:=personCheck(E);
		if HH>0 and HH3=1 THEN
			UPDATE Employer@server1 SET availablePos = HH-1 WHERE lower(nameEm)=lower(A) and email=D and address=C and lower(requirement)=lower(B);
			insert into applied@server1 values(HH2,A,B,D,E,F);
			HH2:=HH2+1;
		end if;
		
		
	else 
		RAISE No_service_zone;
	end if;	
	
	
EXCEPTION
	WHEN No_service_zone THEN
		DBMS_OUTPUT.PUT_LINE('No Site There');
		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('Many rows detected');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No data found');
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Other errors');


END;
/

commit;
