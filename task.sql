use june12;
-- 1) Write a Query to display all the details of employee if the salary ranges between 500 and 250 and department number either 10, 20, 30.
select * from emp where sal between 250 and 500 and d_no in (10,20,30);
-- 2) Write a Query to display all the employee who belongs to department number 10 or 20 and comm between 1000 and 3000 and were hired during 1980 to 1983.
select * from emp where d_no in (10,20) and comm between 1000 and 3000 and year(hiredate) between 1980 and 1983;
-- 3) Write a Query to display all the details of employee if he is not having the reporting manager.
select * from emp where mgr is null;
-- 4) List the employee where salary is between 2000 and 3000.
select * from emp where sal between 2000 and 3000;
-- 5) List all the salesman in department number 30 and having salary greater than 5000.
select * from emp where job="salesman" and d_no=30 and sal>5000;
-- 6) List all the employees who are having reporting manager in department 10.
select e_name from emp where mgr in (select e_no from emp where d_no=10);
-- 7) Write a Query to display all the details of the employee if their job is having one _(underscore) in it.
select * from emp where job like "%@_%" escape "@";
-- 8) Write a Query to display who are having % in their names.
select * from emp where e_name like "%@%%" escape "@";
-- 9)Write a Query to display who are having _(underscore) as second character in their name.
select * from emp where e_name like "_@_%" escape "@";
-- 10) Write a Query to display all the employee who are getting some comm with their designation is neither manager nor analyst.
select e_name from emp where comm is not null and job not in ("manager","analyst");
-- 11) Write a Query to display all the manager whose annual salary is ending with 0.
select e_name from emp where job="manager" and (sal*12)%10=0;
-- 12) Write a Query to display all the employee who are clerk and analyst with salary greater than 1000.
select e_name from emp where job in ("clerk","analyst") and sal>1000;
-- 13) Write a Query to display all the employee who are joined after year 81.
select e_name from emp where year(hiredate)>1981;
-- 14) Write a Query to display all the employees who are joined in Feb.
select e_name from emp where month(hiredate)= 02;
-- 15) List the employee who are not working as manager and clerk in depart no 10 and 20 with salary in the range of 1000 to 3000.
SELECT e_name FROM emp WHERE job NOT IN ('MANAGER', 'CLERK') AND d_no IN (10, 20) AND sal BETWEEN 1000 AND 3000;
-- 16) List the employees whose salary not in the range of 1000 to 2000 in depart no 10, 20, 30 except all salesman.
select e_name from emp where sal not between 1000 and 2000 and d_no in (10,20,30) and job!="salesman";
-- 17) Write a Query to display maximum salary, minimum salary and average salary of the organization by excluding employees who is working as salesman.
select max(sal),min(sal),avg(sal) from emp where job!="salesman";
-- 18) Write a Query to display number of employees by their total salary who are working in department number 20,30.
select count(*),sum(sal) as tot_sal from emp where d_no in (20,30);
-- 19)Write a Query to display max salary,min salary only if the name is start with A or S or M.
select max(sal),min(sal) from emp where e_name like "a%" or e_name like "s%" or e_name like "m%";
-- 20) Write a Query to display number of employee in department number 30 working as salesman.
select count(*) from emp where d_no=30 and job="salesman";
-- 21) Write a Query to display average salary given to the manager of the organization.
select avg(sal) from emp where job="manager";
-- 22) Write a query to display number of employee department number 10 and number of employee in department number 30.
select d_no,count(*) from emp group by d_no having d_no in (10,30);
-- 23) Write a Query to display total salary and average salary for every department.
select d_no,sum(sal) as total_sal,avg(sal) as avg_sal from emp group by d_no;
-- 24) Write a Query to display max sal and min sal in each designation.
select job,max(sal),min(sal) from emp group by job;
-- 25) Write a Query to display total salary of every department by excluding employee whose salary is greater than 3000.
select d_no,sum(sal) as tot_sal from emp where sal<3000 group by d_no;
-- 26) Write a Query to display job wise max salary in each department.
select job,d_no,max(sal) from emp group by d_no,job order by d_no;
-- 27) Write a Query to display department number of more than 4 employees.
select d_no, count(*) from emp group by d_no having count(*)>4;
-- 28) Write a Query to display job wise highest salary only if the highest salary is more than 1500.
select job,max(sal) from emp group by job having max(sal)>1500;
-- 29) Write a Query to display job wise highest salary only if the highest salary is more than 1500 excluding department number 30
select job,max(sal) from emp where d_no!=30 group by job having max(sal)>1500;
-- 30) Write a Query to display department number along with number of employees in it.
select d_no,count(*) from emp group by d_no;
-- 31) Write a Query to display the department number which are having more than 4 employee in them.
select d_no from emp group by d_no having count(*)>4;
-- 32) Write a Query to display the max salary for each of the job excluding all the employee whose name end with S.
select job,max(sal) from emp where e_name not like "%s" group by job;
-- 33) Write a Query to display the department number which are having more than 9000 as their departmental total salary.
select d_no,sum(sal) from emp group by d_no having sum(Sal)>9000;
-- 34) Write a Query to display department wise highest salary only if the highest salary in between 5000 and 10000 and total salary of department is below 10000.
select d_no,max(sal) from emp group by d_no having max(sal) between 5000 and 10000 and sum(sal)<10000;
-- 35)Write a Query to display job wise total salary in each department only if department number 10, 20 total salary is less than 10000.
select job,d_no,sum(sal) from emp group by d_no,job having d_no in (10,20) and sum(sal)<10000;
-- 36) Write a Query to display average salary of each department by excluding all employees who do not have reporting manager.
select d_no,avg(sal) from emp where mgr is not null group by d_no ;
-- 37) Write a Query to display max, min, sum, average, commission and salaries for all the department which is having employee hired within 1980 and 1985.
select d_no,max(sal),min(sal),sum(sal),avg(sal),ifnull(sum(comm),0) from emp where year(hiredate) between 1980 and 1985 group by d_no;
-- 38) Write a Query to display all the details of employee whose designation is same as martin.
select * from emp where job=(select job from emp where e_name="martin");
-- 39) Write a Query to display all the employee who were hired after recruiting miller.
select e_name from emp where hiredate>(select hiredate from emp where e_name="miller");
-- 40) Write a Query to display name of an employee along with the annual salary if the employee is working in newyork.
select e_name,(sal*12) as annual_sal from emp where d_no in (select d_no from dept where loc="new york");
-- 41) Write a Query to display all the details of employee who are working in same department of smith or allen.
select * from emp where d_no in (Select d_no from emp where e_name="smith" or e_name="allen");
-- 44) Write a Query to display duplicate names in an employee table.
select e_name from emp group by e_name having count(*)>1;
-- 45) Write a Query to display all the names of the employee only, if their name starts with vowel and their location ends with vowel.
SELECT e_name
FROM emp
WHERE (e_name LIKE 'A%'
    OR e_name LIKE 'E%'
    OR e_name LIKE 'I%'
    OR e_name LIKE 'O%'
    OR e_name LIKE 'U%')
AND d_no IN (
    SELECT d_no
    FROM dept
    WHERE loc LIKE '%A'
       OR loc LIKE '%E'
       OR loc LIKE '%I'
       OR loc LIKE '%O'
       OR loc LIKE '%U'
);
-- 46) Display Ename, job of all the managers and clerks who works in accounts and sales department
select e_name,job from emp where job in ("manager","clerk") and d_no in (select d_no from dept where d_name="Accounts" or d_name="sales");
-- 47)Write a Query to display the second maximum salary.
select max(sal) from emp where sal<(select max(sal) from emp);
-- 48) Write a Query to display the third maximum salary.
select max(sal) from emp where sal<(select max(sal) from emp where sal <(select max(sal) from emp));
-- 49)Write a Query to display all the employees who are earning more than all the managers.
select e_name from emp where sal>all(select sal from emp where job="manager");
-- 50)Write a Query to display all the employees who are earning more than any of the managers.
select e_name from emp where sal>any(select sal from emp where job="manager");
-- 51)Select empno, job and salary of all the analyst who are earning more than any of themanager.
select e_no,job,sal from emp where job="analyst" and sal>any(select sal from emp where job="manager");
-- 52) Select the department name and location of all the employee working for clark
select d_name,loc from dept where d_no in (select d_no from emp where mgr = (select e_no from emp where e_name="clark"));
-- 53) Find employees who earn more than their manager
select e.e_name from emp e join emp m on e.mgr=m.e_no where e.sal>m.sal;
-- 54). Display the employee hierarchy (employee → manager; → manager's manager)
select e.e_name as employee,m.e_name as manager,l.e_name as managers_manager from emp e join emp m on e.mgr=m.e_no join emp l on m.mgr=l.e_no;
-- 55). List all departments and the number of managers in each
select d_no, count(*) as no_of_managers from emp where e_no in (
    select distinct mgr
    from emp
    where mgr is not null
)group by d_no;
-- 56) List the top 3 highest paid employees in each department(Using window function – if supported)
select d_no,e_name,sal from (select d_no,e_name,sal, row_number() over(partition by d_no order by sal desc) as rn from emp)t where rn<=3;
-- 57). Find employees who joined in the same year as their manager
select e.e_name from emp e join emp m on e.mgr=m.e_no where year(e.hiredate)=year(m.hiredate);
-- 58) Find the department with the highest total salary
select d_no from emp group by d_no order by sum(sal) desc limit 1;
-- 59). Show departments where average salary is higher than company average salary
select d_no from emp group by d_no having avg(sal)>(select avg(sal) from emp);
-- 60). For each employee, show the name of the highest-paid person in their department Bonus: Employees with salaries in the top 10%
select e.e_name,m.e_name,e.d_no from emp e join emp m on e.d_no=m.d_no where m.sal = (select max(sal) from emp where d_no=e.d_no);