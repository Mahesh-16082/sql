use june12;
show tables;
insert into emp values(7495,"kris","Clerk",7902,"1980-12-17",900,null,30);
select * from emp;
-- 1.WAQTD EMPLOYEE NAME WHOSE SALARY IS GREATER THAN 3000 AFTER THE HIKE OF 10%.
select e_name from emp where (0.1*sal+sal)>3000;
-- 2. WAQTD EMPLOYEE NAME ALONG WITH ANNUAL SALARY WITH 10% HIKE IF THE EMPLOYEE WORKING UNDER 7566.
select e_name,((sal+(0.1*sal)))*12 as Annual_salary from emp where mgr=7566;
-- 3. WAQTD EMPLOYEE DETAILS WHOSE NAME STARTS WITH 'K' AND ENDS WITH 'S'.
select * from emp where e_name like "K%S";
-- 4. WAQTD EMPLOLYEE DETAILS WHO HIRED BETWEEN 80-87 AND NAMES STARTS WITH CONSONANTS.
select * from emp where hiredate between "1980-01-01" and "1987-12-31" and (e_name not like "a%" or e_name not like "e%" or e_name not like"i%" or e_name not like "%o" or e_name not like "%u");
-- 5. WAQTD NAMES STARTS WITH VOWELS AND ENDS WITH CONSONANTS.
select e_name from emp where (e_name like "a%" or e_name like "e%" or e_name like"i%" or e_name like "o%" or e_name like "u%") and 
(e_name not like "%a" and e_name not like "%e" and e_name not like "%i" and e_name not like "%o" and e_name not like "%u");
-- 6.WAQTD NAMES OF EMPLOYESS WHO WORKING AS A MANAGER.
select e_name from emp where job="manager";
-- 7. WAQTD EMPLOYEE NUMBER AND NAME WHO'S EARNING COMMISSION.
select e_no,e_name from emp where comm is not null;
-- 8. DISPLAY THE NAMES OF THE EMPLOYEES WHO ARE WORKING IN DEPT 10 AND 20 .
select e_name from emp where d_no in (10,20);
-- 9.WAQTD NAMES OF ALL THE EMPLOYEES WHO ARE WORKING AS CLERKS AND EARNING A SALARY MORE THAN 3000.
select e_name from emp where job="clerk" and sal>3000;
-- 10.DISPLAY THE ENAME OF THE EMPLOYEES WHO ARE WORKING AS CLERKS , SALESMAN OR ANALYST AND DRAWING A SALARY MORE THAN 2500.
select e_name from emp where job in ("CLERK","SALESMAN","ANALYST") and sal>2500;
-- 11.DISPLAY THE LIST OF EMPLOYEES WHO HAVE JOINED A COMPANY BEFORE 1980 OR AFTER 1988.
select e_name,hiredate from emp where hiredate<"1980-01-01" or hiredate > "1988-12-01";
-- 12.WAQTD THE NAMES OF THE EMPLOYEES WORKING IN DEPT 10,20,40 OR EMPLOYEE WORKING AS CLERK,SALESMAN,ANALYST.
select e_name,d_no,job from emp where d_no in (10,20,40) or job in ("CLERK","SALESMAN","ANALYST");
-- 13.WAQTD THE NAME OF THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND HAVING FIVE CHARACTERS.
select e_name from emp where e_name like "s%" and length(e_name)=5;
-- 14.WAQTD THE NAME OF THE EMPLOYEES WHO ARE NOT GET COMM AND WORKING DEPTNO 10,20.
select e_name,comm from emp where comm is null and d_no in (10,20);
-- 15.WAQTD DETAILS OF THE EMPLOYEES ALONG WITH ANNUAL SALARY IF THEY ARE WORKING DEPT MANAGER AS 20,30 AND THEIR ANNUAL SALARY GREATER THAN 12000.
select *,(sal*12) as Annual_sal from emp where d_no in (20,30) and ((sal*12)>12000) and job="manager";
-- 16.WAQTD DETAILS OF EMPLOYEES WHO ARE HIRED FEB.
select * from emp where hiredate like "%@-02@-%" escape '@';
-- 17.WAQTD DETAILS OF EMPLOYEES ALONG WITH ANNUAL SALARY WHOSE NAME STARTS 'M' AND LAST BUT FIRST CHARACTER 'S'.
select *,(Sal*12) as Annual_Sal from emp where e_name like "M%S_";
-- 18.WAQTD NAME AND HIREDATE OF EMPLOYEES WHO ARE HIRED BETWEEN JAN-81 AND DEC-81
select e_name,hiredate from emp where hiredate between "1981-01-01" and "1981-12-31";
-- 19.WAQTD SALESMAN DETAILS.
select * from emp where job="salesman";
-- 20.WAQTD DEPT DETAILS OF 10,20.
select * from emp where d_no in (10,20);
-- 21.WAQTD THE DETAILS OF EMPLOYESS ALONG WITH HALF TERM SALARY WHO EARNIG SAL GREATER THAN 5000 AND NAME STARTS WITH VOWELS.
select *, (sal/2) as Half_term_sal from emp where sal>5000 and (e_name like "a%" or e_name like "e%" or e_name like "i%" or e_name like "o%" or e_name like "u%");
-- 22.WAQTD DETAILS OF EMPLOYESS WHO ARE NOT WORKING AS A MANAGER AND HAVING SAL IN BETWEEN 1000-2000.
select * from emp where job!="manager" and sal between 1000 and 2000;
-- 23.WAQTD NAME OF EMPLOYEES WHO IS WORKING AS A CLERKS OR PRESIDENT.
select e_name,job from emp where job in ("CLERK","PRESIDENT");
-- 24.WAQTD LIST OF EMPLOYEES WHOSE SALARY RANGE BETWEEN 0-1400.
select e_name,sal from emp where sal between 0 and 1400;
-- 25.WAQTD NAMES OF EMPLOYEES WHO'S WORKING IN DEPT 10 AND HAVING SECOND LETTER AS 'M'.
select e_name from emp where d_no=10 and e_name like "_m%";
-- 26.WAQTD THE MAXIMUM SALARY OF DEPT 30 AND 20.
select max(sal),d_no from emp where d_no in (20,30) group by d_no;
-- 27.WAQTD NAME OF THE EMPLOYEE WHO'S GETTING SALARY LESS THAN SMITH.
select e_name from emp where sal<(select sal from emp where e_name="smith");
-- 28.WAQTD MINIMUM SALARIES GIVEN TO AN EMPLOYEE WORKING IN EACH DEPT.
select d_no,min(sal) from emp group by d_no;
-- 29.LIST ALL THE DEPT NAME THAT ARE HAVING ATLEAST 3 EMPLOYEES BUT NOT MORE THAN 5 EMPLOYEES IN IT.
select d_no,count(*) from emp group by d_no having count(*)>=3 and count(*)<6;
-- 30.WAQTD NUMBER OF EMPLOYEES WORKING IN EACH DEPARTMENT EXCEPT SALESMAN.
select d_no,count(*) as Number_of_employees from emp where job!="salesman" group by d_no; 
-- 31.WAQTD DETAILS OF EMPLOYEES WHO ARE GETTING THE REPEATED SALARY.
select * from emp where sal in (select sal from emp group by sal having count(*)>1);
-- 32.WAQTD NUMBER OF EMPLOYESS WHO ARE HAVING SAME NAME .
select e_name,count(*) as number_of_emp from emp group by e_name having count(*)>1;
-- 33.WAQTD AVG SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH DEPT EXCLUDING THE EMPLOYEES OF DEPT 10.
select d_no,avg(sal) from emp where d_no!=10 group by d_no;
-- 34.WAQTD NAME AND TOTAL SALARY OF THE EMPLOYEES IF THE EMPLOYEES ARE EARNING MORE THAN 2500.
select e_name,(sal+ifnull(comm,0)) as Total_Sal from emp where sal>2500;
-- 35.Find job roles with average salary between 30,000 and 60,000.
select job from emp group by job having avg(sal) between 30000 and 60000;
-- 36. List employees by department number in ascending order, and within each department by salary descending.
select e_name,sal,d_no from emp order by d_no,sal desc;
-- 37. Show all employees ordered alphabetically by job title, then by name.
select * from emp order by job,e_name asc;
-- 38. Retrieve employees earning more than 30,000 and sort them by salary in descending order.
select * from emp where sal>30000 order by sal desc;
-- 39. List employees from department 10, sorted by hire date (oldest first).
select * from emp where d_no =10 order by hiredate;
-- 40. Display employee names and job titles ordered by job in descending order and salary ascending.
select e_name,job,sal from emp order by job desc,sal asc;