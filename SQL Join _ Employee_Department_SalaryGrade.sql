--SQL query to find employees along with their department details. 
--select e.emp_id, e.emp_name, e.job_name,  e.dep_id,  d.dep_name 
--from Employees e , department d where e.dep_id = d.dep_id;

--SQL query to identify those employees who earn 60000 or more per year or do not work as ANALYST.
--Return employee name, job name, (12*salary) as Annual Salary, department name, and grade.
--select e.emp_name,e.job_name,(12*e.salary) as annual_sal ,d.dep_name,s.grade 
--from Employees e, department d , Salary_grade s where e.dep_id= d.dep_id
--and e.salary between s.min_sal and s.max_sal 
--and ((12*e.salary)>60000 or e.job_name <> 'ANALYST');

--write a SQL query to identify employees whose salaries are higher than their managers' salaries.
--select w.emp_name,w.job_name,w.manager_id,w.salary,m.emp_name 'Manager', m.emp_id,m.salary "Manager_Salary"
--from Employees w,Practice.dbo.Employees m
--where w.manager_id = m.emp_id and w.salary > m.salary;

--SQL query to find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) 
--and location is PERTH. Return employee name, department ID, salary, and commission.
--select e.emp_name,e.dep_id,e.salary,e.commission  from Practice.dbo.Employees e, department d 
--where e.dep_id = d.dep_id 
--and d.dep_location= 'PERTH' 
--and e.salary between 2000 and 5000;

--write a SQL query to find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4.
--They joined the company before 1992-12-31. Return grade, employee name. 
--select e.emp_name,s.grade  from Employees e , salary_grade s 
--where e.dep_id in (1001, 3001) 
--and (e.salary between s.min_sal and s.max_sal) 
--and  s.grade<>4 and e.hire_date <'1992-12-31'

--write a SQL query to find those employees whose manager name is JONAS.
--Return employee id, employee name,manager ID,salary,manager name. 
--select e.emp_id,e.emp_name,e.manager_id,e.salary,m.emp_name as 'Manager_name'
--from Practice.dbo.Employees e ,Practice.dbo.Employees m where e.manager_id =m.emp_id and m.emp_name='JONAS'

--SQL query to find the name,salary grade and salary of the employee FRANK. 
--Salary should be equal to the maximum salary within his or her salary group
--select e.emp_name , e.salary,s.grade from  Employees e, salary_grade s 
--where e.emp_name = 'FRANK' and e.salary = s.max_sal
--and e.salary between s.min_sal and s.max_Sal ;

--SQL query to find the employees who joined in 1991 and whose department location is  SYDNEY or MELBOURNE with a salary range of
--2000 to 5000(Begin and end values are included).Return employee ID, employee name, department ID, salary, and department location. 
--select e.emp_id,e.emp_name,e.dep_id,e.salary,d.dep_location from Employees e, department d 
--where e.dep_id=d.dep_id 
--and  e.salary between 2000 and 5000
--and d.dep_location in ('SYDNEY','MELBOURNE') 
--and format(e.hire_date,'yyyy')='1991';

--SQL query to find the employees of MARKETING department who come from MELBOURNE or PERTH, are in grades 3 ,4, and 5 and have at
-- least 25 years of experience.Return departmentID, employeeID,employeename, salary,departmentname, department location and grade.
--select e.emp_id,e.emp_name,e.dep_id,e.salary,d.dep_name,d.dep_location ,s.grade
--from Practice.dbo.Employees e, department d ,salary_grade s 
--where e.dep_id=d.dep_id and d.dep_name='MARKETING' 
--and d.dep_location in ('PERTH','MELBOURNE') 
--and s.grade in (3,4,5)
--and e.salary between s.min_sal and s.max_sal  
--and datediff(year,e.hire_date,GETDATE())>25

--write a SQL query to find those employees who are senior to their manager.
--select e.emp_name,e.emp_id,m.emp_name,m.emp_id,e.hire_date,m.hire_date from Employees e, Employees m 
--where e.manager_id=m.emp_id and e.hire_date <m.hire_date

--SQL query to find those employee name who joined after 1991, excluding MARKER or ADELYN in the departments PRODUCTION or AUDIT.  
--select e.emp_name from employees e,department d,salary_grade s
--where e.dep_id = d.dep_id   
--and d.dep_name in ('PRODUCTION','AUDIT')
--and e.salary between s.min_sal and s.max_sal 
--and e.emp_name not in ('MARKER','ADELYN') 
--and format(hire_date,'yyyy') >'1991';

--Query to find the location of all the employees working in the FINANCE or AUDIT department.Sort by department ID in ASC order.
--select e.emp_name,d.dep_name,d.dep_id from Employees e inner join  department d on  e.dep_id=d.dep_id 
--where d.dep_name in ('FINANCE','AUDIT') order by e.dep_id ;

--SQL query to find the employees along with grades in ascending order.
--select e.emp_name,e.emp_id,s.grade from Employees e , salary_grade s where e.salary between s.min_sal and s.max_sal order by grade;

--query to find the employees according to the department in ascending order.Return name,department,salary,and grade
--select e.emp_name,d.dep_name,e.salary, s.grade 
--from Employees e,department d,salary_grade s
--where e.dep_id = d.dep_id
--and e.salary between s.min_sal and s.max_sal 
--order by  e.dep_id ;

--SQL query to list the grade, number of employees, and maximum salary of each grade
SELECT s.grade, count(*) 'count', max(salary) as Max_sal FROM Practice.dbo.Employees e, salary_grade s
WHERE e.salary between s.min_sal and s.max_sal 
GROUP BY s.grade;

-- SQL query to identify departments with at least two SALESMEN in each grade.Return department name, grade and number of employees.
SELECT d.dep_name, s.grade,count(*) EmpCount FROM Practice.dbo.Employees e,  department d,salary_grade s
WHERE e.dep_id = d.dep_id 
and e.job_name = 'SALESMAN' 
and e.salary between s.min_sal and s.max_sal 
GROUP BY d.dep_name, s.grade HAVING count(*)>= 2;

