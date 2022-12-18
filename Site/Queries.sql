SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE mypack AS
		
	PROCEDURE showAppliedList;
	PROCEDURE showAppliedList2;
	PROCEDURE logged(A  in varchar2 default null);
	PROCEDURE site_logged(A  in varchar2 default null);
	--PROCEDURE APPROVE(A  in varchar2 default null, B  in varchar2 default null,C  in varchar2 default null);
	--PROCEDURE DISCARD(A  in varchar2 default null,B  in varchar2 default null,C  in varchar2 default null);
	
	
	
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
		for r in (SELECT e.nameEm,address,requirement,name,email,age FROM Employer@server1 e JOIN applied@server1 a ON e.nameEm = a.nameEm JOIN person@server1 p ON a.email = p.email where p.name='Ani')loop
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
			for g in (SELECT e.nameEm,address,requirement,name,email,age FROM Employer@server1 e JOIN applied@server1 a ON e.nameEm = a.nameEm JOIN person@server1 p ON a.pName = p.name)loop
				if (g.name=A) THEN
					DBMS_OUTPUT.PUT_LINE(g.nameEm||'         '||g.address||'           '||g.requirement||'       '||g.name||'       '||'    '||g.email||'  '||g.age);
				end if;	
			end loop;	
	
	END site_logged;

	
END mypack;
/
commit;
exec mypack.showAppliedList;

exec mypack.showAppliedList2;
