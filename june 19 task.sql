show databases;
use june12;
show tables;
CREATE TABLE emp (
    e_no INT,
    e_name VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    d_no INT
);
INSERT INTO emp VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO emp VALUES(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO emp VALUES(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO emp VALUES(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO emp VALUES(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO emp VALUES(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO emp VALUES(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO emp VALUES(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20);
INSERT INTO emp VALUES(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO emp VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO emp VALUES(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20);
INSERT INTO emp VALUES(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO emp VALUES(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO emp VALUES(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);


-- 1. Write a query to find all employees with a salary greater than 50000.
select * from emp where sal>50000;
-- 2. Write a query to list employees whose age is less than or equal to 30.
select * from emp where age<=30;
-- 3. Write a query to find employees who are not working in the 'Sales' department.
select * from emp where job="Salesman";
-- 4. Write a query to list employees whose name starts with 'A'.
select * from emp where e_name like "A%";
-- 5. Write a query to find employees with salary not between 3000 and 7000.
select * from emp where sal not between 3000 and 7000;
-- 6. Write a query to find employees whose designation is either 'Manager' or 'Clerk'.
select * from emp where job="Manager" or job="Clerk";
-- 7. Write a query to find employees who joined before 1981.
select * from emp where hiredate<"1981-01-01";
-- 8. Write a query to find employees with NULL in their commission field.
select * from emp where com is null;
-- 9. Write a query to find employees with non-NULL commission values.
select * from emp where com is not null;
-- 10. Write a query to list employees whose salary is not equal to 4000.
select * from emp where sal!=4000;
-- 11. Write a query to find employees whose department number is in (10, 20, 30).
select * from emp where d_no in (10,20,30);
-- 12 . Write a query to list employees whose name contains the letter 'e'.
select * from emp where e_name like "%e%";
-- 13 Write a query to find employees with salary greater than 1500 and less than 3000.
select * from emp where sal between 1500 and 3000;
-- 14 Write a query to find employees who do not have 'Analyst' as their job title.
select * from emp where job!="Analyst";
-- 15 Write a query to find employees who were hired in the year 1980.
select * from emp where hiredate>="1980-01-01" and hiredate<="1980-12-31";
show tables;
select * from student;
truncate table emp;
drop table emp1;
select * from emp;
