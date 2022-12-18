clear screen;


drop table person;
create table person(id number,name VARCHAR2(20),age VARCHAR2(20),address VARCHAR2(20),email VARCHAR2(20),num VARCHAR2(20));
insert into person values(1,'Ishan','22','Dhaka','180204111@aust.edu','0124587963');
insert into person values(2,'Raisa','30','Dhaka','180204123@aust.edu','0124527963');
select * from person;



drop table verifyLogin;

create table verifyLogin(id number, userName varchar2(20), password VARCHAR2(20),userStat VARCHAR2(20));

select * from verifyLogin;

insert into verifyLogin values(3,'Ishan', '111','P');
insert into verifyLogin values(4,'Raisa', '123','P');


select * from verifyLogin;

drop table Employer;
create table Employer ( id number, nameEm VARCHAR2(20),address VARCHAR2(20),email VARCHAR2(20),num VARCHAR2(20),requirement VARCHAR2(20),salary number,availablePos number);
insert into Employer values(2,'TigerIt','Dhaka','avdajs@gmail.com','012456946632','Software Developer',50000,3);
insert into Employer values(3,'ffIt','Dhaka','avasdadajs@gmail.com','01732456946632','Software Developer',50000,0);
insert into Employer values(4,'DataSoft','Dhaka','DataSoft@gmail.com','01689224578','System Engineer',50000,1);
insert into Employer values(5,'GGsoft','Dhaka','GGsoft@gmail.com','016892249450','Graphics Designer',15000,4);
insert into Employer values(6,'BDIt','Dhaka','BDIt@gmail.com','01689224949','Web Developer',40000,1);
insert into Employer values(7,'TechCO','Dhaka','TechCO@gmail.com','01689224945','Web Developer',30000,2);

select * from Employer;

drop table Employer_approval;
create table Employer_approval ( nameEm VARCHAR2(20),address VARCHAR2(20),email VARCHAR2(20),num VARCHAR2(20),requirement VARCHAR2(20),salary number,availablePos number);
insert into Employer_approval values('CTech','Dhaka','C@gmail.com','01245694654','Software Developer',50000,3);
insert into Employer_approval values('DCOns','Khulna','D@gmail.com','01732456946','Textile Engineer',50000,2);

select * from Employer_approval;



drop table applied;
create table applied(id number,nameEm VARCHAR2(20),position varchar2(20),coEmail VARCHAR2(20),pName VARCHAR2(20),email VARCHAR2(20));

insert into applied values(1,'TigerIt','Software Developer','avdajs@gmail.com','Ishan','180204111@aust.edu');
insert into applied values(2,'TigerIt','Software Developer','a@gmail.com','Asus','180204124@aust.edu');
select * from applied;

commit;        