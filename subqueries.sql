use june12;
show tables;
select * from emp;
-- 50.write a query to display find the duplicate salary in group and salary must be greater then 1000
select count(*), sal from emp group by sal having count(*)>1 and sal>1000;
-- 51.write a query to display count of the employees in  each dept who have more than 3 except who hired in 1980 and except whose dept is null
select d_no,count(*) from emp where hiredate not like "1980%" group by d_no having count(*)>3 and d_no is not null ;
-- 52.WAQTD DETAILS OF THE EMPLOYEES WORKING AS ANALYST IN THE LOCATION DALLAS.
select * from emp where job="analyst" and d_no=(select d_no from dept where loc="dallas");
-- 53.DISPLAY ALL THE EMPLOYEES WHOSE LOCATION NAME ENDING WITH 'S'.
select * from emp where d_no in (select d_no from dept where loc like "%s");
-- 54.WAQTD NAME , ANNUAL SALARY OF THE EMPLOYEES IF THEIR ANNUAL SALARY IS MORE THAN ALL THE MANAGER.
select e_name,(sal*12) as Annual_salary from emp where (sal*12)> all(select (sal*12) from emp where job="manager");
-- 55.WAQTD DETAILS OF EMPLOYESS WHOSE HIREDATE GREATER THAN SALESMAN.
select * from emp where hiredate>all(select hiredate from emp where job="salesman");
-- 56.WAQTD THE PRESIDENT SALARY.
select job,sal from emp where job="President";
-- 57.WAQTD THE COUNT OF EMP IN EACH DEPT.
select d_no,count(*) from emp group by d_no;
-- 58.WAQTD THE DNAME OF EMP OF EACH DEPT.
select e.e_name,d.d_name from dept d join emp e on d.d_no=e.d_no;
-- 59.WAQTD SALARY GREATER THAN ALLEN AND SMITH.
select * from emp where sal> all(select sal from emp where e_name="allen" or e_name= "smith");
-- 60.WAQTD DETAILS OF AN EMPLOYEE WHOSE SALARY IS GREATER THAN ALLEN AFTER THE HIKE OF 10%.
select * from emp where sal > (select (sal*1.10) from emp where e_name="allen");
-- 61.WAQTD DEPARTMENT NAME OF THE EMPLOYEES WHO ARE HIRED AFTER THE ALLEN INTO SALES DEPARTMENT.
select d_name from dept where d_no in (select d_no from emp where hiredate>(select hiredate from emp where e_name="allen" )and d_no=(select d_no from dept where d_name="sales"));
-- 62.WAQTD JOINED DATE AND REPOTRTING MANAGER NUMBER IF AN EMPLOYEE WORKING IN BOSTON.
select hiredate ,mgr from emp where d_no=(select d_no from dept where loc="boston");
-- 63.WAQTD NAMES AND JOB OF AN EMPLOYEES IN EACH JOB IF THERE ARE TWO EMPLOYEES NAME SHOULD STARTS WITH 'S' OR 'P'.
select e_name,job from emp where job in (select job from emp where (e_name like "s%" or e_name like "p%") group by job having count(*)=2);
-- 64.WAQTD NO OF EMPLOYEES ARE WORKING IN EACH DEPARMENT IN THE CHICAGO.
select d_no,count(*) from emp where d_no in (select d_no from dept where loc="chicago") group by d_no;
-- 65.WAQTD EMP NAME, JOB, LOCATION OF ALL EMPLOYEES WHO ARE WORKING AS A MANAGER AND WORKS AT CHICAGO.
select e.e_name,e.job,d.loc from emp e join dept d on e.d_no=d.d_no where e.job="manager" and d.loc="chicago";
-- 66.LIST EMPLOYEES FROM SALES AND RESEARCH DEPARTMENT HAVING ATLEAST 2 REPORTING EMPLOYEES.
select * from emp where d_no in (select d_no from dept where d_name="sales" or d_name="research") and e_no in (select mgr from emp group by mgr having count(*)>1);
-- 67.DISPLAY THE LOCATION OF ALL THE DEPARTMENTS WHICH HAVE EMPLOYEES JOINED IN THE YEAR 81.
select loc from dept where d_no in (select d_no from emp where hiredate between "1981-01-01" and "1981-12-31");
-- 68.WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE THAN THE ANALYST.
select e_name from emp where sal>all(select sal from emp where job="analyst");
-- 69.WAQTD NAME OF THE EMPLOYEES IF THE EMPLOYEE EARNS SALARY LESS THAN ATLEAST A MANAGER.
select e_name from emp where sal< any(select sal from emp where job="manager");
-- 70.WAQTD EMP NAMES IF EMPLOYEES ARE HIRED AFTER ALL THE EMPLOYEES OF DEPT 30.
select e_name from emp where hiredate>all(select hiredate from emp where d_no=30);
-- 71.WAQTD DETAILS IF THE EMPLOYEES WORKING IN NEWYORK OR DALLAS.
select * from emp where d_no in (select d_no from dept where loc="new york" or loc="dallas");
-- 72.WAQTD LOC OF THE EMPLOYEES IF THEY EARN COMISSION IN DEPT 20.
select loc from dept where d_no in (select d_no from emp where comm is not null and d_no=20);
-- 73.WAQTD ALL THE DETAILS OF EMPLOYEES WORKING IN THE SAME DESIGNATION AS JONES AND WORKS IN LOCATION CHICAGO.
select * from emp where job =(select job from emp where e_name="jones") and d_no in (select d_no from dept where loc="chicago");
-- 74.WAQTD NAMES OF THE EMPLOYEES WHO EARNING MORE THAN SCOTT.
select e_name from emp where sal>(select sal from emp where e_name="scott");
-- 75.WAQTD NUMBER OF EMPLOYEES AND AVG SALARY NEEDED TO PAY THE EMPLOYEES WHOSE SALARY GREATER THAN 3000 IN EACH DEPT.
select d_no,count(*),avg(sal) from emp where sal >3000 group by d_no;
-- 76.WAQTD ENAME AND SAL OF ALL THE EMPLOYEE WHO ARE EARNING MORE THAN CLARK BUT LESS THAN CLARK.
select e_name,sal from emp where sal> (select sal from emp where e_name="clark") and sal< (select sal from emp where e_name="clark");
-- 77.WAQTD DETAILS OF ALL THE EMPLOYEES WORKING IN DEPT 30 AND WORKING IN THE SAME DESIGNATION AS JAMES.
select * from emp where d_no=30 and job=(select job from emp where e_name="james");
-- 78.WAQTD NAME OF THE EMPLOYEES WHO'S NAME STARTS WITH 'B' AND WORK IN THE SAME DESIGNATION AS CLARK.
select e_name from emp where e_name like "b%" and job = (Select job from emp where e_name="clark");
-- 79.WAQTD LOC AND DNAME OF THE EMPLOYEES WHOS SALARY IS 1250 RUPEES.
select loc,d_name from dept where d_no in (select d_no from emp where sal=1250);
-- 80.WAQTD DNAME AND LOC OF THE EMPLOYEES WHO'S NAME HAS CHARACTER 'M' IN IT.
select d_name,loc from dept where d_no in (Select d_no from emp where e_name like "%m%");
-- 81.WAQTD DEPTNO OF THERE ARE ATLEAST 4 EMP IN EACH DEPT WHOSE NAME HAS CHARACTER 'A' IN IT.
select d_no from emp where e_name like "%a%" group by d_no having count(*) > 3;
-- 82.WAQTD ENAME AND SAL OF THE EMPLOYEES IF THEY ARE WORKING AS SALESMAN.
select e_name,sal from emp where job="salesman";
-- 83.WAQTD ENAME OF THE EMPLOYEES IF THEY ARE EARNING SALARY GREATER THAN 2000 AND HIRED BETWEEN 80-86 AND THEIR NAME ENDS WITH VOWELS.
select e_name from emp where sal>2000 and hiredate between "1980-01-01" and "1986-12-31" and (e_name like "%a" or e_name like "%e" or e_name like "%i" or e_name like "%o" or e_name like "%u");
-- 84.WAQTD NAMES AND HIREDATE OF THE EMPLOYEES IF THEY HIRED DURING THE YEAR 82-85 AND EARNING THE SALARY IN BETWEEN 1000-2800.
select e_name,hiredate from emp where year(hiredate) between 1982 and 1985 and sal between 1000 and 2800;
-- 85.WAQTD THE PLACE WHICH ARE DUPLICATED IN DEPT TABLE.
select loc from dept group by loc having count(*)>1;
-- 86.WAQTD NUMBER OF EMPS WHO HAS HIRED ON THE SAME DAY IN EACH DEPT.
select d_no,count(*)  from emp where (d_no,hiredate) in (select d_no,hiredate from emp group by hiredate,d_no having count(*)>1) group by d_no;
-- 87.WAQTD NAMES OF THE EMPLOYEES EARNING LESS THAN KING , FORD.
select e_name from emp where sal< all(select sal from emp where e_name="king" or e_name="ford");
-- 88.WAQTD DETAILS OF EMPLOYEES WORKING NEWYORK OR CHICAGO.
select * from emp where d_no in (select d_no from dept where loc="new york" or loc="chicago");
-- 89.WAQTD NAME AND HIREDATE OF ALL THE EMPLOYEES WHO ARE HIRED BEFORE ANALYST.
select e_name,hiredate from emp where hiredate<all(select hiredate from emp where job="analyst");
-- 90.WAQTD NAMES OF EMPLOYEES EARNING MORE THAN ADAMS IN RESEARCH DEPT.
select e_name from emp where sal>(Select sal from emp where e_name="adams" and d_no=(Select d_no from dept where d_name="research"));
-- 91.DISPLAY ALL THE EMPLOYEES WHO ARE MANAGER'S HAVING 'K' AS THE LAST BUT ONE CHARACTER IN NAME AND EARNING THE SALARY IN BETWEEN 2500-2851.
select * from emp where job="manager" and e_name like "%k_"and sal between 2500 and 2851;
-- 92.WAQTD DETAILS OF THE EMPLOYEES ALONG WITH ANNUAL SALARY IF EMPLOYEES ARE WORKING IN DALLAS.
select *,(sal*12) as Annual_salary from emp where d_no in (select d_no from dept where loc="dallas");
-- 93.WAQTD NAMES OF EMPLOYEES IF THEY ARE EARNING MORE THAN TURNER IN DEPT 30 AND WORKING IN CHICAGO.
select e_name from emp where sal>(select sal from emp where e_name="turner" and d_no=30 )and d_no in (select d_no from dept where loc="chicago");
-- 94.WAQTD NAMES OF ALL THE EMPLOYEES WHO ARE EARNING LESS THAN ANYONE OF THE ANALYST.
select e_name from emp where sal<any(select sal from emp where job="analyst");
-- 95.DISPLAY DEPARTMENT NAME OF ALL THE EMPLOYEES WHO ARE REPORTING TO BLAKE.
select d_name from dept where d_no in (select d_no from emp where mgr=(select e_no from emp where e_name="blake"));
-- 96.WAQTD HIREDATE OF EMPLOYEE WHO HIRED BEFORE MARTIN INTO SALES DEPT.
select hiredate from emp where hiredate<(select hiredate from emp where e_name="martin") and d_no in (select d_no from dept where d_name="sales");
-- 97.WAQTD THE DEPTNO OF EMP WHO ARE WORKING IN SALES DEPT AND THEY ARE WORKING AS MANAGER.
select d_no from emp where d_no in (select d_no from dept where d_name="sales") and job="manager";
-- 98.WAQTD THE LOCATION OF THE EMPLOYEES, WHOSE DOES NOT START WITH 'S' AND HIRED DURING 80-82.
select loc from dept where d_no in (select d_no from emp where year(hiredate) between 1980 and 1982 and  e_name not like "s%");
-- 99.WAQTD AVG SALARY , MAX SALARY , TOTAL SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH JOB EXCEPT SALESMAN.
select job,avg(sal),max(sal),sum(sal) as total_sal from emp where job!="salesman" group by job;
-- 100. WAQTD THE NAMES OF THE EMP WHO HAS 2 A'S IN THEIR NAME AND WORKING IN DEPT 20 AND EARNIG SALARY IN THE RANGE OF 1099-1500 
-- AND HIRED BETWEEN 85-88 INTO THE RESEARCH DEPT .
select e_name from emp where e_name like "%a%a" and d_no=20 and sal between 1099 and 1500 and year(hiredate) between 1985 and 1988 and d_no in (select d_no from dept where d_name="research");