SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE mypack AS
		
	PROCEDURE showAppliedList;
	PROCEDURE showAppliedList2;
	PROCEDURE logged(A  in varchar2 default null);
	PROCEDURE site_logged(A  in varchar2 default null);
	PROCEDURE APPROVE(A  in varchar2 default null);
	PROCEDURE DISCARD(A  in varchar2 default null);
	
	
	
END mypack;
/

CREATE OR REPLACE PACKAGE BODY mypack AS

	PROCEDURE showAppliedList
	IS
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Employer_Name'||'  '||'Office Address'||'   '||'Applied Position'||'   '||'Applicants Name'||'   '||'Email'||'   '||'Age');
		for r in (SELECT Employer.nameEm,Employer.address,Employer.requirement,person.name,person.email,person.age FROM Employer JOIN applied ON applied.nameEm = Employer.nameEm JOIN person ON applied.email = person.email)loop
		DBMS_OUTPUT.PUT_LINE(r.nameEm||'         '||r.address||'           '||r.requirement||'       '||r.name||'       '||'    '||r.email||'  '||r.age);
		
		end loop;
	
	END showAppliedList;
	
	
	PROCEDURE showAppliedList2
	IS
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Employer_Name'||'  '||'Office Address'||'   '||'Applied Position'||'   '||'Applicants Name'||'   '||'Email'||'   '||'Age');
		for r in (SELECT e.nameEm,address,requirement,name,email,age FROM Employer@site e JOIN applied@site a ON e.nameEm = a.nameEm JOIN person@site p ON a.email = p.email where p.name='Ani')loop
		DBMS_OUTPUT.PUT_LINE(r.nameEm||'         '||r.address||'           '||r.requirement||'       '||r.name||'       '||'    '||r.email||'  '||r.age);
		
		end loop;
	
	END showAppliedList2;



	PROCEDURE logged(A in varchar2 default null)
	IS
	--A:=0;
	BEGIN
			DBMS_OUTPUT.PUT_LINE('Employer_Name'||'  '||'Office Address'||'   '||'Applied Position'||'   '||'Applicants Name'||'   '||'Email'||'   '||'Age');
			for g in (SELECT e.nameEm,address,requirement,p.name,email,age FROM Employer e JOIN applied a ON e.nameEm = a.nameEm JOIN person p ON a.pName = p.name)loop
				if (g.name=A) THEN
				
					DBMS_OUTPUT.PUT_LINE(g.nameEm||'         '||g.address||'           '||g.requirement||'       '||g.name||'       '||'    '||g.email||'  '||g.age);
			--jobSearch;
				end if;	
			end loop;	
	
	END logged;
	
	
	PROCEDURE site_logged(A in varchar2 default null)
	IS
	--A:=0;
	BEGIN
			DBMS_OUTPUT.PUT_LINE('Employer_Name'||'  '||'Office Address'||'   '||'Applied Position'||'   '||'Applicants Name'||'   '||'Email'||'   '||'Age');
			for g in (SELECT e.nameEm,address,requirement,name,email,age FROM Employer@site e JOIN applied@site a ON e.nameEm = a.nameEm JOIN person@site p ON a.pName = p.name)loop
				if (g.name=A) THEN
					DBMS_OUTPUT.PUT_LINE(g.nameEm||'         '||g.address||'           '||g.requirement||'       '||g.name||'       '||'    '||g.email||'  '||g.age);
				end if;	
			end loop;	
	
	END site_logged;



	PROCEDURE APPROVE(A  in varchar2 default null)
	IS
	HH int;
	HH2 int;
	--D varchar2(20);
	B VARCHAR2(20);
	C VARCHAR2(20);
	E VARCHAR2(20);
	F VARCHAR2(20);
	G int;
	H int;
	BEGIN
		HH:=5;
		HH2:=8;
		SELECT address into B FROM Employer_approval  WHERE nameEm=A;
		SELECT email into C FROM Employer_approval  WHERE nameEm=A;
		SELECT num into E FROM Employer_approval  WHERE nameEm=A ;
		 SELECT requirement into F FROM Employer_approval WHERE nameEm=A ;
		SELECT salary into G FROM Employer_approval WHERE nameEm=A ;
		SELECT availablePos into H FROM Employer_approval WHERE nameEm=A;
		IF (B='Dhaka') THEN
			insert into Employer values(HH,A,B,C,E,F,G,H);
			HH:=HH+1;
			delete from Employer_approval where nameEm=A;
		ELSIF (B='Khulna')THEN
			insert into Employer@site values(HH2,A,B,C,E,F,G,H);
			HH2:=HH2+1;
			delete from Employer_approval where nameEm=A;
		
		end if;
	
	END APPROVE;
	
	
	PROCEDURE DISCARD(A  in varchar2 default null)
	IS
	
	BEGIN
		delete from Employer_approval where nameEm=A;
		
	END DISCARD;

	
END mypack;
/

exec mypack.showAppliedList;

exec mypack.showAppliedList2;
exec mypack.site_logged('Ani');
commit;

