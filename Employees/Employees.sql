use record_company;

CREATE TABLE employees(
emp_id int not null,
first_name varchar(20),
last_name varchar(20),
salary int,
primary key(emp_id)
);

show tables;

select * from employees;

describe employees;

alter table employees 
add column contact int;

describe employees;

select * from employees;

alter table employees 
change contact job_code int;

select * from employees;

truncate table employees;

drop table employees;

create table employees(
emp_id int not null,
first_name varchar(25),
last_name varchar(25),
salary int,
primary key(emp_id)
);

select * from employees;

insert into employees(emp_id, first_name, last_name, salary)
values (1, 'bratt', 'pitt', 300000),
(2, 'chirstopher', 'nolan', 200000),
(3, 'matt', 'damon', 250000),
(4, 'donald', 'trump', 100000),
(5, 'elon', 'musk', 500000);


update employees set last_name = 'tusk'
where emp_id = 5;

delete from employees where emp_id in (1, 5);


select * from employees where emp_id = 3;

select * from employees where salary = 100000;

select * from employees where first_name = 'matt'
and salary = 250000;

select * from employees where first_name = 'donald'
or salary = 300000;

select * from employees where salary > 100000;

select * from employees where first_name != 'Niraj';

select * from employees where salary between 150000 and 220000;

select * from employees where last_name like 't%';

select * from employees where salary in (200000, 250000);

select distinct(first_name) from employees;


select max(salary) from employees;

select min(salary) from employees;

select avg(salary) from employees;

select count(*) from employees;


alter table employees add column dept varchar(20);

select * from employees;

update employees set dept = 'sales' where emp_id = 2;

update employees set dept = 'IT' where emp_id = 3;

update employees set dept = 'business' where emp_id = 4;


insert into employees (emp_id, first_name, last_name, salary, dept)
values (1, 'bratt', 'pitt', 150000, 'content'),
(5, 'barack', 'obama', 200000, 'sales'),
(6, 'bernie', 'sanders', 400000, 'IT'),
(7, 'Angela', 'merkel', 350000, 'content');

select * from employees;

select salary, count(*) from employees
group by salary;

select salary, count(*) from employees
group by salary having count(*) > 1;

select max(salary), dept from employees group by dept;

select avg(salary), dept from employees group by dept
having count(dept) > 1;

select * from employees order by salary desc;


create table product1(
category_id int, 
product_name varchar(20)
);

select * from product1;

insert into product1 values (1, 'nokia');

insert into product1 values (2, 'samsung');
insert into product1 values (3, 'hp');
insert into product1 values(6,'nikon');

select * from product1;

create table product2(
category_id int, 
product_name varchar(20)
);

select * from product2;

insert into product2 values(2, 'lg');
insert into product2 values(3, 'hp');
insert into product2 values(5, 'dell');
insert into product2 values(6, 'apple');
insert into product2 values(10, 'playstation');


select * from product2;

select product_name from product1
union
select product_name from product2;


select product_name from product1
union all
select product_name from product2;


create table department(
dept_id int,
dept varchar(20),
dept_loc varchar(20)
);


insert into department values
(1, 'content', 'chicago'),
(2,'support','new jersey'),
(3, 'sales' ,'boston'),
(4, 'hr', 'chicago'),
(5, 'operations', 'new york');

select * from department;

select * from employees;

select e.first_name, e.salary, d.dept, d.dept_loc
from employees e 
inner join department d
on e.dept = d.dept;

select e.first_name, e.salary, e.dept, d.dept, d.dept_loc
from employees e
left join department d
on e.dept = d.dept;

select e.first_name, e.salary, d.dept, d.dept_loc
from employees e 
right join department d
on e.dept = d.dept;

select e.first_name, e.salary, d.dept, d.dept_loc
from employees e 
left join department d
on e.dept = d.dept
union
select e.first_name, e.salary, d.dept, d.dept_loc
from employees e 
inner join department d
on e.dept = d.dept;

select * from employees cross join department;

