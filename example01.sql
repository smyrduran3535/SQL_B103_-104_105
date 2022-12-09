--example:
drop table suppliers
drop table products
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
update suppliers
set supplier_name='Ali Can' from products where supplier_name='Merve Temiz'

--b) Change the customer name who purchased TV to the contact name of Apple

--example
CREATE TABLE customers1 
( 
customer_id int UNIQUE, 
customer_name varchar(50) NOT NULL, 
income int
);
INSERT INTO customers1 (customer_id, customer_name, income) 
VALUES (1001, 'John', 62000); 
INSERT INTO customers1 (customer_id, customer_name, income) 
VALUES (1002, 'Jane', 57500); 
INSERT INTO customers1 (customer_id, customer_name, income) 
VALUES (1003, 'Brad', 71000); 
INSERT INTO customers1 (customer_id, customer_name, income) 
VALUES (1004, 'Manse', 42000);
select*from customers1

--Finds any values that starts with “J”
select *from customers1 where customer_name like 'J%' 
--Finds any values that ends with “e”
select *from customers1 where customer_name like '%e' 
--Finds any values that have “an” in any position
select *from customers1 where customer_name like '%an%' 