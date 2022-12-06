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
Azaoeocku-27





















