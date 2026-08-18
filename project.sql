use june12;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    registration_date DATE
);
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100)
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    role VARCHAR(50),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);
CREATE TABLE Parcels (
    parcel_id INT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    weight DECIMAL(5,2),
    cost DECIMAL(10,2),
    booking_date DATE,
    delivery_date DATE,
    status VARCHAR(50),
    source_branch INT,
    destination_branch INT,
    FOREIGN KEY (sender_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (receiver_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (source_branch) REFERENCES Branches(branch_id),
    FOREIGN KEY (destination_branch) REFERENCES   Branches(branch_id)
);
CREATE TABLE Tracking (
    tracking_id INT PRIMARY KEY,
    parcel_id INT,
    status VARCHAR(100),
    location VARCHAR(100),
    update_time DATETIME,
    FOREIGN KEY (parcel_id) REFERENCES Parcels(parcel_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    parcel_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(50),
    FOREIGN KEY (parcel_id) REFERENCES Parcels(parcel_id)
);
INSERT INTO Customers (customer_id, name, email, phone, address, registration_date) VALUES
(1,  'Ravi Kumar',      'ravi.kumar@email.com',      '9876543210', 'Hyderabad',  '2023-01-15'),
(2,  'Priya Sharma',    'priya.sharma@email.com',    '9876543211', 'Hyderabad',  '2023-02-10'),
(3,  'Amit Verma',      'amit.verma@email.com',      '9876543212', 'Kolkata',    '2023-03-05'),
(4,  'Sneha Reddy',     'sneha.reddy@email.com',     '9876543213', 'Hyderabad',  '2023-03-20'),
(5,  'Rahul Singh',     'rahul.singh@email.com',     '9876543214', 'Delhi',      '2023-04-01'),
(6,  'Anjali Nair',     'anjali.nair@email.com',     '9876543215', 'Mumbai',     '2023-04-18'),
(7,  'Vikram Rao',      'vikram.rao@email.com',      '9876543216', 'Chennai',    '2023-05-12'),
(8,  'Kavita Joshi',    'kavita.joshi@email.com',    '9876543217', 'Pune',       '2023-06-02'),
(9,  'Suresh Babu',     'suresh.babu@email.com',     '9876543218', 'Hyderabad',  '2023-06-25'),
(10, 'Meena Iyer',      'meena.iyer@email.com',      '9876543219', 'Chennai',    '2023-07-14'),
(11, 'Arjun Mehta',     'arjun.mehta@email.com',     '9876543220', 'Bangalore',  '2023-08-01'),
(12, 'Divya Pillai',    'divya.pillai@email.com',    '9876543221', 'Kolkata',    '2023-08-19'),
(13, 'Karan Malhotra',  'karan.malhotra@email.com',  '9876543222', 'Delhi',      '2023-09-09'),
(14, 'Pooja Desai',     'pooja.desai@email.com',     '9876543223', 'Ahmedabad',  '2023-09-28'),
(15, 'Rohit Gupta',     'rohit.gupta@email.com',     '9876543224', 'Hyderabad',  '2023-10-10'),
(16, 'Nisha Kulkarni',  'nisha.kulkarni@email.com',  '9876543225', 'Pune',       '2023-11-01'),
(17, 'Manoj Tiwari',    'manoj.tiwari@email.com',    '9876543226', 'Mumbai',     '2023-11-20'),
(18, 'Deepa Menon',     'deepa.menon@email.com',     '9876543227', 'Hyderabad',  '2023-12-05'),
(19, 'Sanjay Chawla',   'sanjay.chawla@email.com',   '9876543228', 'Chandigarh', '2024-01-10'),
(20, 'Ritu Bhatia',     'ritu.bhatia@email.com',     '9876543229', 'Delhi',      '2024-01-25');

INSERT INTO Branches (branch_id, branch_name, city, state) VALUES
(1,  'Hyderabad Central',       'Hyderabad',   'Telangana'),
(2,  'Kolkata Park Street',     'Kolkata',     'West Bengal'),
(3,  'Delhi Connaught',         'Delhi',       'Delhi'),
(4,  'Mumbai Andheri',          'Mumbai',      'Maharashtra'),
(5,  'Chennai Anna Nagar',      'Chennai',     'Tamil Nadu'),
(6,  'Pune Shivaji Nagar',      'Pune',        'Maharashtra'),
(7,  'Bangalore Koramangala',   'Bangalore',   'Karnataka'),
(8,  'Ahmedabad Navrangpura',   'Ahmedabad',   'Gujarat'),
(9,  'Hyderabad Gachibowli',    'Hyderabad',   'Telangana'),
(10, 'Chandigarh Sector17',     'Chandigarh',  'Chandigarh'),
(11, 'Jaipur Malviya Nagar',    'Jaipur',      'Rajasthan'),
(12, 'Lucknow Hazratganj',      'Lucknow',     'Uttar Pradesh'),
(13, 'Bhopal MP Nagar',         'Bhopal',      'Madhya Pradesh'),
(14, 'Nagpur Sitabuldi',        'Nagpur',      'Maharashtra'),
(15, 'Indore Vijay Nagar',      'Indore',      'Madhya Pradesh'),
(16, 'Surat Adajan',            'Surat',       'Gujarat'),
(17, 'Kochi MG Road',           'Kochi',       'Kerala'),
(18, 'Patna Boring Road',       'Patna',       'Bihar'),
(19, 'Guwahati Paltan Bazaar',  'Guwahati',    'Assam'),
(20, 'Ranchi Main Road',        'Ranchi',      'Jharkhand');

INSERT INTO Employees (employee_id, name, phone, role, branch_id) VALUES
(1,  'Suman Rao',       '9123456780', 'Manager',        1),
(2,  'Vikas Anand',     '9123456781', 'Delivery Agent', 1),
(3,  'Geeta Nair',      '9123456782', 'Clerk',          2),
(4,  'Harish Kumar',    '9123456783', 'Delivery Agent', 2),
(5,  'Naveen Reddy',    '9123456784', 'Manager',        3),
(6,  'Shalini Rao',     '9123456785', 'Driver',         3),
(7,  'Vivek Menon',     '9123456786', 'Delivery Agent', 4),
(8,  'Ashwini Patil',   '9123456787', 'Clerk',          4),
(9,  'Ramesh Iyer',     '9123456788', 'Manager',        5),
(10, 'Latha Krishnan',  '9123456789', 'Driver',         5),
(11, 'Farhan Ali',      '9123456790', 'Delivery Agent', 6),
(12, 'Sunita Deshmukh', '9123456791', 'Clerk',          6),
(13, 'Praveen Kumar',   '9123456792', 'Manager',        7),
(14, 'Meera Pillai',    '9123456793', 'Driver',         7),
(15, 'Yogesh Shah',     '9123456794', 'Delivery Agent', 8),
(16, 'Radha Krishna',   '9123456795', 'Manager',        9),
(17, 'Imran Khan',      '9123456796', 'Driver',         9),
(18, 'Swathi Reddy',    '9123456797', 'Clerk',          10),
(19, 'Deepak Chopra',   '9123456798', 'Delivery Agent', 10),
(20, 'Anitha Rao',      '9123456799', 'Manager',        1);

INSERT INTO Parcels (parcel_id, sender_id, receiver_id, weight, cost, booking_date, delivery_date, status, source_branch, destination_branch) VALUES
(1,  1,  3,  5.50,  350.00,  '2023-05-10', '2023-05-15', 'Delivered',  1, 2),
(2,  1,  5,  12.00, 750.00,  '2024-06-01', '2024-06-05', 'Delivered',  1, 3),
(3,  2,  4,  8.00,  450.00,  '2024-07-15', '2024-07-20', 'Delivered',  1, 9),
(4,  2,  6,  15.50, 900.00,  '2025-01-10', '2025-01-15', 'Delivered',  1, 4),
(5,  3,  1,  3.00,  200.00,  '2023-08-20', '2023-08-25', 'Delivered',  2, 1),
(6,  4,  7,  20.00, 1200.00, '2025-02-14', NULL,         'In Transit', 9, 5),
(7,  4,  8,  6.50,  400.00,  '2024-03-05', '2024-03-10', 'Delivered',  9, 6),
(8,  5,  9,  11.00, 650.00,  '2024-09-19', '2024-09-25', 'Delivered',  3, 5),
(9,  5,  10, 2.50,  150.00,  '2023-11-11', '2023-11-14', 'Delivered',  3, 5),
(10, 6,  2,  18.00, 1100.00, '2025-03-01', NULL,         'Pending',    4, 1),
(11, 7,  11, 4.00,  300.00,  '2024-04-22', '2024-04-27', 'Delivered',  5, 7),
(12, 7,  12, 9.00,  500.00,  '2024-12-05', '2024-12-10', 'Delivered',  5, 2),
(13, 8,  13, 25.00, 1500.00, '2025-04-18', NULL,         'In Transit', 6, 3),
(14, 9,  14, 1.50,  100.00,  '2023-02-28', '2023-03-03', 'Delivered',  5, 8),
(15, 9,  15, 14.00, 800.00,  '2024-08-08', '2024-08-13', 'Delivered',  5, 9),
(16, 10, 16, 7.00,  420.00,  '2024-05-30', NULL,         'Cancelled',  7, 6),
(17, 11, 17, 30.00, 2000.00, '2025-05-05', NULL,         'Pending',    1, 4),
(18, 12, 3,  5.00,  320.00,  '2023-06-16', '2023-06-20', 'Delivered',  2, 1),
(19, 13, 4,  16.50, 950.00,  '2024-10-10', '2024-10-15', 'Delivered',  1, 9),
(20, 14, 18, 3.50,  250.00,  '2024-11-11', NULL,         'Cancelled',  9, 1);

INSERT INTO Tracking (tracking_id, parcel_id, status, location, update_time) VALUES
(1,  1,  'Delivered',  'Kolkata Park Street',    '2023-05-15 10:00:00'),
(2,  2,  'Delivered',  'Delhi Connaught',        '2024-06-05 14:30:00'),
(3,  3,  'Delivered',  'Hyderabad Gachibowli',   '2024-07-20 09:15:00'),
(4,  4,  'Delivered',  'Mumbai Andheri',         '2025-01-15 16:45:00'),
(5,  5,  'Delivered',  'Hyderabad Central',      '2023-08-25 11:20:00'),
(6,  6,  'In Transit', 'Chennai Anna Nagar',     '2025-02-16 08:00:00'),
(7,  7,  'Delivered',  'Pune Shivaji Nagar',     '2024-03-10 12:00:00'),
(8,  8,  'Delivered',  'Chennai Anna Nagar',     '2024-09-25 17:10:00'),
(9,  9,  'Delivered',  'Chennai Anna Nagar',     '2023-11-14 13:40:00'),
(10, 10, 'Pending',    'Mumbai Andheri',         '2025-03-02 09:30:00'),
(11, 11, 'Delivered',  'Bangalore Koramangala',  '2024-04-27 10:50:00'),
(12, 12, 'Delivered',  'Kolkata Park Street',    '2024-12-10 15:20:00'),
(13, 13, 'In Transit', 'Delhi Connaught',        '2025-04-19 07:45:00'),
(14, 14, 'Delivered',  'Ahmedabad Navrangpura',  '2023-03-03 14:00:00'),
(15, 15, 'Delivered',  'Hyderabad Gachibowli',   '2024-08-13 11:15:00'),
(16, 16, 'Cancelled',  'Bangalore Koramangala',  '2024-06-02 10:00:00'),
(17, 17, 'Pending',    'Mumbai Andheri',         '2025-05-06 09:00:00'),
(18, 18, 'Delivered',  'Hyderabad Central',      '2023-06-20 13:30:00'),
(19, 19, 'Delivered',  'Hyderabad Gachibowli',   '2024-10-15 16:00:00'),
(20, 20, 'Cancelled',  'Hyderabad Central',      '2024-11-12 10:20:00');

INSERT INTO Payments (payment_id, parcel_id, amount, payment_date, payment_mode) VALUES
(1,  1,  350.00,  '2023-05-10', 'Cash'),
(2,  2,  750.00,  '2024-06-01', 'UPI'),
(3,  3,  450.00,  '2024-07-15', 'Card'),
(4,  4,  900.00,  '2025-01-10', 'UPI'),
(5,  5,  200.00,  '2023-08-20', 'Cash'),
(6,  6,  1200.00, '2025-02-14', 'Card'),
(7,  7,  400.00,  '2024-03-05', 'UPI'),
(8,  8,  650.00,  '2024-09-19', 'NetBanking'),
(9,  9,  150.00,  '2023-11-11', 'Cash'),
(10, 10, 1100.00, '2025-03-01', 'UPI'),
(11, 11, 300.00,  '2024-04-22', 'Card'),
(12, 12, 500.00,  '2024-12-05', 'Cash'),
(13, 13, 1500.00, '2025-04-18', 'UPI'),
(14, 14, 100.00,  '2023-02-28', 'Cash'),
(15, 15, 800.00,  '2024-08-08', 'NetBanking'),
(16, 16, 420.00,  '2024-05-30', 'Card'),
(17, 17, 2000.00, '2025-05-05', 'UPI'),
(18, 18, 320.00,  '2023-06-16', 'Cash'),
(19, 19, 950.00,  '2024-10-10', 'Card'),
(20, 20, 250.00,  '2024-11-11', 'Cash');

-- Basic queries
-- Display parcels with cost greater than 500
select * from parcels where cost>500;
-- Show all customers from Hyderabad
select * from customers where address="Hyderabad";
-- List parcels with weight greater than 10kg
select * from parcels where weight>10;
-- Display parcels booked after 2024
select * from parcels where year(booking_date)>2024;

-- Joins
-- Show customer names with their sent parcels
select c.name,p.parcel_id from customers c join parcels p on c.customer_id=p.sender_id;
-- 2. Display parcel details with sender and receiver names
select p.*,c.name as sender_name,c1.name as receiver_name from parcels p join customers c on p.sender_id = c.customer_id join 
customers c1 on p.receiver_id=c1.customer_id;
-- 3. Show parcel tracking details with current location
select p.parcel_id,t.status,t.location,t.update_time from parcels p join tracking t 
on p.parcel_id=t.parcel_id;
-- 4. List employees with their branch names
select e.name as emp_name,b.branch_name as branch_name from employees e join branches b on e.branch_id=b.branch_id;
-- 5. Show parcels with payment details
select p.parcel_id,p1.* from parcels p join payments p1 on p.parcel_id=p1.parcel_id;

-- Aggregate Functions
-- 1. Count total number of parcels
select count(*) from parcels;
-- 2. Find average parcel cost
select avg(cost) as avg_parcel_cost from parcels;
-- 3. Calculate total revenue from parcels
select sum(cost) as total_revenue from parcels;
-- 4. Count total deliveries completed
select count(*) as deliveries_completed from parcels where status="delivered";
-- 5. Find maximum parcel weight
select max(weight) as max_weight from parcels;

-- Subqueries
-- 1. Find customers who never sent parcels
select name from customers where customer_id not in (select sender_id from parcels);
-- 2. Find parcels not yet delivered
select parcel_id from tracking where status!="delivered";
-- 3. Show parcels with cost greater than average cost
select parcel_id from parcels where cost>(select avg(cost) from parcels);
-- 4. Find customers who spent more than average shipping cost
select name from customers where customer_id in (select sender_id from parcels where cost>(select avg(cost) from parcels));
-- 5. Show parcels with highest cost in each branch
SELECT *
FROM (
    SELECT p.*,
           DENSE_RANK() OVER (
               PARTITION BY source_branch
               ORDER BY cost DESC
           ) r
    FROM parcels p
) t
WHERE r = 1;

-- Updates & Deletes
-- 1. Update parcel status
update parcels set status ="Delivered" where parcel_id=17;
update tracking set status="Delivered" where parcel_id=17;
-- 2. Change customer phone number
update customers set phone=8790242942 where customer_id=1;
-- 3. Update parcel delivery date
update parcels set delivery_date="2026-07-27" where parcel_id=8;
-- 4. Delete cancelled parcels
delete from parcels where status="cancelled";
set sql_safe_updates=0;
-- 5. Delete customers with no parcels
delete from customers where  customer_id not in(select sender_id from parcels);

-- Views
-- 1. Create a view to display parcel details with sender & receiver
create view parcel_details as
select p.*,c.name as sender_name,c1.name as receiver_name from parcels p join customers c on p.sender_id = c.customer_id join 
customers c1 on p.receiver_id=c1.customer_id;
-- 2. Create a view for tracking history
create view tracking_history as
SELECT
    t.tracking_id,
    t.parcel_id,
    p.sender_id,
    p.receiver_id,
    t.status,
    t.location
FROM tracking t
JOIN parcels p
ON t.parcel_id = p.parcel_id;
-- 3. Create a view showing branch-wise parcel count
drop view branch_wise_count;
create view branch_wise_count as
SELECT
    source_branch,
    COUNT(parcel_id) AS parcel_count
FROM parcels
GROUP BY source_branch;
select * from branch_wise_count;
-- 4. Create a view for customer shipment history
CREATE VIEW customer_shipment_history AS
SELECT
    c.customer_id,
    c.name,
    p.parcel_id,
    p.receiver_id,
    p.status,
    p.cost
FROM customers c
JOIN parcels p
ON c.customer_id = p.sender_id;
-- 5. Create a view showing total revenue
CREATE VIEW total_revenue AS
SELECT
    SUM(cost) AS total_revenue
FROM parcels;

-- Stored Procedures
-- 1. Insert New Customer
delimiter //
create procedure new_customer(in name varchar(20),in email varchar(40),in phone int,in address text,in registration_date date)
begin
insert into customers values(name,email,phone,address,registration_date);
end //
delimiter ;

-- 2. Update Parcel Status

delimiter //
create procedure parcel_status(in new_parcel_id int,in new_status varchar(20))
begin
update parcels set status=new_status where parcel_id=new_parcel_id;
end //
delimiter ;
drop procedure tracking_details;
-- 3. Get Tracking Details
delimiter //
create procedure tracking_details(in new_parcel_id int)
begin
select * from tracking where parcel_id=new_parcel_id;
end //
delimiter ;
call tracking_details(10);
-- 4. Calculate Total Revenue
delimiter //
create procedure total_revenue()
begin
select sum(amount) from payments;
end //
delimiter ;
call total_revenue();
-- 5.List Parcels by Branch
drop procedure parcels_branch;
delimiter //
create procedure parcels_branch(in new_branch_id int)
begin
select * from parcels where source_branch=new_branch_id;
end //
delimiter ;
call parcels_branch(4);

-- Reports / Analysis
-- 1. Top 5 highest cost parcels
select parcel_id,cost from parcels order by cost desc limit 5;
-- 2. Most active customers (based on shipments)
select c.customer_id,c.name,count(p.parcel_id) as total_shipments from customers c join parcels p on c.customer_id=p.sender_id group by c.customer_id,c.name 
order by total_shipments desc;
-- 3. Monthly shipment report
select year(booking_date) as year,month(booking_date) as month,count(*) as no_of_parcels from parcels group by month(booking_date),year(booking_date) order by year,month;
-- 4. Branch handling maximum parcels
select source_branch as branch_id,count(*) as no_of_parcels from parcels group by source_branch order by no_of_parcels desc limit 1;
-- 5. Delivery performance analysis (Delivered vs Pending)
select status,count(*) as no_of_parcels from parcels group  by status;
