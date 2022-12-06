--1.What is your name & surname?
--2.What is your e-mail address?
--3.What is a primary key?
--4.Based on the below tables; 
--Based on the below tables;
CREATE TABLE Employee(
EmployeeID varchar(5) PRIMARY,
FirstName varchar(10),
LastName varchar(7),
City varchar(10),
State varchar(7)
);
INSERT INTO Employee VALUES('10330','John','John','NY' ,'NY');
INSERT INTO Employee VALUES('10449','Sarah','Lebat','Melbourne','Bourke');
INSERT INTO Employee VALUES('11012','Jon','Dallas','NY','NY');
INSERT INTO Employee VALUES('11013','Gheorghe','Honey','NY','NY');
INSERT INTO Employee VALUES('11014','Anton','Savar','NY''NY');

CREATE TABLE Payments(
	Salary_date varchar(10),
	MonthID int,
	Value int
);
--Her çalışanın adı ve soyadına göre kazanılan toplam tutarı görüntülemek için SQL sorgularını yazın.
SELECT Employee.FirstName, Employee.LastName, SUM(Payments.Value) AS TotalEarnings
FROM Employee
INNER JOIN Payments ON Employee.EmployeeID = Payments.EmployeeID
GROUP BY Employee.FirstName, Employee.LastName

--Adları J harfi ile başlayan tüm çalışanları görüntüleyin.
SELECT * FROM Employee
WHERE FirstName LIKE 'J%'
:white_check_mark:
1





Payments Table 
Employee ID  date Month ID             Value $
10330       June        6               128
10330       July        7               158
10330       August      8               133
10330       September   9               120
10330       October     10              188
10330       November    11              160
10330       December    12              105
10449       September   9               150
10449       October     10              158
10449       November    11              160
10449       December    12              180
--1.  Write the SQL queries to display the total amount earned by each employee's name and surname. 
--2.  Display all employees that have their names starting with the J letter.
--1.
--2.








	