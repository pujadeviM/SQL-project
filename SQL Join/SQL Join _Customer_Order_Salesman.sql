-- SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
select s.name  as 'salesman',c.cust_name, c.city from Salesman_info s,Customer_Info c where s.city=c.city;

--SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select o.ord_no,o.purch_amt,c.cust_name,c.city from Order_Info o,Customer_Info c
where o.customer_id=c.customer_id
and o.purch_amt between 500 and 2000;

--SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission
SELECT c.cust_name as 'Customer' , c.city, s.name  as 'Salesman', s.commission
FROM Salesman_info s,Customer_Info c where s.salesman_id=c.salesman_id   ;    --or
SELECT c.cust_name as 'Customer' , c.city, s.name  as 'Salesman', s.commission
FROM Salesman_info s inner join Customer_Info c on s.salesman_id=c.salesman_id

--find salespeople who received commissions of more than 12 percent from the company.Return Cust_Name, cust_city, Salesman, commission
SELECT c.cust_name , c.city, s.name  as 'Salesman', s.commission 
FROM Salesman_info s inner join Customer_Info c
on s.salesman_id=c.salesman_id and s.commission>0.12;

--SQL query to locate those salespeople who do not live in the same city where their customers live and have received 
--a commission of more than 12% from the company.
SELECT c.cust_name as customer, c.city as C_City,s.city as S_City, s.name  as 'Salesman', s.commission
FROM Salesman_info s inner join Customer_Info c 
on s.salesman_id=c.salesman_id 
and s.commission>0.12 and c.city!= s.city ;

--SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
SELECT o.ord_no, o.ord_date,o.purch_amt ,c.cust_name as customer, c.grade, s.name  as 'Salesman', s.commission
FROM Order_Info o , Customer_Info c, Salesman_info s
where c.customer_id=o.customer_id and o.salesman_id=s.salesman_id;      --or
SELECT a.ord_no,a.ord_date,a.purch_amt,b.cust_name AS "Customer Name", b.grade, c.name AS "Salesman", c.commission 
FROM Order_Info a INNER JOIN Customer_Info b ON a.customer_id=b.customer_id 
INNER JOIN Salesman_info c  ON a.salesman_id=c.salesman_id;

--find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity.
--The result should be ordered by ascending customer_id. 
select c.cust_name,c.city,c.grade,s.name,s.city FROM Customer_Info c, Salesman_info s
where c.salesman_id=s.salesman_id and c.grade<300 order by c.customer_id

--SQL statement to generate a report with customer name,city,order number,order date,order amount,salesperson name,and commission
--to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves
select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,s.name as salesman,s.commission 
from Customer_Info c,Order_Info o, Salesman_info s
where c.customer_id=o.customer_id and o.salesman_id=s.salesman_id ;         --or
select a.cust_name,a.city, b.ord_no,b.ord_date,b.purch_amt as "Order Amount", c.name,c.commission 
from Customer_Info a LEFT OUTER JOIN Order_Info b on a.customer_id=b.customer_id 
LEFT OUTER JOIN Salesman_info c on c.salesman_id=b.salesman_id ;

--List all salespersons along with customer name, city, grade, order number, date, and amount.Condition for selecting list of salesmen :
--1. Salesmen who works for one or more customer or, 
--2. Salesmen who not yet join under any customer, Condition for selecting list of customer : 
--3. placed one or more orders, or 
--4. no order placed to their salesman.
select c.cust_name,c.city,c.grade,s.name,o.ord_no,o.ord_date,o.purch_amt
FROM Customer_Info c,Order_Info o, Salesman_info s 
where c.customer_id=o.customer_id and o.salesman_id=s.salesman_id;
--or
SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", c.ord_no, c.ord_date, c.purch_amt 
FROM Customer_Info a RIGHT OUTER JOIN Salesman_info b ON b.salesman_id=a.salesman_id 
RIGHT OUTER JOIN Order_Info c ON c.customer_id=a.customer_id;