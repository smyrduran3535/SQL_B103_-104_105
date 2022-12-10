--INTERVIEW QUESTION
drop table personel
CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) );
INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');
select*from personel

drop table isciler
CREATE TABLE isciler
(
id int, 
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
select*from isciler

--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query yaziniz
select isim,id from personel 
where id in(select id from isciler where isciler.id=personel.id);

--Farklı yollardan cozumler
Select personel.isim, personel.id From personel, isciler where personel.id = isciler.id
Group by personel.id, personel.isim


Select isim, id from personel where id In (Select id from isciler)


Select isim, id from personel where Exists (Select id from isciler where personel.id = isciler.id)


Select a.isim, a.id from personel a Inner join isciler e On a.id = e.id
Group by a.id, a.isim


SELECT isim,id FROM personel WHERE id IN (SELECT id FROM isciler WHERE isciler.id=personel.id); -- Kitaptaki Cozum

--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
select isim,id from personel 
intersect
select isim,id from isciler


--3) Personel tablosunda kac farkli sehirden personel var?
select sehir distinct from personel --farklı sehirleri verir
select count(distinct sehir) as sehir_sayisi from personel
select count(sehir) from personel --sehir sayılarının hepsini verir sayarak

--4) Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz
select*from personel where mod(id,2)=0;

--5) Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(id) from personel
SELECT COUNT(*)
FROM personel;

--6) Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select max(maas) from isciler --en yuksek maası ogrendik
select*from isciler where maas in(select max(maas) from isciler);

--7) Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
select*from personel order by  maas limit 1 --en dusuk
select*from personel order by  maas desc limit 1 --en yuksek

--8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select*from isciler order by maas desc limit 1 offset 2

--9) Isciler tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin
select*from isciler order by maas limit 1 offset 1

--10) Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini gosteren query yazin
select*from isciler where maas <>(select max(maas) from isciler) order by maas desc 

