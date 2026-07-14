use june12;
select * from emp;
-- 1. WAQTD emp name and dname for all the employees who are working as salesman dept in 30.
select e_name,d_name from emp left outer join dept on emp.d_no=dept.d_no where emp.job="salesman" and emp.d_no=30;
-- 2. WAQTD emp name, job, deptno, and location of all the emp in sales.
select e.e_name,e.job,d.d_no,d.loc from emp e right outer join dept d on d.d_no=e.d_no where d.d_name="sales";
-- 3. WAQTD ename, dname, sal for all the employees who’s salary is more than miller and less then king.
select e_name,d_name,sal from emp left outer join dept on emp.d_no=dept.d_no where sal>(Select sal from emp where e_name="miller") and sal<(select sal from emp where e_name="king");
-- 4. WAQTD no. of employees working in new york.
select count(*) as no_of_emp_new_york from emp left outer join dept on emp.d_no=dept.d_no where loc="new york";
-- 5. List all employees with their department names.
select e_name,d_name from emp inner join dept on emp.d_no=dept.d_no;
-- 6. List the highest-paid employee in each department.
select d_name,max(sal) from emp left outer join dept on dept.d_no=emp.d_no group by d_name;
-- 7. List employees along with their department name, sorted by salary descending.
select e_name,d_name,sal from emp left outer join dept on emp.d_no=dept.d_no order by sal desc;
-- 8. List employees and their department names where employees have the same job title as 
-- someone in a different department.
select  distinct e.e_name,d.d_name from emp e join emp m on e.job=m.job join dept d on e.d_no=d.d_no where e.d_no!=m.d_no;
-- 9.List all departments name along with who hired first
select d_name,min(hiredate) from emp left outer join dept on emp.d_no=dept.d_no group by d_name;
