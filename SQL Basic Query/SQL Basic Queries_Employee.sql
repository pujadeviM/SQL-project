--write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars
SELECT emp_name,salary, concat('$',cast(1.15* salary as int)) AS "Salary"  FROM employees;

-- write a SQL query to list the employee's name and job name as a format of "Employee & Job".
--select emp_name,job_name , concat(emp_name,'  ',job_name) as "Employee & Job" from employees;

--Write a query in SQL to produce the output of employees as follows:  JONAS(manager).
--select  concat(emp_name,' (',lower(job_name),')') as "Employee & Job" from employees;

--SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID and hire date.
--select emp_id,format(hire_date,'MMMM dd, yyyy')as "Date" from employees;

--write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
--select emp_name,len(trim(emp_name)) from employees;

--SQL query to find out which employees joined in the month of January. 
--SELECT * FROM employees WHERE format(hire_date, 'MMM')='Jun';

--write a SQL query to separate the names of employees and their managers by the string 'works for'. 
--select concat(e.emp_name,' works for ',m.emp_name) from employees e, employees m 
--WHERE e.manager_id = m.emp_id;

--write a SQL query to identify those employees who joined the company in 1991
--SELECT *from Employees where format(hire_date,'yyyy')=1991;

--query to identify the experience of the employees who work under the manager whose ID number is 68319.
--select DATEDIFF(year,hire_date,GETDATE())'Exp' from Employees where manager_id=68319

--write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319
--select  emp_id,salary,  concat(
--	DATEDIFF(year,hire_date,GETDATE()),' years ',
--	DATEDIFF(month,hire_date,GETDATE())%12,' months ',
--	ceiling( DATEDIFF(dd,hire_date,GETDATE())%30.4375 ),' days ') as experience 
--from Practice.dbo.Employees where manager_id=68319;

--SQL query to find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience.
--select  emp_id,salary,(salary/30) as 'Per_day_sal',  
--	concat( 
--		DATEDIFF(year,hire_date,GETDATE()),' years ',
--		DATEDIFF(month,hire_date,GETDATE())%12,' months ',
--		ceiling( DATEDIFF(dd,hire_date,GETDATE())%30.4375 ),' days ' ) as experience 
--from Employees where (salary/30)>100 

--SQL query to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name.
--select  emp_name,hire_date from Employees where DATEADD(year,8,hire_date)>'1999-12-31';

--write a SQL query to identify the employees whose salaries are odd
--select * from Practice.dbo.Employees where (salary %2) <> 0;

--find those employees who joined in the month of APRIL
--select * from Practice.dbo.Employees where format(hire_date,'MMMM')='April'; 

--find those employees who joined the company before 19th of the month
--select * from Employees where format(hire_date,'dd')<19;

-- SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991
--select * from Employees where format (hire_date,'yyyy') in ('1991')and (dep_id = 3001 or dep_id =1001) ;

--Find those employees where -1. the employees receive some commission which should not be more than the salary and
--annual salary including commission is below 34000.2. Designation is ‘SALESMAN’ and working in the department ‘3001’
--SELECT *FROM employees WHERE job_name='SALESMAN' and dep_id=3001 
--and commission<salary and 12*(salary+commission)<34000 AND commission IS NOT null

--SQL query to identify those employees who joined in any month other than February
--select * from Practice.dbo.Employees where FORMAT(hire_date ,'MMMM')<> 'February'; 
--or
--select * from Practice.dbo.Employees where FORMAT(hire_date ,'MMM')not in ('Feb');

--SQL query to identify the employees who joined the company in June 1991.
--select * from Practice.dbo.Employees where FORMAT(hire_date,'MMMM yyyy')='June 1991'

--write a SQL query to identify all employees who joined the company on 1st May 1991, 20th February 1991, and 3rd December 1991. 
--select * from Practice.dbo.Employees where FORMAT(hire_date,'dd MMMM yyyy') in ('01 MAy 1991','20 February 1991','03 December 1991');

--SQL query to find those employees who joined in 90's
--SELECT *FROM Practice.dbo.Employees WHERE format(hire_date,'yy') BETWEEN '90' AND '99';   --or
--SELECT * FROM Practice.dbo.Employees WHERE format(hire_date,'yy') >= '90' AND format(hire_date,'yy') < '99';

--SQL query to list the employees in ascending order of designations of those joined after the second half of 1991
--SELECT * FROM employees WHERE hire_date>('1991-6-30') AND datepart(year,hire_date)=1991 ORDER BY job_name ASC;

--SQL query to find top 3 highest salary.
--select top 3 emp_id,emp_name,job_name,salary from Employees order by salary desc; 
-- or
--select * from(select emp_id,emp_name,job_name,salary,DENSE_RANK() over(order by salary desc)rnk from Employees)as emp where rnk<3;

--SQL query to find 5th highest salary.
--select * from
--	(select emp_id,emp_name,salary,DENSE_RANK() over(order by salary desc)rnk from Employees)as emp 
--	where rnk=5

--SQL query to find the average salary and average total remuneration (salary and commission) for each type of job.
--select job_name, avg(salary) as avg_sal, avg(salary+commission) remuneration from employees group by job_name;

--SQL query to identify departments with fewer than four employees. Return department ID, number of employees.
--select dep_id, count(*) as emp_count from Employees group by dep_id having count(*)<4;

--find which departments have at least two employees. Return department name, number of employees
--select dep_name, count(*) as emp_count from Employees e,department d
--where e.dep_id=d.dep_id  group by dep_name having count(*)>= 2;

--SQL query to check whether the employees ID are unique or not.
--select emp_id, count(*) as count from Practice.dbo.Employees group by emp_id;

--write a SQL query to find number of employees and average salary. Group the result set on department id and job name.
--SELECT  count(*) as count,AVG(salary) as 'avg' ,job_name,dep_id FROM Employees group by dep_id,job_name;

--write a SQL query to identify those employees whose names begin with 'A' and are six characters long. Return employee name
--SELECT  emp_name FROM Employees where emp_name like 'A%' and LEN(emp_name)=6;

--SQL query to find those employees who joined in the month of where the second letter is 'a'.
--SELECT  emp_name, FORMAT(hire_date,'MMMM') 'month' FROM Employees where FORMAT(hire_date,'MMMM') like '_A%';

--query to find those employees who joined in 90's.
--SELECT  * FROM Practice.dbo.Employees where FORMAT(hire_date,'yy') like'9%'








