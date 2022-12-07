--1) What is the difference between “DELETE” and “TRUNCATE”
--DELETE:Bİr tablodaki tum verileri geri alacagımız sekilde siler.
--TRUNCATE
-- Bİr tablodaki tum verileri geri alamayacagımız sekilde siler.Sartli silme yapmaz
--2) What is the difference between “DELETE” and “DROP”
--DELETE:tablo icindeki verileri siler
--DROP:VAR olan tabloyu siler
--3) What is the difference between “DROP” and “DROP PURGE”
--DROP:
--DROP PURGE:
--4) Type a query which gives the same result with the following query
SELECT * 
FROM students 
WHERE age>=8 AND age<=17;
SELECT*FROM ogrenciler where age between 8 and 17;
--5) Type a query which gives the same result with the following query
SELECT * 
FROM students 
WHERE age<8 OR age>17
select*from ogrenciler where age not between 8 and 17;
--6) Type a query which gives the same result with the following query
SELECT * 
FROM students 
WHERE grade = 6 OR grade = 7 OR grade = 8 OR grade = 9;
select*from ogrenciler where grade in(6,7,8,9);


--             Review Question
--1) Create the given table by using SQL Queries
--2) Update “Virginia” to “Pennsylvania ”
--3) Delete 3rd row from the table
--4) Drop the table
drop table people
--1;
CREATE TABLE people 
( 
 ssn char(9), 
 name varchar(20), 
 address varchar(50) 
);
INSERT INTO people VALUES(123456789,'Mark Star','Florida');
INSERT INTO people VALUES(234567890,'Angie Way','Virginia');
INSERT INTO people VALUES(345678901,'Marry Tien','New Jersey');
select*from people
--2;
update people
set address='Pennsylvania' where address= 'Virginia';
--3;
delete from people where ssn='345678901';
--4;
drop table people

--example
CREATE TABLE workers(
id char(5),
name varchar(50),
salary int,
CONSTRAINT id3_pk PRIMARY KEY(id)
);
INSERT INTO workers VALUES('10001','Ali Can',12000);
INSERT INTO workers VALUES('10002','Veli Han',2000);
INSERT INTO workers VALUES('10003','Mary Star',7000);
INSERT INTO workers VALUES('10004','Angie Ocean',8500);
select*from workers


--Example: Company decided to increase the salary of Veli Han. However, instead of setting a specific price, 
--they want to make it 40% less than the highest salary
UPDATE workers
SET salary=(SELECT MAX(salary)*0.6 FROM workers) 
WHERE name='Veli Han';

CREATE TABLE parent(
id char(5),
num_of_kids int,
total_income int,
	CONSTRAINT id3_pk FOREIGN KEY(id) REFERENCES workers(id)
);
INSERT INTO parent VALUES('10001',4,17000);
INSERT INTO parent VALUES('10002',2,5000);
INSERT INTO parent VALUES('10003',1,7000);
INSERT INTO parent VALUES('10004',1,10000);
select*from parent;

--Example: If the salary equals to total income increase the salary 20 percent
UPDATE workers 
SET salary = (SELECT total_income*1.2 
 FROM parent
 WHERE workers.salary = parent.total_income 
 ) 
WHERE salary = (SELECT total_income 
 FROM parent 
 WHERE workers.salary = parent.total_income 
 );


--example:
CREATE TABLE suppliers 
(
supplier_id int PRIMARY KEY,
supplier_name varchar(50),
contact_name varchar(50)
);
INSERT INTO suppliers VALUES(100, 'IBM', 'Ali Can');
INSERT INTO suppliers VALUES(101, 'APPLE', 'Merve Temiz');
INSERT INTO suppliers VALUES(102, 'SAMSUNG', 'Kemal Can');
INSERT INTO suppliers VALUES(103, 'LG', 'Ali Can');

CREATE TABLE products 
(
supplier_id int,
product_id int,
product_name varchar(50),
costumer_name varchar(50),
CONSTRAINT supplier_id_fk FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
);
INSERT INTO products VALUES(100, 1001,'Laptop', 'Suleyman');
INSERT INTO products VALUES(101, 1002,'iPad', 'Fatma');
INSERT INTO products VALUES(102, 1003,'TV', 'Ramazan');
INSERT INTO products VALUES(103, 1004,'Phone', 'Ali Can');
select*from suppliers
select*from products

--a) Change the product which Ali Can purchased to the supplier 
--name which Merve Temiz is contact person
update products 
set supplier_name='Merve Temiz' from products where supplier_name='Ali Can'

--b) Change the customer name who purchased TV to the contact name of Apple






