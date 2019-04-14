Name : M.Ahmed Arshed
Roll no: p176099
Secttion :A
task# :3

--Q1:
create table customer(
    id int(4) primary key,
    FirstName varchar(15) not null,
    LastName varchar(15) not null,
    city varchar(10) not null,
    country varchar(10) not null,
    phone varchar(11) not null);

create table orders(
    id int(4) primary key,
    OrderDate Date not null,
    orderNumber int(6) not null,
    customerid int(4) not null,
    TotalAmount int(20) not null,
constraint fk_custno foreign key(customerid)
	    references customer(id) ON DELETE CASCADE 
	    ON UPDATE CASCADE
);

insert into customer(id , FirstName,LastName,city,country,phone)
	values(100 , 'Ahmed','Arshed','Chunian','pakistan' , '03001234567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(101 , 'Anus','Ali','Chunian','China' , '03101236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(102 , 'Shariq','Zafar','Chunian','pakistan' , '03201236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(103 , 'Raza','Samo','Chunian','USA' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(104 , 'Shufi','ullah','peshewar','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(105 , 'Wajhat','Raza','Islambad','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(106 , 'hafeez','Raza','peshewar','USA' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(107 , 'Gulfam','Raza','Chunian','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(108 , 'hasseb','javad','Chunian','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(109 , 'Abdul Qudar','Hamza','Chunian','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(110 , 'Abid','Raza','Chunian','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(111 , 'Ahmed','Tariq','Lahore','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(112 , 'Waqas','yousaf','Lahore','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(113 , 'Muhammad','Ali','Chunian','USA' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(114 , 'Ammad','Amir','Lahore','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(115 , 'Shaik','Arslan','Changa manga','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(116 , 'Bilal','Raza','Peshawer','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(117 , 'Diasul','Waqar','Peshawer','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(118 , 'Galib','Raza','Chunian','USA' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(119 , 'Hamza','hanif','Lahore','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(120 , 'Muneeb','Raza','Chunian','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(121 , 'Muneeb','Raza','Chunian','pakistan' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(122 , 'Muneeb','Raza','Chunian','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(123 , 'Muneeb','Raza','Chunian','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(124 , 'Muneeb','Raza','Chunian','China' , '03001236567');
insert into customer(id , FirstName,LastName,city,country,phone)
	values(125 , 'Muneeb','Raza','Chunian','China' , '03001236567');

insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(1,'2019-03-01' , 0001 ,120,100000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(2,'2019-04-01' , 1001 ,100,200000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(3,'2019-05-01' , 0201 ,102,300000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(4,'2019-06-01' , 0031 ,105,400000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(5,'2019-07-01' , 2001 ,110,600000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(6,'2019-08-01' , 3001 ,115,10000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(7,'2019-09-01' , 5601 ,105,20000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(8,'2019-04-01' , 1001 ,100,200000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(9,'2019-05-01' , 0201 ,102,300000 );
insert into orders(id , orderDate ,orderNumber,customerid,TotalAmount)
	values(10,'2019-05-01' , 0201 ,102,300000 );

--1)
select count(id) as no_customers , country
	from customer
	group by country
	having no_customers > 10;
--2)
select count(id) as no_customer , country
	from customer
	where country != ' USA'
	group by country
	having no_customer >= 9;
--3)
select FirstName , avg(TotalAmount) as avg_ammount
	from customer c,orders o
	where o.customerid = c.id
	group by TotalAmount
	having TotalAmount between 100000 AND 600000;
	
--4)
select count(country) as no_customers , city , country
	from customer
	group by country , city;
--5)
select count(id)
	from orders
	group by orderdate;

--6)
select count(*) , customerid
	from orders
	group by customerid;
--7)
select customerid , count(ordernumber) as order_count
	from orders
	group by customerid
	having order_count in(select min(m_order)
				from (select orderdate , count(ordernumber) as m_order
					from orders	
						group by customerid)
	as dt);
--8)
select customerid , count(ordernumber) as order_count
	from orders
	group by customerid
	having order_count in(select max(m_order)
				from (select orderdate , count(ordernumber) as m_order
					from orders	
						group by customerid)
	as dt);
--9)
select orderdate , count(ordernumber) as order_count
	from orders
	group by orderdate
	having order_count in(select max(m_order)
				from (select orderdate , count(ordernumber) as m_order
					from orders	
						group by orderdate 
						order by m_order desc)
	as dt);
--Q2:
create table employee(
	emp_id int(4) primary key,
	first_name varchar(15) not null,
	last_name varchar(15) not null,
	email varchar(20) unique,
	hire_date varchar(30) not null,
	job_id varchar(15) not null,
	salary int(15) not null,
	manager_id int(4) not null,
	dept_id int(4) not null
);

insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(100,'Steven','King','SKING','6/17/1987', 'AD_PRES', 24000, 0 ,90);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(101,'Neena','Kochhar','NKOCHHAR','6/18/1987', 'AD_VP', 17000, 100 ,90);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(102,'Lex','De Haan','LDEHAAN','6/19/1987', 'AD_VP', 17000, 100 ,90);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(103,'Alexander','Hunold','AHUNOLD ','6/20/1987', 'IT_PROG', 9000, 102 ,60);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(104,'Bruce','Ernst','BERNST','6/21/1987', 'IT_PROG', 6000, 103 ,60);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(105,'David','Austin','DAUSTIN','6/22/1987', 'IT_PROG', 4800, 103 ,60);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(106,'Valli','Pataballa','VPATABAL','6/23/1987', 'IT_PROG', 4800, 103 ,60);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(107,'Diana','Lorentz','DLORENTZ','6/24/1987', 'IT_PROG', 4200, 130 ,60);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(108,'Nancy','Greenberg','NGREENBE','6/25/1987', 'FI_MGR', 12000, 101 ,100);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(109,'Daniel','Faviet','DFAVIET','6/26/1987', 'FI_ACCOUNT', 9000, 108 ,100);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(110,'John','Chen','JCHEN','6/27/1987', 'FI_ACCOUNT', 8200, 108 ,100);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(111,'Ismael ','Sciarra','ISCIARRA','6/28/1987', 'FI_ACCOUNT', 7700, 108 ,100);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(112,'Jose Manue','Urman','JMURMAN','6/29/1987', 'FI_ACCOUNT', 7800, 108 ,100);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(113,'Luis','Popp','LPOPP','6/30/1987', 'FI_ACCOUNT', 6900, 108 ,100);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(114,'Den','Raphaely','DRAPHEAL','7/1/1987', 'PU_MAN', 11000, 100 ,30);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(115,'Alexander','Khoo','AKHOO','7/2/1987', 'PU_CLERK', 3100, 114 ,30);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(116,'Shelli','Baida','SBAIDA','7/3/1987', 'PU_CLERK', 2900, 114 ,30);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(117,'Sigal','Tobias','STOBIAS','7/4/1987', 'PU_CLERK', 2800, 114 ,30);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(118,'Guy','Himuro','GHIMURO','7/5/1987', 'PU_CLERK', 2600, 114 ,30);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(119,'karen','Colmenares','KCOLMENA','7/6/1987', 'PU_CLERK', 2500, 114 ,30);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(120,'Matthew','Weiss','MWEISS','7/7/1987', 'ST_MAN', 8000, 100 ,50);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(121,'Adam','Fripp','AFRIPP','7/8/1987', 'ST_MAN', 8200, 100 ,50);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(122,'Payam ','Kaufling','PKAUFLIN','7/9/1987', 'ST_MAN', 7900, 100 ,50);
insert into employee(emp_id , first_name , last_name,email,hire_date,job_id,salary,manager_id,dept_id)
	values(123,'Shanta','Vollman','SVOLLMAN','7/10/1987', 'ST_MAN', 6500, 100 ,50);

--1)
select count(*) as no_of_employees , sum(salary)
	from employee
	group by dept_id;
--2)
select count(*) as number , dept_id , manager_id
	from employee
	group by dept_id , manager_id;
--3)
select AVG(salary) as average_salaries
	from employee
	group by job_id;
--4)

select manager_id, count(emp_id) as emps_id
	 from employee 
	group by manager_id 
	having max(emps_id); 
	
--5)
select dept_id,AVG(salary)
	from employee
	group by dept_id ,job_id;
--6)
select manager_id , count(*) as no_employess
	from employee
	group by manager_id
	order by manager_id;
--7)
select dept_id, count(manager_id) as no_manager
	from employee
	group by dept_id;
--8)
select dept_id , count(emp_id) as employ
	from employee
	group by dept_id
	having employ > 3;
--9)
select max(emp_id),dept_id 
	from employee 
	group by dept_id 
	having max(emp_id);
--10)
select min(emp_id),dept_id
	 from employee
	 group by dept_id 
	 having min(emp_id);

--Q4
create table suppliers(
	s_id int(4) primary key,
	s_name varchar(20) not null,
	contact varchar(15) not null,
	city varchar(10) not null
);

create table order_4(
	order_id int(3) primary key,
	customer_name varchar(15) not null,
	order_date date not null
);

create table products(
	p_id int(5) primary key,
	p_name varchar(12) not null,
	units int(5) not null,
	unit_price int(2) not null,
	type char(15) not null,
	s_id int(4) not null,
	constraint fk_sup_id foreign key(s_id)
	references suppliers(s_id) ON DELETE CASCADE 
	    ON UPDATE CASCADE
);

create table order_detail(
	p_id int(5) not null,
	order_id int(3) not null,
	units_purchased  int(2) not null,
	constraint pk_priamry primary key(p_id , order_id),
	
	constraint fk_product foreign key (p_id)
	references products(p_id) ON DELETE CASCADE ON UPDATE CASCADE,

	constraint fk_order foreign key (order_id)
	references order_4(order_id) ON DELETE CASCADE ON UPDATE CASCADE
);
insert into suppliers(s_id , s_name , contact , city)
	values(320 , 'Munir Brothers' , '0321-1234567', 'Karachi');
insert into suppliers(s_id , s_name , contact , city)
	values(312 ,'Alliance Pharmaceuticals' ,'0313-7654321','Peshawar');
insert into suppliers(s_id , s_name , contact , city)
	values(478, 'Abbot Pharmaceuticals', '0300-9876543' ,'Lahore');
insert into suppliers(s_id , s_name , contact , city)
	values(657 ,'Sanofi Aventis' ,'0333-5632476', 'Islamabad');
insert into suppliers(s_id , s_name , contact , city)
	values(987 ,'Ferozsons laboratories' ,'0301-1934257', 'Peshawar');

insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (1005, 'Ponstan', 100, 15, 'Tablets',312);
insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (1421, 'Brufen', 25, 35, 'Syrup', 657);
insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (3215, 'Avil', 122, 26, 'Syrup', 478);
insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (1215, 'Flagyl', 42 ,30, 'Tablets', 987);
insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (7513, 'Avil' ,140 ,20 ,'Injection', 478);
insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (1216, 'Flagyl', 10 ,35, 'Syrup', 987);
insert into products(p_id , p_name , units , unit_price , type , s_id)
	values (1007, 'Disprin', 98, 15, 'Tablets', 320 );

insert into order_4(order_id , customer_name , order_date)
	values(22, 'Waleed Ali', '2014-11-25'); 

insert into order_4(order_id , customer_name , order_date)
	values(23, 'Azhar Akbar', '2014-12-02'); 
insert into order_4(order_id , customer_name , order_date)
	values(24, 'Shahzeb Khan', '2014-12-05'); 
insert into order_4(order_id , customer_name , order_date)
	values(25, 'Javed Iqbal', '2015-01-15'); 
insert into order_4(order_id , customer_name , order_date)
	values(26, 'Tariq Khan', '2015-11-06'); 

insert into order_detail(p_id , order_id , units_purchased)
	values(1007, 22 ,5);
insert into order_detail(p_id , order_id , units_purchased)
	values(1216, 22, 1);
insert into order_detail(p_id , order_id , units_purchased)
	values(1005, 22, 4 );
insert into order_detail(p_id , order_id , units_purchased)
	values(1421 ,23 ,1);
insert into order_detail(p_id , order_id , units_purchased)
	values(1005 ,23, 1 );
insert into order_detail(p_id , order_id , units_purchased)
	values(3215, 23, 2);
insert into order_detail(p_id , order_id , units_purchased)
	values(7513, 23, 3 );
insert into order_detail(p_id , order_id , units_purchased)
	values(1421 ,24 ,2 );
insert into order_detail(p_id , order_id , units_purchased)
	values(1215 ,24 ,1 );
insert into order_detail(p_id , order_id , units_purchased)
	values(1005, 25, 5 );
insert into order_detail(p_id , order_id , units_purchased)
	values(1215 ,26 ,1);
insert into order_detail(p_id , order_id , units_purchased)
	values(1421, 26, 3);

--1)
select o.order_id , o.customer_name as name , o.order_date
	from order_4 o , order_detail d, products p
	where o.order_id = d.order_id
	and d.p_id = p.p_id
	and p.p_name like 'Flagyl' and type = 'Syrup';

--2)
select o.order_id , o.customer_name ,o.order_date
	from products p , order_4 o , order_detail d
	where o.order_id = d.order_id
	and p.p_id = d.p_id
	and customer_name = 'Javed Iqbal';

--3)
select count(*)
	from products p, suppliers s
	where s.s_id = p.s_id
	and s_name ='Munir Brothers';

--4)
delete from products
	where p_name = 'Avil' and type = 'Syrup';

--5)
select p_name , s_name
	from products p ,suppliers s
	where city = 'Peshawar'
	and p.s_id = s.s_id
	group by s.s_id;
--6)
select count(*)
	from products p , suppliers s
	where p.s_id = s.s_id
	and s_name = 'Sanofi Aventis';

--Q5
--A)
select cus_lname , inv_number , inv_date , cus_balance
    from customer c LEFT outer join invoice v
	on c.cus_code = v.cus_code;
--B)
select cus_lname , inv_number ,inv_date , cus_balance
	from customer c, invoice v
	where c.cus_code = v.cus_code;
--C)
select c.cus_lname ,v.inv_number , v.inv_date , p.p_descript
	from customer c , invoice v,product p , line l
	where c.cus_code = v.cus_code
	and l.p_code = p.p_code
	and v.inv_number = l.inv_number;
--D)
select v.inv_number , v.inv_date , p.p_descript
	from invoice v,product p , line l
	where l.p_code = p.p_code
	and v.inv_number = l.inv_number;