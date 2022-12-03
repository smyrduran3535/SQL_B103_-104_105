CREATE TABLE ogrenciler12
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler12 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler12 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler12 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler12 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler12 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler12 VALUES(127, 'Mustafa Bak', 'Ali', 99);
SELECT*FROM ogrenciler12;
--ismi Mustafa Bak ve Nesibe Yılmaz olan kayıt
DELETE FROM ogrenciler12 WHERE isim ='Mustafa Bak' or isim='Nesibe Yılmaz';
--veli ismi hasan olan datayı silelim
DELETE FROM ogrenciler12 WHERE veli_isim='Hasan';
--TRUNCATE-- 
-- Bİr tablodaki tum verileri geri alamayacagımız sekilde siler.Sartli silme yapmaz
TRUNCATE TABLE ogrenciler12;

--ON DELETE CASCADE: CHİLLD VE PARENT'TAN SİLER 
-- ON DELETECASCADE --
/*
Normalde data silmek için önce "Child Table" dan datayi siler daha sonra parent'dan sileriz ama
ON DELETE CASCADE iliskisi kurulduğunda direk "Parent Table"  dan datayi silebiliriz. Data "Parent"dan
silindiğinde "Chield" dan da silinir.
*/ 
--DROP TABLE if exists talebeler; eger tablo varsa kaldırır
CREATE TABLE talebeler3
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not3( --foreign key
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler3(id)
---ON DELETE CASCADE koyarsak ikisindende siler
);
INSERT INTO talebeler3 VALUES(123, 'Ali 
Can', 'Hasan',75);
INSERT INTO talebeler3 VALUES(124, 
'Merve Gul', 'Ayse',83);
INSERT INTO talebeler3 VALUES(125, 
'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler3 VALUES(126, 
'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler3 VALUES(127, 
'Mustafa Bak', 'Can',99);


INSERT INTO not3 VALUES ('123','kimya',75);
INSERT INTO not3 VALUES ('124', 'fizik',65);
INSERT INTO not3 VALUES ('125', 'tarih',90);
INSERT INTO not3 VALUES ('126', 'Matematik',90);
select*from talebeler3;
select*from not3;
--notlar tablosundan talebe_id'si 123 olan datayi silelim
DELETE FROM not3 WHERE talebe_id='123';
--Talebeler tablosunda id si 126 olan datayi silelim
DELETE FROM talebeler3 WHERE id='126';

--------------
