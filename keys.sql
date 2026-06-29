use june12;
create table dept(d_no int primary key, d_name varchar(20),loc varchar(20));
create table emp
(e_no int primary key,
e_name varchar(20),
job varchar(20),
mgr int,
hiredate date,
sal float,
comm float,
d_no int,
foreign key (d_no) references dept(d_no));
insert into dept values(10,"Accounting","New York");
insert into dept values(20,"Research","Dallas");
insert into dept values(30,"Sales","Chicago");
insert into dept values(40,"Operations","Boston");
select * from emp;
drop table emp;
insert into emp values(7369,"Smith","Clerk",7902,"1980-12-17",800,null,20);
insert into emp values(7499,'Allen','Salesman',7698,'1981-02-20',1600,300,30);
insert into emp values(7521,'Ward','Salesman',7698,'1981-02-22',1250,500,30);
insert into emp values(7566,'Jones','Manager',7839,'1981-04-02',2975,NULL,20);
insert into emp values(7654,'Martin','Salesman',7698,'1981-09-28',1250,1400,30);
insert into emp values(7698,'Blake','Manager',7839,'1981-05-01',2850,NULL,30);
insert into emp values(7782,'Clark','Manager',7839,'1981-06-09',2450,NULL,10);
insert into emp values(7788,'Scott','Analyst',7566,'1987-04-19',3000,NULL,20);
insert into emp values(7839,'King','President',NULL,'1981-11-17',5000,NULL,10);
insert into emp values(7844,'Turner','Salesman',7698,'1981-09-08',1500,0,30);
insert into emp values(7876,'Adams','Clerk',7788,'1987-05-23',1100,NULL,20);
insert into emp values(7900,'James','Clerk',7698,'1981-12-03',950,NULL,30);
insert into emp values(7902,'Ford','Analyst',7566,'1981-12-03',3000,NULL,20);
insert into emp values(7934,'Miller','Clerk',7782,'1982-01-23',1300,NULL,10);
select * from emp;