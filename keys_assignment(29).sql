use june12;
create table customers(
customer_id int primary key,
c_name varchar(20),
email varchar(25),
address text
);
create table products(
product_id int primary key,
p_name varchar(20),
price float,
description text
);
create table orders(
order_id int primary key,
customer_id int,
product_id int,
order_date date,
total_cost float,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
);
insert into customers values(101,"Mahesh","mahesh@gmail.com","Hyderabad");
insert into customers values(102,"Rahul","rahul@gmail.com","Bangalore");
insert into customers values(103,"Priya","priya@gmail.com","Chennai");
insert into customers values(104,"Anjali","anjali@gmail.com","Mumbai");
insert into customers values(105,"Kiran","kiran@gmail.com","Vijayawada");
insert into products values(201,"Laptop",65000,"Dell Inspiron Laptop");
insert into products values(202,"Mobile",25000,"Samsung Galaxy Smartphone");
insert into products values(203,"Headphones",3000,"Wireless Bluetooth Headphones");
insert into products values(204,"Keyboard",1500,"Mechanical Keyboard");
insert into products values(205,"Smartwatch",8000,"Fitness Smart Watch");
insert into orders values(301,101,201,"2026-06-10",65000);
insert into orders values(302,102,203,"2026-06-12",3000);
insert into orders values(303,103,202,"2026-06-15",25000);
insert into orders values(304,104,205,"2026-06-18",8000);
insert into orders values(305,105,204,"2026-06-20",1500);
select * from customers;
select * from products;
select * from orders;
-- Write a query that retrieves the order history for a specific customer, including the product name, order date, and total cost
select*from orders where customer_id = 103;
-- Write a query that retrieves the total sales for a specific product
select product_id, sum(total_cost) as Total_Sales from orders where product_id = 201 group by product_id;

