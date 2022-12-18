clear screen;
drop table person;

create table person(id number ,name varchar2(20),age varchar2(20),address varchar2(20),email VARCHAR2(20),num VARCHAR2(20));

select * from person;

insert into person values(1, 'Ani', '23','Khulna','adfadf@gmail.com','1234312221');
insert into person values(2, 'dsa', '23','Khulna','adfadsdf@gmail.com','1234312221');
insert into person values(3, 'Asni', '23','Khulna','adf@gmail.com','1234312221');


select * from person;


drop table Employer;
create table Employer( id number, nameEm VARCHAR2(20),address VARCHAR2(20),email VARCHAR2(20),num VARCHAR2(20),requirement VARCHAR2(30),salary number,availablePos number);

insert into Employer values(1,'SS.soft','Khulna','ss1@gmail.com','0921348403','Web developer',25000,2);

insert into Employer values(2,'SSew.soft','Khulna','ss1ads@gmail.com','0921348403','Web developer',25000,0);

insert into Employer values(3,'SStgd.soft','Khulna','SStgd@gmail.com','0921348498','Software Engineer',25000,2);

insert into Employer values(4,'TanzatConc','Khulna','TanzatConc@gmail.com','0921348487','Civil Enginner',30000,3);

select * from Employer;

drop table verifyLogin;

create table verifyLogin(id number,userName VARCHAR2(20),password VARCHAR2(20),userStat varchar2(20));
insert into verifyLogin values(1,'Ani','124','P');
select * from verifyLogin;

drop table applied;

create table applied(id number,nameEm VARCHAR2(20),position varchar2(20),coEmail varchar2(20),pName VARCHAR2(20),email varchar2(20));

insert into applied values(1,'SS.soft','Web Developer','ss1@gmail','Ani','adfadf@gmail.com');

insert into applied values(2,'BDIt','Web Developer','BDIt@gmail.com','Ani','124@gmail.com');

commit;        